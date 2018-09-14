package com.hxyc.ots.controller;

import com.hxyc.ots.model.Project;
import com.hxyc.ots.model.Receipt;
import com.hxyc.ots.service.*;
import com.hxyc.ots.vo.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

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
        CreditVO creditparam =  new CreditVO();
        creditparam.setProjectId(projectId);
        creditparam.setSortDesc("asc");
        List<CreditVO> creditVOList = creditService.listCredit(creditparam);
        //收款信息
        ReceiptVO receiptParam = new ReceiptVO();
        receiptParam.setProjectId(projectId);
        receiptParam.setSortDesc("asc");
        List<ReceiptVO> receiptVOList = receiptService.listReceipt(receiptParam);
        //列表信息
        List<OrderAduitVO> orderAduitVOList = orderAduitService.listAduitOrder(projectId);

        List<OrderAduitVO> xyzOrderAduitVOList = orderAduitVOList.stream()
                .filter(orderAduitVO -> null != orderAduitVO.getSettlementMode() && 1 == orderAduitVO.getSettlementMode())
                .collect(Collectors.toList());

        List<OrderAduitVO> daigouOrderAduitVOList = orderAduitVOList.stream()
                .filter(orderAduitVO -> null != orderAduitVO.getSettlementMode() && 2 == orderAduitVO.getSettlementMode())
                .collect(Collectors.toList());
        List<OrderAduitVO> daigouFukuanVOList = new ArrayList<>();
        daigouFukuanVOList.addAll(daigouOrderAduitVOList);

        List<OrderAduitVO> liwaiOrderAduitVOList = orderAduitVOList.stream()
                .filter(orderAduitVO -> null != orderAduitVO.getSettlementMode() && 3 == orderAduitVO.getSettlementMode())
                .collect(Collectors.toList());

        List<OrderAduitVO> liwaiFukuanVOList = new ArrayList<>();
        liwaiFukuanVOList.addAll(liwaiOrderAduitVOList);


        //将开证信息放入列表list中 开证收款与列表数据无逻辑关系
        if (! CollectionUtils.isEmpty(creditVOList)){
            for(int i=0;i<creditVOList.size();i++){
                if (CollectionUtils.isEmpty(xyzOrderAduitVOList)){
                    xyzOrderAduitVOList = new ArrayList<>();
                    for(int m = 0;m < creditVOList.size(); m++){
                        OrderAduitVO orderAduitVO = new  OrderAduitVO();
                        orderAduitVO.setOpenAmount(creditVOList.get(m).getOpenAmount());
                        orderAduitVO.setOpenTime(creditVOList.get(m).getOpenTime());
                        xyzOrderAduitVOList.add(orderAduitVO);
                    }
                    break;
                }
                if (i < xyzOrderAduitVOList.size()) {
                    OrderAduitVO orderAduitVO = xyzOrderAduitVOList.get(i);
                    CreditVO creditVO = creditVOList.get(i);
                    orderAduitVO.setOpenTime(creditVO.getOpenTime());
                    orderAduitVO.setOpenAmount(creditVO.getOpenAmount());
                }else {
                    OrderAduitVO orderAduitVO = new  OrderAduitVO();
                    CreditVO creditVO = creditVOList.get(i);
                    orderAduitVO.setOpenTime(creditVO.getOpenTime());
                    orderAduitVO.setOpenAmount(creditVO.getOpenAmount());
                    xyzOrderAduitVOList.add(orderAduitVO);
                }
            }

        }
        //代购放入收款信息
        List<AduitVO> daigouAduitVOList = new ArrayList<>();
        if (! CollectionUtils.isEmpty(receiptVOList)){
            for(int n=0;n<receiptVOList.size();n++){
                if (CollectionUtils.isEmpty(daigouFukuanVOList)){
                    daigouFukuanVOList = new ArrayList<>();
                    for(int p = 0;p < receiptVOList.size(); p++){
                        OrderAduitVO orderAduitVO = new  OrderAduitVO();
                        orderAduitVO.setReceiptAmount(receiptVOList.get(p).getReceiptAmount());
                        orderAduitVO.setReceiptTime(receiptVOList.get(p).getReceiptTime());
                        daigouFukuanVOList.add(orderAduitVO);
                    }
                    break;
                }
                if (n < daigouFukuanVOList.size()){
                    OrderAduitVO orderAduitVO = daigouFukuanVOList.get(n);
                    ReceiptVO receiptVO = receiptVOList.get(n);
                    orderAduitVO.setReceiptTime(receiptVO.getReceiptTime());
                    orderAduitVO.setReceiptAmount(receiptVO.getReceiptAmount());
                }else {
                    OrderAduitVO orderAduitVO = new  OrderAduitVO();
                    ReceiptVO receiptVO = receiptVOList.get(n);
                    orderAduitVO.setReceiptTime(receiptVO.getReceiptTime());
                    orderAduitVO.setReceiptAmount(receiptVO.getReceiptAmount());
                    daigouFukuanVOList.add(orderAduitVO);
                }
            }

        }
        //例外放入收款信息
        if (! CollectionUtils.isEmpty(receiptVOList)){
            for(int n=0;n<receiptVOList.size();n++){
                if (CollectionUtils.isEmpty(liwaiFukuanVOList)){
                    liwaiFukuanVOList = new ArrayList<>();
                    for(int p = 0;p < receiptVOList.size(); p++){
                        OrderAduitVO orderAduitVO = new  OrderAduitVO();
                        orderAduitVO.setReceiptAmount(receiptVOList.get(p).getReceiptAmount());
                        orderAduitVO.setReceiptTime(receiptVOList.get(p).getReceiptTime());
                        liwaiFukuanVOList.add(orderAduitVO);
                    }
                    break;
                }
                if (n < liwaiFukuanVOList.size()) {
                    OrderAduitVO orderAduitVO = liwaiFukuanVOList.get(n);
                    ReceiptVO receiptVO = receiptVOList.get(n);
                    orderAduitVO.setReceiptTime(receiptVO.getReceiptTime());
                    orderAduitVO.setReceiptAmount(receiptVO.getReceiptAmount());
                }else {
                    OrderAduitVO orderAduitVO = new  OrderAduitVO();
                    ReceiptVO receiptVO = receiptVOList.get(n);
                    orderAduitVO.setReceiptTime(receiptVO.getReceiptTime());
                    orderAduitVO.setReceiptAmount(receiptVO.getReceiptAmount());
                    liwaiFukuanVOList.add(orderAduitVO);
                }

            }

        }
        ModelAndView mav = new ModelAndView("ots/order-aduit-list");
        mav.addObject("project", project);
        if (! CollectionUtils.isEmpty(orderAduitVOList)){
            OrderAduitVO orderAduitVO = orderAduitVOList.get(0);
            mav.addObject("orderCreator", orderAduitVO.getOrderCreator());
            mav.addObject("settlementCreator", orderAduitVO.getCreateBy());
            orderAduitVOList.stream().forEach(item->{
                if (! StringUtils.isEmpty(item.getFinancialCerator())){
                    mav.addObject("financialCerator", item.getFinancialCerator());
                }
                return;
            });
        }
        mav.addObject("projectCreator", project.getCreateBy());
        mav.addObject("xyzOrderAduitVOList", xyzOrderAduitVOList);
        mav.addObject("daigouOrderAduitVOList", daigouOrderAduitVOList);
        mav.addObject("liwaiOrderAduitVOList", liwaiOrderAduitVOList);
        mav.addObject("daigouFukuanVOList", daigouFukuanVOList);
        mav.addObject("liwaiFukuanVOList", liwaiFukuanVOList);
        mav.addObject("orderAduitVOList",orderAduitVOList);
        return mav;
    }


}
