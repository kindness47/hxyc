package com.hxjc.hxyc.mapper;

import com.hxjc.core.utils.DataSource;
import com.hxjc.hxyc.model.HxycTest;

@DataSource(value="dataSourceHxyc")
public interface HxycTestMapper {
    HxycTest findHxycTest(Long id);
}