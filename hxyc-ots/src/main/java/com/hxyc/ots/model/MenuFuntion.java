package com.hxyc.ots.model;

/**
 * @Description:菜单功能实体
 * @Author: 于金谷
 * @Date: 2018/7/26 9:58
 */
public class MenuFuntion {

    /**主键ID*/
    private String id;

    /**菜单ID*/
    private String menuId;

    /**功能ID*/
    private String functionId;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getMenuId() {
        return menuId;
    }

    public void setMenuId(String menuId) {
        this.menuId = menuId == null ? null : menuId.trim();
    }

    public String getFunctionId() {
        return functionId;
    }

    public void setFunctionId(String functionId) {
        this.functionId = functionId == null ? null : functionId.trim();
    }
}