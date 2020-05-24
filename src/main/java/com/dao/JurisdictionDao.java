package com.dao;

import com.entity.Jurisdiction;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author baibaiben
 * @create 2020-05-11 21:20
 */
public interface JurisdictionDao extends BaseDao<Jurisdiction> {

    public List<Jurisdiction> selectAccountId(Integer id);

    public Integer insertBatch(@Param("accoutnId") Integer accoutnId, @Param("menuid") List<Integer> menuid);

    public Integer delete(Integer id);

    public Integer deleteBatch(Integer id);
}
