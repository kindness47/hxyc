package com.hxjc.hxyc.model;

public class Post extends BaseModel {

    private Long deptId;

    private String postCode;

    private String postName;

    private String postNameEn;

    public Long getDeptId() {
        return deptId;
    }

    public void setDeptId(Long deptId) {
        this.deptId = deptId;
    }

    public String getPostCode() {
        return postCode;
    }

    public void setPostCode(String postCode) {
        this.postCode = postCode == null ? null : postCode.trim();
    }

    public String getPostName() {
        return postName;
    }

    public void setPostName(String postName) {
        this.postName = postName == null ? null : postName.trim();
    }

    public String getPostNameEn() {
        return postNameEn;
    }

    public void setPostNameEn(String postNameEn) {
        this.postNameEn = postNameEn == null ? null : postNameEn.trim();
    }
}