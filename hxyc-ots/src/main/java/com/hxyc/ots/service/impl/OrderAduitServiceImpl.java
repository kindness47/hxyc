package com.hxyc.ots.service.impl;

import com.hxyc.ots.mapper.SettlementMapper;
import com.hxyc.ots.service.OrderAduitService;
import com.hxyc.ots.vo.OrderAduitVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 订单审查业务接口实现
 * @Author: bin.wu
 * @Date: 2018/8/8
 */
@Service
public class OrderAduitServiceImpl implements OrderAduitService {

    @Autowired
    private SettlementMapper settlementMapper;

    @Override
    public List<OrderAduitVO> listAduitOrder(String projectId) {
        return settlementMapper.selectAduitOrder(projectId);
    }
}
