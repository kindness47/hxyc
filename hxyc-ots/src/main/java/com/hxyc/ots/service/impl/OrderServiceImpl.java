package com.hxyc.ots.service.impl;

import com.hxyc.ots.mapper.OrderMapper;
import com.hxyc.ots.model.Order;
import com.hxyc.ots.service.OrderService;
import com.hxyc.ots.vo.OrderVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Author: 于金谷
 * @Date: 2018/7/16 16:33
 * @Description: 订单管理业务实现
 */
@Service
public class OrderServiceImpl implements OrderService {

    @Autowired
    private OrderMapper orderMapper;
    /**
     * 功能描述:订单信息列表
     * @param orderVO
     * @Auther: 于金谷
     * @Date create in 2018/7/16 16:30
     */
    @Override
    public List<OrderVO> listOrder(OrderVO orderVO) {
        return orderMapper.select(orderVO);
    }

    @Override
    public List<OrderVO> listOrderByProjectId(String projectId) {
        return orderMapper.selectByProjectId(projectId);
    }

    @Override
    public Integer getCount(OrderVO orderVO) {
        return orderMapper.selectCount(orderVO);
    }

    /**
     * 功能描述: 通过ID获取订单信息
     * @param id 订单ID
     * @Auther: 于金谷
     * @Date create in 2018/7/31 16:04
     */
    @Override
    public Order getOrderById(String id) {
        Order order = orderMapper.selectById(id);
        return order;
    }

    /**
     * 功能描述: 修改订单信息
     * @param order 订单信息
     * @Auther: 于金谷
     * @Date create in 2018/7/31 16:04
     */
    @Override
    public void updateOrder(Order order) {
        orderMapper.update(order);
    }

    /**
     * 功能描述: 保存订单信息
     * @param order 订单信息
     * @Auther: 于金谷
     * @Date create in 2018/7/31 16:05
     */
    @Override
    public void saveOrder(Order order) {
        orderMapper.insert(order);
    }
}
