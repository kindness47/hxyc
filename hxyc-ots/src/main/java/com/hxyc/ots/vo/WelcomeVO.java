package com.hxyc.ots.vo;

import java.io.Serializable;

/**
 * @Author: 于金谷
 * @Date: 2018/11/6 16:36
 * @Description: 欢迎页VO对象
 */
public class WelcomeVO implements Serializable {

    private String title;

    private String projectNum;

    private String orderNum;

    private String settlementNum;

    private String paymentNum;

    private String receiptNum;

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getProjectNum() {
        return projectNum;
    }

    public void setProjectNum(String projectNum) {
        this.projectNum = projectNum;
    }

    public String getOrderNum() {
        return orderNum;
    }

    public void setOrderNum(String orderNum) {
        this.orderNum = orderNum;
    }

    public String getSettlementNum() {
        return settlementNum;
    }

    public void setSettlementNum(String settlementNum) {
        this.settlementNum = settlementNum;
    }

    public String getPaymentNum() {
        return paymentNum;
    }

    public void setPaymentNum(String paymentNum) {
        this.paymentNum = paymentNum;
    }

    public String getReceiptNum() {
        return receiptNum;
    }

    public void setReceiptNum(String receiptNum) {
        this.receiptNum = receiptNum;
    }
}
