package com.hxyc.ots.model;

import java.util.Date;

/**
 * @Description: 公司信息实体类
 * @Author: 于金谷
 * @Date: 2018/7/13 14:45
 */
public class Company  extends BaseModel {

    /**公司名称*/
    private String companyName;

    /**公司简称*/
    private String companyShortName;

    /**上级ID*/
    private String parentId;

    /**排序*/
    private Integer sort;

    /**级别*/
    private Integer level;


    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName == null ? null : companyName.trim();
    }

    public String getCompanyShortName() {
        return companyShortName;
    }

    public void setCompanyShortName(String companyShortName) {
        this.companyShortName = companyShortName == null ? null : companyShortName.trim();
    }

    public String getParentId() {
        return parentId;
    }

    public void setParentId(String parentId) {
        this.parentId = parentId == null ? null : parentId.trim();
    }

    public Integer getSort() {
        return sort;
    }

    public void setSort(Integer sort) {
        this.sort = sort;
    }

    public Integer getLevel() {
        return level;
    }

    public void setLevel(Integer level) {
        this.level = level;
    }
}