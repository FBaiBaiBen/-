package com.service.impl;

import com.dao.StaffDao;
import com.entity.Staff;
import com.service.StaffService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * (Staff)表服务实现类
 *
 * @author makejava
 * @since 2020-05-15 11:20:34
 */
@Service("staffService")
public class StaffServiceImpl implements StaffService {
    @Resource
    private StaffDao staffDao;

    /**
     * 通过ID查询单条数据
     *
     * @param id 主键
     * @return 实例对象
     */
    @Override
    public Staff selectId(Integer id) {
        return this.staffDao.selectId(id);
    }

    /**
     * 查询所有的数据
     *
     * @return 对象列表
     */
    @Override
    public List<Staff> selectAll() {
        return this.staffDao.selectAll();
    }

    /**
     * 查询多条数据
     *
     * @param start    查询起始位置
     * @param pageSize 查询条数
     * @return 对象列表
     */
    @Override
    public List<Staff> selectPage(Integer start, Integer pageSize) {
        return this.staffDao.selectPage(start, pageSize);
    }

    /**
     * 根据条件查询数据
     *
     * @param staff 实例对象
     * @return 对象列表
     */
    @Override
    public List<Staff> selectCondition(Staff staff, Integer start, Integer pageSize) {
        return this.staffDao.selectCondition(staff, start, pageSize);
    }

    /**
     * 新增数据
     *
     * @param staff 实例对象
     * @return 是否成功
     */
    @Override
    public boolean insert(Staff staff) {
        this.staffDao.insert(staff);
        return this.staffDao.insert(staff) > 0;
    }

    /**
     * 修改数据
     *
     * @param staff 实例对象
     * @return 是否成功
     */
    @Override
    public boolean update(Staff staff) {
        return this.staffDao.update(staff) > 0;
    }

    /**
     * 通过主键删除数据
     *
     * @param id 主键
     * @return 是否成功
     */
    @Override
    public boolean delete(Integer id) {
        Staff staff = this.staffDao.selectId(id);
        staff.setState(0);
        return this.staffDao.delete(staff) > 0;
    }
}