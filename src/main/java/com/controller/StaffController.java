package com.controller;

import com.entity.*;
import com.entity.Staff;
import com.service.PostService;
import com.service.SectionService;
import com.service.StaffService;
import com.util.PageUtil;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * (Staff)表控制层
 *
 * @author makejava
 * @since 2020-05-15 11:20:34
 */
@Controller
@RequiresPermissions("staff/show")
@RequestMapping("staff")
public class StaffController {
    /**
     * 服务对象
     */
    @Resource
    private StaffService staffService;

    @Resource
    private PostService postService;

    @Resource
    private SectionService sectionService;

    @RequestMapping("show")
    public String show(@RequestParam(defaultValue = "1") Integer page, Model model) {
        PageUtil pageUtil = new PageUtil();
        pageUtil.setNum(page);
        pageUtil.setTotal(staffService.selectAll().size());
        List<Staff> list = staffService.selectPage(pageUtil.getBegin(), pageUtil.getSize());
        List<Post> postList = postService.selectAll();
        List<Section> sectionList = sectionService.selectAll();
        model.addAttribute("staffList", list);
        model.addAttribute("postList", postList);
        model.addAttribute("sectionList", sectionList);
        model.addAttribute("page", pageUtil);
        return "WEB-INF/jsp/showStaff";
    }

    @RequestMapping("showCondition")
    public String showCondition(Staff staff, @RequestParam(defaultValue = "1") Integer page, Model model) {
        PageUtil pageUtil = new PageUtil();
        pageUtil.setNum(page);
        pageUtil.setTotal(staffService.selectAll().size());
        List<Staff> list = staffService.selectCondition(staff, pageUtil.getBegin(), pageUtil.getSize());
        List<Post> postList = postService.selectAll();
        List<Section> sectionList = sectionService.selectAll();
        model.addAttribute("staffList", list);
        model.addAttribute("postList", postList);
        model.addAttribute("sectionList", sectionList);
        model.addAttribute("page", pageUtil);
        return "WEB-INF/jsp/showStaff";
    }

    @RequestMapping("toAdd")
    @ResponseBody
    public Map<String, Object> todd(HttpSession session) {
        Map<String, Object> map = new HashMap<>();
        List<Post> postList = postService.selectAll();
        List<Section> sectionList = sectionService.selectAll();
        map.put("postList", postList);
        map.put("sectionList", sectionList);
        return map;
    }

    @RequestMapping(value = "add", produces = "text/html;charset=utf-8")
    public void add(Staff staff, HttpServletResponse response, HttpServletRequest request) throws IOException {
        response.setContentType("text/html;charset=utf-8");
        if (staffService.insert(staff)) {
            response.getWriter().println("<script>alert('新增成功');location.href='" + request.getContextPath() + "/staff/show'</script>");
        }
        response.getWriter().print("<script>alert('新增失败');location.href='" + request.getContextPath() + "/staff/show'</script>");
    }

    @RequestMapping("toUpdate")
    @ResponseBody
    public Map<String, Object> toupdate(Integer id) {
        Map<String, Object> map = new HashMap<>();
        List<Post> postList = postService.selectAll();
        List<Section> sectionList = sectionService.selectAll();
        map.put("postList", postList);
        map.put("sectionList", sectionList);
        map.put("staff", staffService.selectId(id));
        return map;
    }

    @RequestMapping(value = "update", produces = "text/html;charset=utf-8")
    public void update(Staff staff, HttpServletResponse response, HttpServletRequest request) throws IOException {
        response.setContentType("text/html;charset=utf-8");
        if (staffService.update(staff)) {
            response.getWriter().println("<script>alert('修改成功');location.href='" + request.getContextPath() + "/staff/show'</script>");
        }
        response.getWriter().println("<script>alert('修改失败');location.href='" + request.getContextPath() + "/staff/show'</script>");
    }

    @RequestMapping(value = "delete", produces = "text/html;charset=utf-8")
    public void delete(Integer id, HttpServletResponse response, HttpServletRequest request) throws IOException {
        response.setContentType("text/html;charset=utf-8");
        if (staffService.delete(id)) {
            response.getWriter().println("<script>alert('删除成功');location.href='" + request.getContextPath() + "/staff/show'</script>");
        }
        response.getWriter().println("<script>alert('删除失败');location.href='" + request.getContextPath() + "/staff/show'</script>");
    }

}