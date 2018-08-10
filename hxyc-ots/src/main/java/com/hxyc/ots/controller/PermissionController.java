package com.hxyc.ots.controller;

import com.hxyc.ots.base.Response;
import com.hxyc.ots.model.Permission;
import com.hxyc.ots.service.PermissionService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * @Author: 于金谷
 * @Date: 2018/7/30 14:44
 * @Description: 权限管理控制
 */
@Controller
public class PermissionController extends BaseController {

    @Autowired
    private PermissionService permissionService;

    /**
     * 功能描述: 用户账号权限分配
     * @Auther: 于金谷
     * @Date create in 2018/7/30 10:43
     */
    @RequestMapping(value = "/permission-save", method = RequestMethod.POST)
    @ResponseBody
    public Response savePermission(Permission permission){
        String userId = permission.getUserId();
        if(StringUtils.isBlank(userId)) {
            return returnValidateError("授权账号不能为空！");
        }

        // 权限
        List<String> permissionList = new ArrayList<>();
        String permissionStr = permission.getPermissions();
        if(StringUtils.isNotBlank(permissionStr)) {
            String pStr = permissionStr.replace("\"", "").replace("[","").replace("]","");
            permissionList = Arrays.asList(pStr.split(","));
        }
        permissionService.addUserPermission(userId, permissionList);

        return returnSuccess("权限分配成功！");
    }


    /**
     * 功能描述: 获取用户权限信息
     * @Auther: 于金谷
     * @Date create in 2018/7/30 15:40
     */
    @ResponseBody
    @RequestMapping(value = "/permission-list/{userId}", method = RequestMethod.POST)
    public List<Permission> getPermissionsByUserId(@PathVariable("userId") String userId) {
        List<Permission> permissionList = permissionService.getPermissionsByUserId(userId);
        return permissionList;
    }
}
