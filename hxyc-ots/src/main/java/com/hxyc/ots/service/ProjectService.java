package com.hxyc.ots.service;

import com.hxyc.ots.model.Project;
import com.hxyc.ots.vo.ProjectVO;
import com.hxyc.ots.vo.WelcomeVO;

import java.util.List;

/**
 * @Author: 于金谷
 * @Date: 2018/7/4 15:14
 * @Description: 招标采购管理业务接口
 */
public interface ProjectService {
    /**
     * 功能描述:项目列表
     * @Auther: 于金谷
     * @Date create in 2018/7/4 16:11
     */
    List<ProjectVO> listProject(ProjectVO projectVO);

    /**
     * 根据参数查询项目列表
     * @param projectVO
     * @return
     */
    List<ProjectVO> listProjectByParam(ProjectVO projectVO);

    /**
     * 根据参数查询项目数据总条数
     * @param projectVO
     * @return
     */
    Integer getCount(ProjectVO projectVO);

    /**
     * 功能描述: 新增项目
     * @Auther: 于金谷
     * @Date create in 2018/7/25 15:02
     */
    void saveProject(Project project);

    /**
     * 功能描述: 更新项目
     * @Auther: 于金谷
     * @Date create in 2018/7/25 15:15
     */
    void updateProject(Project project);

    /**
     * 功能描述: 根据项目ID获取项目信息
     * @Auther: 于金谷
     * @Date create in 2018/7/25 15:17
     */
    Project getProjectById(String id);

    /**
     * 功能描述: 根据项目名称获取项目
     * @Auther: 于金谷
     * @Date create in 2018/7/25 15:24
     */
    Project getProjectByName(String projectName);

    List<ProjectVO> selectExceptionProject(ProjectVO projectVO);

    Integer selectExceptionProjectCount(ProjectVO project);
    /**
     * 功能描述: 获取欢迎页汇总数据
     * @Auther: 于金谷
     * @Date create in 2018/11/6 16:47
     */
    List<WelcomeVO> getWelcomeList();

    /**
     * 功能描述: 按汇总日期获取项目信息
     * @Auther: 于金谷
     * @Date create in 2018/12/17 14:08
     */
    List<ProjectVO> projectDetailByDateSum(String title);
}
