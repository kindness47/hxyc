package com.hxyc.ots.service.impl;

import com.hxyc.ots.service.LogService;
import com.hxyc.ots.vo.LogVO;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Author: 于金谷
 * @Date: 2018/7/16 17:01
 * @Description: 日志管理业务实现
 */
@Service
public class LogServiceImpl implements LogService {
    /**
     * 功能描述:系统日志列表
     * @param logVO
     * @Auther: 于金谷
     * @Date create in 2018/7/16 17:00
     */
    @Override
    public List<LogVO> listLog(LogVO logVO) {
        return null;
    }
}
