package com.hxyc.ots.controller;

import com.hxjc.core.utils.SysUtils;
import com.hxyc.ots.base.Constants;
import com.hxyc.ots.model.Menu;
import com.hxyc.ots.model.SysLogs;
import com.hxyc.ots.model.Users;
import com.hxyc.ots.service.MenuService;
import com.hxyc.ots.service.ProjectService;
import com.hxyc.ots.service.SysLogsService;
import com.hxyc.ots.vo.WelcomeVO;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.InetAddress;
import java.net.NetworkInterface;
import java.util.Date;
import java.util.List;

/**
 * @Author: 于金谷
 * @Date: 2018/7/2 13:00
 * @Description: 登录控制
 */
@Controller
public class LoginController extends BaseController {

    private static final Logger logger = LoggerFactory.getLogger(LoginController.class);

    @Autowired
    private ProjectService projectService;
    @Autowired
    private MenuService menuService;
    @Autowired
    private SysLogsService sysLogsService;

    @RequestMapping(value = "/")
    public String Index(){
        return "login";
    }

    /**
     * 系统登录
     */
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String login(Users user, Model model, HttpServletRequest request){
        Subject subject = SecurityUtils.getSubject();
        UsernamePasswordToken token = new UsernamePasswordToken(user.getAccount(), user.getPasswd().toCharArray(), null);
        token.setRememberMe(true);
        try {
            subject.login(token);
            // 登录用户初始化
            Users sessionUser = (Users) SysUtils.getSession().getAttribute("user");
            model.addAttribute("user", sessionUser);
            // 登录菜单初始化
            String roleName = sessionUser.getRoleName();
            List<Menu> menus;
            if (Constants.SUPER_ADMIN.equals(roleName)) {
                menus = menuService.getAllMenus();
            } else {
                String userId = sessionUser.getId();
                menus = menuService.getMenusByLoginUser(userId);
            }
            model.addAttribute("menus", menus);

            // 记录登录日志
            SysLogs sysLog = new SysLogs();
            sysLog.setUserName(sessionUser.getUserName());
            sysLog.setLoginAccount(sessionUser.getAccount());
            String ip = getIpAddr(request);
            sysLog.setIp(ip);
            String mac = getMACAddress(ip);
            sysLog.setLoginMac(mac);
            sysLog.setLoginTime(new Date());
            sysLogsService.saveSysLogs(sysLog);
        } catch (Exception e) {
            System.out.println("登录异常： " + e.getMessage());
            return "login";
        }

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

        // 初始化汇总数据
        List<WelcomeVO> welcomeList = projectService.getWelcomeList();
        mav.addObject("welcomeList", welcomeList);

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

    /**
     * 功能描述: 通过HttpServletRequest返回IP地址
     * @Auther: 于金谷
     * @Date create in 2018/12/3 17:16
     */
    public String getIpAddr(HttpServletRequest request) throws Exception {
        String ip = request.getHeader("x-forwarded-for");
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("WL-Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("HTTP_CLIENT_IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("HTTP_X_FORWARDED_FOR");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getRemoteAddr();
        }
        return ip.equals("0:0:0:0:0:0:0:1") ? "127.0.0.1" : ip;
    }

    /**
     * 功能描述: 通过IP地址获取MAC地址
     * @Auther: 于金谷
     * @Date create in 2018/12/3 17:15
     */
    public String getMACAddress(String ip) throws Exception {
        String line = "";
        String macAddress = "";
        final String MAC_ADDRESS_PREFIX = "MAC Address = ";
        final String LOOPBACK_ADDRESS = "127.0.0.1";
        //如果为127.0.0.1,则获取本地MAC地址。
        if (LOOPBACK_ADDRESS.equals(ip)) {
            InetAddress inetAddress = InetAddress.getLocalHost();
            //貌似此方法需要JDK1.6。
            byte[] mac = NetworkInterface.getByInetAddress(inetAddress).getHardwareAddress();
            //下面代码是把mac地址拼装成String
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < mac.length; i++) {
                if (i != 0) {
                    sb.append("-");
                }
                //mac[i] & 0xFF 是为了把byte转化为正整数
                String s = Integer.toHexString(mac[i] & 0xFF);
                sb.append(s.length() == 1 ? 0 + s : s);
            }
            //把字符串所有小写字母改为大写成为正规的mac地址并返回
            macAddress = sb.toString().trim().toUpperCase();
            return macAddress;
        }
        //获取非本地IP的MAC地址
        try {
            Process p = Runtime.getRuntime().exec("nbtstat -A " + ip);
            InputStreamReader isr = new InputStreamReader(p.getInputStream());
            BufferedReader br = new BufferedReader(isr);
            while ((line = br.readLine()) != null) {
                if (line != null) {
                    int index = line.indexOf(MAC_ADDRESS_PREFIX);
                    if (index != -1) {
                        macAddress = line.substring(index + MAC_ADDRESS_PREFIX.length()).trim().toUpperCase();
                    }
                }
            }
            br.close();
        } catch (IOException e) {
            e.printStackTrace(System.out);
        }
        return macAddress;
    }
}
