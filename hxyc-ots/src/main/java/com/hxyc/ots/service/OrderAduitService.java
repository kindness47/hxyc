package com.hxyc.ots.service;

import com.hxyc.ots.vo.OrderAduitVO;

import java.util.List;

/**
 * @Author: bin.wu
 * @Date: 2018/8/8
 * @Description: 订单审查业务接口
 */
public interface OrderAduitService {

    /**
     * 项目订单跟踪信息列表
     * @Auther: bin.wu
     * @Date  2018/8/8
     */
    List<OrderAduitVO> listAduitOrder(String projectId);
}
