package com.service.impl;

import com.dao.DownloadDao;
import com.entity.Download;
import com.service.DownloadService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * (Download)表服务实现类
 *
 * @author makejava
 * @since 2020-05-15 11:18:25
 */
@Service("downloadService")
public class DownloadServiceImpl implements DownloadService {
    @Resource
    private DownloadDao downloadDao;

    /**
     * 通过ID查询单条数据
     *
     * @param id 主键
     * @return 实例对象
     */
    @Override
    public Download selectId(Integer id) {
        return this.downloadDao.selectId(id);
    }

    /**
     * 查询所有的数据
     *
     * @return 对象列表
     */
    @Override
    public List<Download> selectAll() {
        return this.downloadDao.selectAll();
    }

    /**
     * 查询多条数据
     *
     * @param start    查询起始位置
     * @param pageSize 查询条数
     * @return 对象列表
     */
    @Override
    public List<Download> selectPage(Integer start, Integer pageSize) {
        return this.downloadDao.selectPage(start, pageSize);
    }

    /**
     * 根据条件查询数据
     *
     * @param download 实例对象
     * @return 对象列表
     */
    @Override
    public List<Download> selectCondition(Download download, Integer start, Integer pageSize) {
        return this.downloadDao.selectCondition(download, start, pageSize);
    }

    /**
     * 新增数据
     *
     * @param download 实例对象
     * @return 实例对象
     */
    @Override
    public boolean insert(Download download) {

        return this.downloadDao.insert(download) > 0;
    }

    /**
     * 修改数据
     *
     * @param download 实例对象
     * @return 实例对象
     */
    @Override
    public boolean update(Download download) {

        return this.downloadDao.update(download) > 0;
    }

    /**
     * 通过主键删除数据
     *
     * @param id 主键
     * @return 是否成功
     */
    @Override
    public boolean delete(Integer id) {
        Download download = this.downloadDao.selectId(id);
        download.setState(0);
        return this.downloadDao.delete(download) > 0;
    }
}