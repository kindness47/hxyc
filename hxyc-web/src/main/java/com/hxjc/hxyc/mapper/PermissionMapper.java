package com.hxjc.hxyc.mapper;

import com.hxjc.core.utils.DataSource;
import com.hxjc.hxyc.model.Permission;

@DataSource(value="dataSourceHxyc")
public interface PermissionMapper {
    int insert(Permission record);

    int insertSelective(Permission record);
}