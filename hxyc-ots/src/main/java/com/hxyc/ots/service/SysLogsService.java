package com.hxyc.ots.service;

import com.hxyc.ots.model.SysLogs;

import java.util.List;

/**
 * @Author: 于金谷
 * @Date: 2018/12/3 16:31
 * @Description: 系统登录日志接口
 */
public interface SysLogsService {

    /**
     * 功能描述: 获取所有登录系统日志
     * @Auther: 于金谷
     * @Date create in 2018/12/3 16:34
     */
    List<SysLogs> listLogs(String startDate, String endDate, String inputStr);

    /**
     * 功能描述: 系统登录日志
     * @Auther: 于金谷
     * @Date create in 2018/12/3 17:18
     */
    void saveSysLogs(SysLogs sysLog);
}
