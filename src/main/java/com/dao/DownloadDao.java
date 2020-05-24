package com.dao;

import com.entity.Account;
import com.entity.Download;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author baibaiben
 * @create 2020-05-11 21:09
 */
public interface DownloadDao extends BaseDao<Download> {

    public List<Download> selectPage(@Param("start") Integer start, @Param("pageSize") Integer pageSize);

    public List<Download> selectCondition(@Param("download") Download download,@Param("start") Integer start, @Param("pageSize") Integer pageSize);

}
