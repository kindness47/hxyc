package com.hxyc.ots.service;

import com.hxyc.ots.model.Payment;
import com.hxyc.ots.vo.PaymentVO;

import java.util.List;

/**
 * @Author: 于金谷
 * @Date: 2018/7/16 16:51
 * @Description: 支付管理业务接口
 */
public interface PaymentService {

    /**
     * 功能描述: 支付信息列表
     * @Auther: 于金谷
     * @Date create in 2018/7/16 16:52
     */
    List<PaymentVO> listPayment(PaymentVO paymentVO);

    /**
     * 新增支付信息
     * @param payment
     */
    void addPayment(Payment payment);

    /**
     * 更新支付信息
     * @param payment
     */
    void updatePayment(Payment payment);

    /**
     * 根据ID获取支付信息
     * @param id
     * @return
     */
    PaymentVO getPayment(String id);

    int updateBillOpen(Payment payment);

    //获取已支付金额
    Double getPaidSettleAmount(String settlementId);
}
