package com.dao;

import com.entity.Section;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author baibaiben
 * @create 2020-05-11 21:07
 */
public interface SectionDao extends BaseDao<Section> {

    public List<Section> selectPage(@Param("start") Integer start, @Param("pageSize") Integer pageSize);

    public List<Section> selectCondition(@Param("section") Section section, @Param("start") Integer start, @Param("pageSize") Integer pageSize);

    public Integer delete(Integer id);
}
