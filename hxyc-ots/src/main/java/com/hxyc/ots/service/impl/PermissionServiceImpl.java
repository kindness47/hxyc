package com.hxyc.ots.service.impl;

import com.hxyc.ots.base.Constants;
import com.hxyc.ots.mapper.PermissionMapper;
import com.hxyc.ots.model.Permission;
import com.hxyc.ots.service.PermissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @Author: 于金谷
 * @Date: 2018/7/30 14:46
 * @Description: 用户权限业务实现
 */
@Service
public class PermissionServiceImpl implements PermissionService {

    @Autowired
    private PermissionMapper permissionMapper;

    /**
     * 功能描述: 用户权限分配
     * @param userId
     * @param permissionList
     * @Auther: 于金谷
     * @Date create in 2018/7/30 14:21
     */
    @Override
    @Transactional
    public void addUserPermission(String userId, List<String> permissionList) {
        List<Permission> permissions = new ArrayList<>();
        for (String permissionStr : permissionList) {
            Permission permission = new Permission();
            permission.setUserId(userId);
            permission.setPermissions(permissionStr);
            // 权限类型  1 菜单模块 2 菜单权限 3 功能权限
            if (permissionStr.length() == 2) {
                permission.setPermissionType(Constants.ONE);
            } else if (permissionStr.length() == 4) {
                permission.setPermissionType(Constants.TWO);
            } else {
                permission.setPermissionType(Constants.THREE);
            }
            permission.setStatus(Constants.ONE);
            permission.setCreateBy("admin");
            permission.setCreateTime(new Date());

            permissions.add(permission);
        }
        permissionMapper.deleteByUserId(userId);
        permissionMapper.insertPermissionBatch(permissions);
    }

    /**
     * 功能描述: 获取用户权限
     * @param userId 用户ID
     * @Auther: 于金谷
     * @Date create in 2018/7/30 15:42
            */
    @Override
    public List<Permission> getPermissionsByUserId(String userId) {
        List<Permission> permissionList = permissionMapper.getPermissionsByUserId(userId);
        if (permissionList == null) {
            permissionList = new ArrayList<>();
        }
        return permissionList;
    }

}
