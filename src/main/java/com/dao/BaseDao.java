package com.dao;

import com.entity.Download;

import java.util.List;

/**
 * @author baibaiben
 * @create 2020-04-22 9:49
 */
public interface BaseDao<T> {

    public Integer insert(T t);

    public Integer delete(T t);

    public Integer update(T t);

    public List<T> selectAll();

    public T selectId(Integer id);

}
