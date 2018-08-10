package com.hxjc.hxyc.model;

import com.baomidou.mybatisplus.annotations.TableName;

@TableName("hxyc.t_supplier_deposit")
public class SupplierDeposit extends BaseModel {

    /** 招标ID*/
    private String tenderId;

    /** 缴费详情ID*/
    private String childDetailId;

    /** 招标编号*/
    private String tenderCode;

    /** 招标名称*/
    private String tenderName;

    /** 工程项目*/
    private String projectName;

    /** 招标状态*/
    private String procStateName;

    /** 供应商ID*/
    private String supplierId;

    /** 供应商名称*/
    private String supplierName;

    /** 联系人*/
    private String contactPerson;

    /** 联系电话*/
    private String mobile;

    /** 邮箱*/
    private String email;

    /** 付费类型*/
    private String accType;

    /** 交易总金额*/
    private String needAmount;

    /** 子账号*/
    private String payeeAccNo;

    /** 收款人*/
    private String payeeAccName;

    /** 交易流水号*/
    private String payeesEq;

    /** 交易金额*/
    private String tranAmount;

    /** 交易日期*/
    private String tranDate;

    /** 交易时间*/
    private String tranTime;

    /** 付款方开户行*/
    private String draweePartyName;

    /** 付款人*/
    private String draweeAccName;

    /** 付款人账号*/
    private String draweeAccNo;

    /** 联行号*/
    private String draweePartyId;

    /**  保证金状态 0 未退款 1 退款中 2 已退款*/
    private String depositStatus;

    public String getTenderId() {
        return tenderId;
    }

    public void setTenderId(String tenderId) {
        this.tenderId = tenderId == null ? null : tenderId.trim();
    }

    public String getTenderCode() {
        return tenderCode;
    }

    public void setTenderCode(String tenderCode) {
        this.tenderCode = tenderCode == null ? null : tenderCode.trim();
    }

    public String getTenderName() {
        return tenderName;
    }

    public void setTenderName(String tenderName) {
        this.tenderName = tenderName == null ? null : tenderName.trim();
    }

    public String getProjectName() {
        return projectName;
    }

    public void setProjectName(String projectName) {
        this.projectName = projectName == null ? null : projectName.trim();
    }

    public String getProcStateName() {
        return procStateName;
    }

    public void setProcStateName(String procStateName) {
        this.procStateName = procStateName == null ? null : procStateName.trim();
    }

    public String getSupplierId() {
        return supplierId;
    }

    public void setSupplierId(String supplierId) {
        this.supplierId = supplierId == null ? null : supplierId.trim();
    }

    public String getSupplierName() {
        return supplierName;
    }

    public void setSupplierName(String supplierName) {
        this.supplierName = supplierName == null ? null : supplierName.trim();
    }

    public String getContactPerson() {
        return contactPerson;
    }

    public void setContactPerson(String contactPerson) {
        this.contactPerson = contactPerson == null ? null : contactPerson.trim();
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile == null ? null : mobile.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public String getAccType() {
        return accType;
    }

    public void setAccType(String accType) {
        this.accType = accType == null ? null : accType.trim();
    }

    public String getNeedAmount() {
        return needAmount;
    }

    public void setNeedAmount(String needAmount) {
        this.needAmount = needAmount == null ? null : needAmount.trim();
    }

    public String getPayeeAccNo() {
        return payeeAccNo;
    }

    public void setPayeeAccNo(String payeeAccNo) {
        this.payeeAccNo = payeeAccNo == null ? null : payeeAccNo.trim();
    }

    public String getPayeeAccName() {
        return payeeAccName;
    }

    public void setPayeeAccName(String payeeAccName) {
        this.payeeAccName = payeeAccName == null ? null : payeeAccName.trim();
    }

    public String getPayeesEq() {
        return payeesEq;
    }

    public void setPayeesEq(String payeesEq) {
        this.payeesEq = payeesEq == null ? null : payeesEq.trim();
    }

    public String getTranAmount() {
        return tranAmount;
    }

    public void setTranAmount(String tranAmount) {
        this.tranAmount = tranAmount == null ? null : tranAmount.trim();
    }

    public String getTranDate() {
        return tranDate;
    }

    public void setTranDate(String tranDate) {
        this.tranDate = tranDate == null ? null : tranDate.trim();
    }

    public String getTranTime() {
        return tranTime;
    }

    public void setTranTime(String tranTime) {
        this.tranTime = tranTime == null ? null : tranTime.trim();
    }

    public String getDraweeAccName() {
        return draweeAccName;
    }

    public void setDraweeAccName(String draweeAccName) {
        this.draweeAccName = draweeAccName == null ? null : draweeAccName.trim();
    }

    public String getDraweeAccNo() {
        return draweeAccNo;
    }

    public void setDraweeAccNo(String draweeAccNo) {
        this.draweeAccNo = draweeAccNo == null ? null : draweeAccNo.trim();
    }

    public String getDraweePartyId() {
        return draweePartyId;
    }

    public void setDraweePartyId(String draweePartyId) {
        this.draweePartyId = draweePartyId == null ? null : draweePartyId.trim();
    }

    public String getDepositStatus() {
        return depositStatus;
    }


    public String getDraweePartyName() {
        return draweePartyName;
    }

    public void setDraweePartyName(String draweePartyName) {
        this.draweePartyName = draweePartyName;
    }

    public void setDepositStatus(String depositStatus) {
        this.depositStatus = depositStatus == null ? null : depositStatus.trim();
    }

    public String getChildDetailId() {
        return childDetailId;
    }

    public void setChildDetailId(String childDetailId) {
        this.childDetailId = childDetailId;
    }
}