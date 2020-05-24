import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;

import java.util.HashSet;
import java.util.Set;

/**
 * @author baibaiben
 * @create 2020-05-20 17:01
 */
public class MyReaml extends AuthorizingRealm {
    //授权：确认用户的权限
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
        //1、根据principalCollection（用户名）去数据库中查询用户拥有的角色和权限
        String username = principalCollection.toString();
        Set<String> roles = getRoles(username);
        Set<String> premissions = getPermissions(username);

        //2、将角色和权限封装到AuthorizationInfo交给shrio
        SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo();
        authorizationInfo.setRoles(roles);
        authorizationInfo.setStringPermissions(premissions);
        return authorizationInfo;
    }

    //认证：确认用户身份
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {
        //authenticationToken就是收集到的用户信息
        //1、根据用户提交的用户名，查看用户名是否存在
        String username = authenticationToken.getPrincipal().toString();
        System.out.println("用户名：" + username);
        //2、查询数据库，确认用户名是否存在
        String password = checkUserName(username);
        if (password == null) {
            throw new UnknownAccountException("用户名不存在！");
        } else {
            //3、如果用户名存在，获取该用户的正确密码
            //4、将正确的用户名和密码交给shiro判断
            //认证用户是否正确的工作还是要交给shiro，我们提供正确的用户名和密码
            SimpleAuthenticationInfo authenticationInfo = new SimpleAuthenticationInfo(username,password,this.getName());
            return authenticationInfo;
        }
    }

    /**
     * 模拟查询数据库，根据查询用户的密码
     *
     * @param username
     * @return
     */
    public String checkUserName(String username) {
        if (username.equals("zhangsan") || username.equals("baiben")) {
            return "123";
        }
        return null;
    }

    /**
     * 模拟从数据库中查询用户的角色集合
     *
     * @param username
     * @return
     */
    public Set<String> getRoles(String username) {
        Set<String> set = new HashSet<>();
        if (username.equals("zhangsan")) {
            set.add("boss");
        } else {
            set.add("admin");
            set.add("boss");
        }
        return set;
    }

    public Set<String> getPermissions(String username) {
        Set<String> set = new HashSet<>();
        if (username.equals("zhangsan")) {
            set.add("account:add");
            set.add("account:delete");
        } else {
            set.add("account:add");
            set.add("account:delete");
            set.add("account:update");
            set.add("account:show");
        }
        return set;
    }
}
