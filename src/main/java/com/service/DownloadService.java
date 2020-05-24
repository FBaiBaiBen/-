package com.service;

import com.entity.Download;

import java.util.List;

/**
 * (Download)表服务接口
 *
 * @author makejava
 * @since 2020-05-15 11:18:25
 */
public interface DownloadService {

    /**
     * 通过ID查询单条数据
     *
     * @param id 主键
     * @return 实例对象
     */
    Download selectId(Integer id);

    /**
     * 查询所有的数据
     *
     * @return 对象列表
     */
    List<Download> selectAll();

    /**
     * 查询多条数据
     *
     * @param start    查询起始位置
     * @param pageSize 查询条数
     * @return 对象列表
     */
    List<Download> selectPage(Integer start, Integer pageSize);

    /**
     * 根据条件查询数据
     *
     * @param download 实例对象
     * @return 对象列表
     */
    List<Download> selectCondition(Download download,Integer start, Integer pageSize);

    /**
     * 新增数据
     *
     * @param download 实例对象
     * @return 是否成功
     */
    boolean insert(Download download);

    /**
     * 修改数据
     *
     * @param download 实例对象
     * @return 是否成功
     */
    boolean update(Download download);

    /**
     * 通过主键删除数据
     *
     * @param id 主键
     * @return 是否成功
     */
    boolean delete(Integer id);

}