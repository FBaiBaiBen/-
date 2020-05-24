package com.service;

import com.entity.Jurisdiction;

import java.util.List;

/**
 * (Jurisdiction)表服务接口
 *
 * @author makejava
 * @since 2020-05-15 11:19:01
 */
public interface JurisdictionService {

    /**
     * 通过ID查询单条数据
     *
     * @param id 主键
     * @return 实例对象
     */
    Jurisdiction selectId(Integer id);

    /**
     * 查询多条数据
     *
     * @param id 用户ID
     * @return 对象列表
     */
    List<Jurisdiction> selectAccountId(Integer id);

    /**
     * 新增数据
     *
     * @param jurisdiction 实例对象
     * @return 实例对象
     */
    boolean insert(Jurisdiction jurisdiction);

    /**
     * 批量新增数据
     *
     * @param accoutnId 用户ID
     * @param list      菜单ID集合
     * @return 实例对象
     */
    boolean insertBatch(Integer accoutnId, List<Integer> list);

    /**
     * 修改数据
     *
     * @param jurisdiction 实例对象
     * @return 实例对象
     */
    boolean update(Jurisdiction jurisdiction);

    /**
     * 通过主键删除数据
     *
     * @param id 主键
     * @return 是否成功
     */
    boolean delete(Integer id);

    /**
     * 通过用户ID删除数据
     *
     * @param id 用户ID
     * @return 是否成功
     */
    boolean deleteBatch(Integer id);

}