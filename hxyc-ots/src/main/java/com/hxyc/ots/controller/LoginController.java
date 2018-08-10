package com.hxyc.ots.controller;

import com.hxjc.core.utils.SysUtils;
import com.hxyc.ots.model.Users;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @Author: 于金谷
 * @Date: 2018/7/2 13:00
 * @Description: 登录控制
 */
@Controller
public class LoginController extends BaseController {

    private static final Logger logger = LoggerFactory.getLogger(LoginController.class);

    @RequestMapping(value = "/")
    public String Index(){
        return "login";
    }

    /**
     * 系统登录
     */
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String login(Users user, Model model){
        Subject subject = SecurityUtils.getSubject();
        UsernamePasswordToken token = new UsernamePasswordToken(user.getAccount(), user.getPasswd().toCharArray(), null);
        token.setRememberMe(true);
        try {
            subject.login(token);
        } catch (Exception e) {
            System.out.println("登录异常： " + e.getMessage());
            return "login";
        }

        Users sessionUser = (Users) SysUtils.getSession().getAttribute("user");
        model.addAttribute("user", sessionUser);

        return "index";
    }

    /**
     * 我的桌面
     */
    @RequestMapping(value = "/welcome")
    public ModelAndView welcome(){
        ModelAndView mav = new ModelAndView("welcome");
        //List<Users> users = usersService.getUsers();
        //mav.addObject("users", users);

        return mav;
    }

    /**
     * 功能描述: 用户注销
     * @Auther: 于金谷
     * @Date create in 2018/8/1 17:14
     */
    @RequestMapping("/logout")
    public String logout(HttpServletRequest request, HttpServletResponse response) {
        Subject subject = SecurityUtils.getSubject();
        if (subject != null) {
            try{
                subject.logout();
            }catch(Exception ex){
            }
        }

        return "redirect:/";
    }
}
