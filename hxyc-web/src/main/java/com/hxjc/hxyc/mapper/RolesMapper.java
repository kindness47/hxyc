package com.hxjc.hxyc.mapper;

import com.hxjc.core.utils.DataSource;
import com.hxjc.hxyc.model.Roles;

@DataSource(value="dataSourceHxyc")
public interface RolesMapper {
    int deleteByPrimaryKey(Long id);

    int insert(Roles record);

    int insertSelective(Roles record);

    Roles selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(Roles record);

    int updateByPrimaryKey(Roles record);
}