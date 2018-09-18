package com.hxyc.ots.service;

import com.hxyc.ots.vo.*;

import java.util.List;

/**
 * @Author: bin.wu
 * @Date: 2018/8/8
 * @Description: 订单审查业务接口
 */
public interface OrderAduitService {

    /**
     * 项目订单跟踪信息列表
     * @Auther: bin.wu
     * @Date  2018/8/8
     */
    List<OrderAduitVO> listAduitOrder(String projectId);

    /**
     * 获取结算列表
     * @Auther: bin.wu
     * @Date  2018/9/18
     */
    List<SettlementVO> getSettlementRecordList(SettlementVO settlementVO);

    /**
     * 获取付款列表
     * @Auther: bin.wu
     * @Date  2018/9/18
     */
    List<PaymentVO> getPaymentRecordList(PaymentVO paymentVO);

    /**
     * 信用证列表放入开证嘻嘻
     * @Auther: bin.wu
     * @Date  2018/9/18
     */
    void putCreditInfoIntoOrderAduitVO(List<CreditVO> creditVOList, List<OrderAduitVO> orderAduitVOList);

    /**
     * 代购、例外列表放入付款信息
     * @Auther: bin.wu
     * @Date  2018/9/18
     */
    void putReceiptInfoIntoOrderAduitVO(List<ReceiptVO> receiptVOList, List<OrderAduitVO> orderAduitVOList);
}
