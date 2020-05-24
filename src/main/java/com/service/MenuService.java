package com.service;

import com.entity.Menu;

import java.util.List;
import java.util.Map;

/**
 * (Menu)表服务接口
 *
 * @author makejava
 * @since 2020-05-15 11:20:20
 */
public interface MenuService {

    /**
     * 通过ID查询单条数据
     *
     * @param id 主键
     * @return 实例对象
     */
    Menu selectId(Integer id);

    /**
     * 查询所有的数据
     *
     * @return 对象列表
     */
    Map<String,List<Menu>> selectAll();

    /**
     * 查询多条数据
     *
     * @param id 用户ID
     * @return 对象列表
     */
    Map<String,List<Menu>> select(Integer id);

    /**
     * 新增数据
     *
     * @param menu 实例对象
     * @return 是否成功
     */
    boolean insert(Menu menu);

    /**
     * 修改数据
     *
     * @param menu 实例对象
     * @return 是否成功
     */
    boolean update(Menu menu);

    /**
     * 通过主键删除数据
     *
     * @param id 主键
     * @return 是否成功
     */
    boolean delete(Integer id);

}