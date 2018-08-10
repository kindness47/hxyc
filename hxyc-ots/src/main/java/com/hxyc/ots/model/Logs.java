package com.hxyc.ots.model;

import java.util.Date;

/**
 * @Description:操作日志实体类
 * @Author: 于金谷
 * @Date: 2018/7/13 15:40
 */
public class Logs {
    /**主键*/
    private String id;

    /**操作人ID*/
    private String operatorId;

    /**操作人*/
    private String operatorName;

    /**操作时间*/
    private Date operatorTime;

    /**模块描述*/
    private String modelDesc;

    /**功能描述*/
    private String functionDesc;

    /**功能ID*/
    private String functionId;

    /**ip*/
    private String ip;

    /**操作类型 1 系统日志 2 功能操作日志*/
    private Integer type;

    /**备注*/
    private String remarks;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getOperatorId() {
        return operatorId;
    }

    public void setOperatorId(String operatorId) {
        this.operatorId = operatorId == null ? null : operatorId.trim();
    }

    public String getOperatorName() {
        return operatorName;
    }

    public void setOperatorName(String operatorName) {
        this.operatorName = operatorName == null ? null : operatorName.trim();
    }

    public Date getOperatorTime() {
        return operatorTime;
    }

    public void setOperatorTime(Date operatorTime) {
        this.operatorTime = operatorTime;
    }

    public String getModelDesc() {
        return modelDesc;
    }

    public void setModelDesc(String modelDesc) {
        this.modelDesc = modelDesc == null ? null : modelDesc.trim();
    }

    public String getFunctionDesc() {
        return functionDesc;
    }

    public void setFunctionDesc(String functionDesc) {
        this.functionDesc = functionDesc == null ? null : functionDesc.trim();
    }

    public String getFunctionId() {
        return functionId;
    }

    public void setFunctionId(String functionId) {
        this.functionId = functionId == null ? null : functionId.trim();
    }

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip == null ? null : ip.trim();
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks == null ? null : remarks.trim();
    }
}