package com.hxyc.ots.controller;

import com.hxjc.core.utils.CodeUtils;
import com.hxyc.ots.base.Response;
import com.hxyc.ots.model.Company;
import com.hxyc.ots.model.Credit;
import com.hxyc.ots.service.CreditService;
import com.hxyc.ots.utils.SystemUtil;
import com.hxyc.ots.vo.CreditVO;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

/**
 * @Description:信用证管理
 * @Author: 于金谷
 * @Date: 2018/7/16 16:07
 */
@Controller
public class CreditController extends BaseController {

    @Autowired
    private CreditService creditService;

    /**
     * 信用证信息列表
     */
    @RequestMapping(value = "/credit-list", method = RequestMethod.GET)
    public ModelAndView listCredit(CreditVO creditVO){
        ModelAndView mav = new ModelAndView("ots/credit-list");
        List<CreditVO> creditList = creditService.listCredit(creditVO);
        mav.addObject("creditList", creditList);

        return mav;
    }

    @RequestMapping(value = "/credit-select", method = RequestMethod.GET)
    @ResponseBody
    public Response listCreditSelect(CreditVO creditVO){
        List<CreditVO> creditList = creditService.listCredit(creditVO);
        return returnSuccess(creditList);
    }

    /**
     * 功能描述:新增信用证
     * @Auther: 于金谷
     * @Date create in 2018/7/16 15:20
     */
    @RequestMapping(value = "/credit-add", method = RequestMethod.GET)
    public ModelAndView addCompany(){
        ModelAndView mav = new ModelAndView("ots/credit-add");
        mav.addObject("credit", new Credit());
        return mav;
    }

    /**
     * 功能描述:新增信用证
     * @Auther: 于金谷
     * @Date create in 2018/7/17 16:55
     */
    @ResponseBody
    @RequestMapping(value = "/credit-save", method = RequestMethod.POST)
    public Response saveCredit(Credit credit) {
        String id = credit.getId();
        if(StringUtils.isBlank(id)) {
            credit.setCreditCode(CodeUtils.getRuleCode("XYZ"));
            credit.setRestAmount(credit.getOpenAmount());
            credit.setCreateBy(SystemUtil.getLoginUserName());
            creditService.saveCredit(credit);

            return returnSuccess("新增成功！");
        } else {
            Credit oldCredit = creditService.getCreditById(id);
            oldCredit.setOpenAmount(credit.getOpenAmount());
            oldCredit.setOpenTime(credit.getOpenTime());
            oldCredit.setUpdateBy(SystemUtil.getLoginUserName());
            oldCredit.setUpdateTime(new Date());
            creditService.updateCredit(oldCredit);

            return returnSuccess("修改成功！");
        }

    }


    /**
     * 功能描述:根据ID获取信用证信息
     * @Auther: 于金谷
     * @Date create in 2018/7/23 17:09
     */
    @ResponseBody
    @RequestMapping(value = "/credit/{id}", method = RequestMethod.POST)
    public CreditVO getCreditById(@PathVariable("id") String id) {
        CreditVO vo = creditService.getCreditById(id);
        return vo;
    }

}
