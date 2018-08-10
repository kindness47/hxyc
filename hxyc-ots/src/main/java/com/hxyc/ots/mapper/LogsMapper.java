package com.hxyc.ots.mapper;

import com.hxjc.core.utils.DataSource;
import com.hxyc.ots.model.Logs;

@DataSource(value="dataSourceOts")
public interface LogsMapper {
    int deleteByPrimaryKey(String id);

    int insert(Logs record);

    int insertSelective(Logs record);

    Logs selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(Logs record);

    int updateByPrimaryKey(Logs record);
}