package com.hxyc.ots.mapper;

import com.hxyc.ots.model.Menu;
import org.apache.ibatis.annotations.Param;
import org.springframework.jmx.export.annotation.ManagedOperationParameter;

import java.util.List;

public interface MenuMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Menu record);

    int insertSelective(Menu record);

    Menu selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Menu record);

    int updateByPrimaryKey(Menu record);

    /**
     * 功能描述: 获取所有有效菜单功能
     * @Auther: 于金谷
     * @Date create in 2018/11/15 17:22
     */
    List<Menu> getAllMenus();


    /**
     * 功能描述: 获取登录用户有效授权菜单功能
     * @Auther: 于金谷
     * @Date create in 2018/11/15 17:24
     */
    List<Menu> getMenusByLoginUser(@Param("userId") String userId);
}