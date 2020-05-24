package com.controller;

import com.entity.Section;
import com.entity.Section;
import com.service.SectionService;
import com.util.PageUtil;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * (Section)表控制层
 *
 * @author makejava
 * @since 2020-05-15 11:20:34
 */
@Controller
@RequiresPermissions("section/show")
@RequestMapping("section")
public class SectionController {
    /**
     * 服务对象
     */
    @Resource
    private SectionService sectionService;

    @RequestMapping("show")
    public String show(@RequestParam(defaultValue = "1") Integer page, Model model) {
        PageUtil pageUtil = new PageUtil();
        pageUtil.setNum(page);
        pageUtil.setTotal(sectionService.selectAll().size());
        List<Section> list = sectionService.selectPage(pageUtil.getBegin(), pageUtil.getSize());
        model.addAttribute("sectionList", list);
        model.addAttribute("page", pageUtil);
        return "WEB-INF/jsp/showSection";
    }

    @RequestMapping("showCondition")
    public String showCondition(Section section, @RequestParam(defaultValue = "1") Integer page, Model model) {
        PageUtil pageUtil = new PageUtil();
        pageUtil.setNum(page);
        pageUtil.setTotal(sectionService.selectAll().size());
        List<Section> list = sectionService.selectCondition(section, pageUtil.getBegin(), pageUtil.getSize());
        model.addAttribute("sectionList", list);
        model.addAttribute("page", pageUtil);
        return "WEB-INF/jsp/showSection";
    }

    @RequestMapping(value = "add", produces = "text/html;charset=utf-8")
    public void add(Section section, HttpServletResponse response, HttpServletRequest request) throws IOException {
        response.setContentType("text/html;charset=utf-8");
        if (sectionService.insert(section)) {
            response.getWriter().println("<script>alert('新增成功');location.href='" + request.getContextPath() + "/section/show'</script>");
        }
        response.getWriter().print("<script>alert('新增失败');location.href='" + request.getContextPath() + "/section/show'</script>");
    }

    @RequestMapping("toUpdate")
    @ResponseBody
    public Section toupdate(Integer id) {
        return sectionService.selectId(id);
    }

    @RequestMapping(value = "update", produces = "text/html;charset=utf-8")
    public void update(Section section, HttpServletResponse response, HttpServletRequest request) throws IOException {
        response.setContentType("text/html;charset=utf-8");
        if (sectionService.update(section)) {
            response.getWriter().println("<script>alert('修改成功');location.href='" + request.getContextPath() + "/section/show'</script>");
        }
        response.getWriter().println("<script>alert('修改失败');location.href='" + request.getContextPath() + "/section/show'</script>");
    }

    @RequestMapping(value = "delete", produces = "text/html;charset=utf-8")
    public void delete(Integer id, HttpServletResponse response, HttpServletRequest request) throws IOException {
        response.setContentType("text/html;charset=utf-8");
        if (sectionService.delete(id)) {
            response.getWriter().println("<script>alert('删除成功');location.href='" + request.getContextPath() + "/section/show'</script>");
        }
        response.getWriter().println("<script>alert('删除失败');location.href='" + request.getContextPath() + "/section/show'</script>");
    }

}