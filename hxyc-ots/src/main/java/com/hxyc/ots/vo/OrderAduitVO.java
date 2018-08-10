package com.hxyc.ots.vo;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.hxyc.ots.model.Settlement;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * @Author: bin.wu
 * @Date: 2018/8/7
 * @Description: 订单审查VO
 */
public class OrderAduitVO extends Settlement {

    /**
     * 公司名称
     */
    private String companyName;

    /**
     * 项目名称
     */
    private String projectName;

    //========支付部分==========

    /**审批完成时间*/
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date approvalTime;

    /**审批完成状态*/
    private Integer approvalStatus;

    /**审批备注*/
    private String approvalRemark;

    /**付款时间*/
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date paymentTime;

    /**付款状态*/
    private Integer paymentStatus;

    /**付款备注*/
    private String paymentRemark;

    /**付款金额*/
    private Double paymentAmount;

    /**信用证余额*/
    private Double creditSurplusAmount;

    /**其它备注*/
    private String remarks;

    //========订单部分============

    /**订单编码*/
    private String orderCode;

    /**订单时间*/
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date orderTime;

    /**订单状态*/
    private Integer orderStatus;

    /**交验时间*/
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date deliveryTime;

    /**交验状态*/
    private Integer deliveryStatus;

    /**验收数量*/
    private String receiveNum;

    /**质量 1 服务好 0 服务差*/
    private Integer quality;

    /**服务 1 服务好 0 服务差*/
    private Integer service;

    /**订单异常描述*/
    private String orderExceptionDesc;

    /**交验异常描述*/
    private String deliveryExceptionDesc;

    //===========信用证============

    /**开证金额*/
    private Double openAmount;

    /**开证日期*/
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date openTime;

    /**订单责任人*/
    private String orderCreator;

    /**财务责任人*/
    private String financialCerator;

    public String getOrderCreator() {
        return orderCreator;
    }

    public void setOrderCreator(String orderCreator) {
        this.orderCreator = orderCreator;
    }

    public String getFinancialCerator() {
        return financialCerator;
    }

    public void setFinancialCerator(String financialCerator) {
        this.financialCerator = financialCerator;
    }

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    public String getProjectName() {
        return projectName;
    }

    public void setProjectName(String projectName) {
        this.projectName = projectName;
    }

    public Date getApprovalTime() {
        return approvalTime;
    }

    public void setApprovalTime(Date approvalTime) {
        this.approvalTime = approvalTime;
    }

    public Integer getApprovalStatus() {
        return approvalStatus;
    }

    public void setApprovalStatus(Integer approvalStatus) {
        this.approvalStatus = approvalStatus;
    }

    public String getApprovalRemark() {
        return approvalRemark;
    }

    public void setApprovalRemark(String approvalRemark) {
        this.approvalRemark = approvalRemark;
    }

    public Date getPaymentTime() {
        return paymentTime;
    }

    public void setPaymentTime(Date paymentTime) {
        this.paymentTime = paymentTime;
    }

    public Integer getPaymentStatus() {
        return paymentStatus;
    }

    public void setPaymentStatus(Integer paymentStatus) {
        this.paymentStatus = paymentStatus;
    }

    public String getPaymentRemark() {
        return paymentRemark;
    }

    public void setPaymentRemark(String paymentRemark) {
        this.paymentRemark = paymentRemark;
    }

    public Double getPaymentAmount() {
        return paymentAmount;
    }

    public void setPaymentAmount(Double paymentAmount) {
        this.paymentAmount = paymentAmount;
    }

    public Double getCreditSurplusAmount() {
        return creditSurplusAmount;
    }

    public void setCreditSurplusAmount(Double creditSurplusAmount) {
        this.creditSurplusAmount = creditSurplusAmount;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

    public String getOrderCode() {
        return orderCode;
    }

    public void setOrderCode(String orderCode) {
        this.orderCode = orderCode;
    }

    public Date getOrderTime() {
        return orderTime;
    }

    public void setOrderTime(Date orderTime) {
        this.orderTime = orderTime;
    }

    public Integer getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(Integer orderStatus) {
        this.orderStatus = orderStatus;
    }

    public Date getDeliveryTime() {
        return deliveryTime;
    }

    public void setDeliveryTime(Date deliveryTime) {
        this.deliveryTime = deliveryTime;
    }

    public Integer getDeliveryStatus() {
        return deliveryStatus;
    }

    public void setDeliveryStatus(Integer deliveryStatus) {
        this.deliveryStatus = deliveryStatus;
    }

    public String getReceiveNum() {
        return receiveNum;
    }

    public void setReceiveNum(String receiveNum) {
        this.receiveNum = receiveNum;
    }

    public Integer getQuality() {
        return quality;
    }

    public void setQuality(Integer quality) {
        this.quality = quality;
    }

    public Integer getService() {
        return service;
    }

    public void setService(Integer service) {
        this.service = service;
    }

    public String getOrderExceptionDesc() {
        return orderExceptionDesc;
    }

    public void setOrderExceptionDesc(String orderExceptionDesc) {
        this.orderExceptionDesc = orderExceptionDesc;
    }

    public String getDeliveryExceptionDesc() {
        return deliveryExceptionDesc;
    }

    public void setDeliveryExceptionDesc(String deliveryExceptionDesc) {
        this.deliveryExceptionDesc = deliveryExceptionDesc;
    }

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
}
