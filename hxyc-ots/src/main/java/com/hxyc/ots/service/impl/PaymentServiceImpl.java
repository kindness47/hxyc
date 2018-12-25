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
import com.hxyc.ots.utils.DoubleOperationUtil;
import com.hxyc.ots.utils.SystemUtil;
import com.hxyc.ots.vo.CreditVO;
import com.hxyc.ots.vo.PaymentVO;
import com.hxyc.ots.vo.ReceiptVO;
import com.hxyc.ots.vo.SettlementVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.sql.Timestamp;
import java.util.Date;
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
    @Transactional(rollbackFor = { Exception.class })
    public void addPayment(Payment payment){
        //updateCreditOrReceiptBanlance(payment);
        SettlementVO settlementVO = settlementService.getSettlement(payment.getSettlementId());
        if(settlementVO.getSettlementMode() == 3){
            //用***支付例外
            String paySourceId = payment.getPaymentSourceId();
            CreditVO creditVO = creditService.getCreditById(paySourceId);

            PaymentVO p = new PaymentVO();
            p.setSettlementId(payment.getSettlementId());
            List<PaymentVO> list = paymentMapper.select(p);
            //当未支付过此结算单，更新需方结算
            if(list.size() == 0) {
                if (creditVO != null) {
                    //用信用证支付例外
                    //更新信用证余额  剩余金额 = 信用证余额(万元)-需方结算金额(元)
                    Double restAmount = DoubleOperationUtil.sub(creditVO.getRestAmount(), DoubleOperationUtil.div(settlementVO.getSettlementAmount(),10000));
                    if (restAmount < new Double(0))
                        throw new RuntimeException();
                    //更新信用证余额
                    Credit credit = new Credit();
                    credit.setId(creditVO.getId());
                    credit.setRestAmount(restAmount);
                    credit.setUpdateBy(SystemUtil.getLoginUserName());
                    credit.setUpdateTime(new Timestamp(System.currentTimeMillis()));
                    creditService.updateCreditBalance(credit);
                    //更新结算单余额
                    Settlement s = new Settlement();
                    s.setId(settlementVO.getId());
                    s.setBalanceOfSettlement(restAmount);
                    s.setUpdateBy(SystemUtil.getLoginUserName());
                    s.setUpdateTime(new Timestamp(System.currentTimeMillis()));
                    settlementService.update(s);

                    payment.setCreditSurplusAmount(restAmount);
                } else {
                    ReceiptVO receiptVO = receiptService.getReceiptById(paySourceId);
                    Double restAmount = DoubleOperationUtil.sub(receiptVO.getReceiptBalance(), DoubleOperationUtil.div(settlementVO.getSettlementAmount(),10000));

                    //更新收款余额
                    Receipt r = new Receipt();
                    r.setId(receiptVO.getId());
                    r.setReceiptBalance(restAmount);
                    r.setUpdateBy(SystemUtil.getLoginUserName());
                    r.setUpdateTime(new Timestamp(System.currentTimeMillis()));
                    receiptService.updateReceiptBanlance(r);

                    Settlement s = new Settlement();
                    s.setId(settlementVO.getId());
                    s.setBalanceOfSettlement(restAmount);
                    s.setUpdateBy(SystemUtil.getLoginUserName());
                    s.setUpdateTime(new Timestamp(System.currentTimeMillis()));
                    settlementService.update(s);

                    payment.setCreditSurplusAmount(restAmount);
                }
            }
        }
        paymentMapper.insert(payment);
    }

    @Override
    public void updatePayment(Payment payment) {
        //updateCreditOrReceiptBanlance(payment);
        paymentMapper.update(payment);
    }

    @Override
    public PaymentVO getPayment(String id) {
        return paymentMapper.selectById(id);
    }

    /*private void updateCreditOrReceiptBanlance(Payment payment){
        Settlement settlement = settlementService.getSettlement(payment.getSettlementId());
        if (null != settlement.getSettlementMode() && 1 == settlement.getSettlementMode()){
            updateCreditBanlance(payment.getPaymentSourceId(),payment.getCreditSurplusAmount());
        }else {
            updateReceiptBanlance(payment.getPaymentSourceId(),payment.getCreditSurplusAmount());
        }
    }*/


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

    @Override
    public Double getPaidSettleAmount(String settlementId) {
        return paymentMapper.getPaidSettleAmount(settlementId);
    }
}
