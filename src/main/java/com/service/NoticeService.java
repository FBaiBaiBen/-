package com.service;

import com.entity.Notice;

import java.util.List;

/**
 * (Notice)表服务接口
 *
 * @author makejava
 * @since 2020-05-15 11:20:34
 */
public interface NoticeService {

    /**
     * 通过ID查询单条数据
     *
     * @param id 主键
     * @return 实例对象
     */
    Notice selectId(Integer id);

    /**
     * 查询所有的数据
     *
     * @return 对象列表
     */
    List<Notice> selectAll();

    /**
     * 查询多条数据
     *
     * @param start    查询起始位置
     * @param pageSize 查询条数
     * @return 对象列表
     */
    List<Notice> selectPage(Integer start, Integer pageSize);

    /**
     * 根据条件查询数据
     *
     * @param notice 实例对象
     * @return 对象列表
     */
    List<Notice> selectCondition(Notice notice,Integer start, Integer pageSize);

    /**
     * 新增数据
     *
     * @param notice 实例对象
     * @return 是否成功
     */
    boolean insert(Notice notice);

    /**
     * 修改数据
     *
     * @param notice 实例对象
     * @return 是否成功
     */
    boolean update(Notice notice);

    /**
     * 通过主键删除数据
     *
     * @param id 主键
     * @return 是否成功
     */
    boolean delete(Integer id);

}