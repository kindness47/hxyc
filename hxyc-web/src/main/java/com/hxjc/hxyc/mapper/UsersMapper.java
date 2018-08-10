package com.hxjc.hxyc.mapper;

import com.hxjc.core.utils.DataSource;
import com.hxjc.hxyc.model.Users;

@DataSource(value="dataSourceHxyc")
public interface UsersMapper {
    int deleteByPrimaryKey(Long id);

    int insert(Users record);

    int insertSelective(Users record);

    Users selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(Users record);

    int updateByPrimaryKey(Users record);
}