package com.hxyc.ots.service;

import com.hxyc.ots.model.Menu;

import java.util.List;

/**
 * @Author: 于金谷
 * @Date: 2018/11/15 17:13
 * @Description: 菜单功能业务接口
 */
public interface MenuService {
    /**
     * 功能描述: 获取所有有效菜单功能
     * @Auther: 于金谷
     * @Date create in 2018/11/15 17:19
     */
    List<Menu> getAllMenus();

    /**
     * 功能描述: 获取登录用户有效授权菜单功能
     * @Auther: 于金谷
     * @Date create in 2018/11/15 17:20
     */
    List<Menu> getMenusByLoginUser(String userId);
}
