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

    /**
     * Description： 插入菜单
     * Author: 刘永红
     * Date: Created in 2018/12/4 8:49
     */
    int insert(Menu menu);

    /**
     * Description： 删除菜单
     * Author: 刘永红
     * Date: Created in 2018/12/4 9:03
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * Description： 获取menu信息
     * Author: 刘永红
     * Date: Created in 2018/12/4 9:47
     */
    Menu selectByPrimaryKey(Integer id);

    /**
     * Description： 更新
     * Author: 刘永红
     * Date: Created in 2018/12/4 9:57
     */
    int updateByPrimaryKeySelective(Menu record);

    /**
     * Description： 取得所有菜单项
     * Author: 刘永红
     * Date: Created in 2018/12/4 16:26
     */
    List<Menu> getAll();

    /**
     * Description： 根据条件查询菜单
     * Author: 刘永红
     * Date: Created in 2018/12/4 16:26
     */
    List<Menu> select(Menu menu);
}
