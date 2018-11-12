package com.hxyc.ots.service;

import com.hxyc.ots.model.Users;
import com.hxyc.ots.vo.UserVO;

import java.util.List;

/**
 * @Author: 于金谷
 * @Date: 2018/7/25 17:16
 * @Description: 用户管理业务接口
 */
public interface UserService {
    /**
     * 功能描述: 用户信息列表
     * @Auther: 于金谷
     * @Date create in 2018/7/25 17:19
     */
    List<UserVO> listUser(UserVO userVO);

    /**
     * 功能描述: 用户停用
     * @Auther: 于金谷
     * @Date create in 2018/7/26 10:52
     */
    Boolean stopUser(String id);

    /**
     * 功能描述: 用户启用
     * @Auther: 于金谷
     * @Date create in 2018/7/26 10:53
     */
    Boolean startUser(String id);

    /**
     * 功能描述: 删除用户
     * @Auther: 于金谷
     * @Date create in 2018/7/26 10:53
     */
    Boolean delUser(String id);

    /**
     * 功能描述: 获取对应账号用户信息
     * @Auther: 于金谷
     * @Date create in 2018/7/27 15:06
     */
    Users getUserByAccount(String account);

    /**
     * 功能描述: 添加用户
     * @Auther: 于金谷
     * @Date create in 2018/7/27 15:06
     */
    void saveUser(Users user);

    /**
     * 功能描述:根据用户ID获取用户
     * @Auther: 于金谷
     * @Date create in 2018/8/2 14:40
     */
    Users getUserById(String id);

    /**
     * 功能描述: 更新用户
     * @Auther: 于金谷
     * @Date create in 2018/8/2 14:41
     */
    int updateUser(Users user);

    /**
     * 功能描述: 获取所有项目用户列表（排除管理员）
     * @Auther: 于金谷
     * @Date create in 2018/11/5 11:16
     */
    List<UserVO> getUsersByRole(String roleName);
}
