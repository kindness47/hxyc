package com.hxyc.ots.controller;

import com.hxyc.ots.base.Response;
import com.hxyc.ots.model.Company;
import com.hxyc.ots.service.CompanyService;
import com.hxyc.ots.utils.SystemUtil;
import com.hxyc.ots.vo.CompanyVO;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Description:公司管理
 * @Author: 于金谷
 * @Date: 2018/7/13 17:13
 */
@Controller
public class CompanyController extends BaseController {

    @Autowired
    private CompanyService companyService;

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
    public Response listCompanyByTree(@RequestParam("completion") String completion){
        Map<String,Boolean> statusMap = new HashMap<String,Boolean>();
        statusMap.put("completion",Boolean.parseBoolean(completion));
        List<CompanyVO> companyList = companyService.listCompanyByStatus(statusMap);
        for(CompanyVO companyVO:companyList)
            System.out.println("------------>"+companyVO.getCompanyName()+"---->"+companyVO.getParentCompanyName());
        return returnSuccess(companyList);
    }
    /**
     * Description： 查询有异常项目的公司列表
     * Author: 刘永红
     * Date: Created in 2018/11/13 9:13
     */
    @RequestMapping(value = "/company-tree-exception-list" , method = RequestMethod.GET)
    @ResponseBody
    public Response exceptionCompanyTree(CompanyVO companyVO){
        List<CompanyVO> companyList = companyService.listExceptionCompanys(companyVO);
        return returnSuccess(companyList);
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
