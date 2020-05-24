package com.service.impl;

import com.dao.AccountDao;
import com.dao.JurisdictionDao;
import com.entity.Account;
import com.service.AccountService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * (Account)表服务实现类
 *
 * @author makejava
 * @since 2020-05-14 17:29:13
 */
@Service("accountService")
public class AccountServiceImpl implements AccountService {
    @Resource
    private AccountDao accountDao;

    @Resource
    private JurisdictionDao jurisdictionDao;

    @Override
    public Account login(String name, String password) {
        return this.accountDao.login(name, password);
    }

    /**
     * 通过ID查询单条数据
     *
     * @param id 主键
     * @return 实例对象
     */
    @Override
    public Account selectId(Integer id) {
        return this.accountDao.selectId(id);
    }

    /**
     * 查询所有的数据
     *
     * @return 对象列表
     */
    @Override
    public List<Account> selectAll() {
        return this.accountDao.selectAll();
    }

    /**
     * 查询多条数据
     *
     * @param start    查询起始位置
     * @param pageSize 查询条数
     * @return 对象列表
     */
    @Override
    public List<Account> selectPage(Integer start, Integer pageSize) {
        return this.accountDao.selectPage(start, pageSize);
    }

    /**
     * 根据条件查询数据
     *
     * @param account 实例对象
     * @return 对象列表
     */
    @Override
    public List<Account> selectCondition(Account account,Integer start, Integer pageSize) {
        return this.accountDao.selectCondition(account,start,pageSize);
    }

    /**
     * 新增数据
     *
     * @param account 实例对象
     * @return 是否成功
     */
    @Override
    public boolean insert(Account account, List<Integer> menuId) {
        Account account1=this.accountDao.insertAccount(account);
        return  this.jurisdictionDao.insertBatch(account1.getId(), menuId) > 0;
    }

    /**
     * 修改数据
     *
     * @param account 实例对象
     * @return 是否成功
     */
    @Override
    public boolean update(Account account, List<Integer> menuId) {
        return this.accountDao.update(account) > 0 && this.jurisdictionDao.deleteBatch(account.getId()) > 0 && this.jurisdictionDao.insertBatch(account.getId(), menuId) > 0;
    }

    /**
     * 通过主键删除数据
     *
     * @param id 主键
     * @return 是否成功
     */
    @Override
    public boolean delete(Integer id) {
        Account account=this.accountDao.selectId(id);
        account.setState(0);
        return this.accountDao.delete(account) > 0;
    }
}