package com.util;

import com.dao.AccountDao;
import com.entity.Account;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.HashSet;
import java.util.Set;

/**
 * @author baibaiben
 * @create 2020-05-20 17:01
 */
public class MyReaml extends AuthorizingRealm {

    @Autowired
    AccountDao accountDao;

    //授权：确认用户的权限
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
        //1、根据principalCollection（用户名）去数据库中查询用户拥有的角色和权限
        String username = principalCollection.toString();
        Set<String> premissions = accountDao.queryMenuName(username);

        //2、将角色和权限封装到AuthorizationInfo交给shrio
        SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo();
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
        Account account = accountDao.queryName(username);
        if (account == null) {
            throw new UnknownAccountException("用户名不存在！");
        } else {
            //3、如果用户名存在，获取该用户的正确密码
            //4、将正确的用户名和密码交给shiro判断
            //认证用户是否正确的工作还是要交给shiro，我们提供正确的用户名和密码
            SimpleAuthenticationInfo authenticationInfo = new SimpleAuthenticationInfo(username, account.getPassword(), this.getName());
            return authenticationInfo;
        }
    }
}
