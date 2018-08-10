package com.hxyc.ots.model;

/**
 * 功能描述: 权限实体对象
 * @Auther: 于金谷
 * @Date create in 2018/7/26 9:58
 */
public class Permission extends BaseModel {

    /**用户ID*/
    private String userId;

    /**权限字符串*/
    private String permissions;

    /**权限类型*/
    private Integer permissionType;

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId == null ? null : userId.trim();
    }

    public String getPermissions() {
        return permissions;
    }

    public void setPermissions(String permissions) {
        this.permissions = permissions == null ? null : permissions.trim();
    }

    public Integer getPermissionType() {
        return permissionType;
    }

    public void setPermissionType(Integer permissionType) {
        this.permissionType = permissionType;
    }
}