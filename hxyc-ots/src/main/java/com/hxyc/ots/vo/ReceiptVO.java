package com.hxyc.ots.vo;

import com.hxyc.ots.model.Receipt;

/**
 * @Author: 于金谷
 * @Date: 2018/7/16 16:21
 * @Description:收款管理VO对象
 */
public class ReceiptVO extends Receipt {

    /**开始时间*/
    private String startDate;

    /**结束时间*/
    private String endDate;

    /**开证公司名称*/
    private String companyName;

    /**项目名称*/
    private String projectName;

    /**排序描述 desc  asc */
    private String sortDesc;

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

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    public String getSortDesc() {
        return sortDesc;
    }

    public void setSortDesc(String sortDesc) {
        this.sortDesc = sortDesc;
    }

    public String getProjectName() {
        return projectName;
    }

    public void setProjectName(String projectName) {
        this.projectName = projectName;
    }
}
