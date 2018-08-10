package com.hxyc.ots.vo;

import com.hxyc.ots.model.Company;

import java.util.Date;

/**
 * @Author: 于金谷
 * @Date: 2018/7/13 17:15
 * @Description:公司信息VO
 */
public class CompanyVO extends Company {

    /**开始时间*/
    private String startDate;

    /**结束时间*/
    private String endDate;

    /**上级公司名称*/
    private String parentCompanyName;

    public String getParentCompanyName() {
        return parentCompanyName;
    }

    public void setParentCompanyName(String parentCompanyName) {
        this.parentCompanyName = parentCompanyName;
    }

    public String getStartDate() {
        return startDate;
    }

    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }

    public String getEndDate() {
        return endDate;
    }

    public void setEndDate(String endDate) {
        this.endDate = endDate;
    }
}
