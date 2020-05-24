package com.controller;

import com.entity.Download;
import com.entity.Download;
import com.entity.Jurisdiction;
import com.entity.Menu;
import com.service.DownloadService;
import com.util.PageUtil;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

/**
 * (Download)表控制层
 *
 * @author makejava
 * @since 2020-05-15 11:18:25
 */
@Controller
@RequiresPermissions("download/show")
@RequestMapping("download")
public class DownloadController {
    /**
     * 服务对象
     */
    @Resource
    private DownloadService downloadService;

    @RequestMapping("show")
    public String show(@RequestParam(defaultValue = "1") Integer page, Model model) {
        PageUtil pageUtil = new PageUtil();
        pageUtil.setNum(page);
        pageUtil.setTotal(downloadService.selectAll().size());
        List<Download> list = downloadService.selectPage(pageUtil.getBegin(), pageUtil.getSize());
        model.addAttribute("downloadList", list);
        model.addAttribute("page", pageUtil);
        return "WEB-INF/jsp/showDownload";
    }

    @RequestMapping("showCondition")
    public String showCondition(String name, @RequestParam(defaultValue = "1") Integer page, Model model) {
        model.addAttribute("name", name);
        Download download = new Download();
        download.setName(name);
        PageUtil pageUtil = new PageUtil();
        pageUtil.setNum(page);
        pageUtil.setTotal(downloadService.selectAll().size());
        List<Download> list = downloadService.selectCondition(download, pageUtil.getBegin(), pageUtil.getSize());
        model.addAttribute("downloadList", list);
        model.addAttribute("page", pageUtil);
        return "WEB-INF/jsp/showDownload";
    }

    @RequestMapping(value = "upload", produces = "text/html;charset=utf-8")
    @ResponseBody
    public String upload(MultipartFile file, HttpServletRequest request) {
        if (file == null || file.isEmpty()) {
            return "不允许上传空文件";
        }
        //获取上传文件的文件名
        String filename = file.getOriginalFilename();
        String filesuffix = filename.substring(filename.lastIndexOf("."));
        String newfilename = UUID.randomUUID() + filesuffix;
        String savepath = request.getServletContext().getRealPath("upload") + "/" + newfilename;
        try {
            //将文件存入指定位置
            file.transferTo(new File(savepath));
        } catch (IOException e) {
            e.printStackTrace();
        }
        return "upload/" + newfilename;
    }

    @RequestMapping("download")
    public void download(Integer id,HttpServletRequest request, HttpServletResponse response) throws IOException {
        Download download=downloadService.selectId(id);
        if(download==null){
            return;
        }
        //设置content-disposition响应头控制浏览器以下载的形式打开文件，filename中设置的是下载弹出框里面显示的名称
        String str=download.getLocation().substring(download.getLocation().indexOf("."));
        response.setHeader("content-disposition", "attachment;filename="+ URLEncoder.encode(download.getName()+str,"utf-8"));
        String path = request.getServletContext().getRealPath("");
        FileInputStream fis = new FileInputStream(path+"/"+download.getLocation());
        ServletOutputStream os = response.getOutputStream();
        int length = 0;
        byte[] b = new byte[100];
        while ((length = fis.read(b)) != -1) {
            os.write(b, 0, length);
        }
        os.close();
        fis.close();
    }

    @RequestMapping(value = "add", produces = "text/html;charset=utf-8")
    public void add(Download download, HttpServletResponse response, HttpServletRequest request) throws IOException {
        response.setContentType("text/html;charset=utf-8");
        if (downloadService.insert(download)) {
            response.getWriter().println("<script>alert('新增成功');location.href='" + request.getContextPath() + "/download/show'</script>");
        }
        response.getWriter().print("<script>alert('新增失败');location.href='" + request.getContextPath() + "/download/show'</script>");
    }

    @RequestMapping("toUpdate")
    @ResponseBody
    public Download toupdate(Integer id) {
        return downloadService.selectId(id);
    }

    @RequestMapping(value = "update", produces = "text/html;charset=utf-8")
    public void update(Download download, HttpServletResponse response, HttpServletRequest request) throws IOException {
        response.setContentType("text/html;charset=utf-8");
        if (downloadService.update(download)) {
            response.getWriter().println("<script>alert('修改成功');location.href='" + request.getContextPath() + "/download/show'</script>");
        }
        response.getWriter().println("<script>alert('修改失败');location.href='" + request.getContextPath() + "/download/show'</script>");
    }

    @RequestMapping(value = "delete", produces = "text/html;charset=utf-8")
    public void delete(Integer id, HttpServletResponse response, HttpServletRequest request) throws IOException {
        response.setContentType("text/html;charset=utf-8");
        if (downloadService.delete(id)) {
            response.getWriter().println("<script>alert('删除成功');location.href='" + request.getContextPath() + "/download/show'</script>");
        }
        response.getWriter().println("<script>alert('删除失败');location.href='" + request.getContextPath() + "/download/show'</script>");
    }

}