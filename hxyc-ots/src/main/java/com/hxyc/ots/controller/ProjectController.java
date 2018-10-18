package com.hxyc.ots.controller;

import com.hxjc.core.utils.CodeUtils;
import com.hxyc.ots.base.Response;
import com.hxyc.ots.model.Project;
import com.hxyc.ots.service.CompanyService;
import com.hxyc.ots.service.ProjectService;
import com.hxyc.ots.utils.SystemUtil;
import com.hxyc.ots.vo.CompanyVO;
import com.hxyc.ots.vo.ProjectVO;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * @Author: 于金谷
 * @Date: 2018/7/4 15:12
 * @Description: 项目管理
 */
@Controller
public class ProjectController extends BaseController {

    @Autowired
    private ProjectService projectService;

    @Autowired
    private CompanyService companyService;

    /**
     * 招标录入列表
     */
    @RequestMapping(value = "/project-list", method = RequestMethod.GET)
    public ModelAndView listProject(ProjectVO projectVO){
        ModelAndView mav = new ModelAndView("ots/project-list");
        List<ProjectVO> projectList = projectService.listProject(projectVO);
        mav.addObject("projectList", projectList);

        return mav;
    }

    /**
     * 项目信息列表
     */
    @RequestMapping(value = "/project-list-by-param", method = RequestMethod.GET)
    @ResponseBody
    public Map<String,Object> listProjectByCompany(ProjectVO projectVO){
        Map<String,Object> paramMap = new HashMap<>();
        paramMap.put("code",0);
        paramMap.put("msg","");
        Integer total = projectService.getCount(projectVO);
        paramMap.put("count",total);
        projectVO.setPageStart((projectVO.getPage()-1)*projectVO.getLimit());
        projectVO.setPageEnd(projectVO.getLimit());
        List<ProjectVO> projectVOList = projectService.listProjectByParam(projectVO);
        paramMap.put("data",projectVOList);
        return paramMap;
    }

    /**
     * 新增招采订单
     * 功能描述: 新增公司项目
     * @Auther: 于金谷
     * @Date create in 2018/7/25 11:26
     */
    @RequestMapping(value = "/project-add", method = RequestMethod.GET)
    public ModelAndView addProject(){
        ModelAndView mav = new ModelAndView("ots/project-add");

        // 初始化上级公司Select
        CompanyVO vo = new CompanyVO();
        List<CompanyVO> companyList = companyService.listCompany(vo);
        mav.addObject("companyList", companyList);

        return mav;
    }

    /**
     * 招采订单保存
     */
    @RequestMapping(value = "/project-save", method = RequestMethod.POST)
    @ResponseBody
    public Response saveProject(Project project) {
        String id = project.getId();
        if (StringUtils.isBlank(id)) { // 新增
            String projectName = project.getProjectName();
            if(StringUtils.isNotBlank(projectName)) {
                Project projectObj = projectService.getProjectByName(projectName);
                if(projectObj != null) {
                    return returnValidateError("项目已经存在,请重新输入！");
                }
            }
            project.setProjectCode(CodeUtils.getRuleCode("GCP"));
            project.setCreateBy(SystemUtil.getLoginUserName());
            project.setCreateTime(new Date());
            projectService.saveProject(project);

            return returnSuccess("新增成功！");
        } else { // 修改
            Project oldProject = projectService.getProjectById(id);
            if(oldProject == null) {
                return returnValidateError("修改项目不存在，请检查！");
            }

            oldProject.setCompanyId(project.getCompanyId());
            oldProject.setProjectName(project.getProjectName());
            oldProject.setYear(project.getYear());
            oldProject.setSupplyUnit(project.getSupplyUnit());
            oldProject.setContractSignTime(project.getContractSignTime());
            oldProject.setSupplyTime(project.getSupplyTime());
            oldProject.setContractNum(project.getContractNum());
            oldProject.setContractAmount(project.getContractAmount());
            oldProject.setSettlementMode(project.getSettlementMode());
            oldProject.setBaseFloatValue(project.getBaseFloatValue());
            oldProject.setExtraCapitalAmount(project.getExtraCapitalAmount());
            oldProject.setCapitalTimeLimit(project.getCapitalTimeLimit());
            oldProject.setInterestRate(project.getInterestRate());
            oldProject.setUpdateBy(SystemUtil.getLoginUserName());
            oldProject.setUpdateTime(new Date());
            projectService.updateProject(oldProject);

            return returnSuccess("修改成功！");
        }
    }

    /**
     * 功能描述:根据ID获取公司对象
     * @Auther: 于金谷
     * @Date create in 2018/7/20 16:59
     */
    @ResponseBody
    @RequestMapping(value = "/project/{id}", method = RequestMethod.POST)
    public Project getProjectById(@PathVariable("id") String id) {
        Project project = projectService.getProjectById(id);
        return project;
    }
}
