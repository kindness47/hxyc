package com.hxyc.ots.utils;

import com.hxjc.core.utils.SysUtils;
import com.hxyc.ots.model.Users;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;


/**
 * @Author: 于金谷
 * @Date: 2018/8/2 10:13
 * @Description: 模块系统工具类
 */
public class SystemUtil {

    /**
     * 功能描述: 获取登录Session用户
     * @Auther: 于金谷
     * @Date create in 2018/8/2 15:29
     */
    public static Users getSessionUser() {
        Users user = (Users)SysUtils.getSession().getAttribute("user");
        return  user;
    }

    /**
     * 功能描述: 获取登录用户名
     * @Auther: 于金谷
     * @Date create in 2018/8/2 15:32
     */
    public static String getLoginUserName() {
        Users user = getSessionUser();
        return  user.getUserName();
    }

    public static String getLoginUserAccount() {
        Users user = getSessionUser();
        return  user.getAccount();
    }
}
