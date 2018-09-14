package com.hxyc.ots.vo;

import com.hxyc.ots.model.Settlement;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * @Author: bin.wu
 * @Date: 2018/8/7
 * @Description: 订单审查VO
 */
public class AduitVO {


    //===========信用证============

    /**开证金额*/
    private Double openAmount;

    /**开证日期*/
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date openTime;

    /**收款金额*/
    private Double receiptAmount;

    /**收款日期*/
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date receiptTime;

    private OrderAduitVO orderAduitVO;

    public Double getOpenAmount() {
        return openAmount;
    }

    public void setOpenAmount(Double openAmount) {
        this.openAmount = openAmount;
    }

    public Date getOpenTime() {
        return openTime;
    }

    public void setOpenTime(Date openTime) {
        this.openTime = openTime;
    }

    public Double getReceiptAmount() {
        return receiptAmount;
    }

    public void setReceiptAmount(Double receiptAmount) {
        this.receiptAmount = receiptAmount;
    }

    public Date getReceiptTime() {
        return receiptTime;
    }

    public void setReceiptTime(Date receiptTime) {
        this.receiptTime = receiptTime;
    }

    public OrderAduitVO getOrderAduitVO() {
        return orderAduitVO;
    }

    public void setOrderAduitVO(OrderAduitVO orderAduitVO) {
        this.orderAduitVO = orderAduitVO;
    }
}
