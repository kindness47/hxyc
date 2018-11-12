package com.hxyc.ots.service.impl;

import com.hxyc.ots.base.Constants;
import com.hxyc.ots.mapper.PermissionMapper;
import com.hxyc.ots.mapper.UsersMapper;
import com.hxyc.ots.model.Permission;
import com.hxyc.ots.model.Users;
import com.hxyc.ots.service.UserService;
import com.hxyc.ots.vo.UserVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @Author: 于金谷
 * @Date: 2018/7/25 17:17
 * @Description: 用户管理业务实现
 */
@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UsersMapper usersMapper;

    private PermissionMapper permissionMapper;

    /**
     * 功能描述: 用户信息列表
     * @param userVO 用户信息VO对象
     * @Auther: 于金谷
     * @Date create in 2018/7/25 17:19
     */
    @Override
    public List<UserVO> listUser(UserVO userVO) {
        List<UserVO> userList = usersMapper.listUser(userVO);
        return userList;
    }

    /**
     * 功能描述: 用户停用
     * @param id 用户ID
     * @Auther: 于金谷
     * @Date create in 2018/7/26 10:52
     */
    @Override
    @Transactional
    public Boolean stopUser(String id) {
        Boolean status = false;
        Users user = usersMapper.selectById(id);
        if(user == null) {
            return false;
        }

        user.setIsUse(Constants.ZERO);
        int result = usersMapper.update(user);
        if(result > 0) {
            status = true;
        }

        return status;
    }

    /**
     * 功能描述: 用户启用
     * @param id 用户ID
     * @Auther: 于金谷
     * @Date create in 2018/7/26 10:53
     */
    @Override
    @Transactional
    public Boolean startUser(String id) {
        Boolean status = false;
        Users user = usersMapper.selectById(id);
        if(user == null) {
            return false;
        }

        user.setIsUse(Constants.ONE);
        int result = usersMapper.update(user);
        if(result > 0) {
            status = true;
        }

        return status;
    }

    /**
     * 功能描述: 删除用户
     * @param id 用户ID
     * @Auther: 于金谷
     * @Date create in 2018/7/26 10:53
     */
    @Override
    @Transactional
    public Boolean delUser(String id) {
        Boolean status = false;
        Users user = usersMapper.selectById(id);
        if(user == null) {
            return false;
        }

        user.setStatus(Constants.ZERO);
        int result = usersMapper.update(user);
        if(result > 0) {
            status = true;
        }

        return status;
    }

    /**
     * 功能描述: 获取对应账号用户信息
     * @param account 用户账号
     * @Auther: 于金谷
     * @Date create in 2018/7/27 15:06
     */
    @Override
    public Users getUserByAccount(String account) {
        Users user = usersMapper.getUserByAccount(account);
        return user;
    }

    /**
     * 功能描述: 添加用户
     * @param user 用户对象
     * @Auther: 于金谷
     * @Date create in 2018/7/27 15:06
     */
    @Override
    @Transactional
    public void saveUser(Users user) {
        usersMapper.insert(user);
    }

    /**
     * 功能描述:根据用户ID获取用户
     * @param id
     * @Auther: 于金谷
     * @Date create in 2018/8/2 14:40
     */
    @Override
    public Users getUserById(String id) {
        Users user = usersMapper.selectById(id);
        return user;
    }

    /**
     * 功能描述: 更新用户
     * @param user
     * @Auther: 于金谷
     * @Date create in 2018/8/2 14:41
     */
    @Override
    @Transactional
    public int updateUser(Users user) {
        int rs = usersMapper.update(user);
        return rs;
    }

    /**
     * 功能描述: 获取所有用户列表（排除管理员）
     * @Auther: 于金谷
     * @Date create in 2018/11/5 11:16
     */
    @Override
    public List<UserVO> getUsersByRole(String roleName) {
        return usersMapper.getUsersByRole(roleName);
    }
}
