package com.controller;

import com.entity.Account;
import com.entity.Jurisdiction;
import com.entity.Menu;
import com.github.pagehelper.util.StringUtil;
import com.service.AccountService;
import com.service.JurisdictionService;
import com.service.MenuService;
import com.util.PageUtil;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.apache.shiro.subject.Subject;
import org.springframework.context.ApplicationContext;
import org.springframework.http.HttpRequest;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * (Account)表控制层
 *
 * @author makejava
 * @since 2020-05-14 17:41:41
 */
@Controller
//@RequiresPermissions("account/show")
@RequestMapping("account")
public class AccountController {
    /**
     * 服务对象
     */
    @Resource
    private AccountService accountService;

    @Resource
    private MenuService menuService;

    @Resource
    private JurisdictionService jurisdictionService;

    @RequestMapping("login")
    public String login(String name, String password, String remeberme, HttpSession session) {
        UsernamePasswordToken token = new UsernamePasswordToken(name, password);
        if (!StringUtil.isEmpty(remeberme)) {
            token.setRememberMe(true);
        }
        Subject subject = SecurityUtils.getSubject();
        try {
            subject.login(token);
            Account account =accountService.login(name, password);
            Map<String, List<Menu>> map = menuService.select(account.getId());
            session.setAttribute("menuList", map.get("menuList"));
            session.setAttribute("parentList", map.get("parentList"));
            session.setAttribute("admin", account);
            return "WEB-INF/jsp/index";
        } catch (AuthenticationException e) {
            e.printStackTrace();
            System.out.println("认证失败");
            return "login";
        }
    }

    @RequestMapping("chart")
    @ResponseBody
    public Map<String, Integer> chart(HttpServletRequest request) {
        Map<String, Integer> map= (Map<String, Integer>) request.getServletContext().getAttribute("map");
        return map;
    }

    @RequestMapping("show")
    public String show(@RequestParam(defaultValue = "1") Integer page, Model model) {
        PageUtil pageUtil = new PageUtil();
        pageUtil.setNum(page);
        pageUtil.setTotal(accountService.selectAll().size());
        List<Account> list = accountService.selectPage(pageUtil.getBegin(), pageUtil.getSize());
        model.addAttribute("accountList", list);
        model.addAttribute("page", pageUtil);
        return "WEB-INF/jsp/showAccount";
    }

    @RequestMapping("showCondition")
    public String showCondition(String name, @RequestParam(defaultValue = "1") Integer page, Model model) {
        model.addAttribute("name", name);
        Account account = new Account();
        account.setName(name);
        PageUtil pageUtil = new PageUtil();
        pageUtil.setNum(page);
        pageUtil.setTotal(accountService.selectAll().size());
        List<Account> list = accountService.selectCondition(account, pageUtil.getBegin(), pageUtil.getSize());
        model.addAttribute("accountList", list);
        model.addAttribute("page", pageUtil);
        return "WEB-INF/jsp/showAccount";
    }

    @RequestMapping("toAdd")
    @ResponseBody
    public Map<String, List<Menu>> todd(HttpSession session) {
        return menuService.selectAll();
    }

    @RequestMapping(value = "add", produces = "text/html;charset=utf-8")
    public void add(Account account, @RequestParam List<Integer> menuId, HttpServletResponse response, HttpServletRequest request) throws IOException {
        response.setContentType("text/html;charset=utf-8");
        if (accountService.insert(account, menuId)) {
            response.getWriter().println("<script>alert('新增成功');location.href='" + request.getContextPath() + "/account/show'</script>");
        }
        response.getWriter().print("<script>alert('新增失败');location.href='" + request.getContextPath() + "/account/show'</script>");
    }

    @RequestMapping("toUpdate")
    @ResponseBody
    public Map<String, Object> toupdate(Integer id) {
        Account account = accountService.selectId(id);
        List<Jurisdiction> list = jurisdictionService.selectAccountId(id);
        Map<String, Object> map = new HashMap();
        Map<String, List<Menu>> map1 = menuService.selectAll();
        map.put("account", account);
        map.put("jurisdictionList", list);
        map.putAll(map1);
        return map;
    }

    @RequestMapping(value = "update", produces = "text/html;charset=utf-8")
    public void update(Account account, @RequestParam List<Integer> menuId, HttpServletResponse response, HttpServletRequest request) throws IOException {
        response.setContentType("text/html;charset=utf-8");
        if (accountService.update(account, menuId)) {
            response.getWriter().println("<script>alert('修改成功');location.href='" + request.getContextPath() + "/account/show'</script>");
        }
        response.getWriter().println("<script>alert('修改失败');location.href='" + request.getContextPath() + "/account/show'</script>");
    }

    @RequestMapping(value = "delete", produces = "text/html;charset=utf-8")
    public void delete(Integer id, HttpServletResponse response, HttpServletRequest request) throws IOException {
        response.setContentType("text/html;charset=utf-8");
        if (accountService.delete(id)) {
            response.getWriter().println("<script>alert('删除成功');location.href='" + request.getContextPath() + "/account/show'</script>");
        }
        response.getWriter().println("<script>alert('删除失败');location.href='" + request.getContextPath() + "/account/show'</script>");
    }

}