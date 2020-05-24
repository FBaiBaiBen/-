import com.service.AccountService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.mgt.DefaultSecurityManager;
import org.apache.shiro.mgt.SecurityManager;
import org.apache.shiro.realm.Realm;
import org.apache.shiro.realm.text.IniRealm;
import org.apache.shiro.subject.Subject;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.lang.reflect.Array;
import java.util.Arrays;

/**
 * @author baibaiben
 * @create 2020-05-18 10:01
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"/spring/spring-mybatis.xml", "/spring/spring-mvc.xml"})
public class ServiceTest {

    @Test
    public void demo() {

        //创建一个自定义的领域
        Realm realm = new MyReaml();
        //创建securitymangger
        SecurityManager securityManager = new DefaultSecurityManager(realm);
        //设置当前环境中使用securitymanager
        SecurityUtils.setSecurityManager(securityManager);
        //收集用户信息
        UsernamePasswordToken token = new UsernamePasswordToken("zhangsan", "123");
        //得到当前的主题(用户)
        Subject subject = SecurityUtils.getSubject();
        //提交认证信息，验证身份
        try {
            subject.login(token);
            //获取认证结果
            System.out.println("认证结果: " + subject.isAuthenticated());
            System.out.println("是否是管理员"+subject.hasRole("admin"));
            System.out.println("是否是老板"+subject.hasRole("boss"));

            System.out.println("是否拥有对用户的新增权限"+subject.isPermitted("account:add"));
            System.out.println("是否拥有对用户的新增、修改权限"+ Arrays.toString(subject.isPermitted("account:add","account:update")));
        } catch (UnknownAccountException uae) {
            System.out.println("用户名不对! ");
        } catch (IncorrectCredentialsException ice) {
            System.out.println("凭证(密码)不正确");
        }

    }
}
