package com.hxjc.hxyc.mapper;

import com.hxjc.core.utils.DataSource;
import com.hxjc.hxyc.model.Module;

@DataSource(value="dataSourceHxyc")
public interface ModuleMapper {
    int deleteByPrimaryKey(Long id);

    int insert(Module record);

    int insertSelective(Module record);

    Module selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(Module record);

    int updateByPrimaryKey(Module record);
}