package com.controller;

import com.entity.Post;
import com.entity.Post;
import com.service.PostService;
import com.util.PageUtil;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * (Post)表控制层
 *
 * @author makejava
 * @since 2020-05-15 11:20:34
 */
@Controller
@RequiresPermissions("post/show")
@RequestMapping("post")
public class PostController {
    /**
     * 服务对象
     */
    @Resource
    private PostService postService;

    @RequestMapping("show")
    public String show(@RequestParam(defaultValue = "1") Integer page, Model model) {
        PageUtil pageUtil = new PageUtil();
        pageUtil.setNum(page);
        pageUtil.setTotal(postService.selectAll().size());
        List<Post> list = postService.selectPage(pageUtil.getBegin(), pageUtil.getSize());
        model.addAttribute("postList", list);
        model.addAttribute("page", pageUtil);
        return "WEB-INF/jsp/showPost";
    }

    @RequestMapping("showCondition")
    public String showCondition(Post post, @RequestParam(defaultValue = "1") Integer page, Model model) {
        PageUtil pageUtil = new PageUtil();
        pageUtil.setNum(page);
        pageUtil.setTotal(postService.selectAll().size());
        List<Post> list = postService.selectCondition(post, pageUtil.getBegin(), pageUtil.getSize());
        model.addAttribute("postList", list);
        model.addAttribute("page", pageUtil);
        return "WEB-INF/jsp/showPost";
    }

    @RequestMapping(value = "add", produces = "text/html;charset=utf-8")
    public void add(Post post, HttpServletResponse response, HttpServletRequest request) throws IOException {
        response.setContentType("text/html;charset=utf-8");
        if (postService.insert(post)) {
            response.getWriter().println("<script>alert('新增成功');location.href='" + request.getContextPath() + "/post/show'</script>");
        }
        response.getWriter().print("<script>alert('新增失败');location.href='" + request.getContextPath() + "/post/show'</script>");
    }

    @RequestMapping("toUpdate")
    @ResponseBody
    public Post toupdate(Integer id) {
        return postService.selectId(id);
    }

    @RequestMapping(value = "update", produces = "text/html;charset=utf-8")
    public void update(Post post, HttpServletResponse response, HttpServletRequest request) throws IOException {
        response.setContentType("text/html;charset=utf-8");
        if (postService.update(post)) {
            response.getWriter().println("<script>alert('修改成功');location.href='" + request.getContextPath() + "/post/show'</script>");
        }
        response.getWriter().println("<script>alert('修改失败');location.href='" + request.getContextPath() + "/post/show'</script>");
    }

    @RequestMapping(value = "delete", produces = "text/html;charset=utf-8")
    public void delete(Integer id, HttpServletResponse response, HttpServletRequest request) throws IOException {
        response.setContentType("text/html;charset=utf-8");
        if (postService.delete(id)) {
            response.getWriter().println("<script>alert('删除成功');location.href='" + request.getContextPath() + "/post/show'</script>");
        }
        response.getWriter().println("<script>alert('删除失败');location.href='" + request.getContextPath() + "/post/show'</script>");
    }

}