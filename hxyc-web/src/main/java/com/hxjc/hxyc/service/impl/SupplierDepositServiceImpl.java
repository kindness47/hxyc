package com.hxjc.hxyc.service.impl;

import com.hxjc.hxyc.mapper.HxjcMapper;
import com.hxjc.hxyc.mapper.SupplierDepositMapper;
import com.hxjc.hxyc.model.SupplierDeposit;
import com.hxjc.hxyc.service.SupplierDepositService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Author: 于金谷
 * @Date: 2018/6/1 16:34
 * @Description: 供应商保证金管理实现
 */
@Service
public class SupplierDepositServiceImpl implements SupplierDepositService {

    @Autowired
    private HxjcMapper hxjcMapper;

    @Autowired
    private SupplierDepositMapper supplierDepositMapper;

    /**
     * 功能描述: 同步未退款投标保证金
     * @Auther: 于金谷
     * @Date create in 2018/6/1 16:39
     */
    @Override
    public Boolean syncBidBond() {
        List<SupplierDeposit> supplierDepositList = hxjcMapper.syncBidBond();
        if(supplierDepositList != null && supplierDepositList.size() > 0) {
            for (SupplierDeposit supplierDeposit: supplierDepositList) {
                String tenderCode = supplierDeposit.getTenderCode();
                String childDetailId = supplierDeposit.getChildDetailId();
                if(StringUtils.isNotBlank(tenderCode) && StringUtils.isNotBlank(childDetailId)){
                    int result = supplierDepositMapper.getSupplierDepositCount(tenderCode, childDetailId);
                    if(!(result > 0)) {
                        supplierDepositMapper.insertSelective(supplierDeposit);
                    }
                }
            }
        }

        return true;
    }

    /**
     * 功能描述: 获取投标保证金
     * @Auther: 于金谷
     * @Date create in 2018/6/4 10:21
     */
    @Override
    public List<SupplierDeposit> getSupplierDeposits() {
        List<SupplierDeposit> supplierDepositList = supplierDepositMapper.getSupplierDeposits();
        return supplierDepositList;
    }
}
