package com.hxyc.ots.mapper;

import com.hxjc.core.utils.DataSource;
import com.hxyc.ots.model.Payment;
import com.hxyc.ots.vo.PaymentVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 订单跟踪
 * <p>
 * 支付信息mapper接口
 *
 * @author bin.wu 2018-7-24
 */
@DataSource(value="dataSourceOts")
public interface PaymentMapper {

    /**
     * 删除支付信息
     * @param paymentId
     * @return
     */
    int delete(String paymentId);

    /**
     * 新增支付信息
     * @param payment
     * @return
     */
    int insert(Payment payment);

    /**
     * 根据ID查询支付信息
     * @param id
     * @return
     */
    PaymentVO selectById(String id);

    /**
     * 查询支付列表
     * @param paymentVO
     * @return
     */
    List<PaymentVO> select(PaymentVO paymentVO);

    /**
     * 更新支付信息
     * @param payment
     * @return
     */
    int update(Payment payment);

    /**
     * Description： 更新发票开立信息
     * Author: 刘永红
     * Date: Created in 2018/11/23 14:32
     */
    int updateBillOpen(Payment payment);

    Double getPaidSettleAmount(@Param(value = "settlementId")String settlementId);
}