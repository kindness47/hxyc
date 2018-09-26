package com.hxyc.ots.controller;

import com.hxyc.ots.base.Response;
import com.hxyc.ots.model.Payment;
import com.hxyc.ots.service.CreditService;
import com.hxyc.ots.service.PaymentService;
import com.hxyc.ots.service.ReceiptService;
import com.hxyc.ots.service.SettlementService;
import com.hxyc.ots.utils.SystemUtil;
import com.hxyc.ots.vo.CreditVO;
import com.hxyc.ots.vo.PaymentVO;
import com.hxyc.ots.vo.ReceiptVO;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.sql.Timestamp;
import java.util.ArrayList;
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
            payment.setCreateTime(new Timestamp(System.currentTimeMillis()));
            payment.setCreateBy(SystemUtil.getLoginUserName());
            paymentService.addPayment(payment);
            return returnSuccess("新增成功");
        }else {
            payment.setUpdateTime(new Timestamp(System.currentTimeMillis()));
            payment.setUpdateBy(SystemUtil.getLoginUserName());
            paymentService.updatePayment(payment);
            return returnSuccess("修改成功");
        }

    }

}
