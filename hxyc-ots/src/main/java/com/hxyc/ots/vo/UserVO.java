package com.hxyc.ots.vo;

import com.hxyc.ots.model.Users;

/**
 * @Author: 于金谷
 * @Date: 2018/7/25 17:14
 * @Description: 用户VO对象
 */
public class UserVO extends Users {

    /**开始时间*/
    private String startDate;

    /**结束时间*/
    private String endDate;

    /**旧密码*/
    private String oldPasswd;

    private String newPasswd;

    /**确认密码*/
    private String confPasswd;

    /**当前登录账号*/
    private String currentAccount;

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

    public String getOldPasswd() {
        return oldPasswd;
    }

    public void setOldPasswd(String oldPasswd) {
        this.oldPasswd = oldPasswd;
    }

    public String getConfPasswd() {
        return confPasswd;
    }

    public void setConfPasswd(String confPasswd) {
        this.confPasswd = confPasswd;
    }

    public String getNewPasswd() {
        return newPasswd;
    }

    public void setNewPasswd(String newPasswd) {
        this.newPasswd = newPasswd;
    }

    public String getCurrentAccount() {
        return currentAccount;
    }

    public void setCurrentAccount(String currentAccount) {
        this.currentAccount = currentAccount;
    }
}
