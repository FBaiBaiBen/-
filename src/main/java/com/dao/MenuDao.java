package com.dao;

import com.entity.Menu;

import java.util.List;

/**
 * @author baibaiben
 * @create 2020-05-11 21:19
 */
public interface MenuDao extends BaseDao<Menu> {

    public List<Menu> select(Integer id);

    public Integer delete(Integer id);
}
