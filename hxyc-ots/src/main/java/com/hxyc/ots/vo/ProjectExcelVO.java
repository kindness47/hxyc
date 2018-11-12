package com.hxyc.ots.vo;

import java.io.Serializable;

/**
 * @Author: 于金谷
 * @Date: 2018/11/12 14:52
 * @Description:
 */
public class ProjectExcelVO implements Serializable {
    public String companyName;

    protected String projectName;

    protected String year;

    protected String supplyUnit;

    protected String contractSignTime;

    protected String supplyTime;

    protected String contractNum;

    protected String contractAmount;

    protected String settlementMode;

    protected String baseFloatValue;

    protected String extraCapitalAmount;

    protected String capitalTimeLimit;

    protected String interestRate;

    protected String createTime;


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

    public String getYear() {
        return year;
    }

    public void setYear(String year) {
        this.year = year;
    }

    public String getSupplyUnit() {
        return supplyUnit;
    }

    public void setSupplyUnit(String supplyUnit) {
        this.supplyUnit = supplyUnit;
    }

    public String getContractSignTime() {
        return contractSignTime;
    }

    public void setContractSignTime(String contractSignTime) {
        this.contractSignTime = contractSignTime;
    }

    public String getSupplyTime() {
        return supplyTime;
    }

    public void setSupplyTime(String supplyTime) {
        this.supplyTime = supplyTime;
    }

    public String getContractNum() {
        return contractNum;
    }

    public void setContractNum(String contractNum) {
        this.contractNum = contractNum;
    }

    public String getContractAmount() {
        return contractAmount;
    }

    public void setContractAmount(String contractAmount) {
        this.contractAmount = contractAmount;
    }

    public String getSettlementMode() {
        return settlementMode;
    }

    public void setSettlementMode(String settlementMode) {
        this.settlementMode = settlementMode;
    }

    public String getBaseFloatValue() {
        return baseFloatValue;
    }

    public void setBaseFloatValue(String baseFloatValue) {
        this.baseFloatValue = baseFloatValue;
    }

    public String getExtraCapitalAmount() {
        return extraCapitalAmount;
    }

    public void setExtraCapitalAmount(String extraCapitalAmount) {
        this.extraCapitalAmount = extraCapitalAmount;
    }

    public String getCapitalTimeLimit() {
        return capitalTimeLimit;
    }

    public void setCapitalTimeLimit(String capitalTimeLimit) {
        this.capitalTimeLimit = capitalTimeLimit;
    }

    public String getInterestRate() {
        return interestRate;
    }

    public void setInterestRate(String interestRate) {
        this.interestRate = interestRate;
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }
}
