package com.service.impl;

import com.dao.SectionDao;
import com.entity.Section;
import com.service.SectionService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * (Section)表服务实现类
 *
 * @author makejava
 * @since 2020-05-15 11:20:34
 */
@Service("sectionService")
public class SectionServiceImpl implements SectionService {
    @Resource
    private SectionDao sectionDao;

    /**
     * 通过ID查询单条数据
     *
     * @param id 主键
     * @return 实例对象
     */
    @Override
    public Section selectId(Integer id) {
        return this.sectionDao.selectId(id);
    }

    /**
     * 查询所有的数据
     *
     * @return 对象列表
     */
    @Override
    public List<Section> selectAll() {
        return this.sectionDao.selectAll();
    }

    /**
     * 查询多条数据
     *
     * @param start    查询起始位置
     * @param pageSize 查询条数
     * @return 对象列表
     */
    @Override
    public List<Section> selectPage(Integer start, Integer pageSize) {
        return this.sectionDao.selectPage(start, pageSize);
    }

    /**
     * 根据条件查询数据
     *
     * @param section 实例对象
     * @return 对象列表
     */
    @Override
    public List<Section> selectCondition(Section section, Integer start, Integer pageSize) {
        return this.sectionDao.selectCondition(section, start, pageSize);
    }

    /**
     * 新增数据
     *
     * @param section 实例对象
     * @return 是否成功
     */
    @Override
    public boolean insert(Section section) {
        this.sectionDao.insert(section);
        return this.sectionDao.insert(section) > 0;
    }

    /**
     * 修改数据
     *
     * @param section 实例对象
     * @return 是否成功
     */
    @Override
    public boolean update(Section section) {
        return this.sectionDao.update(section) > 0;
    }

    /**
     * 通过主键删除数据
     *
     * @param id 主键
     * @return 是否成功
     */
    @Override
    public boolean delete(Integer id) {
        return this.sectionDao.delete(id) > 0;
    }
}