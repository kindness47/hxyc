package com.hxjc.hxyc.model;

import java.io.Serializable;
import java.util.Date;

/**
 * @Author: 于金谷
 * @Date: 2018/6/1 15:53
 * @Description:
 */
public class BaseModel implements Serializable {

    /** 主键*/
    private Long id;

    /**  记录状态 1 有效 0 无效*/
    private String status;

    /**  创建时间*/
    private Date createDate;

    /** 创建人*/
    private String createBy;

    /**  更新时间*/
    private Date updateDate;

    /**  修改人*/
    private String updateBy;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public String getCreateBy() {
        return createBy;
    }

    public void setCreateBy(String createBy) {
        this.createBy = createBy;
    }

    public Date getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(Date updateDate) {
        this.updateDate = updateDate;
    }

    public String getUpdateBy() {
        return updateBy;
    }

    public void setUpdateBy(String updateBy) {
        this.updateBy = updateBy;
    }
}
