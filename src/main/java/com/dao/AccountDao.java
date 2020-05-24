package com.dao;

import com.entity.Account;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Set;

/**
 * @author baibaiben
 * @create 2020-05-11 21:00
 */
public interface AccountDao extends BaseDao<Account> {

    public Account login(@Param("loginName") String loginName, @Param("password") String password);

    public List<Account> selectPage(@Param("start") Integer start, @Param("pageSize") Integer pageSize);

    public List<Account> selectCondition(@Param("account") Account account, @Param("start") Integer start, @Param("pageSize") Integer pageSize);

    public Account insertAccount(Account account);

    /**
     * 根据用户名查询用户
     *
     * @param name 用户名
     * @return 用户
     */
    Account queryName(String name);

    /**
     * 根据用户名查询权限
     *
     * @param name 用户名
     * @return 权限名称集合
     */
    Set<String> queryMenuName(String name);

}
