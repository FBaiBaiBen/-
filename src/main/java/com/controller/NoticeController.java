package com.controller;

import com.entity.Notice;
import com.entity.Notice;
import com.service.NoticeService;
import com.util.PageUtil;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

/**
 * (Notice)表控制层
 *
 * @author makejava
 * @since 2020-05-15 11:20:34
 */
@Controller
@RequiresPermissions("notice/show")
@RequestMapping("notice")
public class NoticeController {
    /**
     * 服务对象
     */
    @Resource
    private NoticeService noticeService;

    @RequestMapping("show")
    public String show(@RequestParam(defaultValue = "1") Integer page, Model model) {
        PageUtil pageUtil = new PageUtil();
        pageUtil.setNum(page);
        pageUtil.setTotal(noticeService.selectAll().size());
        List<Notice> list = noticeService.selectPage(pageUtil.getBegin(), pageUtil.getSize());
        model.addAttribute("noticeList", list);
        model.addAttribute("page", pageUtil);
        return "WEB-INF/jsp/showNotice";
    }

    @RequestMapping("showCondition")
    public String showCondition(Notice notice, @RequestParam(defaultValue = "1") Integer page, Model model) {
        PageUtil pageUtil = new PageUtil();
        pageUtil.setNum(page);
        pageUtil.setTotal(noticeService.selectAll().size());
        List<Notice> list = noticeService.selectCondition(notice, pageUtil.getBegin(), pageUtil.getSize());
        model.addAttribute("noticeList", list);
        model.addAttribute("page", pageUtil);
        return "WEB-INF/jsp/showNotice";
    }

    @RequestMapping(value = "add", produces = "text/html;charset=utf-8")
    public void add(Notice notice, HttpServletResponse response, HttpServletRequest request) throws IOException {
        response.setContentType("text/html;charset=utf-8");
        if (noticeService.insert(notice)) {
            response.getWriter().println("<script>alert('新增成功');location.href='" + request.getContextPath() + "/notice/show'</script>");
        }
        response.getWriter().print("<script>alert('新增失败');location.href='" + request.getContextPath() + "/notice/show'</script>");
    }

    @RequestMapping("toUpdate")
    @ResponseBody
    public Notice toupdate(Integer id) {
        return noticeService.selectId(id);
    }

    @RequestMapping(value = "update", produces = "text/html;charset=utf-8")
    public void update(Notice notice, HttpServletResponse response, HttpServletRequest request) throws IOException {
        response.setContentType("text/html;charset=utf-8");
        if (noticeService.update(notice)) {
            response.getWriter().println("<script>alert('修改成功');location.href='" + request.getContextPath() + "/notice/show'</script>");
        }
        response.getWriter().println("<script>alert('修改失败');location.href='" + request.getContextPath() + "/notice/show'</script>");
    }

    @RequestMapping(value = "delete", produces = "text/html;charset=utf-8")
    public void delete(Integer id, HttpServletResponse response, HttpServletRequest request) throws IOException {
        response.setContentType("text/html;charset=utf-8");
        if (noticeService.delete(id)) {
            response.getWriter().println("<script>alert('删除成功');location.href='" + request.getContextPath() + "/notice/show'</script>");
        }
        response.getWriter().println("<script>alert('删除失败');location.href='" + request.getContextPath() + "/notice/show'</script>");
    }

}