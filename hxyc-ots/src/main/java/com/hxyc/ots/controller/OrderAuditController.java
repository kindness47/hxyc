package com.hxyc.ots.controller;

import com.hxyc.ots.model.Project;
import com.hxyc.ots.model.Receipt;
import com.hxyc.ots.service.*;
import com.hxyc.ots.vo.CreditVO;
import com.hxyc.ots.vo.OrderAduitVO;
import com.hxyc.ots.vo.ReceiptVO;
import com.hxyc.ots.vo.SettlementVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * @Description:订单审查
 * @Author: bin.wu
 * @Date: 2018/8/3
 */
@Controller
public class OrderAuditController extends BaseController {

    @Autowired
    private ProjectService projectService;

    @Autowired
    private CreditService creditService;

    @Autowired
    private ReceiptService receiptService;

    @Autowired
    private OrderAduitService orderAduitService;

    /**
     * 审查订单
     */
    @RequestMapping(value = "/order-aduit", method = RequestMethod.GET)
    public ModelAndView aduit(SettlementVO settlementVO){
        ModelAndView mav = new ModelAndView("ots/order-aduit");
        return mav;
    }

    /**
     * 查看项目订单跟踪详情
     */
    @RequestMapping(value = "/aduit-list", method = RequestMethod.GET)
    public ModelAndView aduitDetail(String projectId){
        //项目信息
        Project project = projectService.getProjectById(projectId);
        //开证信息
        CreditVO Creditparam =  new CreditVO();
        Creditparam.setCompanyId(project.getCompanyId());
        List<CreditVO> creditVOList = creditService.listCredit(Creditparam);
        //收款信息
        ReceiptVO receiptParam = new ReceiptVO();
        receiptParam.setCompanyId(project.getCompanyId());
        List<ReceiptVO> receiptVOList = receiptService.listReceipt(receiptParam);
        //列表信息
        List<OrderAduitVO> orderAduitVOList = orderAduitService.listAduitOrder(projectId);
        //将开证收款信息放入列表list中 开证收款与列表数据无逻辑关系
        if (! CollectionUtils.isEmpty(creditVOList)){
            Integer j = 0;
            for(int i=0;i<orderAduitVOList.size();i++){
                OrderAduitVO orderAduitVO = orderAduitVOList.get(i);
                if (null != orderAduitVO.getSettlementMode() && 1 == orderAduitVO.getSettlementMode()){
                    CreditVO creditVO = creditVOList.get(j);
                    orderAduitVO.setOpenTime(creditVO.getOpenTime());
                    orderAduitVO.setOpenAmount(creditVO.getOpenAmount());
                    System.out.println(creditVO.getOpenAmount());
                    j++;
                    if ( j >= creditVOList.size()) break;
                }
            }
        }

        ModelAndView mav = new ModelAndView("ots/order-aduit-list");
        mav.addObject("project", project);
        if (! CollectionUtils.isEmpty(orderAduitVOList)){
            OrderAduitVO orderAduitVO = orderAduitVOList.get(0);
            mav.addObject("orderCreator", orderAduitVO.getOrderCreator());
            mav.addObject("financialCerator", orderAduitVO.getFinancialCerator());
            mav.addObject("settlementCreator", orderAduitVO.getCreateBy());
        }
        mav.addObject("orderAduitVOList", orderAduitVOList);
        mav.addObject("receiptVOList", receiptVOList);
        return mav;
    }


}
