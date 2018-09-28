package com.hxyc.ots.controller;

import com.hxjc.core.utils.SysUtils;
import com.hxyc.ots.base.Constants;
import com.hxyc.ots.base.Response;
import com.hxyc.ots.model.Users;
import com.hxyc.ots.service.UserService;
import com.hxyc.ots.utils.SystemUtil;
import com.hxyc.ots.vo.UserVO;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.Date;
import java.util.List;

/**
 * 功能描述: 用户权限管理
 * @Auther: 于金谷
 * @Date create in 2018/7/25 17:12
 */
@Controller
public class UserController extends BaseController {

    @Autowired
    private UserService userService;

    /**
     * 功能描述: 用户信息列表
     * @Auther: 于金谷
     * @Date create in 2018/7/25 17:19
     */
    @RequestMapping(value = "/user-list")
    public ModelAndView listUser(UserVO userVO){
        ModelAndView mav = new ModelAndView("sysManage/user-permission-list");
        // 登录用户角色
        Users sessionUser = SystemUtil.getSessionUser();
        userVO.setRoleName(sessionUser.getRoleName());
        userVO.setUserName(sessionUser.getUserName());
        List<UserVO> userList = userService.listUser(userVO);
        mav.addObject("userList", userList);

        return mav;
    }

    /**
     * 功能描述: 添加用户
     * @Auther: 于金谷
     * @Date create in 2018/7/26 10:45
     */
    @RequestMapping(value = "/user-add", method = RequestMethod.GET)
    public ModelAndView addUser(){
        ModelAndView mav = new ModelAndView("sysManage/user-add");
        return mav;
    }

    /**
     * 功能描述: 权限分配
     * @Auther: 于金谷
     * @Date create in 2018/7/27 15:42
     */
    @RequestMapping(value = "/user-permission", method = RequestMethod.GET)
    public ModelAndView assignPermission(){
        ModelAndView mav = new ModelAndView("sysManage/user-permission");
        return mav;
    }

    /**
     * 功能描述: 保存用户
     * @Auther: 于金谷
     * @Date create in 2018/7/26 10:47
     */
    @RequestMapping(value = "/user-save", method = RequestMethod.POST)
    @ResponseBody
    public Response saveUser(Users user){
        String id = user.getId();
        if(StringUtils.isNotBlank(id)) { // 修改
            String account = user.getAccount();
            Users oldUser = userService.getUserById(id);
            String oldAccount = oldUser.getAccount();
            if (!account.equals(oldAccount)) {
                Users userObj = userService.getUserByAccount(account);
                if(userObj != null) {
                    return  returnValidateError("保存失败，修改账号已经存在！");
                }
                oldUser.setAccount(user.getAccount());
            }
            oldUser.setUserName(user.getUserName());
            oldUser.setRoleName(user.getRoleName());
            oldUser.setUpdateBy(SystemUtil.getLoginUserName());
            oldUser.setUpdateTime(new Date());
            userService.updateUser(oldUser);

            return returnSuccess("修改成功！");
        } else { // 新增
            String account = user.getAccount();
            if (StringUtils.isNotBlank(account)) {
                Users userObj = userService.getUserByAccount(account);
                if(userObj != null) {
                    return  returnValidateError("保存失败，账号已经存在！");
                }
            }
            user.setPasswd(Constants.INIT_PD);
            Users sessionUser = (Users) SysUtils.getSession().getAttribute("user");
            user.setCreateBy(sessionUser.getUserName());
            user.setCreateTime(new Date());
            user.setStatus(1);
            user.setIsUse(1);
            userService.saveUser(user);

            return returnSuccess("新增成功！");
        }
    }

    /**
     * 功能描述: 用户停用
     * @Auther: 于金谷
     * @Date create in 2018/7/26 10:48
     */
    @RequestMapping(value = "/user-stop/{id}", method = RequestMethod.POST)
    @ResponseBody
    public Response stopUser(@PathVariable String id){
        Boolean status = userService.stopUser(id);
        if(status){
            return returnSuccess("停用成功！");
        } else {
            return returnSuccess("停用失败！");
        }
    }

    /**
     * 功能描述: 用户启用
     * @Auther: 于金谷
     * @Date create in 2018/7/26 10:49
     */
    @RequestMapping(value = "/user-start/{id}", method = RequestMethod.POST)
    @ResponseBody
    public Response startUser(@PathVariable String id){
        Boolean status = userService.startUser(id);
        if(status){
            return returnSuccess("启用成功！");
        } else {
            return returnSuccess("启用失败！");
        }
    }

    /**
     * 功能描述: 删除用户
     * @Auther: 于金谷
     * @Date create in 2018/7/26 10:50
     */
    @RequestMapping(value = "/user-del/{id}", method = RequestMethod.POST)
    @ResponseBody
    public Response delUser(@PathVariable String id){
        Boolean status = userService.delUser(id);
        if(status){
            return returnSuccess("删除成功！");
        } else {
            return returnSuccess("删除失败！");
        }
    }

    /**
     * 功能描述: 初始化用户密码
     * @Auther: 于金谷
     * @Date create in 2018/8/2 14:35
     */
    @RequestMapping(value = "/user-init/{id}", method = RequestMethod.POST)
    @ResponseBody
    public Response initUser(@PathVariable String id){
        Users user = userService.getUserById(id);
        user.setPasswd(Constants.INIT_PD);
        int result = userService.updateUser(user);
        if(result > 0){
            return returnSuccess("初始化密码成功！");
        } else {
            return returnSuccess("初始化密码失败！");
        }
    }

    /**
     * 功能描述: 用户用户账号
     * @Auther: 于金谷
     * @Date create in 2018/8/2 15:42
     */
    @RequestMapping(value = "/user-mod", method = RequestMethod.GET)
    public ModelAndView modUser(Model model){
        ModelAndView mav = new ModelAndView("sysManage/user-mod");
        Users user = (Users)SysUtils.getSession().getAttribute("user");
        model.addAttribute("user", user);

        return mav;
    }

    /**
     * 功能描述: 获取当前登录用户信息
     * @Auther: 于金谷
     * @Date create in 2018/8/2 14:57
     */
    @ResponseBody
    @RequestMapping(value = "/user/{id}", method = RequestMethod.POST)
    public Users getUserById(@PathVariable("id") String id) {
        Users user = userService.getUserById(id);
        return user;
    }

    /**
     * 功能描述: 用户账号修改
     * @Auther: 于金谷
     * @Date create in 2018/8/2 15:13
     */
    @RequestMapping(value = "/user-mod", method = RequestMethod.POST)
    @ResponseBody
    public Response modUser(UserVO userVO){
        String id = userVO.getId();
        Users user = userService.getUserById(id);
        String oldPasswd = userVO.getOldPasswd();
        String passwd = user.getPasswd();
        if (!passwd.equals(oldPasswd)) {
            return returnValidateError("修改失败，旧密码验证错误！");
        }

        String newPasswd = userVO.getNewPasswd();
        if(StringUtils.isNotBlank(newPasswd)) {
            userVO.setPasswd(newPasswd);
            userVO.setUpdateBy(SystemUtil.getLoginUserName());
            userVO.setUpdateTime(new Date());
        }
        if (StringUtils.isBlank(userVO.getId())){
            return returnValidateError("用户ID能为空！");
        }
        int result = userService.updateUser(userVO);
        if(result > 0){
            return returnSuccess("修改成功！");
        } else {
            return returnSuccess("修改失败！");
        }
    }
}
