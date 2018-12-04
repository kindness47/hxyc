package com.hxyc.ots.mapper;

import com.hxjc.core.utils.DataSource;
import com.hxyc.ots.model.SysLogs;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@DataSource(value="dataSourceOts")
public interface SysLogsMapper {
    int deleteByPrimaryKey(Long id);

    int insert(SysLogs record);

    int insertSelective(SysLogs record);

    SysLogs selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(SysLogs record);

    int updateByPrimaryKey(SysLogs record);

    /**
     * 功能描述: 获取所有登录系统日志
     * @param startDate  登录开始时间
     * @param endDate 登录结束时间
     * @param inputStr 查询输入数据
     * @Auther: 于金谷
     * @Date create in 2018/12/3 16:34
     */
    List<SysLogs> listLogs(@Param("startDate") String startDate, @Param("endDate") String endDate, @Param("inputStr") String inputStr);
}