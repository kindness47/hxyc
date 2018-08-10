package com.hxyc.ots.service;

import com.hxyc.ots.model.Permission;

import java.util.List;

/**
 * @Author: 于金谷
 * @Date: 2018/7/30 14:46
 * @Description: 权限管理功能接口
 */
public interface PermissionService {

    /**
     * 功能描述: 用户权限分配
     * @Auther: 于金谷
     * @Date create in 2018/7/30 14:21
     */
    void addUserPermission(String userId, List<String> permissionList);

    /**
     * 功能描述: 获取用户权限
     * @Auther: 于金谷
     * @Date create in 2018/7/30 15:42
     */
    List<Permission> getPermissionsByUserId(String userId);
}
