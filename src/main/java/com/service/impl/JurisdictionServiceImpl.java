package com.service.impl;

import com.dao.JurisdictionDao;
import com.entity.Jurisdiction;
import com.service.JurisdictionService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * (Jurisdiction)表服务实现类
 *
 * @author makejava
 * @since 2020-05-15 11:19:01
 */
@Service("jurisdictionService")
public class JurisdictionServiceImpl implements JurisdictionService {
    @Resource
    private JurisdictionDao jurisdictionDao;

    /**
     * 通过ID查询单条数据
     *
     * @param id 主键
     * @return 实例对象
     */
    @Override
    public Jurisdiction selectId(Integer id) {
        return this.jurisdictionDao.selectId(id);
    }

    /**
     * 查询多条数据
     *
     * @param id 用户ID
     * @return 对象列表
     */
    @Override
    public List<Jurisdiction> selectAccountId(Integer id) {
        return this.jurisdictionDao.selectAccountId(id);
    }

    /**
     * 新增数据
     *
     * @param jurisdiction 实例对象
     * @return 实例对象
     */
    @Override
    public boolean insert(Jurisdiction jurisdiction) {
        return this.jurisdictionDao.insert(jurisdiction) > 0;
    }

    /**
     * 批量新增数据
     *
     * @param accoutnId 用户ID
     * @param list      菜单ID集合
     * @return 实例对象
     */
    @Override
    public boolean insertBatch(Integer accoutnId, List<Integer> list) {
        return jurisdictionDao.insertBatch(accoutnId, list) > 0;
    }

    /**
     * 修改数据
     *
     * @param jurisdiction 实例对象
     * @return 实例对象
     */
    @Override
    public boolean update(Jurisdiction jurisdiction) {

        return this.jurisdictionDao.update(jurisdiction) > 0;
    }

    /**
     * 通过主键删除数据
     *
     * @param id 主键
     * @return 是否成功
     */
    @Override
    public boolean delete(Integer id) {
        return this.jurisdictionDao.delete(id) > 0;
    }

    /**
     * 通过用户ID删除数据
     *
     * @param id 用户ID
     * @return 是否成功
     */
    @Override
    public boolean deleteBatch(Integer id) {
        return this.jurisdictionDao.deleteBatch(id) > 0;
    }
}