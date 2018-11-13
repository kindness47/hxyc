package com.hxyc.ots.service.impl;

import com.hxyc.ots.mapper.PaymentMapper;
import com.hxyc.ots.mapper.SettlementMapper;
import com.hxyc.ots.service.OrderAduitService;
import com.hxyc.ots.service.PaymentService;
import com.hxyc.ots.vo.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.util.ArrayList;
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

    @Autowired
    private PaymentMapper paymentMapper;

    @Override
    public List<OrderAduitVO> listAduitOrder(String projectId) {
        return settlementMapper.selectAduitOrder(projectId);
    }

    public List<SettlementVO> getSettlementRecordList(SettlementVO settlementVO){
        return settlementMapper.select(settlementVO);
    }

    public List<PaymentVO> getPaymentRecordList(PaymentVO paymentVO){
        return paymentMapper.select(paymentVO);
    }

    public void putCreditInfoIntoOrderAduitVO(List<CreditVO> creditVOList, List<OrderAduitVO> orderAduitVOList){
        //将开证信息放入列表list中 开证收款与列表数据无逻辑关系
        if (CollectionUtils.isEmpty(creditVOList)){
            return;
        }
        for(int i=0;i<creditVOList.size();i++){
            if (CollectionUtils.isEmpty(orderAduitVOList)){
                orderAduitVOList = new ArrayList<>();
                for(int m = 0;m < creditVOList.size(); m++){
                    OrderAduitVO orderAduitVO = new  OrderAduitVO();
                    orderAduitVO.setOpenAmount(creditVOList.get(m).getOpenAmount());
                    orderAduitVO.setOpenTime(creditVOList.get(m).getOpenTime());
                    orderAduitVOList.add(orderAduitVO);
                }
                break;
            }
            if (i < orderAduitVOList.size()) {
                OrderAduitVO orderAduitVO = orderAduitVOList.get(i);
                CreditVO creditVO = creditVOList.get(i);
                orderAduitVO.setOpenTime(creditVO.getOpenTime());
                orderAduitVO.setOpenAmount(creditVO.getOpenAmount());
            }else {
                OrderAduitVO orderAduitVO = new  OrderAduitVO();
                CreditVO creditVO = creditVOList.get(i);
                orderAduitVO.setOpenTime(creditVO.getOpenTime());
                orderAduitVO.setOpenAmount(creditVO.getOpenAmount());
                orderAduitVOList.add(orderAduitVO);
            }
        }
    }

    public void putReceiptInfoIntoOrderAduitVO(List<ReceiptVO> receiptVOList, List<OrderAduitVO> orderAduitVOList){
        if (CollectionUtils.isEmpty(receiptVOList)){
            return;
        }
        for(int n=0;n<receiptVOList.size();n++){
            if (CollectionUtils.isEmpty(orderAduitVOList)){
                orderAduitVOList = new ArrayList<>();
                for(int p = 0;p < receiptVOList.size(); p++){
                    OrderAduitVO orderAduitVO = new  OrderAduitVO();
                    orderAduitVO.setReceiptAmount(receiptVOList.get(p).getReceiptAmount());
                    orderAduitVO.setReceiptTime(receiptVOList.get(p).getReceiptTime());
                orderAduitVOList.add(orderAduitVO);
            }
                break;
            }
            if (n < orderAduitVOList.size()){
                OrderAduitVO orderAduitVO = orderAduitVOList.get(n);
                ReceiptVO receiptVO = receiptVOList.get(n);
                orderAduitVO.setReceiptTime(receiptVO.getReceiptTime());
                orderAduitVO.setReceiptAmount(receiptVO.getReceiptAmount());
            }else {
                OrderAduitVO orderAduitVO = new  OrderAduitVO();
                ReceiptVO receiptVO = receiptVOList.get(n);
                orderAduitVO.setReceiptTime(receiptVO.getReceiptTime());
                orderAduitVO.setReceiptAmount(receiptVO.getReceiptAmount());
                orderAduitVOList.add(orderAduitVO);
            }
        }
    }

}
