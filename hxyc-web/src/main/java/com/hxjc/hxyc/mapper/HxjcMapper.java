package com.hxjc.hxyc.mapper;

import com.hxjc.core.utils.DataSource;
import com.hxjc.hxyc.model.HxjcTest;
import com.hxjc.hxyc.model.SupplierDeposit;

import java.util.List;

@DataSource(value="dataSourceHxjc")
public interface HxjcMapper {
    List<SupplierDeposit> syncBidBond();
}