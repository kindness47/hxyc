package com.hxyc.ots.controller;

import com.hxyc.ots.service.LogService;
import com.hxyc.ots.vo.LogVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * @Description:系统日志
 * @Author: 于金谷
 * @Date: 2018/7/16 16:07
 */
@Controller
public class LogController extends BaseController {

    @Autowired
    private LogService logService;

    /**
     * 功能描述:系统日志列表
     * @Auther: 于金谷
     * @Date create in 2018/7/16 16:43
     */
    @RequestMapping(value = "/log-list", method = RequestMethod.GET)
    public ModelAndView listLog(LogVO logVO){
        ModelAndView mav = new ModelAndView("ots/log-list");
        List<LogVO> logList = logService.listLog(logVO);
        mav.addObject("logList", logList);

        return mav;
    }
}
