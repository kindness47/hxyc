package com.hxyc.ots.service.impl;

import com.hxyc.ots.mapper.CreditMapper;
import com.hxyc.ots.mapper.PaymentMapper;
import com.hxyc.ots.mapper.ReceiptMapper;
import com.hxyc.ots.model.Credit;
import com.hxyc.ots.model.Payment;
import com.hxyc.ots.model.Receipt;
import com.hxyc.ots.model.Settlement;
import com.hxyc.ots.service.CreditService;
import com.hxyc.ots.service.PaymentService;
import com.hxyc.ots.service.ReceiptService;
import com.hxyc.ots.service.SettlementService;
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

    @Autowired
    private CreditService creditService;

    @Autowired
    private ReceiptService receiptService;

    @Autowired
    private SettlementService settlementService;

    @Override
    public List<PaymentVO> listPayment(PaymentVO paymentVO) {
        return paymentMapper.select(paymentVO);
    }

    @Override
    public void addPayment(Payment payment) {
        updateCreditOrReceiptBanlance(payment);
        paymentMapper.insert(payment);
    }

    @Override
    public void updatePayment(Payment payment) {
        updateCreditOrReceiptBanlance(payment);
        paymentMapper.update(payment);
    }

    @Override
    public PaymentVO getPayment(String id) {
        return paymentMapper.selectById(id);
    }

    private void updateCreditOrReceiptBanlance(Payment payment){
        Settlement settlement = settlementService.getSettlement(payment.getSettlementId());
        if (null != settlement.getSettlementMode() && 1 == settlement.getSettlementMode()){
            updateCreditBanlance(payment.getPaymentSourceId(),payment.getCreditSurplusAmount());
        }else {
            updateReceiptBanlance(payment.getPaymentSourceId(),payment.getCreditSurplusAmount());
        }
    }

    private void updateCreditBanlance(String creditId,Double banlanceAmount){
        Credit credit = new Credit();
        credit.setId(creditId);
        credit.setRestAmount(banlanceAmount);
        creditService.updateCreditBalance(credit);

    }

    private void updateReceiptBanlance(String receiptId,Double banlanceAmount){
        Receipt receipt = new Receipt();
        receipt.setId(receiptId);
        receipt.setReceiptBalance(banlanceAmount);
        receiptService.updateReceiptBanlance(receipt);
    }

    @Override
    public int updateBillOpen(Payment payment) {
        return paymentMapper.updateBillOpen(payment);
    }
}
