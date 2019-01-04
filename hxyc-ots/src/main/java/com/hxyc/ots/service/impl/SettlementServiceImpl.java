package com.hxyc.ots.service.impl;

import com.hxyc.ots.mapper.CreditMapper;
import com.hxyc.ots.mapper.ReceiptMapper;
import com.hxyc.ots.mapper.SettlementMapper;
import com.hxyc.ots.model.Credit;
import com.hxyc.ots.model.Receipt;
import com.hxyc.ots.model.Settlement;
import com.hxyc.ots.service.CreditService;
import com.hxyc.ots.service.ReceiptService;
import com.hxyc.ots.service.SettlementService;
import com.hxyc.ots.utils.DoubleOperationUtil;
import com.hxyc.ots.utils.SystemUtil;
import com.hxyc.ots.vo.OrderAduitVO;
import com.hxyc.ots.vo.SettlementVO;
import com.mysql.jdbc.StringUtils;
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
    private CreditService creditService;

    @Autowired
    private ReceiptService receiptService;

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
            if(!StringUtils.isNullOrEmpty(settlement.getSettlementModeId()))
                updateCreditBalance(settlement.getSettlementModeId(),settlement.getBalanceOfSettlement());
            else
                settlement.setBalanceOfSettlement(DoubleOperationUtil.sub(0,settlement.getSettlementAmount()));
        }else if(settlement.getSettlementMode() == 2){
            //选择模式为代购   更新收款余额
            if(!StringUtils.isNullOrEmpty(settlement.getSettlementModeId()))
                updateReceiptBalance(settlement.getSettlementModeId(),settlement.getBalanceOfSettlement());
            else{
                settlement.setBalanceOfSettlement(DoubleOperationUtil.sub(0,settlement.getSettlementAmount()));
            }

        }else{
            settlement.setBalanceOfSettlement(DoubleOperationUtil.sub(0,settlement.getSettlementAmount()));
        }
        settlementMapper.insert(settlement);
    }

    /**
     * Description： 改写逻辑：具体改动如下:
     *                          1、结算时不控制项目上的信用证、收款是否具备，都可开立结算单;
     *                          2、在1 的基础上，存在用信用证、代购开立结算单且余额为负的情况
     *                          3、信用证/代购模式结算的模式有:结算时未选择具体信用证;结算时选择了具体信用证/结算时未选择具体收款;结算时选择了具体结算时未选择具体收款
     *                          4、update操作操作可能引起的模式之间的变动有:
 *                                  信用证:(1).信用证(选择)->信用证(未选);(2).旧信用证(选择)->新信用证(选择);(3).信用证(选择)->代购(未选);
 *                                         (4).信用证(选择)->代购(选择);(5).信用证(选择)->例外;(6).信用证(未选)->信用证(未选)(更改需方/供方结算金额);(7).信用证(未选)->信用证(选择);
     *                                     (8).信用证(未选)->代购(未选);(9).信用证(未选)->代购(选择);(10).信用证(未选)->例外;
     *                              代购:同上
     *                              例外:(1).例外->信用证(未选);(2).例外->信用证(选择);(3).例外->代购(未选);(4).例外->代购(选择);(5).例外->例外(更改需方/供方结算金额);
 *   *                          5、其中的操作有:(1)、更新新信用证余额;(2)、回滚旧信用证余额;(3)、更新新收款余额;(4)、回滚旧收款余额;(5)、更新各种结算模式下的settlement中的剩余金额
     * Author: 刘永红
     * Date: Created in 2019/1/3 15:35
     */
    @Override
    @Transactional(rollbackFor = { Exception.class })
    public void updateSettlement(Settlement settlement) {
        //查询更改前的结算单
        Settlement oldSettlement = settlementMapper.selectById(settlement.getId());

        if(oldSettlement.getSettlementMode() == 1){
            //更改前结算模式是信用证
            if(StringUtils.isNullOrEmpty(oldSettlement.getSettlementModeId())){
                //更改前未选择信用证支付源id
                switch (settlement.getSettlementMode()){
                    case 1://信用证(weixuan )->信用证(选择)
                        if(StringUtils.isNullOrEmpty(settlement.getSettlementModeId())) {
                            settlement.setBalanceOfSettlement(DoubleOperationUtil.sub(0,settlement.getSettlementAmount()));
                        }else{
                            Credit credit = creditService.getCreditById(settlement.getSettlementModeId());
                            if(credit != null) {
                                Double restAmount = DoubleOperationUtil.sub(credit.getRestAmount(),DoubleOperationUtil.div(settlement.getSettlementAmount(),10000));
                                if(restAmount < 0 )
                                    throw new RuntimeException();
                                updateCreditBalance(credit.getId(),restAmount);
                                settlement.setBalanceOfSettlement(restAmount);
                            }
                        }
                        break;
                    case 2://信用证(未选)->代购
                        if(StringUtils.isNullOrEmpty(settlement.getSettlementModeId())){
                            settlement.setBalanceOfSettlement(DoubleOperationUtil.sub(0,settlement.getSettlementAmount()));
                        }else{
                            Receipt receipt = receiptService.getReceiptById(settlement.getSettlementModeId());
                            if(receipt != null){
                                Double restAmount = DoubleOperationUtil.sub(receipt.getReceiptBalance(),DoubleOperationUtil.div(settlement.getSettlementAmount(),10000));
                                updateReceiptBalance(receipt.getId(),restAmount);
                                settlement.setBalanceOfSettlement(restAmount);
                            }
                        }
                        break;
                    case 3://信用证(未选)->例外
                        settlement.setBalanceOfSettlement(DoubleOperationUtil.sub(0,settlement.getSettlementAmount()));
                        break;
                }
            }else{
                //更改前已选择
                switch (settlement.getSettlementMode()) {
                    case 1 ://信用证(选择)->信用证
                        if (StringUtils.isNullOrEmpty(settlement.getSettlementModeId())) {
                            //信用证(xuanze)->信用证(未选)   回退之前得余额，结算单新余额计算
                            Credit oldCredit = creditService.getCreditById(oldSettlement.getSettlementModeId());
                            if (oldCredit != null)
                                updateCreditBalance(oldCredit.getId(), DoubleOperationUtil.add(oldCredit.getRestAmount(), DoubleOperationUtil.div(oldSettlement.getSettlementAmount(), 10000)));
                            settlement.setBalanceOfSettlement(DoubleOperationUtil.sub(0, settlement.getSettlementAmount()));
                        }else{
                            //信用证(选择)-->信用证(xuanze)
                            Credit newCredit = creditService.getCreditById(settlement.getSettlementModeId());
                            Credit oldCredit = creditService.getCreditById(oldSettlement.getSettlementModeId());
                            if(oldCredit != null)
                                updateCreditBalance(oldCredit.getId(),DoubleOperationUtil.add(oldCredit.getRestAmount(),DoubleOperationUtil.div(oldSettlement.getSettlementAmount(),10000)));
                            if(newCredit != null) {
                                Double restAmount = DoubleOperationUtil.sub(newCredit.getRestAmount(), DoubleOperationUtil.div(settlement.getSettlementAmount(), 10000));
                                updateCreditBalance(newCredit.getId(), restAmount);
                                settlement.setBalanceOfSettlement(restAmount);
                            }

                        }
                    break;
                    case 2://信用证(选择)->代购
                        if(StringUtils.isNullOrEmpty(settlement.getSettlementModeId())){
                            //信用证(选择)->代购(未选)
                            Credit oldCredit = creditService.getCreditById(oldSettlement.getSettlementModeId());
                            if(oldCredit != null)
                                updateCreditBalance(oldCredit.getId(),DoubleOperationUtil.add(oldCredit.getRestAmount(),DoubleOperationUtil.div(oldSettlement.getSettlementAmount(),10000)));
                            settlement.setBalanceOfSettlement(DoubleOperationUtil.sub(0,settlement.getSettlementAmount()));
                        }else{
                            //信用证->代购(选择)
                            Credit oldCredit = creditService.getCreditById(oldSettlement.getSettlementModeId());
                            Receipt newReceipt = receiptService.getReceiptById(settlement.getSettlementModeId());
                            if(oldCredit != null)
                                updateCreditBalance(oldCredit.getId(),DoubleOperationUtil.add(oldCredit.getRestAmount(),DoubleOperationUtil.div(oldSettlement.getSettlementAmount(),10000)));
                            if(newReceipt != null){
                                Double restAmount = DoubleOperationUtil.sub(newReceipt.getReceiptBalance(),DoubleOperationUtil.div(settlement.getSettlementAmount(),10000));
                                updateReceiptBalance(newReceipt.getId(),restAmount);
                                settlement.setBalanceOfSettlement(restAmount);
                            }
                        }
                        break;
                    case 3://信用证(选择) -> 例外
                        Credit oldCredit = creditService.getCreditById(oldSettlement.getSettlementModeId());
                        if(oldCredit != null)
                            updateCreditBalance(oldCredit.getId(),DoubleOperationUtil.add(oldCredit.getRestAmount(),DoubleOperationUtil.div(oldSettlement.getSettlementAmount(),10000)));
                        settlement.setBalanceOfSettlement(DoubleOperationUtil.sub(0,DoubleOperationUtil.div(settlement.getSettlementAmount(),10000)));
                        break;
                }
            }
        }else if(oldSettlement.getSettlementMode() == 2){
            //更改前结算模式为代购
            if(StringUtils.isNullOrEmpty(oldSettlement.getSettlementModeId())){
                //代购(未选)->
                switch (settlement.getSettlementMode()){
                    case 1://代购(未选)->信用证
                        if(!StringUtils.isNullOrEmpty(settlement.getSettlementModeId())){
                            //代购(未选)->信用证(选择)
                            Credit newCredit = creditService.getCreditById(settlement.getSettlementModeId());
                            Double restAmount = oldSettlement.getBalanceOfSettlement();
                            restAmount = DoubleOperationUtil.sub(newCredit.getRestAmount(),DoubleOperationUtil.div(settlement.getSettlementAmount(),10000));
                            if(restAmount < 0)
                                throw new RuntimeException();
                            else if(restAmount >=0 && newCredit != null){
                                updateCreditBalance(newCredit.getId(),restAmount);
                                settlement.setBalanceOfSettlement(restAmount);
                            }
                        }else
                            settlement.setBalanceOfSettlement(DoubleOperationUtil.sub(0,settlement.getSettlementAmount()));
                        break;
                    case 2://代购(未选)->代购
                        if(!StringUtils.isNullOrEmpty(settlement.getSettlementModeId())){
                            //代购(未选)->代购(选择)
                            Receipt newReceipt = receiptService.getReceiptById(settlement.getSettlementModeId());
                            if(newReceipt != null){
                                Double restAmount = DoubleOperationUtil.sub(newReceipt.getReceiptBalance(),DoubleOperationUtil.div(settlement.getSettlementAmount(),10000));
                                updateReceiptBalance(newReceipt.getId(),restAmount);
                                settlement.setBalanceOfSettlement(restAmount);
                            }
                        }else
                            settlement.setBalanceOfSettlement(DoubleOperationUtil.sub(0,settlement.getSettlementAmount()));
                    case 3://代购(未选)->例外
                        settlement.setBalanceOfSettlement(DoubleOperationUtil.sub(0,settlement.getSettlementAmount()));
                        break;
                }
            }else{
                //代购(选择)->
                switch (settlement.getSettlementMode()){
                    case 1://代购(选择)->信用证
                        if(StringUtils.isNullOrEmpty(settlement.getSettlementModeId())){//代购(xuanze)->信用证(未选)
                            Receipt oldReceipt = receiptService.getReceiptById(oldSettlement.getSettlementModeId());
                            if(oldReceipt != null) {
                                Double restAmount = DoubleOperationUtil.add(oldReceipt.getReceiptBalance(), oldSettlement.getSettlementAmount());
                                updateReceiptBalance(oldReceipt.getId(), restAmount);
                                settlement.setBalanceOfSettlement(DoubleOperationUtil.sub(0, settlement.getSettlementAmount()));
                            }
                        }else{//代购(xuanze)->信用证(选择)
                            Receipt oldReceipt = receiptService.getReceiptById(oldSettlement.getSettlementModeId());
                            Credit newCredit = creditService.getCreditById(settlement.getSettlementModeId());
                            if(oldReceipt != null)
                                updateReceiptBalance(oldReceipt.getId(), DoubleOperationUtil.add(oldReceipt.getReceiptBalance(), DoubleOperationUtil.div(oldSettlement.getSettlementAmount(),10000)));
                            if(newCredit != null){
                                Double restAmount = DoubleOperationUtil.sub(newCredit.getRestAmount(),DoubleOperationUtil.div(settlement.getSettlementAmount(),10000));
                                updateCreditBalance(newCredit.getId(),restAmount);
                                settlement.setBalanceOfSettlement(restAmount);
                            }
                        }
                        break;
                    case 2://代购(选择)->代购
                        if(StringUtils.isNullOrEmpty(settlement.getSettlementModeId())){//代购(选择)->代购(未选)
                            Receipt oldReceipt = receiptService.getReceiptById(oldSettlement.getSettlementModeId());
                            if(oldReceipt != null) {
                                Double restAmount = DoubleOperationUtil.add(oldReceipt.getReceiptBalance(),DoubleOperationUtil.div(oldSettlement.getSettlementAmount(),10000));
                                updateReceiptBalance(oldReceipt.getId(), restAmount);
                                settlement.setBalanceOfSettlement(DoubleOperationUtil.sub(0, settlement.getSettlementAmount()));
                            }
                        }else{//代购(选择)->代购(选择)
                            Receipt oldReceipt = receiptService.getReceiptById(oldSettlement.getSettlementModeId());
                            Receipt newReceipt = receiptService.getReceiptById(settlement.getSettlementModeId());
                            if(oldReceipt != null){
                                updateReceiptBalance(oldReceipt.getId(), DoubleOperationUtil.add(oldReceipt.getReceiptBalance(), DoubleOperationUtil.div(oldSettlement.getSettlementAmount(),10000)));
                            }if(newReceipt != null){
                                Double restAmount = DoubleOperationUtil.sub(newReceipt.getReceiptBalance(),DoubleOperationUtil.div(settlement.getSettlementAmount(),10000));
                                updateReceiptBalance(newReceipt.getId(),restAmount);
                                settlement.setBalanceOfSettlement(restAmount);
                            }
                        }
                        break;
                    case 3://代购(选择)->例外
                        Receipt oldReceipt = receiptService.getReceiptById(oldSettlement.getSettlementModeId());
                        if(oldReceipt != null) {
                            updateReceiptBalance(oldReceipt.getId(), DoubleOperationUtil.add(oldReceipt.getReceiptBalance(), DoubleOperationUtil.div(oldSettlement.getSettlementAmount(), 10000)));
                            settlement.setBalanceOfSettlement(DoubleOperationUtil.sub(0,settlement.getSettlementAmount()));
                        }
                        break;
                }
            }
        }else if(oldSettlement.getSettlementMode() == 3){
            switch (settlement.getSettlementMode()){
                case 1://例外 -> 信用证
                    if(StringUtils.isNullOrEmpty(settlement.getSettlementModeId())){//例外->信用证(未选)
                        settlement.setBalanceOfSettlement(DoubleOperationUtil.sub(0,settlement.getSettlementAmount()));
                    }else{
                        Credit newCredit = creditService.getCreditById(settlement.getSettlementModeId());
                        if(newCredit != null) {
                            Double restAmount = DoubleOperationUtil.sub(newCredit.getRestAmount(), DoubleOperationUtil.div(settlement.getSettlementAmount(),10000));
                            updateCreditBalance(newCredit.getId(), restAmount);
                            settlement.setBalanceOfSettlement(restAmount);
                        }
                    }
                    break;
                case 2://例外 -> 代购
                    if(StringUtils.isNullOrEmpty(settlement.getSettlementModeId())){//例外->代购(未选)
                        settlement.setBalanceOfSettlement(DoubleOperationUtil.sub(0,settlement.getSettlementAmount()));
                    }else{
                        Receipt newReceipt = receiptService.getReceiptById(settlement.getSettlementModeId());
                        if(newReceipt != null){
                            Double restAmount = DoubleOperationUtil.sub(newReceipt.getReceiptBalance(),DoubleOperationUtil.div(settlement.getSettlementAmount(),10000));
                            updateReceiptBalance(newReceipt.getId(),restAmount);
                            settlement.setBalanceOfSettlement(restAmount);
                        }
                    }
                    break;
                case 3://例外->例外
                    settlement.setBalanceOfSettlement(DoubleOperationUtil.sub(0,settlement.getSettlementAmount()));
                    break;
            }
        }
        settlementMapper.update(settlement);



        //更新  信用证/代购余额

        /*//查询未更改前的settlement对象
        Settlement oldSettlement = settlementMapper.selectById(settlement.getId());
        //判断是否更改结算模式
        if(oldSettlement.getSettlementMode() == settlement.getSettlementMode()){
            *//*如果未更改结算模式*//*
            if(settlement.getSettlementMode() == 1){
                *//*模式为信用证*//*
                //判断是否为同一个信用证
                if(oldSettlement.getSettlementModeId() == settlement.getSettlementModeId()){
                    *//*是  更新余额*//*
                    updateCreditBalance(settlement.getSettlementModeId(),settlement.getBalanceOfSettlement());
                }else{
                    *//*不是，将之前的信用证余额还原    新的信用证余额更新*//*
                    Credit oldCredit = creditService.getCreditById(oldSettlement.getSettlementModeId());
                    //回滚旧信用证余额  newBalance(新余额) = oldBanlance(旧余额) + oldSettlementAamount(旧的需方结算金额)/10000
                    //计算时精确度为元,存储时为万元
                    if(oldCredit != null)
                        updateCreditBalance(oldCredit.getId(),DoubleOperationUtil.div(DoubleOperationUtil.add(DoubleOperationUtil.mul(oldCredit.getRestAmount(),10000),oldSettlement.getSettlementAmount()),10000));
                    //更新新信用证
                    updateCreditBalance(settlement.getSettlementModeId(),settlement.getBalanceOfSettlement());
                }
            }else if(settlement.getSettlementMode() == 2){
                *//*模式为代购*//*
                //判断是否为同一个收款
                if(oldSettlement.getSettlementModeId() == settlement.getSettlementModeId()){
                    *//*是 更新余额*//*
                    updateReceiptBalance(settlement.getSettlementModeId(),settlement.getBalanceOfSettlement());
                }else{
                    *//*不是,将之前的收款余额回滚    ，新的收款余额更新*//*
                    Receipt oldReceipt = receiptService.getReceiptById(oldSettlement.getSettlementModeId());
                    //回滚旧收款余额  newBalance(新余额) = oldBanlance(旧余额) + oldSettlementAamount(旧的需方结算金额)/10000
                    //计算时精确度为元,存储时为万元
                    if(oldReceipt != null)
                        updateReceiptBalance(oldReceipt.getId(),DoubleOperationUtil.div(DoubleOperationUtil.add(DoubleOperationUtil.mul(oldReceipt.getReceiptBalance(),10000),oldSettlement.getSettlementAmount()),10000));

                    //更新新的收款
                    updateReceiptBalance(settlement.getSettlementModeId(),settlement.getBalanceOfSettlement());
                    settlement.setBalanceOfSettlement(DoubleOperationUtil.sub(0,settlement.getBalanceOfSettlement()));
                }
            }else if(settlement.getSettlementMode() == 3){
                settlement.setBalanceOfSettlement(DoubleOperationUtil.sub(0,settlement.getSettlementAmount()));
            }
        }else{
            *//*更改结算模式*//*
            if(oldSettlement.getSettlementMode() ==1){
                *//*信用证  转  代购/例外*//*
                if(settlement.getSettlementMode() == 2){
                    *//*信用证转代购*//*
                    //还原旧的信用证余额    更新新的代购余额
                    Credit oldCredit = creditService.getCreditById(oldSettlement.getSettlementModeId());
                    //计算时精确度为元,存储时为万元
                    if(oldCredit != null)
                        updateCreditBalance(oldCredit.getId(),DoubleOperationUtil.div(DoubleOperationUtil.add(DoubleOperationUtil.mul(oldCredit.getRestAmount(),10000),oldSettlement.getSettlementAmount()),10000));

                    updateReceiptBalance(settlement.getSettlementModeId(),settlement.getBalanceOfSettlement());
                }else if(settlement.getSettlementMode() ==3){
                    *//*信用证转例外*//*
                    //还原旧的信用证余额

                    Credit oldCredit = creditService.getCreditById(oldSettlement.getSettlementModeId());
                    if(oldCredit != null)
                    updateCreditBalance(oldCredit.getId(),DoubleOperationUtil.add(oldCredit.getRestAmount()*10000,oldSettlement.getSettlementAmount())/10000);
                    settlement.setBalanceOfSettlement(DoubleOperationUtil.sub(0,settlement.getSettlementAmount()));
                }
            }else if(oldSettlement.getSettlementMode() ==2){
                *//*代购   转   信用证/例外*//*
                if(settlement.getSettlementMode() ==1) {
                    *//*代购转信用证*//*
                    //还原旧代购余额   更新新信用证余额
                    Receipt oldReceipt = receiptService.getReceiptById(oldSettlement.getSettlementModeId());
                    if(oldReceipt != null)
                        updateReceiptBalance(oldReceipt.getId(),DoubleOperationUtil.div(DoubleOperationUtil.add(DoubleOperationUtil.mul(oldReceipt.getReceiptBalance(),10000),oldSettlement.getSettlementAmount()),10000));

                    updateCreditBalance(settlement.getSettlementModeId(),settlement.getBalanceOfSettlement());
                }else if(settlement.getSettlementMode() ==3){
                    *//*代购转例外*//*
                    //还原旧代购余额
                    Receipt oldReceipt = receiptService.getReceiptById(oldSettlement.getSettlementModeId());
                    if(oldReceipt != null)
                        updateReceiptBalance(oldReceipt.getId(),DoubleOperationUtil.div(DoubleOperationUtil.add(DoubleOperationUtil.mul(oldReceipt.getReceiptBalance(),10000),oldSettlement.getSettlementAmount()),10000));
                    settlement.setBalanceOfSettlement(DoubleOperationUtil.sub(0,settlement.getSettlementAmount()));
                }
            }else if(oldSettlement.getSettlementMode() == 3){
                *//*例外   转   信用证/代购*//*
                if(settlement.getSettlementMode() == 1)
                    updateCreditBalance(settlement.getSettlementModeId(),settlement.getBalanceOfSettlement());
                else if(settlement.getSettlementMode() == 2)
                    updateReceiptBalance(settlement.getSettlementModeId(),settlement.getBalanceOfSettlement());
            }
        }

        settlementMapper.update(settlement);*/
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
        credit.setRestAmount(restAmount);
        credit.setUpdateBy(SystemUtil.getLoginUserName());
        credit.setUpdateTime(new Timestamp(System.currentTimeMillis()));
        creditService.updateCreditBalance(credit);
    }
    //更新收款余额
    public void updateReceiptBalance(String receiptId,Double receiptBalance){
        Receipt receipt = new Receipt();
        receipt.setId(receiptId);
        receipt.setReceiptBalance(receiptBalance);
        receipt.setUpdateBy(SystemUtil.getLoginUserName());
        receipt.setUpdateTime(new Timestamp(System.currentTimeMillis()));
        receiptService.updateReceiptBanlance(receipt);
    }

    public void update(Settlement settlement){
        settlementMapper.update(settlement);
    }


}
