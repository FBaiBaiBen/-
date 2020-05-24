package com.dao;

import com.entity.Notice;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author baibaiben
 * @create 2020-05-11 21:08
 */
public interface NoticeDao extends BaseDao<Notice> {

    public List<Notice> selectPage(@Param("start") Integer start, @Param("pageSize") Integer pageSize);

    public List<Notice> selectCondition(@Param("notice") Notice notice, @Param("start") Integer start, @Param("pageSize") Integer pageSize);
}
