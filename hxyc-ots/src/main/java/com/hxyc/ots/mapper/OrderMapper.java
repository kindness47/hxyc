package com.hxyc.ots.mapper;

import com.hxjc.core.utils.DataSource;
import com.hxyc.ots.model.Order;
import com.hxyc.ots.vo.OrderVO;

import java.util.List;

@DataSource(value="dataSourceOts")
public interface OrderMapper {

    int delete(String id);

    int insert(Order order);

    OrderVO selectById(String id);

    List<OrderVO> selectByProjectId(String projectId);

    List<OrderVO> select(OrderVO orderVO);

    Integer selectCount(OrderVO orderVO);

    int update(Order order);
    int updateByPrimaryKey(Order record);

    /**
     * 功能描述: 订单信息列表
     * @Auther: 于金谷
     * @Date create in 2018/7/31 15:39
     */
    List<OrderVO> listOrder(OrderVO orderVO);
}