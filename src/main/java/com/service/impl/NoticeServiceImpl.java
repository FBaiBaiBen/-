package com.service.impl;

import com.dao.NoticeDao;
import com.entity.Notice;
import com.service.NoticeService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * (Notice)表服务实现类
 *
 * @author makejava
 * @since 2020-05-15 11:20:34
 */
@Service("noticeService")
public class NoticeServiceImpl implements NoticeService {
    @Resource
    private NoticeDao noticeDao;

    /**
     * 通过ID查询单条数据
     *
     * @param id 主键
     * @return 实例对象
     */
    @Override
    public Notice selectId(Integer id) {
        return this.noticeDao.selectId(id);
    }

    /**
     * 查询所有的数据
     *
     * @return 对象列表
     */
    @Override
    public List<Notice> selectAll() {
        return this.noticeDao.selectAll();
    }

    /**
     * 查询多条数据
     *
     * @param start    查询起始位置
     * @param pageSize 查询条数
     * @return 对象列表
     */
    @Override
    public List<Notice> selectPage(Integer start, Integer pageSize) {
        return this.noticeDao.selectPage(start, pageSize);
    }

    /**
     * 根据条件查询数据
     *
     * @param notice 实例对象
     * @return 对象列表
     */
    @Override
    public List<Notice> selectCondition(Notice notice, Integer start, Integer pageSize) {
        return this.noticeDao.selectCondition(notice, start, pageSize);
    }

    /**
     * 新增数据
     *
     * @param notice 实例对象
     * @return 是否成功
     */
    @Override
    public boolean insert(Notice notice) {
        this.noticeDao.insert(notice);
        return this.noticeDao.insert(notice) > 0;
    }

    /**
     * 修改数据
     *
     * @param notice 实例对象
     * @return 是否成功
     */
    @Override
    public boolean update(Notice notice) {
        return this.noticeDao.update(notice) > 0;
    }

    /**
     * 通过主键删除数据
     *
     * @param id 主键
     * @return 是否成功
     */
    @Override
    public boolean delete(Integer id) {
        Notice notice = this.noticeDao.selectId(id);
        notice.setState(0);
        return this.noticeDao.delete(notice) > 0;
    }
}