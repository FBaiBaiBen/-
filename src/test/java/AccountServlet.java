import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @author baibaiben
 * @create 2020-05-21 10:35
 */
@WebServlet("/login")
public class AccountServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username=req.getParameter("username");
        String password=req.getParameter("password");
        String remeberme=req.getParameter("remeberme");
        UsernamePasswordToken token=new UsernamePasswordToken(username,password);
        if(remeberme!=null){
            token.setRememberMe(true);
        }
        Subject subject= SecurityUtils.getSubject();
        try {
            subject.login(token);
            System.out.println("登录成功！");
            resp.sendRedirect("/index.jsp");
        } catch (AuthenticationException e) {
            e.printStackTrace();
            System.out.println("登录失败！");
            resp.sendRedirect("/login.jsp");
        }
    }
}
