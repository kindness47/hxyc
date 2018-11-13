package com.hxyc.ots.service.impl;

import com.hxyc.ots.mapper.SettlementMapper;
import com.hxyc.ots.model.Settlement;
import com.hxyc.ots.service.SettlementService;
import com.hxyc.ots.vo.OrderAduitVO;
import com.hxyc.ots.vo.SettlementVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * @Author: 于金谷
 * @Date: 2018/7/16 16:38
 * @Description: 结算管理业务实现
 */
@Service
public class SettlementServiceImpl implements SettlementService {

    @Autowired
    private SettlementMapper settlementMapper;

    @Override
    public List<SettlementVO> listSettlement(SettlementVO settlement) {
        return settlementMapper.select(settlement);
    }

    @Override
    public void addSettlement(Settlement settlement) {
        settlementMapper.insert(settlement);
    }

    @Override
    public void updateSettlement(Settlement settlement) {
        settlementMapper.update(settlement);
    }

    @Override
    public SettlementVO getSettlement(String id) {
        return settlementMapper.selectById(id);
    }

    @Override
    public Integer getCount(SettlementVO settlementVO) {
        return settlementMapper.selectCount(settlementVO);
    }

    @Override
    public List<OrderAduitVO> selectOrderAudit(Map map) {
        return settlementMapper.selectOrderAudit(map);
    }
}
