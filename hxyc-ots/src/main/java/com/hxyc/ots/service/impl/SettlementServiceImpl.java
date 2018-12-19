package com.hxyc.ots.service.impl;

import com.hxyc.ots.mapper.CreditMapper;
import com.hxyc.ots.mapper.ReceiptMapper;
import com.hxyc.ots.mapper.SettlementMapper;
import com.hxyc.ots.model.Credit;
import com.hxyc.ots.model.Receipt;
import com.hxyc.ots.model.Settlement;
import com.hxyc.ots.service.SettlementService;
import com.hxyc.ots.utils.SystemUtil;
import com.hxyc.ots.vo.OrderAduitVO;
import com.hxyc.ots.vo.SettlementVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.sql.Timestamp;
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

    @Autowired
    private CreditMapper creditMapper;

    @Autowired
    private ReceiptMapper receiptMapper;

    @Override
    public List<SettlementVO> listSettlement(SettlementVO settlement) {
        return settlementMapper.select(settlement);
    }

    @Override
    @Transactional(rollbackFor = { Exception.class })
    public void addSettlement(Settlement settlement) {
        //更新 信用证/代购余额
        if(settlement.getSettlementMode() == 1) {
            //选择结算模式为信用证   更新信用证余额
            updateCreditBalance(settlement.getSettlementModeId(),settlement.getBalanceOfSettlement());
        }else if(settlement.getSettlementMode() == 2){
            //选择模式为代购   更新收款余额
            updateReceiptBalance(settlement.getSettlementModeId(),settlement.getBalanceOfSettlement());
        }else{
            settlement.setBalanceOfSettlement(sub(0,settlement.getSettlementAmount()));
        }
        settlementMapper.insert(settlement);
    }

    @Override
    @Transactional(rollbackFor = { Exception.class })
    public void updateSettlement(Settlement settlement) {
        //更新  信用证/代购余额

        //查询未更改前的settlement对象
        Settlement oldSettlement = settlementMapper.selectById(settlement.getId());
        //判断是否更改结算模式
        if(oldSettlement.getSettlementMode() == settlement.getSettlementMode()){
            /*如果未更改结算模式*/
            if(settlement.getSettlementMode() == 1){
                /*模式为信用证*/
                //判断是否为同一个信用证
                if(oldSettlement.getSettlementModeId() == settlement.getSettlementModeId()){
                    /*是  更新余额*/
                    updateCreditBalance(settlement.getSettlementModeId(),settlement.getBalanceOfSettlement());
                }else{
                    /*不是，将之前的信用证余额还原    新的信用证余额更新*/
                    Credit oldCredit = creditMapper.getCreditById(oldSettlement.getSettlementModeId());
                    //回滚旧信用证余额  newBalance(新余额) = oldBanlance(旧余额) + oldSettlementAamount(旧的需方结算金额)/10000
                    //计算时精确度为元,存储时为万元
                    updateCreditBalance(oldCredit.getId(),add(oldCredit.getRestAmount()*10000,oldSettlement.getSettlementAmount())/10000);
                    //更新新信用证
                    updateCreditBalance(settlement.getSettlementModeId(),settlement.getBalanceOfSettlement());
                }
            }else if(settlement.getSettlementMode() == 2){
                /*模式为代购*/
                //判断是否为同一个收款
                if(oldSettlement.getSettlementModeId() == settlement.getSettlementModeId()){
                    /*是 更新余额*/
                    updateReceiptBalance(settlement.getSettlementModeId(),settlement.getBalanceOfSettlement());
                }else{
                    /*不是,将之前的收款余额回滚    ，新的收款余额更新*/
                    Receipt oldReceipt = receiptMapper.getReceiptById(oldSettlement.getSettlementModeId());
                    //回滚旧收款余额  newBalance(新余额) = oldBanlance(旧余额) + oldSettlementAamount(旧的需方结算金额)/10000
                    //计算时精确度为元,存储时为万元
                    updateReceiptBalance(oldReceipt.getId(),add(oldReceipt.getReceiptBalance()*10000,oldSettlement.getSettlementAmount())/10000);

                    //更新新的收款
                    updateReceiptBalance(settlement.getSettlementModeId(),settlement.getBalanceOfSettlement());
                }
            }else if(settlement.getSettlementMode() == 3){
                settlement.setBalanceOfSettlement(sub(0,settlement.getSettlementAmount()));
            }
        }else{
            /*更改结算模式*/
            if(oldSettlement.getSettlementMode() ==1){
                /*信用证  转  代购/例外*/
                if(settlement.getSettlementMode() == 2){
                    /*信用证转代购*/
                    //还原旧的信用证余额    更新新的代购余额
                    Credit oldCredit = creditMapper.getCreditById(oldSettlement.getSettlementModeId());
                    //计算时精确度为元,存储时为万元
                    updateCreditBalance(oldCredit.getId(),add(oldCredit.getRestAmount()*10000,oldSettlement.getSettlementAmount())/10000);

                    updateReceiptBalance(settlement.getSettlementModeId(),settlement.getBalanceOfSettlement());
                }else if(settlement.getSettlementMode() ==3){
                    /*信用证转例外*/
                    //还原旧的信用证余额
                    Credit oldCredit = creditMapper.getCreditById(oldSettlement.getSettlementModeId());

                    updateCreditBalance(oldCredit.getId(),add(oldCredit.getRestAmount()*10000,oldSettlement.getSettlementAmount())/10000);
                    settlement.setBalanceOfSettlement(sub(0,settlement.getSettlementAmount()));
                }
            }else if(oldSettlement.getSettlementMode() ==2){
                /*代购   转   信用证/例外*/
                if(settlement.getSettlementMode() ==1) {
                    /*代购转信用证*/
                    //还原旧代购余额   更新新信用证余额
                    Receipt oldReceipt = receiptMapper.getReceiptById(oldSettlement.getSettlementModeId());

                    updateReceiptBalance(oldReceipt.getId(),add(oldReceipt.getReceiptBalance()*10000,oldSettlement.getSettlementAmount())/10000);

                    updateCreditBalance(settlement.getSettlementModeId(),settlement.getBalanceOfSettlement());
                }else if(settlement.getSettlementMode() ==3){
                    /*代购转例外*/
                    //还原旧代购余额
                    Receipt oldReceipt = receiptMapper.getReceiptById(oldSettlement.getSettlementModeId());

                    updateReceiptBalance(oldReceipt.getId(),add(oldReceipt.getReceiptBalance()*10000,oldSettlement.getSettlementAmount())/10000);
                    settlement.setBalanceOfSettlement(sub(0,settlement.getSettlementAmount()));
                }
            }else if(oldSettlement.getSettlementMode() == 3){
                /*例外   转   信用证/代购*/
                if(settlement.getSettlementMode() == 1)
                    updateCreditBalance(settlement.getSettlementModeId(),settlement.getBalanceOfSettlement());
                else if(settlement.getSettlementMode() == 2)
                    updateReceiptBalance(settlement.getSettlementModeId(),settlement.getBalanceOfSettlement());
            }
        }

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

    //更新信用证余额
    public void updateCreditBalance(String creditId,Double restAmount){
        Credit credit = new Credit();
        credit.setId(creditId);
        //计算时精确度为元，存储时为万元
        credit.setRestAmount(restAmount);
        credit.setUpdateBy(SystemUtil.getLoginUserName());
        credit.setUpdateTime(new Timestamp(System.currentTimeMillis()));
        creditMapper.updateByPrimaryKeySelective(credit);
    }
    //更新收款余额
    public void updateReceiptBalance(String receiptId,Double receiptBalance){
        Receipt receipt = new Receipt();
        receipt.setId(receiptId);
        //计算时精确度为元，存储时为万元
        receipt.setReceiptBalance(receiptBalance);
        receipt.setUpdateBy(SystemUtil.getLoginUserName());
        receipt.setUpdateTime(new Timestamp(System.currentTimeMillis()));
        receiptMapper.update(receipt);
    }

    //定义精确计算double相加结果的函数
    public double add(double d1,double d2){
        BigDecimal bd1 = new BigDecimal(Double.toString(d1));
        BigDecimal bd2 = new BigDecimal(Double.toString(d2));
        return bd1.add(bd2).doubleValue();
    }

    public double sub(double d1,double d2){
        BigDecimal bd1 = new BigDecimal(Double.toString(d1));
        BigDecimal bd2 = new BigDecimal(Double.toString(d2));
        return bd1.subtract(bd2).doubleValue();
    }
}
