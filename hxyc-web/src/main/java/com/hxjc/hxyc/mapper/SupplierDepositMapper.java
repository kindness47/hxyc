package com.hxjc.hxyc.mapper;

import com.hxjc.core.utils.DataSource;
import com.hxjc.hxyc.model.SupplierDeposit;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@DataSource(value="dataSourceHxyc")
public interface SupplierDepositMapper {
    int deleteByPrimaryKey(Long id);

    int insert(SupplierDeposit record);

    int insertSelective(SupplierDeposit record);

    SupplierDeposit selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(SupplierDeposit record);

    int updateByPrimaryKey(SupplierDeposit record);

    /**
     * 功能描述: 检查同步数据是否已经存在
     * @Auther: 于金谷
     * @Date create in 2018/6/4 9:43
     */
    int getSupplierDepositCount(@Param("tenderCode") String tenderCode, @Param("childDetailId") String childDetailId);

    /**
     * 功能描述: 投标保证金列表数据
     * @Auther: 于金谷
     * @Date create in 2018/6/4 10:24
     */
    List<SupplierDeposit> getSupplierDeposits();
}