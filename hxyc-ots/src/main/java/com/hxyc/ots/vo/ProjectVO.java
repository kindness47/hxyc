package com.hxyc.ots.vo;

import com.hxyc.ots.model.Project;

/**
 * @Author: 于金谷
 * @Date: 2018/7/13 16:26
 * @Description: 项目信息VO对象
 */
public class ProjectVO extends Project {

    /**开始时间*/
    private String startDate;

    /**结束时间*/
    private String endDate;

    /** 公司名称*/
    private String companyName;

    /** 创建人名称*/
    private String createPersonName;

    /**
     * 页码
     */
    private Integer page;

    /**
     * 页size
     */
    private Integer limit;

    /**
     * 分页开始数
     */
    private Integer pageStart;

    /**
     * 分页结束数
     */
    private Integer pageEnd;

    /**排序描述 desc  asc */
    private String sortDesc;

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    public String getCreatePersonName() {
        return createPersonName;
    }

    public void setCreatePersonName(String createPersonName) {
        this.createPersonName = createPersonName;
    }

    public Integer getPage() {
        return page;
    }

    public void setPage(Integer page) {
        this.page = page;
    }

    public Integer getLimit() {
        return limit;
    }

    public void setLimit(Integer limit) {
        this.limit = limit;
    }

    public Integer getPageStart() {
        return pageStart;
    }

    public void setPageStart(Integer pageStart) {
        this.pageStart = pageStart;
    }

    public Integer getPageEnd() {
        return pageEnd;
    }

    public void setPageEnd(Integer pageEnd) {
        this.pageEnd = pageEnd;
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
