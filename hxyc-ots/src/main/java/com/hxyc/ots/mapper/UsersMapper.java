package com.hxyc.ots.mapper;

import com.hxjc.core.utils.DataSource;
import com.hxyc.ots.model.Permission;
import com.hxyc.ots.model.Users;
import com.hxyc.ots.vo.UserVO;
import com.sun.tools.internal.xjc.reader.xmlschema.bindinfo.BIConversion;

import java.util.List;

import java.util.List;

/**
 * 订单跟踪
 * <p>
 * 用户信息mapper接口
 *
 * @author bin.wu 2018-7-16
 */
@DataSource(value="dataSourceOts")
public interface UsersMapper {

    /**
     * 根据账号删除用户
     * @param account
     * @return
     */
    int deleteByAccount(String account);

    /**
     * 新增用户
     * @param user
     * @return
     */
    int insert(Users user);

    /**
     * 根据账号查询用户
     * @param account
     * @return
     */
    Users selectByAccount(String account);

    /**
     * 更新用户信息
     * @param user
     * @return
     */
    int update(Users user);

    /**
     * 功能描述: 获取用户列表
     * @Auther: 于金谷
     * @Date create in 2018/7/26 10:04
     */
    List<UserVO> listUser(UserVO userVO);

    /**
     * 功能描述: 取对应账号用户信息
     * @Auther: 于金谷
     * @Date create in 2018/7/27 15:08
     */
    Users getUserByAccount(String account);

    /**
     * 功能描述: 根据ID获取用户信息
     * @Auther: 于金谷
     * @Date create in 2018/7/27 15:08
     */
    Users selectById(String id);
}