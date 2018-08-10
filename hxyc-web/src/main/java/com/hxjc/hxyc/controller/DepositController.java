package com.hxjc.hxyc.controller;

import com.hxjc.hxyc.base.Response;
import com.hxjc.hxyc.model.SupplierDeposit;
import com.hxjc.hxyc.service.SupplierDepositService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * @Description: 供应商保证金管理
 * @Author: 于金谷
 * @Date: 2018/5/16 10:29
 */
@Controller
public class DepositController extends BaseController  {

    @Autowired
    private SupplierDepositService supplierDepositService;

    /**
     * 功能描述: 开标并交纳保证金供应商列表
     * @Auther: 于金谷
     * @Date create in 2018/5/16 10:29
     */
    @RequestMapping(value = "/deposit-list", method = RequestMethod.GET)
    public ModelAndView depositList(){
        ModelAndView mav = new ModelAndView("supplier/deposit-list");
        List<SupplierDeposit> depositList = supplierDepositService.getSupplierDeposits();
        mav.addObject("depositList", depositList);

        return mav;
    }

    /**
     * 功能描述: 同步投标保证金数据
     * @Auther: 于金谷
     * @Date create in 2018/5/16 10:29
     */
    @RequestMapping(value = "/deposit-sync", method = RequestMethod.POST)
    @ResponseBody
    public Response syncBidBond(){
        Boolean status = supplierDepositService.syncBidBond(); // 投标保证金同步
        if(status){
            return returnSuccess("同步成功！");
        } else {
            return returnSuccess("同步失败！");
        }
    }
}
