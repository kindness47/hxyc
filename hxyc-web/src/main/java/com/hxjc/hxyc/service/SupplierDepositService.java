package com.hxjc.hxyc.service;

import com.hxjc.hxyc.model.SupplierDeposit;

import java.util.List;

/**
 * @Author: 于金谷
 * @Date: 2018/6/1 16:33
 * @Description: 供应商保证金管理接口
 */
public interface SupplierDepositService {

    /**
     * 功能描述: 同步未退款投标保证金
     * @Auther: 于金谷
     * @Date create in 2018/6/1 16:39
     */
    Boolean syncBidBond();

    /**
     * 功能描述: 获取投标保证金
     * @Auther: 于金谷
     * @Date create in 2018/6/4 10:21
     */
    List<SupplierDeposit> getSupplierDeposits();
}
