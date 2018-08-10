package com.hxyc.ots.model;

import java.util.Date;

/**
 * @Description:项目信息实体类
 * @Author: 于金谷
 * @Date: 2018/7/13 15:00
 */
public class Project extends BaseModel {

    /**公司ID*/
    private String companyId;

    /**项目名称*/
    private String projectName;

    /**项目编码*/
    private String projectCode;

    /**年份*/
    private String year;

    /**供应单位*/
    private String supplyUnit;

    /**合同签订时间*/
    private String contractSignTime;

    /**供货时间段*/
    private String supplyTime;

    /**合同数量（T）*/
    private String contractNum;

    /**合同金额（万元）*/
    private String contractAmount;

    /**结算模式*/
    private String settlementModel;

    /**基价浮动值*/
    private String baseFloatValue;

    /**例外垫资额度*/
    private String extraCapitalAmount;

    /**垫资期限*/
    private String capitalTimeLimit;

    /**利息标准*/
    private String interestRate;


    public String getCompanyId() {
        return companyId;
    }

    public void setCompanyId(String companyId) {
        this.companyId = companyId == null ? null : companyId.trim();
    }

    public String getProjectName() {
        return projectName;
    }

    public void setProjectName(String projectName) {
        this.projectName = projectName == null ? null : projectName.trim();
    }

    public String getProjectCode() {
        return projectCode;
    }

    public void setProjectCode(String projectCode) {
        this.projectCode = projectCode == null ? null : projectCode.trim();
    }

    public String getYear() {
        return year;
    }

    public void setYear(String year) {
        this.year = year == null ? null : year.trim();
    }

    public String getSupplyUnit() {
        return supplyUnit;
    }

    public void setSupplyUnit(String supplyUnit) {
        this.supplyUnit = supplyUnit == null ? null : supplyUnit.trim();
    }

    public String getContractSignTime() {
        return contractSignTime;
    }

    public void setContractSignTime(String contractSignTime) {
        this.contractSignTime = contractSignTime == null ? null : contractSignTime.trim();
    }

    public String getSupplyTime() {
        return supplyTime;
    }

    public void setSupplyTime(String supplyTime) {
        this.supplyTime = supplyTime == null ? null : supplyTime.trim();
    }

    public String getContractNum() {
        return contractNum;
    }

    public void setContractNum(String contractNum) {
        this.contractNum = contractNum == null ? null : contractNum.trim();
    }

    public String getContractAmount() {
        return contractAmount;
    }

    public void setContractAmount(String contractAmount) {
        this.contractAmount = contractAmount == null ? null : contractAmount.trim();
    }

    public String getSettlementModel() {
        return settlementModel;
    }

    public void setSettlementModel(String settlementModel) {
        this.settlementModel = settlementModel == null ? null : settlementModel.trim();
    }

    public String getBaseFloatValue() {
        return baseFloatValue;
    }

    public void setBaseFloatValue(String baseFloatValue) {
        this.baseFloatValue = baseFloatValue == null ? null : baseFloatValue.trim();
    }

    public String getExtraCapitalAmount() {
        return extraCapitalAmount;
    }

    public void setExtraCapitalAmount(String extraCapitalAmount) {
        this.extraCapitalAmount = extraCapitalAmount == null ? null : extraCapitalAmount.trim();
    }

    public String getCapitalTimeLimit() {
        return capitalTimeLimit;
    }

    public void setCapitalTimeLimit(String capitalTimeLimit) {
        this.capitalTimeLimit = capitalTimeLimit == null ? null : capitalTimeLimit.trim();
    }

    public String getInterestRate() {
        return interestRate;
    }

    public void setInterestRate(String interestRate) {
        this.interestRate = interestRate == null ? null : interestRate.trim();
    }
}