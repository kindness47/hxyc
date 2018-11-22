package com.hxyc.ots.controller;

import com.hxyc.ots.base.Constants;
import com.hxyc.ots.base.Response;
import com.hxyc.ots.model.Company;
import com.hxyc.ots.service.CompanyService;
import com.hxyc.ots.service.ProjectService;
import com.hxyc.ots.utils.SystemUtil;
import com.hxyc.ots.vo.CompanyVO;
import com.hxyc.ots.vo.ProjectVO;
import com.sun.org.apache.xpath.internal.operations.Bool;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.*;

/**
 * @Description:公司管理
 * @Author: 于金谷
 * @Date: 2018/7/13 17:13
 */
@Controller
public class CompanyController extends BaseController {

    @Autowired
    private CompanyService companyService;

    @Autowired
    private ProjectService projectService;

    /**
     * 公司信息列表
     */
    @RequestMapping(value = "/company-list")
    public ModelAndView listCompany(CompanyVO companyVO){
        ModelAndView mav = new ModelAndView("ots/company-list");
        List<CompanyVO> companyVOList = companyService.listCompany(companyVO);
        mav.addObject("companyVOList", companyVOList);
        mav.addObject("companyVO", companyVO);

        return mav;
    }

    /**
     * 公司信息列表
     */
    @RequestMapping(value = "/company-tree-list", method = RequestMethod.GET)
    @ResponseBody
    public Response listCompanyByTree(CompanyVO companyVO){
        return returnSuccess(companyService.listCompany(companyVO));
    }

    /**
     * Description： 根据项目完成状态查询Company  tree
     * Author: 刘永红
     * Date: Created in 2018/11/20 18:24
     */
    @RequestMapping(value = "/company-tree-list-by-status", method = RequestMethod.GET)
    @ResponseBody
    public Response listCompanyTreeByStatus(@RequestParam("completion") String completion){
        Map<String,Boolean> statusMap = new HashMap<String,Boolean>();
        statusMap.put("completion",Boolean.parseBoolean(completion));
        List<CompanyVO> companyList = companyService.listCompanyByStatus(statusMap);
        //操作将在companyList进行,newCompanyList向前台返回数据
        List<CompanyVO> newCompanyList = new ArrayList<>();
        for(CompanyVO companyVO:companyList) {
            newCompanyList.add(companyVO);
        }
        //查找每个CompanyVO对象下的project的count
        int count;
        ProjectVO p = new ProjectVO();
        //判断查询的listcompany的状态
        Map<String,Integer> countMap=Boolean.parseBoolean(completion)?Constants.completionCountMap:Constants.noCompletionCountMap;
        if(countMap == null || countMap.isEmpty())
            countMap = new HashMap<String,Integer>();
            for(CompanyVO companyVO:companyList) {
                p.setCompanyId(companyVO.getId());
                p.setCompletion(Boolean.parseBoolean(completion));
                //获取某个company下project的count
                count = projectService.getCount(p);
                System.out.println();
                //判断是否已有子节点加上了count
                int sum = countMap.get(companyVO.getId()) == null ? count : (countMap.get(companyVO.getId())+count);
                countMap.put(companyVO.getId(),sum);
                //判断此CompanyVO对象是否为顶级父节点
                boolean isTopFa = companyVO.getLevel() == 1;
                CompanyVO c = new CompanyVO();
                //如果不是顶级父节点，将count加到其直接父节点上
                while(!isTopFa){
                    //父节点新的数量
                    int fNewCount = countMap.get(companyVO.getParentId()) == null ? count : (countMap.get(companyVO.getParentId())+count);
                    countMap.put(companyVO.getParentId(),fNewCount);
                    //将下一次操作的CompanyVO对象变为其父对象
                    c.setId(companyVO.getParentId());
                    List<CompanyVO> list = companyService.listCompany(c);
                    if(list.size() == 0)
                        break;
                    companyVO = list.get(0);
                    isTopFa = companyVO.getLevel() == 1;
                }
            }
       String newCompanyShortName = "";
        for(CompanyVO companyVO : newCompanyList) {
            newCompanyShortName = companyVO.getCompanyShortName()+"("+countMap.get(companyVO.getId())+")";
             companyVO.setCompanyShortName(newCompanyShortName);
        }
        return returnSuccess(newCompanyList);
    }
    /**
     * Description： 查询有异常项目的公司列表
     * Author: 刘永红
     * Date: Created in 2018/11/13 9:13
     */
    @RequestMapping(value = "/company-tree-exception-list" , method = RequestMethod.GET)
    @ResponseBody
    public Response exceptionCompanyTree(CompanyVO company){
        List<CompanyVO> companyList = companyService.listExceptionCompanys(company);
        List<CompanyVO> newCompanyList = new ArrayList<>();
        for(CompanyVO companyVO:companyList) {
            newCompanyList.add(companyVO);
        }
        int count;
        ProjectVO p = new ProjectVO();
        Map<String,Integer> countMap= Constants.exceptionCountMap;
        if(countMap == null || countMap.isEmpty())
            countMap = new HashMap<String,Integer>();
        for(CompanyVO companyVO:companyList) {
            p.setCompanyId(companyVO.getId());
            count = projectService.selectExceptionProjectCount(p);
            System.out.println();
            int sum = countMap.get(companyVO.getId()) == null ? count : (countMap.get(companyVO.getId())+count);
            countMap.put(companyVO.getId(),sum);
            boolean isTopFa = companyVO.getLevel() == 1;
            CompanyVO c = new CompanyVO();
            while(!isTopFa){
                //父节点新的数量
                int fNewCount = countMap.get(companyVO.getParentId()) == null ? count : (countMap.get(companyVO.getParentId())+count);
                countMap.put(companyVO.getParentId(),fNewCount);
                //将下一次操作的CompanyVO对象变为其父对象
                c.setId(companyVO.getParentId());
                List<CompanyVO> list = companyService.listCompany(c);
                if(list.size() == 0)
                    break;
                companyVO = list.get(0);
                isTopFa = companyVO.getLevel() == 1;
            }
        }
        String newCompanyShortName = "";
        for(CompanyVO companyVO : newCompanyList) {
            newCompanyShortName = companyVO.getCompanyShortName()+"("+countMap.get(companyVO.getId())+")";
            companyVO.setCompanyShortName(newCompanyShortName);
        }
        return returnSuccess(newCompanyList);
    }
    /**
     * 功能描述:新增公司
     * @Auther: 于金谷
     * @Date create in 2018/7/16 15:20
     */
    @RequestMapping(value = "/company-add", method = RequestMethod.GET)
    public ModelAndView addCompany(){
        ModelAndView mav = new ModelAndView("ots/company-add");

        // 初始化上级公司Select
        CompanyVO vo = new CompanyVO();
        List<CompanyVO> companyList = companyService.listCompany(vo);
        mav.addObject("companyList", companyList);

        return mav;
    }

