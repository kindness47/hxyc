package com.hxjc.hxyc.controller;

import com.hxjc.hxyc.model.HxjcTest;
import com.hxjc.hxyc.model.HxycTest;
import com.hxjc.hxyc.service.HxjcTestService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 * 登录管理
 */
@Controller
public class LoginController {
    private static final Logger logger = LoggerFactory.getLogger(LoginController.class);

    @RequestMapping(value = "/")
    public String Index(){
        return "login";
    }

    /**
     * 系统登录
     */
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public ModelAndView login(){
        ModelAndView mav = new ModelAndView("index");
        return mav;
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
}
