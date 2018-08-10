package com.hxyc.ots.vo;

import com.hxyc.ots.model.Settlement;

/**
 * @Author: 于金谷
 * @Date: 2018/7/16 16:39
 * @Description: 结算信息业务对象
 */
public class SettlementVO extends Settlement {

    /**
     * 公司名称
     */
    private String companyName;

    /**
     * 项目名称
     */
    private String projectName;

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

    @Override
    public String toString() {
        return "SettlementVO{" +
                "companyName='" + companyName + '\'' +
                ", projectName='" + projectName + '\'' +
                '}';
    }
}
