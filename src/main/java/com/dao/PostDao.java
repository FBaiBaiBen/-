package com.dao;

import com.entity.Post;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author baibaiben
 * @create 2020-05-10 17:03
 */
public interface PostDao extends BaseDao<Post> {

    public List<Post> selectPage(@Param("start") Integer start, @Param("pageSize") Integer pageSize);

    public List<Post> selectCondition(@Param("post") Post post, @Param("start") Integer start, @Param("pageSize") Integer pageSize);

    public Integer delete(Integer id);
}
