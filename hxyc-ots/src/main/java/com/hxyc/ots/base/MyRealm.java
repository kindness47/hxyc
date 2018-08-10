package com.hxyc.ots.base;

import com.hxjc.core.utils.SysUtils;
import com.hxyc.ots.model.Permission;
import com.hxyc.ots.model.Users;
import com.hxyc.ots.service.PermissionService;
import com.hxyc.ots.service.UserService;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.PrincipalCollection;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * @Author: 于金谷
 * @Date: 2018/7/30 16:20
 * @Description: 自定义权限控制
 */
public class MyRealm extends AuthorizingRealm {

    private static final Logger logger = LoggerFactory.getLogger(MyRealm.class);

    @Autowired
    private UserService userService;

    @Autowired
    private PermissionService permissionService;


    /**
     * 功能描述: 用户授权认证
     * @Auther: 于金谷
     * @Date create in 2018/7/30 16:23
     */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
        String account = principalCollection.getPrimaryPrincipal().toString();
        SimpleAuthorizationInfo simpleAuthorizationInfo = new SimpleAuthorizationInfo();
        Users user = userService.getUserByAccount(account);
        Set<String> permissionSet = new HashSet<>();
        List<Permission> permissions = permissionService.getPermissionsByUserId(user.getId());
        for (Permission permission: permissions) {
            permissionSet.add(permission.getPermissions());
        }
        simpleAuthorizationInfo.setStringPermissions(permissionSet);

        return simpleAuthorizationInfo;
    }

    /**
     * 功能描述: 用户登陆认证
     * @Auther: 于金谷
     * @Date create in 2018/7/30 16:23
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {
        String account = authenticationToken.getPrincipal().toString();
        Users user = userService.getUserByAccount(account);
        if (user != null) {
            AuthenticationInfo authenticationInfo = new SimpleAuthenticationInfo(user.getAccount(), user.getPasswd(), account);
            Session session = SysUtils.getSession();
            if (session != null) {
                session.setAttribute("user", user);
            }
            return authenticationInfo;
        }
        return null;
    }
}
