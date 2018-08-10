package com.hxyc.ots.model;

import java.util.Date;

/**
 * @Description: 用户实体对象
 * @Author: 于金谷
 * @Date: 2018/7/26 10:01
 */
public class Users extends BaseModel {

    /**用户名称*/
    private String userName;

    /**账号*/
    private String account;

    /**密码*/
    private String passwd;

    /**角色名称*/
    private String roleName;

    /**是否启用 1 启用 0 停用*/
    private Integer isUse;

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName == null ? null : userName.trim();
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account == null ? null : account.trim();
    }

    public String getPasswd() {
        return passwd;
    }

    public void setPasswd(String passwd) {
        this.passwd = passwd == null ? null : passwd.trim();
    }

    public Integer getIsUse() {
        return isUse;
    }

    public void setIsUse(Integer isUse) {
        this.isUse = isUse;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }
}