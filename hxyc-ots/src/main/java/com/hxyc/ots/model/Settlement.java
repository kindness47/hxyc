package com.hxyc.ots.model;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * 功能描述:结算信息实体类
 * @Auther: 于金谷
 * @Date create in 2018/7/13 15:09
 */
public class Settlement extends BaseModel {

    /**订单ID*/
    private String orderId;

    /**所属公司ID*/
    private String companyId;

    /**所属项目ID*/
    private String projectId;

    /**结算编码*/
    private String settlementCode;

    /**供方结算时间*/
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date supplierSettlementTime;

    /**供方结算状态*/
    private Integer supplierSettlementStatus;

    /**供方结算备注*/
    private String supplierSettlementRemark;

    /**结算单据送达时间*/
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date settlementDeliveryTime;

    /**结算单据送达状态*/
    private Integer settlementDeliveryStatus;

    /**结算单据送达备注*/
    private String settlementDeliveryRemark;

    /**发票送达时间*/
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date billDeliveryTime;

    /**发票送达状态*/
    private Integer billDeliveryStatus;

    /**发票送达备注*/
    private String billDeliveryRemark;

    /**需方结算时间*/
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date buyerSettlementTime;

    /**需方结算状态*/
    private Integer buyerSettlementStatus;

    /**需方结算备注*/
    private String buyerSettlementRemark;

    /**结算方式 1信用证 2代购 3信用证-例外*/
    private Integer settlementMode;

    /**结算金额*/
    private Double settlementAmount;

    //结算模式对应的id
    private String settlementModeId;

    //供方结算金额
    private Double supplierSettleAmount;

    //剩余金额
    private Double balanceOfSettlement;

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId == null ? null : orderId.trim();
    }

    public String getSettlementCode() {
        return settlementCode;
    }

    public void setSettlementCode(String settlementCode) {
        this.settlementCode = settlementCode == null ? null : settlementCode.trim();
    }

    public Date getSupplierSettlementTime() {
        return supplierSettlementTime;
    }

    public void setSupplierSettlementTime(Date supplierSettlementTime) {
        this.supplierSettlementTime = supplierSettlementTime;
    }

    public Integer getSupplierSettlementStatus() {
        return supplierSettlementStatus;
    }

    public void setSupplierSettlementStatus(Integer supplierSettlementStatus) {
        this.supplierSettlementStatus = supplierSettlementStatus;
    }

    public Date getSettlementDeliveryTime() {
        return settlementDeliveryTime;
    }

    public void setSettlementDeliveryTime(Date settlementDeliveryTime) {
        this.settlementDeliveryTime = settlementDeliveryTime;
    }

    public Integer getSettlementDeliveryStatus() {
        return settlementDeliveryStatus;
    }

    public void setSettlementDeliveryStatus(Integer settlementDeliveryStatus) {
        this.settlementDeliveryStatus = settlementDeliveryStatus;
    }

    public Date getBillDeliveryTime() {
        return billDeliveryTime;
    }

    public void setBillDeliveryTime(Date billDeliveryTime) {
        this.billDeliveryTime = billDeliveryTime;
    }

    public Integer getBillDeliveryStatus() {
        return billDeliveryStatus;
    }

    public void setBillDeliveryStatus(Integer billDeliveryStatus) {
        this.billDeliveryStatus = billDeliveryStatus;
    }

    public Date getBuyerSettlementTime() {
        return buyerSettlementTime;
    }

    public void setBuyerSettlementTime(Date buyerSettlementTime) {
        this.buyerSettlementTime = buyerSettlementTime;
    }

    public Integer getBuyerSettlementStatus() {
        return buyerSettlementStatus;
    }

    public void setBuyerSettlementStatus(Integer buyerSettlementStatus) {
        this.buyerSettlementStatus = buyerSettlementStatus;
    }

    public Integer getSettlementMode() {
        return settlementMode;
    }

    public void setSettlementMode(Integer settlementMode) {
        this.settlementMode = settlementMode;
    }

    public Double getSettlementAmount() {
        return settlementAmount;
    }

    public void setSettlementAmount(Double settlementAmount) {
        this.settlementAmount = settlementAmount;
    }

    public String getSupplierSettlementRemark() {
        return supplierSettlementRemark;
    }

    public void setSupplierSettlementRemark(String supplierSettlementRemark) {
        this.supplierSettlementRemark = supplierSettlementRemark;
    }

    public String getSettlementDeliveryRemark() {
        return settlementDeliveryRemark;
    }

    public void setSettlementDeliveryRemark(String settlementDeliveryRemark) {
        this.settlementDeliveryRemark = settlementDeliveryRemark;
    }

    public String getBillDeliveryRemark() {
        return billDeliveryRemark;
    }

    public void setBillDeliveryRemark(String billDeliveryRemark) {
        this.billDeliveryRemark = billDeliveryRemark;
    }

    public String getBuyerSettlementRemark() {
        return buyerSettlementRemark;
    }

    public void setBuyerSettlementRemark(String buyerSettlementRemark) {
        this.buyerSettlementRemark = buyerSettlementRemark;
    }

    public String getCompanyId() {
        return companyId;
    }

    public void setCompanyId(String companyId) {
        this.companyId = companyId;
    }

    public String getProjectId() {
        return projectId;
    }

    public void setProjectId(String projectId) {
        this.projectId = projectId;
    }

    public String getSettlementModeId() {
        return settlementModeId;
    }

    public void setSettlementModeId(String settlementModeId) {
        this.settlementModeId = settlementModeId;
    }

    public Double getSupplierSettleAmount() {
        return supplierSettleAmount;
    }

    public void setSupplierSettleAmount(Double supplierSettleAmount) {
        this.supplierSettleAmount = supplierSettleAmount;
    }

    public Double getBalanceOfSettlement() {
        return balanceOfSettlement;
    }

    public void setBalanceOfSettlement(Double balanceOfSettlement) {
        this.balanceOfSettlement = balanceOfSettlement;
    }
}