package com.hxyc.ots.model;

import java.io.Serializable;
import java.util.Date;

/**
 * 功能描述: 系统登录操作日志
 * @Auther: 于金谷
 * @Date create in 2018/12/3 16:18
 */
public class SysLogs implements Serializable {
    private Long id;

    private String userName;

    private String loginAccount;

    private String ip;

    private String loginMac;

    private Date loginTime;

    private Date logoutTime;

    private Integer status;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName == null ? null : userName.trim();
    }

    public String getLoginAccount() {
        return loginAccount;
    }

    public void setLoginAccount(String loginAccount) {
        this.loginAccount = loginAccount == null ? null : loginAccount.trim();
    }

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip == null ? null : ip.trim();
    }

    public String getLoginMac() {
        return loginMac;
    }

    public void setLoginMac(String loginMac) {
        this.loginMac = loginMac == null ? null : loginMac.trim();
    }

    public Date getLoginTime() {
        return loginTime;
    }

    public void setLoginTime(Date loginTime) {
        this.loginTime = loginTime;
    }

    public Date getLogoutTime() {
        return logoutTime;
    }

    public void setLogoutTime(Date logoutTime) {
        this.logoutTime = logoutTime;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }
}