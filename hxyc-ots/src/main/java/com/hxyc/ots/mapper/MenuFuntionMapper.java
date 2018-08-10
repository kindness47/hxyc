package com.hxyc.ots.mapper;

import com.hxjc.core.utils.DataSource;
import com.hxyc.ots.model.MenuFuntion;

@DataSource(value="dataSourceOts")
public interface MenuFuntionMapper {
    int insert(MenuFuntion record);

    int insertSelective(MenuFuntion record);
}