    /**
     * 功能描述:保持或修改新增公司信息
     * @Auther: 于金谷
     * @Date create in 2018/7/16 15:21
     */
    @RequestMapping(value = "/company-save", method = RequestMethod.POST)
    @ResponseBody
    public Response saveCompany(Company company) {
        String id = company.getId();
        if(StringUtils.isNotBlank(id)) { // 修改
            Company oldCompany = companyService.getCompanyById(id);
            if(oldCompany == null) {
                return returnValidateError("修改公司不存在，请检查！");
            }

            String companyName = company.getCompanyName();
            String oldCompanyName = oldCompany.getCompanyName();
            if(!companyName.equals(oldCompanyName)) {
                int count = companyService.getCompanyCountByName(companyName);
                if(count > 0) {
                    return returnValidateError("保存失败，修改的公司名称已经存在！");
                }
            }

            String companyShortName = company.getCompanyShortName();
            String oldCompanyShortName = oldCompany.getCompanyShortName();
            if(!companyShortName.equals(oldCompanyShortName)){
                int count = companyService.getCompanyCountByName(companyShortName);
                if(count > 0) {
                    return returnValidateError("保存失败，修改的公司简称已经存在！");
                }
            }

            oldCompany.setCompanyName(companyName);
            oldCompany.setCompanyShortName(companyShortName);
            oldCompany.setParentId(company.getParentId());
            oldCompany.setSort(company.getSort());
            oldCompany.setLevel(company.getLevel());
            oldCompany.setUpdateBy(SystemUtil.getLoginUserName());
            oldCompany.setUpdateTime(new Date());
            companyService.updateCompany(oldCompany);

            return returnSuccess("修改成功！");
        } else {
            String companyName = company.getCompanyName();
            if(StringUtils.isNotBlank(companyName)) {
                int count = companyService.getCompanyCountByName(companyName);
                if(count > 0) {
                    return returnValidateError("保存失败，公司名称已经存在！");
                }
            }
            String companyShortName = company.getCompanyShortName();
            if(StringUtils.isNotBlank(companyShortName)){
                int count = companyService.getCompanyCountByName(companyShortName);
                if(count > 0) {
                    return returnValidateError("保存失败，公司简称已经存在！");
                }
            }

            company.setCreateBy(SystemUtil.getLoginUserName());
            company.setCreateTime(new Date());
            companyService.saveCompany(company);

            return returnSuccess("新增成功！");
        }
    }

    /**
     * 功能描述:根据ID获取公司对象
     * @Auther: 于金谷
     * @Date create in 2018/7/20 16:59
     */
    @ResponseBody
    @RequestMapping(value = "/company/{id}", method = RequestMethod.POST)
    public Company getCompanyById(@PathVariable("id") String id) {
        Company company = companyService.getCompanyById(id);
        return company;
    }

}
