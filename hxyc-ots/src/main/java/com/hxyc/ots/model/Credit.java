package com.hxyc.ots.model;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;


/**
 * @Description: 公司信用证实体类
 * @Author: 于金谷
 * @Date: 2018/7/13 14:48
 */
public class Credit extends BaseModel {

    /**公司ID*/
    private String companyId;

    /**项目ID*/
    private String projectId;

    /**信用证编码*/
    private String creditCode;

    /**信用证类型 1 公司信用证 2 项目信用证*/
    private Integer creditType;

    /**开证金额*/
    private Double openAmount;

    /**开证日期*/
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @JsonFormat(pattern = "yyyy-MM-dd",timezone = "GMT+8")
    private Date openTime;

    /**信用证余额*/
    private Double restAmount;


    public String getCompanyId() {
        return companyId;
    }

    public void setCompanyId(String companyId) {
        this.companyId = companyId == null ? null : companyId.trim();
    }

    public String getCreditCode() {
        return creditCode;
    }

    public void setCreditCode(String creditCode) {
        this.creditCode = creditCode == null ? null : creditCode.trim();
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

    public Double getRestAmount() {
        return restAmount;
    }

    public void setRestAmount(Double restAmount) {
        this.restAmount = restAmount;
    }

    public String getProjectId() {
        return projectId;
    }

    public void setProjectId(String projectId) {
        this.projectId = projectId;
    }

    public Integer getCreditType() {
        return creditType;
    }

    public void setCreditType(Integer creditType) {
        this.creditType = creditType;
    }
}