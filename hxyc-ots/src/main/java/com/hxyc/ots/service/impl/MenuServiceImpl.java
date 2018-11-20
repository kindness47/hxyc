package com.hxyc.ots.service.impl;

import com.hxyc.ots.mapper.MenuMapper;
import com.hxyc.ots.model.Menu;
import com.hxyc.ots.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @Author: 于金谷
 * @Date: 2018/11/15 17:13
 * @Description: 菜单功能业务实现
 */
@Service
public class MenuServiceImpl implements MenuService {

    @Autowired
    private MenuMapper menuMapper;

    /**
     * 功能描述: 获取所有有效菜单功能
     * @Auther: 于金谷
     * @Date create in 2018/11/15 17:19
     */
    @Override
    @Transactional(readOnly = true)
    public List<Menu> getAllMenus() {
        return menuMapper.getAllMenus();
    }

    /**
     * 功能描述: 获取登录用户有效授权菜单功能
     * @param userId 登录用户ID
     * @Auther: 于金谷
     * @Date create in 2018/11/15 17:20
     */
    @Override
    @Transactional(readOnly = true)
    public List<Menu> getMenusByLoginUser(String userId) {
        return menuMapper.getMenusByLoginUser(userId);
    }
}
