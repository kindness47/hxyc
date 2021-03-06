package com.hxyc.ots.service.impl;

import com.hxyc.ots.mapper.ProjectMapper;
import com.hxyc.ots.model.Project;
import com.hxyc.ots.service.ProjectService;
import com.hxyc.ots.vo.ProjectVO;
import com.hxyc.ots.vo.WelcomeVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @Author: 于金谷
 * @Date: 2018/7/4 15:15
 * @Description: 招标采购管理业务实现
 */
@Service
public class ProjectServiceImpl implements ProjectService {

    @Autowired
    private ProjectMapper projectMapper;

    /**
     * 功能描述:项目管理列表
     * @Auther: 于金谷
     * @Date create in 2018/7/4 16:11
     */
    @Override
    public List<ProjectVO> listProject(ProjectVO projectVO) {
        return projectMapper.listProject(projectVO);
    }

    @Override
    public List<ProjectVO> listProjectByParam(ProjectVO projectVO) {
        return projectMapper.select(projectVO);
    }

    @Override
    public Integer getCount(ProjectVO projectVO) {
        return projectMapper.selectCount(projectVO);
    }
    /**
     * 功能描述: 新增项目
     * @param project 项目信息
     * @Auther: 于金谷
     * @Date create in 2018/7/25 15:02
     */
    @Override
    @Transactional
    public void saveProject(Project project) {
        projectMapper.insertSelective(project);
    }

    /**
     * 功能描述: 更新项目
     * @param project 更新项目信息
     * @Auther: 于金谷
     * @Date create in 2018/7/25 15:15
     */
    @Override
    @Transactional
    public void updateProject(Project project) {
        projectMapper.updateByPrimaryKeySelective(project);
    }

    /**
     * 功能描述: 根据项目ID获取项目信息
     * @param id 项目ID
     * @Auther: 于金谷
     * @Date create in 2018/7/25 15:17
     */
    @Override
    public Project getProjectById(String id) {
        return projectMapper.selectByPrimaryKey(id);
    }

    /**
     * 功能描述: 根据项目名称获取项目
     * @param projectName 工程名
     * @Auther: 于金谷
     * @Date create in 2018/7/25 15:24
     */
    @Override
    public Project getProjectByName(String projectName) {
        return projectMapper.getProjectByName(projectName);
    }

    /**
     * 功能描述: 获取欢迎页汇总数据
     * @Auther: 于金谷
     * @Date create in 2018/11/6 16:47
     */
    @Override
    public List<WelcomeVO> getWelcomeList() {
        return projectMapper.getWelcomeList();
    }

    /**
     * 功能描述: 按汇总日期获取项目信息
     * @param title 汇总日期
     * @Auther: 于金谷
     * @Date create in 2018/12/17 14:08
     */
    @Override
    public List<ProjectVO> projectDetailByDateSum(String title) {
        return projectMapper.projectDetailByDateSum(title);
    }

    @Override
    public List<ProjectVO> selectExceptionProject(ProjectVO projectVO) {
        return projectMapper.selectExceptionProject(projectVO);
    }

    @Override
    public Integer selectExceptionProjectCount(ProjectVO project) {
        return projectMapper.selectExceptionProjectCount(project);
    }
}
