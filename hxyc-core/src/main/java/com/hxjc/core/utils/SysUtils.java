package com.hxjc.core.utils;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;


/**
 * @Author: 于金谷
 * @Date: 2018/8/2 10:13
 * @Description: 系统工具类
 */
public class SysUtils {

    /**
     * 功能描述: 获取登录用户Session
     * @Auther: 于金谷
     * @Date create in 2018/8/2 10:14
     */
    public static Session getSession() {
        Subject subject = SecurityUtils.getSubject();
        Session session = subject.getSession(true);

        return  session;
    }
}
