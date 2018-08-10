package com.hxyc.ots.vo;

import com.hxyc.ots.model.Permission;

import java.util.List;

/**
 * @Author: 于金谷
 * @Date: 2018/7/30 11:25
 * @Description: 权限VO对象
 */
public class PermissionVO extends Permission {

    /**权限字符串*/
    private List<String> permission;

    public List<String> getPermission() {
        return permission;
    }

    public void setPermission(List<String> permission) {
        this.permission = permission;
    }
}
