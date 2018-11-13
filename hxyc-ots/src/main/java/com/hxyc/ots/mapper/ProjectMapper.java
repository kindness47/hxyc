package com.hxyc.ots.mapper;

import com.hxjc.core.utils.DataSource;
import com.hxyc.ots.model.Project;
import com.hxyc.ots.vo.ProjectVO;
import com.hxyc.ots.vo.WelcomeVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@DataSource(value="dataSourceOts")
public interface ProjectMapper {
    int deleteByPrimaryKey(String id);

    int insert(Project record);

    int insertSelective(Project record);

    Project selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(Project record);

    int updateByPrimaryKey(Project record);

    /**
     * 根据条件查询项目列表
     * @param projectVO
     * @Auther: bin.wu
     * @return
     */
    List<ProjectVO> select(ProjectVO projectVO);

    /**
     * 功能描述: 获取所有有效项目信息
     * @Auther: 于金谷
     * @Date create in 2018/7/13 15:57
     */
    List<ProjectVO> listProject(ProjectVO projectVO);

    /**
     * 根据条件查询项目总数
     * @param projectVO
     * @Auther: bin.wu
     * @return
     */
    Integer selectCount(ProjectVO projectVO);

    /**
     * 功能描述:根据项目名称获取项目
     * @Auther: 于金谷
     * @Date create in 2018/7/25 15:26
     */
    Project getProjectByName(@Param("projectName") String projectName);
    /**
     * Description： 查询异常项目信息
     * Author: 刘永红
     * Date: Created in 2018/11/12 10:38
     */
    List<ProjectVO> selectExceptionProject(ProjectVO projectVO);
    /**
     * Description： 查询异常项目数量
     * Author: 刘永红
     * Date: Created in 2018/11/12 10:49
     */
    Integer selectExceptionProjectCount(ProjectVO project);

    /**
     * 功能描述: 获取欢迎页汇总数据
     * @Auther: 于金谷
     * @Date create in 2018/11/6 16:50
     */
    List<WelcomeVO> getWelcomeList();
}