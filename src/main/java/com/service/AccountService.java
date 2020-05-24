package com.service;

import com.entity.Account;

import java.util.List;

/**
 * (Account)表服务接口
 *
 * @author makejava
 * @since 2020-05-14 17:29:13
 */
public interface AccountService {

    /**
     * 登录验证
     *
     * @param name     用户名
     * @param password 密码
     * @return 实例对象
     */
    Account login(String name, String password);

    /**
     * 通过ID查询单条数据
     *
     * @param id 主键
     * @return 实例对象
     */
    Account selectId(Integer id);

    /**
     * 查询所有的数据
     *
     * @return 对象列表
     */
    List<Account> selectAll();

    /**
     * 查询多条数据
     *
     * @param start    查询起始位置
     * @param pageSize 查询条数
     * @return 对象列表
     */
    List<Account> selectPage(Integer start, Integer pageSize);

    /**
     * 根据条件查询数据
     *
     * @param account 实例对象
     * @return 对象列表
     */
    List<Account> selectCondition(Account account,Integer start, Integer pageSize);

    /**
     * 新增数据
     *
     * @param account 实例对象
     * @return 是否成功
     */
    boolean insert(Account account,List<Integer> menuId);

    /**
     * 修改数据
     *
     * @param account 实例对象
     * @return 是否成功
     */
    boolean update(Account account,List<Integer> menuId);

    /**
     * 通过主键删除数据
     *
     * @param id 主键
     * @return 是否成功
     */
    boolean delete(Integer id);

}