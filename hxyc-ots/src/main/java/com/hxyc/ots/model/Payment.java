package com.hxyc.ots.model;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * 功能描述: 付款支付信息实体类
 * @Auther: 于金谷
 * @Date create in 2018/7/13 14:56
 */
public class Payment extends BaseModel {

    /**结算ID*/
    private String settlementId;

    /**需方发票开立时间*/
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date billOpenTime;

    /**需方发票开立状态*/
    private Integer billOpenStatus;

    /**需方发票开立备注*/
    private String billOpenRemark;

    /**支付编码*/
    private String paymentCode;

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

    /**支付源ID 为对应结算模式下的信用证或收款ID*/
    private String paymentSourceId;


    public String getSettlementId() {
        return settlementId;
    }

    public void setSettlementId(String settlementId) {
        this.settlementId = settlementId == null ? null : settlementId.trim();
    }

    public String getPaymentCode() {
        return paymentCode;
    }

    public void setPaymentCode(String paymentCode) {
        this.paymentCode = paymentCode == null ? null : paymentCode.trim();
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
        this.remarks = remarks == null ? null : remarks.trim();
    }

    public String getApprovalRemark() {
        return approvalRemark;
    }

    public void setApprovalRemark(String approvalRemark) {
        this.approvalRemark = approvalRemark;
    }

    public String getPaymentRemark() {
        return paymentRemark;
    }

    public void setPaymentRemark(String paymentRemark) {
        this.paymentRemark = paymentRemark;
    }

    public Date getBillOpenTime() {
        return billOpenTime;
    }

    public void setBillOpenTime(Date billOpenTime) {
        this.billOpenTime = billOpenTime;
    }

    public Integer getBillOpenStatus() {
        return billOpenStatus;
    }

    public void setBillOpenStatus(Integer billOpenStatus) {
        this.billOpenStatus = billOpenStatus;
    }

    public String getBillOpenRemark() {
        return billOpenRemark;
    }

    public void setBillOpenRemark(String billOpenRemark) {
        this.billOpenRemark = billOpenRemark;
    }

    public String getPaymentSourceId() {
        return paymentSourceId;
    }

    public void setPaymentSourceId(String paymentSourceId) {
        this.paymentSourceId = paymentSourceId;
    }
}