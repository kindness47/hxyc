package com.hxyc.ots.controller;

import com.hxyc.ots.model.Project;
import com.hxyc.ots.service.*;
import com.hxyc.ots.vo.*;

import java.util.*;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

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

    @Autowired
    private SettlementService settlementService;

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

        List<OrderAduitVO> liwaiOrderAduitVOList = orderAduitVOList.stream()
                .filter(orderAduitVO -> null != orderAduitVO.getSettlementMode() && 3 == orderAduitVO.getSettlementMode())
                .collect(Collectors.toList());

        //将开证信息放入列表list中 开证收款与列表数据无逻辑关系
        orderAduitService.putCreditInfoIntoOrderAduitVO(creditVOList,xyzOrderAduitVOList);

        //付款信息查询
        List<PaymentVO> paymentVOList = null;
        PaymentVO paymentVO = new PaymentVO();
        paymentVO.setProjectId(projectId);


        //代购放入收款信息
        List<OrderAduitVO> daigouFukuanVOList = new ArrayList<>();
        paymentVO.setSettlementMode(2);
        paymentVOList = orderAduitService.getPaymentRecordList(paymentVO);
        if (! CollectionUtils.isEmpty(paymentVOList)){
            paymentVOList.forEach(payItem->{
                OrderAduitVO orderAduitVO = new OrderAduitVO();
                BeanUtils.copyProperties(payItem,orderAduitVO);
                daigouFukuanVOList.add(orderAduitVO);
            });
        }
        orderAduitService.putReceiptInfoIntoOrderAduitVO(receiptVOList,daigouFukuanVOList);

        //例外放入收款信息
        List<OrderAduitVO> liwaiFukuanVOList = new ArrayList<>();
        paymentVO.setSettlementMode(3);
        paymentVOList = orderAduitService.getPaymentRecordList(paymentVO);
        if (! CollectionUtils.isEmpty(paymentVOList)){
            paymentVOList.forEach(payItem->{
                OrderAduitVO orderAduitVO = new OrderAduitVO();
                BeanUtils.copyProperties(payItem,orderAduitVO);
                liwaiFukuanVOList.add(orderAduitVO);
            });
        }
        orderAduitService.putReceiptInfoIntoOrderAduitVO(receiptVOList,liwaiFukuanVOList);

        ModelAndView mav = new ModelAndView("ots/order-aduit-list");
        mav.addObject("project", project);
        if (! CollectionUtils.isEmpty(orderAduitVOList)){
            List<OrderAduitVO> itemList = new ArrayList<>();
            itemList.addAll(orderAduitVOList);
            Collections.reverse(itemList);
            mav.addObject("orderCreator", itemList.get(0).getOrderCreator());
            itemList.stream().forEach(item->{
                if (! StringUtils.isEmpty(item.getCreateBy())){
                    mav.addObject("settlementCreator", item.getCreateBy());
                }
                return;
            });
            itemList.stream().forEach(item->{
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
        System.out.println(orderAduitVOList);
        return mav;
    }

    @RequestMapping("/exceptionOrder")
    public ModelAndView selectExceptionOrder(@RequestParam("projectId") String projectId){
        Map<String,Object> map = new HashMap<>();
        map.put("projectId",projectId);
        List<OrderAduitVO> orderAduitVOList = settlementService.selectOrderAudit(map);
        ModelAndView mov = new ModelAndView();

        //查询ProjectVO对象
        ProjectVO projectVO = new ProjectVO();
        projectVO.setId(projectId);
        List<ProjectVO> projectVOList = projectService.listProjectByParam(projectVO);
        projectVO = projectVOList.size() == 0 ? null:projectVOList.get(0);

        mov.addObject("project",projectVO);
        mov.addObject("orderAduitVOList",orderAduitVOList);
        mov.setViewName("ots/order-exception-list");
        return mov;
    }

    /**
     * 归档订单
     */
    @RequestMapping("/order-archiving")
    public ModelAndView orderException(SettlementVO settlementVO){
        ModelAndView mav = new ModelAndView("ots/order-archiving");
        return mav;
    }
}
