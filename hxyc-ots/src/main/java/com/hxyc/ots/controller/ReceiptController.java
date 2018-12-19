package com.hxyc.ots.controller;

import com.hxyc.ots.base.Constants;
import com.hxyc.ots.base.Response;
import com.hxyc.ots.model.Receipt;
import com.hxyc.ots.service.ReceiptService;
import com.hxyc.ots.utils.SortList;
import com.hxyc.ots.utils.SystemUtil;
import com.hxyc.ots.vo.ReceiptVO;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.Collections;
import java.util.Date;
import java.util.List;

/**
 * @Description:收款管理
 * @Author: 于金谷
 * @Date: 2018/7/16 16:07
 */
@Controller
public class ReceiptController extends BaseController {

    @Autowired
    private ReceiptService receiptService;

    /**
     * 收款信息列表
     */
    @RequestMapping(value = "/receipt-list", method = RequestMethod.GET)
    public ModelAndView listReceipt(ReceiptVO receiptVO){
        ModelAndView mav = new ModelAndView("ots/receipt-list");
        List<ReceiptVO> receiptList = receiptService.listReceipt(receiptVO);
        mav.addObject("receiptList", receiptList);

        return mav;
    }

    @RequestMapping(value = "/receipt-select", method = RequestMethod.GET)
    @ResponseBody
    public Response listReceiptSelect(ReceiptVO receiptVO){
        List<ReceiptVO> receiptList = receiptService.listReceipt(receiptVO);
        return returnSuccess(receiptList);
    }

    @RequestMapping(value = "credit-list",method = RequestMethod.POST)
    @ResponseBody
    public Response creditList(ReceiptVO receiptVO){
        List<ReceiptVO> receiptList = receiptService.listReceipt(receiptVO);
        Collections.sort(receiptList,new SortList<ReceiptVO>("createTime",true));
        return returnSuccess(receiptList);
    }

    /**
     * 功能描述:新增收款
     * @Auther: 于金谷
     * @Date create in 2018/7/16 15:20
     */
    @RequestMapping(value = "/receipt-add", method = RequestMethod.GET)
    public ModelAndView addReceipt(){
        ModelAndView mav = new ModelAndView("ots/receipt-add");
        mav.addObject("receipt", new Receipt());
        return mav;
    }


    /**
     * 功能描述:新增收款
     * @Auther: 于金谷
     * @Date create in 2018/7/23 16:37
     */
    @ResponseBody
    @RequestMapping(value = "/receipt-save", method = RequestMethod.POST)
    public Response saveReceipt(Receipt receipt) {
        String id = receipt.getId();
        if(StringUtils.isBlank(id)) {
            receipt.setCreateBy(SystemUtil.getLoginUserName());
            receipt.setCreateTime(new Date());
            receipt.setStatus(Constants.ONE);
            receipt.setReceiptBalance(receipt.getReceiptAmount());
            receiptService.saveReceipt(receipt);
            return returnSuccess("新增成功！");
        } else {
            Receipt oldReceipt = receiptService.getReceiptById(id);
            oldReceipt.setReceiptAmount(receipt.getReceiptAmount());
            oldReceipt.setReceiptTime(receipt.getReceiptTime());
            oldReceipt.setUpdateBy(SystemUtil.getLoginUserName());
            oldReceipt.setUpdateTime(new Date());
            receiptService.updateReceipt(oldReceipt);

            return returnSuccess("修改成功！");
        }

    }


    /**
     * 功能描述:根据ID获取收款信息
     * @Auther: 于金谷
     * @Date create in 2018/7/24 15:40
     */
    @ResponseBody
    @RequestMapping(value = "/receipt/{id}", method = RequestMethod.POST)
    public ReceiptVO getReceiptById(@PathVariable("id") String id) {
        ReceiptVO vo = receiptService.getReceiptById(id);
        return vo;
    }

}
