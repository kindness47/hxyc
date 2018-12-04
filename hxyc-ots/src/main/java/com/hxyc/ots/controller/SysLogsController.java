package com.hxyc.ots.controller;

import com.hxyc.ots.model.SysLogs;
import com.hxyc.ots.service.SysLogsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * @Author: 于金谷
 * @Date: 2018/12/3 16:26
 * @Description: 系统登录日志
 */
@Controller
public class SysLogsController extends BaseController {

    @Autowired
    private SysLogsService sysLogsService;

    @RequestMapping(value = "/sysLogs-list", method = RequestMethod.GET)
    public ModelAndView listSysLogs(String startDate, String endDate,String  inputStr){
        ModelAndView mav = new ModelAndView("sysManage/sysLogs-list");
        List<SysLogs> sysLogsList = sysLogsService.listLogs(startDate, endDate, inputStr);
        mav.addObject("sysLogsList", sysLogsList);
        return mav;
    }
}
