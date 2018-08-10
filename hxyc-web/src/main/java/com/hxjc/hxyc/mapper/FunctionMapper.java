package com.hxjc.hxyc.mapper;

import com.hxjc.core.utils.DataSource;
import com.hxjc.hxyc.model.Function;

@DataSource(value="dataSourceHxyc")
public interface FunctionMapper {
    int deleteByPrimaryKey(Long id);

    int insert(Function record);

    int insertSelective(Function record);

    Function selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(Function record);

    int updateByPrimaryKey(Function record);
}