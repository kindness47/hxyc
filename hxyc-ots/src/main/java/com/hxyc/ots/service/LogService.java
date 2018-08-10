package com.hxyc.ots.service;

import com.hxyc.ots.vo.LogVO;

import java.util.List;

/**
 * @Author: 于金谷
 * @Date: 2018/7/16 16:57
 * @Description: 日志管理业务接口
 */
public interface LogService {

    /**
     * 功能描述:系统日志列表
     * @Auther: 于金谷
     * @Date create in 2018/7/16 17:00
     */
    List<LogVO> listLog(LogVO logVO);
}
