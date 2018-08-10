package com.hxjc.hxyc.model;

public class Department extends BaseModel {

    private Long companyId;

    private String deptCode;

    private String deptName;

    private String deptNameEn;

    public Long getCompanyId() {
        return companyId;
    }

    public void setCompanyId(Long companyId) {
        this.companyId = companyId;
    }

    public String getDeptCode() {
        return deptCode;
    }

    public void setDeptCode(String deptCode) {
        this.deptCode = deptCode == null ? null : deptCode.trim();
    }

    public String getDeptName() {
        return deptName;
    }

    public void setDeptName(String deptName) {
        this.deptName = deptName == null ? null : deptName.trim();
    }

    public String getDeptNameEn() {
        return deptNameEn;
    }

    public void setDeptNameEn(String deptNameEn) {
        this.deptNameEn = deptNameEn == null ? null : deptNameEn.trim();
    }
}