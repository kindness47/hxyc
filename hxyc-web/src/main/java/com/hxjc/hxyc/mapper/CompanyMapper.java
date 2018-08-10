package com.hxjc.hxyc.mapper;

import com.hxjc.core.utils.DataSource;
import com.hxjc.hxyc.model.Company;

@DataSource(value="dataSourceHxyc")
public interface CompanyMapper {
    int deleteByPrimaryKey(Long id);

    int insert(Company record);

    int insertSelective(Company record);

    Company selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(Company record);

    int updateByPrimaryKey(Company record);
}