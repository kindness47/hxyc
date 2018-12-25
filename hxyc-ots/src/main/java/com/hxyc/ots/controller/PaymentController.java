package com.hxyc.ots.controller;

import com.hxyc.ots.base.Constants;
import com.hxyc.ots.base.Response;
import com.hxyc.ots.model.Credit;
import com.hxyc.ots.model.Payment;
import com.hxyc.ots.service.CreditService;
import com.hxyc.ots.service.PaymentService;
import com.hxyc.ots.service.ReceiptService;
import com.hxyc.ots.service.SettlementService;
import com.hxyc.ots.utils.SortList;
import com.hxyc.ots.utils.SystemUtil;
import com.hxyc.ots.vo.*;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.UUID;

/**
 * @Description:支付管理
 * @Author: 于金谷
 * @Date: 2018/7/16
 */
@Controller
public class PaymentController extends BaseController {

    @Autowired
    private PaymentService paymentService;

    @Autowired
    private SettlementService settlementService;

    @Autowired
    private CreditService creditService;

    @Autowired
    private ReceiptService receiptService;

    /**
     * 功能描述:支付信息列表
     * @Auther: 于金谷
     * @Date 2018/7/16
     */
    @RequestMapping(value = "/payment-list", method = RequestMethod.GET)
    public ModelAndView listPayment(PaymentVO paymentVO){
//        paymentVO.setCreateBy(SystemUtil.getLoginUserName());
//        if (SystemUtil.getSessionUser().getRoleName().indexOf("管理")!=-1){
//            paymentVO.setCreateBy(null);
//        }//由于财务涉及多人操作统一数据,暂时取消18-09-26
        ModelAndView mav = new ModelAndView("ots/payment-list");
        List<PaymentVO> paymentList = paymentService.listPayment(paymentVO);
        mav.addObject("paymentList", paymentList);

        return mav;
    }

    /**
     * 功能描述:新增支付信息
     * @Auther: bin.wu
     * @Date 2018/7/24
     */
    @RequestMapping(value = "/payment-add", method = RequestMethod.GET)
    public ModelAndView addPayment(){
        ModelAndView mav = new ModelAndView("ots/payment-add");
        mav.addObject("payment", new Payment());
        return mav;
    }

    /**
     * 功能描述:编辑支付信息
     * @Auther: bin.wu
     * @Date 2018/7/24
     */
    @RequestMapping(value = "/payment-edit", method = RequestMethod.GET)
    public ModelAndView editPayment(String id){
        PaymentVO paymentVO = paymentService.getPayment(id);
        ModelAndView mav = new ModelAndView("ots/payment-add");
        if (null != paymentVO.getSettlementMode() && 1 == paymentVO.getSettlementMode()){
            CreditVO creditVO = new CreditVO();
            creditVO.setProjectId(paymentVO.getProjectId());
            List<CreditVO> creditVOList = creditService.listCredit(creditVO);
            mav.addObject("creditVOList", creditVOList);
        }else {
            ReceiptVO receiptVO = new ReceiptVO();
            receiptVO.setProjectId(paymentVO.getProjectId());
            List<ReceiptVO> receiptVOList = receiptService.listReceipt(receiptVO);
            mav.addObject("receiptVOList", receiptVOList);
        }
        mav.addObject("paymentVO", paymentVO);
        return mav;
    }

    /**
     * 功能描述:保存支付信息
     * @Auther: bin.wu
     * @Date  2018/7/24
     */
    @RequestMapping(value = "/payment-save", method = RequestMethod.POST)
    @ResponseBody
    public Response savePayment(Payment payment){
        if (StringUtils.isEmpty(payment.getId())){
            payment.setId(UUID.randomUUID().toString().replaceAll("-",""));
            // 新增支付信息为有效 add by joyu 20181206
            payment.setStatus(Constants.ONE);
            payment.setCreateTime(new Timestamp(System.currentTimeMillis()));
            payment.setCreateBy(SystemUtil.getLoginUserName());
            try {
                paymentService.addPayment(payment);
            }catch (Exception e){
                return returnValidateError("信用证余额不足");
            }
            return returnSuccess("新增成功");
        }else {
            payment.setUpdateTime(new Timestamp(System.currentTimeMillis()));
            payment.setUpdateBy(SystemUtil.getLoginUserName());
            paymentService.updatePayment(payment);
            return returnSuccess("修改成功");
        }

    }
    /**
     * Description： 保存发票开立信息
     * Author: 刘永红
     * Date: Created in 2018/11/23 14:38
     */
    @RequestMapping(value = "/payment-billopen-save", method = RequestMethod.POST)
    @ResponseBody
    public Response saveBillOpenInfo(Payment payment){
        payment.setUpdateTime(new Timestamp(System.currentTimeMillis()));
        payment.setUpdateBy(SystemUtil.getLoginUserName());
        int i = paymentService.updateBillOpen(payment);
        return returnSuccess(i==1?"修改成功":"修改失败");
    }

    /**
     * Description： 发票开立
     * Author: 刘永红
     * Date: Created in 2018/11/20 19:38
     */
    @RequestMapping("/payment-bill-open")
    public ModelAndView settlementBillOpen(String id){
        PaymentVO paymentVO = paymentService.getPayment(id);
        ModelAndView mav = new ModelAndView("ots/payment-billopen");
        mav.addObject("paymentVO",paymentVO);
        return mav;
    }

    /**
     * Description： 获取信用证/收款信息
     * Author: 刘永红
     * Date: Created in 2018/12/20 10:34
     */
    @RequestMapping(value = "/getcredit-or-receipt/{id}",method = RequestMethod.POST)
    @ResponseBody
    public Response getCreditOrReceipt(@PathVariable("id") String settlementId){
        SettlementVO s = settlementService.getSettlement(settlementId);
        String projectId = s.getProjectId(),companyId = s.getCompanyId();
        //获取结算单对应的公司下的信用证
        CreditVO c = new CreditVO();
        c.setCompanyId(companyId);
        List<CreditVO> creditVOList = creditService.listCredit(c);
        Collections.sort(creditVOList,new SortList<CreditVO>("createTime",true));

        //获取结算单对应的公司下的收款
        ReceiptVO r = new ReceiptVO();
        r.setCompanyId(companyId);
        List<ReceiptVO> receiptVOList = receiptService.listReceipt(r);
        Collections.sort(receiptVOList,new SortList<ReceiptVO>("createTime",true));

        List<Object> resultList = new ArrayList<>();
        resultList.addAll(creditVOList);
        resultList.addAll(receiptVOList);
        if(resultList.size() >0)
            return returnSuccess(resultList);
        else
            return returnValidateError("未找到新用证/收款信息");
    }

    /**
     * Description： 获取结算单已支付金额
     * Author: 刘永红
     * Date: Created in 2018/12/20 14:29
     */
    @RequestMapping(value = "/getpaidSettleAmount/{settlementId}",method = RequestMethod.POST)
    @ResponseBody
    public Response getPaidSettleAmount(@PathVariable("settlementId") String settlementId){
        Double paidAmount = paymentService.getPaidSettleAmount(settlementId);
        if (paidAmount != null)
            return returnSuccess(new Double(paidAmount));
        else
            return returnValidateError("还没有支付");
    }
}
