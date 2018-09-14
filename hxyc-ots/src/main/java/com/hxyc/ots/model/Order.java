package com.hxyc.ots.model;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * 功能描述: 订单信息实体类
 * @Auther: 于金谷
 * @Date create in 2018/7/13 14:50
 */
public class Order extends BaseModel {

    /**项目ID*/
    private String projectId;

    /**订单编码*/
    private String orderCode;

    /**订单时间*/
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @JsonFormat(pattern = "yyyy-MM-dd",timezone = "GMT+8")
    private Date orderTime;

    /**订单状态*/
    private Integer orderStatus;

    /**订单批次号*/
    private String orderBatchNo;

    /**交验时间*/
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @JsonFormat(pattern = "yyyy-MM-dd",timezone = "GMT+8")
    private Date deliveryTime;

    /**交验状态*/
    private Integer deliveryStatus;

    /**验收数量*/
    private String receiveNum;

    /**质量 1 服务好 0 服务差*/
    private Integer quality;

    /**质量备注*/
    private String qualityRemark;

    /**服务 1 服务好 0 服务差*/
    private Integer service;

    /**服务备注*/
    private String serviceRemark;

    /**结算方式： 1 信用证 2 列外 3 代购*/
    private Integer settlementMode;

    /**订单异常描述*/
    private String orderExceptionDesc;

    /**交验异常描述*/
    private String deliveryExceptionDesc;


    public String getProjectId() {
        return projectId;
    }

    public void setProjectId(String projectId) {
        this.projectId = projectId == null ? null : projectId.trim();
    }

    public String getOrderCode() {
        return orderCode;
    }

    public void setOrderCode(String orderCode) {
        this.orderCode = orderCode == null ? null : orderCode.trim();
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
        this.receiveNum = receiveNum == null ? null : receiveNum.trim();
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

    public String getQualityRemark() {
        return qualityRemark;
    }

    public void setQualityRemark(String qualityRemark) {
        this.qualityRemark = qualityRemark;
    }

    public String getServiceRemark() {
        return serviceRemark;
    }

    public void setServiceRemark(String serviceRemark) {
        this.serviceRemark = serviceRemark;
    }

    public Integer getSettlementMode() {
        return settlementMode;
    }

    public void setSettlementMode(Integer settlementMode) {
        this.settlementMode = settlementMode;
    }

    public String getOrderBatchNo() {
        return orderBatchNo;
    }

    public void setOrderBatchNo(String orderBatchNo) {
        this.orderBatchNo = orderBatchNo;
    }
}