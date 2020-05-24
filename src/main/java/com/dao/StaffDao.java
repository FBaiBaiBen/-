package com.dao;

import com.entity.Staff;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author baibaiben
 * @create 2020-05-11 21:08
 */
public interface StaffDao extends BaseDao<Staff> {

    public List<Staff> selectPage(@Param("start") Integer start, @Param("pageSize") Integer pageSize);

    public List<Staff> selectCondition(@Param("staff") Staff staff, @Param("start") Integer start, @Param("pageSize") Integer pageSize);
}
