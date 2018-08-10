package com.hxyc.ots.model;

import java.util.Date;

/**
 * @Description: 菜单实体对象
 * @Author: 于金谷
 * @Date: 2018/7/26 9:54
 */
public class Menu extends BaseModel {

    /**菜单编码*/
    private String menuCode;

    /**菜单名称*/
    private String menuName;

    /**父菜单ID*/
    private String parentId;

    /**父菜单名称*/
    private String parentMenuName;

    /**菜单URL*/
    private String url;

    /**菜单样式*/
    private String menuClass;

    /**菜单类型 1 模块 2 菜单*/
    private Integer menuType;

    /**排序*/
    private Integer sort;

    /**级别 */
    private Integer level;

    public String getMenuCode() {
        return menuCode;
    }

    public void setMenuCode(String menuCode) {
        this.menuCode = menuCode == null ? null : menuCode.trim();
    }

    public String getMenuName() {
        return menuName;
    }

    public void setMenuName(String menuName) {
        this.menuName = menuName == null ? null : menuName.trim();
    }

    public String getParentId() {
        return parentId;
    }

    public void setParentId(String parentId) {
        this.parentId = parentId == null ? null : parentId.trim();
    }

    public String getParentMenuName() {
        return parentMenuName;
    }

    public void setParentMenuName(String parentMenuName) {
        this.parentMenuName = parentMenuName == null ? null : parentMenuName.trim();
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url == null ? null : url.trim();
    }

    public String getMenuClass() {
        return menuClass;
    }

    public void setMenuClass(String menuClass) {
        this.menuClass = menuClass == null ? null : menuClass.trim();
    }

    public Integer getMenuType() {
        return menuType;
    }

    public void setMenuType(Integer menuType) {
        this.menuType = menuType;
    }

    public Integer getSort() {
        return sort;
    }

    public void setSort(Integer sort) {
        this.sort = sort;
    }

    public Integer getLevel() {
        return level;
    }

    public void setLevel(Integer level) {
        this.level = level;
    }
}