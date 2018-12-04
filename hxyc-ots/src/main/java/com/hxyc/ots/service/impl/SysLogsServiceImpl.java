package com.hxyc.ots.service.impl;

import com.hxyc.ots.mapper.SysLogsMapper;
import com.hxyc.ots.model.SysLogs;
import com.hxyc.ots.service.SysLogsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @Author: 于金谷
 * @Date: 2018/12/3 16:32
 * @Description: 系统登录日志实现
 */
@Service
public class SysLogsServiceImpl implements SysLogsService {
    @Autowired
    private SysLogsMapper sysLogsMapper;

    /**
     * 功能描述: 获取所有登录系统日志
     * @param startDate  登录开始时间
     * @param endDate 登录结束时间
     * @param inputStr 查询输入数据
     * @Auther: 于金谷
     * @Date create in 2018/12/3 16:34
     */
    @Override
    public List<SysLogs> listLogs(String startDate, String endDate, String inputStr) {
        return sysLogsMapper.listLogs(startDate, endDate, inputStr);
    }

    /**
     * 功能描述: 系统登录日志
     * @param sysLog 系统日志对象
     * @Auther: 于金谷
     * @Date create in 2018/12/3 17:18
     */
    @Override
    @Transactional
    public void saveSysLogs(SysLogs sysLog) {
        sysLogsMapper.insertSelective(sysLog);
    }
}
