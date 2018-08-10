package com.hxyc.ots.service;

import com.hxyc.ots.model.Order;
import com.hxyc.ots.vo.OrderVO;
import org.aspectj.weaver.ast.Or;

import java.util.List;

/**
 * @Author: 于金谷
 * @Date: 2018/7/16 16:28
 * @Description: 订单业务接口
 */
public interface OrderService {
    /**
     * 功能描述:订单信息列表
     * @Auther: 于金谷
     * @Date create in 2018/7/16 16:30
     */
    List<OrderVO> listOrder(OrderVO orderVO);

    /**
     * 根据ID获取项目
     * @param projectId
     * @Auther: bin.wu
     * @return
     */
    List<OrderVO> listOrderByProjectId(String projectId);

    /**
     * 根据条件获取项目总数
     * @param orderVO
     * @Auther: bin.wu
     * @return
     */
    Integer getCount(OrderVO orderVO);

    /**
     * 功能描述: 通过ID获取订单信息
     * @Auther: 于金谷
     * @Date create in 2018/7/31 16:04
     */
    Order getOrderById(String id);

    /**
     * 功能描述: 修改订单信息
     * @Auther: 于金谷
     * @Date create in 2018/7/31 16:04
     */
    void updateOrder(Order order);

    /**
     * 功能描述: 保存订单信息
     * @Auther: 于金谷
     * @Date create in 2018/7/31 16:05
     */
    void saveOrder(Order order);
}
