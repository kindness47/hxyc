package com.hxyc.ots.service.impl;

import com.hxyc.ots.mapper.PaymentMapper;
import com.hxyc.ots.model.Payment;
import com.hxyc.ots.service.PaymentService;
import com.hxyc.ots.vo.PaymentVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Author: 于金谷
 * @Date: 2018/7/16 16:53
 * @Description: 支付信息业务实现
 */
@Service
public class PaymentServiceImpl implements PaymentService {

    @Autowired
    private PaymentMapper paymentMapper;

    @Override
    public List<PaymentVO> listPayment(PaymentVO paymentVO) {
        return paymentMapper.select(paymentVO);
    }

    @Override
    public void addPayment(Payment payment) {
        paymentMapper.insert(payment);
    }

    @Override
    public void updatePayment(Payment payment) {
        paymentMapper.update(payment);
    }

    @Override
    public PaymentVO getPayment(String id) {
        return paymentMapper.selectById(id);
    }
}
