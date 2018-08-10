package com.hxyc.ots.mapper;

import com.hxjc.core.utils.DataSource;
import com.hxyc.ots.model.Functions;

@DataSource(value="dataSourceOts")
public interface FunctionsMapper {
    int deleteByPrimaryKey(String id);

    int insert(Functions record);

    int insertSelective(Functions record);

    Functions selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(Functions record);

    int updateByPrimaryKey(Functions record);
}