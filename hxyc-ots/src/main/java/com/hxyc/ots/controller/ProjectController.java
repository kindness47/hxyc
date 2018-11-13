package com.hxyc.ots.controller;

import com.alibaba.fastjson.JSONArray;
import com.hxjc.core.utils.CodeUtils;
import com.hxjc.core.utils.PoiExcelExport;
import com.hxyc.ots.base.Constants;
import com.hxyc.ots.base.Response;
import com.hxyc.ots.model.Project;
import com.hxyc.ots.service.CompanyService;
import com.hxyc.ots.service.ProjectService;
import com.hxyc.ots.service.UserService;
import com.hxyc.ots.utils.SystemUtil;
import com.hxyc.ots.vo.CompanyVO;
import com.hxyc.ots.vo.ProjectExcelVO;
import com.hxyc.ots.vo.ProjectVO;
import com.hxyc.ots.vo.UserVO;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.*;
import java.lang.reflect.Array;
import java.util.*;

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
    @Autowired
    private UserService userService;

    /**
     * 项目信息列表
     */
    @RequestMapping(value = "/project-list", method = RequestMethod.GET)
    public ModelAndView listProject(ProjectVO projectVO){
        ModelAndView mav = new ModelAndView("ots/project-list");
        List<ProjectVO> projectList = projectService.listProject(projectVO);
        mav.addObject("projectList", projectList);

        return mav;
    }

    /**
     * 通过参数获取项目信息列表
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
     * 设置项目已完成
     * @param projectList
     * @return
     */
    @RequestMapping(value = "/project-list-setfinish",method = RequestMethod.GET)
    @ResponseBody
    public Response projectSetFinish(@RequestParam("jsonData") String projectList){
        List<ProjectVO> list = JSONArray.parseArray(projectList,ProjectVO.class);
        Project project = new Project();
        for(ProjectVO projectVO:list){
            project.setId(projectVO.getId());
            project.setUpdateBy(SystemUtil.getLoginUserName());
            project.setUpdateTime(new Date());
            project.setCompletion(true);
            System.out.println(project);
            projectService.updateProject(project);
        }

        return returnSuccess("修改成功");
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

        // 初始化人员
        List<UserVO> projectUsers = userService.getUsersByRole(Constants.INVITING_ADMIN);
        mav.addObject("projectUsers", projectUsers);
        List<UserVO> operatorUsers = userService.getUsersByRole(Constants.OPERATOR_ADMIN);
        mav.addObject("operatorUsers", operatorUsers);
        List<UserVO> settlementUsers = userService.getUsersByRole(Constants.SETTLEMENT_ADMIN);
        mav.addObject("settlementUsers", settlementUsers);
        List<UserVO> financeUsers = userService.getUsersByRole(Constants.FINANCE_ADMIN);
        mav.addObject("financeUsers", financeUsers);

        return mav;
    }

    /**
     * 招采订单保存
     */
    @RequestMapping(value = "/project-save", method = RequestMethod.POST)
    @ResponseBody
    public Response saveProject(Project project) {
        System.out.println("project------------>"+project.getCompletion()+project.getProjectName()+
                (project.getCompletion() instanceof Boolean ));
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
            project.setCompletion(false);

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
            oldProject.setCompletion(project.getCompletion());
            // 新增指定项目、运营、结算、财务专员
            oldProject.setProjectAssistant(project.getProjectAssistant());
            oldProject.setOperateAssistant(project.getOperateAssistant());
            oldProject.setSettlementAssistant(project.getSettlementAssistant());
            oldProject.setFinanceAssistant(project.getFinanceAssistant());
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
    /**
     * Description： 查看项目详细信息
     * Author: 刘永红
     * Date: Created in 2018/11/8 17:09
     */
    @RequestMapping(value = "/project-detail",method = RequestMethod.GET)
    public ModelAndView projectDetails(ProjectVO projectVO){
        ModelAndView mav = new ModelAndView("ots/project-detail");
        mav.addObject("project",projectService.listProject(projectVO).get(0));
        return mav;
    }
    /**
     * Description： 查询异常项目信息
     * Author: 刘永红
     * Date: Created in 2018/11/12 9:29
     */
    @RequestMapping(value = "/project-list-exception",method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> projectListException(ProjectVO projectVO){
        Map<String,Object> paramMap = new HashMap<>();
        paramMap.put("code",0);
        paramMap.put("msg","");
        Integer total = projectService.selectExceptionProjectCount(projectVO);
        paramMap.put("count",total);
        projectVO.setPageStart((projectVO.getPage()-1)*projectVO.getLimit());
        projectVO.setPageEnd(projectVO.getLimit());
        List<ProjectVO> projectVOList = projectService.selectExceptionProject(projectVO);
        paramMap.put("data",projectVOList);
        return paramMap;
    }

    /**
     * 功能描述: 导出项目信息
     * @Auther: 于金谷
     * @Date create in 2018/7/20 16:59
     */
    @ResponseBody
    @RequestMapping(value = "/project/exportExcel")
    public void exportExcel(HttpServletRequest request, HttpServletResponse response) {
        String titleColumn[] = {"companyName","projectName","year","supplyUnit","contractSignTime","supplyTime","contractNum","contractAmount","settlementMode",
                "baseFloatValue","extraCapitalAmount","capitalTimeLimit","interestRate","createTime"};
        String titleName[] = {"公司名称", "项目名称", "年份","供应单位","签订时间","供货时间","合同数量（T）","合同金额（万元）","结算模式","裸价浮动值（元）",
                "垫资额","垫资期限","利息标准","创建时间"};
        int titleSize[] = {20,20,20,20,20,20,20,20,20,20,20,20,20,20};

        List<ProjectExcelVO> list = new ArrayList<>();
        PoiExcelExport excelExport = new PoiExcelExport(request,response,"项目信息","sheet1");
        List<ProjectVO> projectList = projectService.listProject(new ProjectVO());
        for (ProjectVO vo : projectList) {
            ProjectExcelVO excelVO = new ProjectExcelVO();
            excelVO.setCompanyName(vo.getCompanyName());
            excelVO.setProjectName(vo.getProjectName());
            excelVO.setYear(vo.getYear());
            excelVO.setSupplyUnit(vo.getSupplyUnit());
            excelVO.setContractSignTime(vo.getContractSignTime());
            excelVO.setSupplyTime(vo.getSupplyTime());
            excelVO.setContractNum(vo.getContractNum());
            excelVO.setContractAmount(vo.getContractAmount());
            String settlementMode = vo.getSettlementMode();
            if (StringUtils.isNotBlank(settlementMode)) {
                switch (settlementMode) {
                    case Constants.TWO_STR:
                        excelVO.setSettlementMode(Constants.DAIGOU);
                        break;
                    case Constants.THREE_STR:
                        excelVO.setSettlementMode(Constants.XINYONGZHENG_LIWAI);
                        break;
                    default:
                        excelVO.setSettlementMode(Constants.XINYONGZHENG);
                        break;
                }
            }
            excelVO.setBaseFloatValue(vo.getBaseFloatValue());
            excelVO.setExtraCapitalAmount(vo.getExtraCapitalAmount());
            excelVO.setCapitalTimeLimit(vo.getCapitalTimeLimit());
            excelVO.setInterestRate(vo.getInterestRate());
            excelVO.setCreateTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(vo.getCreateTime()));
            list.add(excelVO);
        }
        excelExport.writeExcel(titleColumn, titleName, titleSize, list);
    }
}
