package com.hxyc.ots.vo;

import com.hxyc.ots.model.Credit;

/**
 * @Author: 于金谷
 * @Date: 2018/7/16 16:10
 * @Description: 信用证VO对象
 */
public class CreditVO extends Credit {

    /**开始时间*/
    private String startDate;

    /**结束时间*/
    private String endDate;

    /**开证公司名称*/
    private String companyName;

    /**排序描述 desc  asc */
    private String sortDesc;

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
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

    public String getSortDesc() {
        return sortDesc;
    }

    public void setSortDesc(String sortDesc) {
        this.sortDesc = sortDesc;
    }
}
