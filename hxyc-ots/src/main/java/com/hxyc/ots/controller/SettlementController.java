package com.hxyc.ots.controller;

import com.hxyc.ots.base.Constants;
import com.hxyc.ots.base.Response;
import com.hxyc.ots.model.Settlement;
import com.hxyc.ots.service.ProjectService;
import com.hxyc.ots.service.SettlementService;
import com.hxyc.ots.utils.SystemUtil;
import com.hxyc.ots.vo.ProjectVO;
import com.hxyc.ots.vo.SettlementVO;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

/**
 * @Description:结算管理
 * @Author: 于金谷
 * @Date: 2018/7/16 16:07
 */
@Controller
public class SettlementController extends BaseController {

    @Autowired
    private SettlementService settlementService;

    @Autowired
    private ProjectService projectService;

    /**
     * 结算信息列表
     */
    @RequestMapping(value = "/settlement-list", method = RequestMethod.GET)
    public ModelAndView listSettlement(SettlementVO settlementVO){
        settlementVO.setCreateBy(SystemUtil.getLoginUserName());
        if (SystemUtil.getSessionUser().getRoleName().indexOf("管理")!=-1){
            settlementVO.setCreateBy(null);
        }
        ModelAndView mav = new ModelAndView("ots/settlement-list");
        List<SettlementVO> settlementVOList = settlementService.listSettlement(settlementVO);
        mav.addObject("settlementVOList", settlementVOList);

        return mav;
    }

    /**
     * 结算单下拉列表
     */
    @RequestMapping(value = "/settlement-code-list", method = RequestMethod.GET)
    @ResponseBody
    public Map<String,Object> listSettlementCode2(SettlementVO settlementVO){
        Map<String,Object> paramMap = new HashMap<>();
        paramMap.put("code",0);
        paramMap.put("msg","");
        Integer total = settlementService.getCount(settlementVO);
        paramMap.put("count",total);
        settlementVO.setPageStart((settlementVO.getPage()-1)*settlementVO.getLimit());
        settlementVO.setPageEnd(settlementVO.getLimit());
        List<SettlementVO> settlementVOList = settlementService.listSettlement(settlementVO);
        paramMap.put("data",settlementVOList);
        return paramMap;
    }

    /**
     * 功能描述:新增结算信息
     * @Auther: bin.wu
     * @Date 2018/7/18
     */
    @RequestMapping(value = "/settlement-add", method = RequestMethod.GET)
    public ModelAndView addSettlement(String companyId){
        ModelAndView mav = new ModelAndView("ots/settlement-add");
        mav.addObject("settlement", new Settlement());
        ProjectVO projectVO = new ProjectVO();
        projectVO.setCompanyId(companyId);
        List<ProjectVO> projectList = projectService.listProject(projectVO);
        mav.addObject("projectList", projectList);
        mav.addObject("companyId",companyId);
        return mav;
    }

    /**
     * 功能描述:编辑结算信息
     * @Auther: bin.wu
     * @Date 2018/7/18
     */
    @RequestMapping(value = "/settlement-edit", method = RequestMethod.GET)
    public ModelAndView editSettlement(String id,String companyId){
        SettlementVO settlementVO = settlementService.getSettlement(id);
        System.out.println(settlementVO.toString());
        ModelAndView mav = new ModelAndView("ots/settlement-add");
        mav.addObject("settlementVO", settlementVO);
        mav.addObject("companyId",companyId);
        return mav;
    }

    /**
     * 功能描述:保存结算信息
     * @Auther: bin.wu
     * @Date  2018/7/18
     */
    @RequestMapping(value = "/settlement-save", method = RequestMethod.POST)
    @ResponseBody
    public Response saveSettlement(Settlement settlement){
        if (StringUtils.isEmpty(settlement.getId())){
            settlement.setId(UUID.randomUUID().toString().replaceAll("-",""));
            // 新增结算信息为有效 add by joyu 20181206
            settlement.setStatus(Constants.ONE);
            settlement.setCreateTime(new Timestamp(System.currentTimeMillis()));
            settlement.setCreateBy(SystemUtil.getLoginUserName());
            settlementService.addSettlement(settlement);
            return returnSuccess("新增成功");
        }else {
            settlement.setUpdateTime(new Timestamp(System.currentTimeMillis()));
            settlement.setUpdateBy(SystemUtil.getLoginUserName());
            settlementService.updateSettlement(settlement);
            return returnSuccess("修改成功");
        }

    }
}
