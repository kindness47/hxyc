package com.hxyc.ots.controller;

import com.hxyc.ots.base.Response;
import com.hxjc.core.utils.CodeUtils;
import com.hxyc.ots.model.Order;
import com.hxyc.ots.service.OrderService;
import com.hxyc.ots.service.ProjectService;
import com.hxyc.ots.utils.SystemUtil;
import com.hxyc.ots.vo.OrderVO;
import com.hxyc.ots.vo.ProjectVO;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * @Description:订单管理
 * @Author: 于金谷
 * @Date: 2018/7/16 16:07
 */
@Controller
public class OrderController extends BaseController {

    @Autowired
    private OrderService orderService;
    @Autowired
    private ProjectService projectService;

    /**
     * 订单信息列表
     */
    @RequestMapping(value = "/order-list", method = RequestMethod.GET)
    public ModelAndView listOrder(OrderVO orderVO){
        orderVO.setCreateBy(SystemUtil.getLoginUserName());
        if (SystemUtil.getSessionUser().getRoleName().indexOf("管理")!=-1){
            orderVO.setCreateBy(null);
        }
        ModelAndView mav = new ModelAndView("ots/order-list");
        List<OrderVO> orderList = orderService.listOrder(orderVO);
        mav.addObject("orderList", orderList);

        return mav;
    }

    /**
     * 订单信息列表
     */
    @RequestMapping(value = "/order-list-by-projId", method = RequestMethod.GET)
    @ResponseBody
    public Map<String,Object> listOrderByProjectId(OrderVO orderVO){
        Map<String,Object> paramMap = new HashMap<>();
        paramMap.put("code",0);
        paramMap.put("msg","");
        Integer total = orderService.getCount(orderVO);
        paramMap.put("count",total);
        orderVO.setPageStart((orderVO.getPage()-1)*orderVO.getLimit());
        orderVO.setPageEnd(orderVO.getPage()*orderVO.getLimit());
        List<OrderVO> projectVOList = orderService.getOrderList(orderVO);
        paramMap.put("data",projectVOList);
        return paramMap;
    }

    /**
     * 功能描述:新增订单
     * @Auther: 于金谷
     * @Date create in 2018/7/16 15:20
     */
    @RequestMapping(value = "/order-add", method = RequestMethod.GET)
    public ModelAndView addOrder(){
        ModelAndView mav = new ModelAndView("ots/order-add");

        // 初始化项目
        ProjectVO vo = new ProjectVO();
        List<ProjectVO> projectList = projectService.listProject(vo);
        mav.addObject("projectList", projectList);

        return mav;
    }

    /**
     * 功能描述:新增或修改订单保存
     * @Auther: 于金谷
     * @Date create in 2018/7/31 15:51
     */
    @RequestMapping(value = "/order-save", method = RequestMethod.POST)
    @ResponseBody
    public Response saveOrder(Order order) {
        String id = order.getId();
        if(StringUtils.isNotBlank(id)) { // 修改
            Order oldOrder = orderService.getOrderById(id);
            if(oldOrder == null) {
                return returnValidateError("修改订单不存在，请检查！");
            }

            oldOrder.setProjectId(order.getProjectId());
            oldOrder.setOrderTime(order.getOrderTime());
            oldOrder.setOrderStatus(order.getOrderStatus());
            oldOrder.setOrderExceptionDesc(order.getOrderExceptionDesc());
            oldOrder.setDeliveryTime(order.getDeliveryTime());
            oldOrder.setDeliveryStatus(order.getDeliveryStatus());
            oldOrder.setDeliveryExceptionDesc(order.getDeliveryExceptionDesc());
            oldOrder.setReceiveNum(order.getReceiveNum());
            oldOrder.setQuality(order.getQuality());
            oldOrder.setService(order.getService());
            oldOrder.setUpdateBy(SystemUtil.getLoginUserName());
            oldOrder.setUpdateTime(new Date());
            oldOrder.setOrderBatchNo(order.getOrderBatchNo());
            orderService.updateOrder(oldOrder);

            return returnSuccess("修改成功！");
        } else {
            order.setOrderCode(CodeUtils.getRuleCode("JCO"));
            order.setCreateBy(SystemUtil.getLoginUserName());
            order.setCreateTime(new Date());
            order.setStatus(1);
            orderService.saveOrder(order);

            return returnSuccess("新增成功！");
        }
    }

    /**
     * 功能描述: 根据ID获取订单信息
     * @Auther: 于金谷
     * @Date create in 2018/7/31 16:03
     */
    @ResponseBody
    @RequestMapping(value = "/order/{id}", method = RequestMethod.POST)
    public Order getOrderById(@PathVariable("id") String id) {
        Order order = orderService.getOrderById(id);
        return order;
    }

}
