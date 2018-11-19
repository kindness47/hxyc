package com.hxyc.ots.service.impl;

import com.hxyc.ots.base.Constants;
import com.hxyc.ots.mapper.CompanyMapper;
import com.hxyc.ots.model.Company;
import com.hxyc.ots.service.CompanyService;
import com.hxyc.ots.vo.CompanyVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * @Author: 于金谷
 * @Date: 2018/7/13 17:18
 * @Description:公司管理业务实现
 */
@Service
public class CompanyServiceImpl implements CompanyService {

    @Autowired
    private CompanyMapper companyMapper;

    /**
     * 功能描述:获取公司信息列表
     * @param companyVO
     * @Auther: 于金谷
     * @Date create in 2018/7/13 17:18
     */
    @Override
    public List<CompanyVO> listCompany(CompanyVO companyVO) {
        List<CompanyVO> companyList = companyMapper.listCompanys(companyVO);
        return companyList;
    }

    /**
     * 功能描述:根据ID获取公司信息
     * @param id
     * @Auther: 于金谷
     * @Date create in 2018/7/16 15:46
     */
    @Override
    public Company getCompanyById(String id) {
        Company company = companyMapper.selectByPrimaryKey(id);
        return company;
    }

    /**
     * 功能描述:修改公司信息
     * @param oldCompany
     * @Auther: 于金谷
     * @Date create in 2018/7/16 15:46
     */
    @Override
    @Transactional
    public void updateCompany(Company oldCompany) {
        companyMapper.updateByPrimaryKeySelective(oldCompany);
    }

    /**
     * 功能描述:获取公司名称或公司简称是否存在
     * @param name 公司名称或者公司简称
     * @Auther: 于金谷
     * @Date create in 2018/7/16 15:47
     */
    @Override
    public int getCompanyCountByName(String name) {
        int count = companyMapper.getCompanyCountByName(name);
        return count;
    }

    /**
     * 功能描述: 保持公司信息
     * @param company 公司对象信息
     * @Auther: 于金谷
     * @Date create in 2018/7/16 15:48
     */
    @Override
    public void saveCompany(Company company) {
        companyMapper.insertSelective(company);
    }

    @Override
    public List<CompanyVO> listExceptionCompanys(CompanyVO company) {
        List<CompanyVO> companyList = companyMapper.listExceptionCompanys(company);
        //如果无项目返回顶级父目录
        if(companyList.size() == 0) {
            CompanyVO c = new CompanyVO();
            c.setLevel(1);
            return companyMapper.listCompanys(c);
        }
        if(companyList.size() == 0) {
            CompanyVO c = new CompanyVO();
            c.setLevel(1);
            return companyMapper.listCompanys(c);
        }
        List<String> idList = new ArrayList<>();
        boolean isFa ;
        List<CompanyVO> hasFaCompanyVOList = new ArrayList<>();
        CompanyVO c = new CompanyVO();
        for(CompanyVO companyVO : companyList) {
            idList.add(companyVO.getId());
            hasFaCompanyVOList.add(companyVO);
        }
        for(CompanyVO companyVO : companyList){
            //判断是否为根节点
            isFa = companyVO.getLevel() == (Integer)1;
            while(!isFa && idList.indexOf(companyVO.getParentId()) == -1) {
                //查出父对象
                c.setId(companyVO.getParentId());
                List<CompanyVO> list = companyMapper.listCompanys(c);
                if(list.size() == 0)
                    break;
                companyVO = list.get(0);
                idList.add(companyVO.getId());
                hasFaCompanyVOList.add(companyVO);
                isFa = companyVO.getLevel() == (Integer)1;
            }
        }
        return hasFaCompanyVOList;
    }

    @Override
    public List<CompanyVO> listCompanyByStatus(Map map) {
        List<CompanyVO> companyList = companyMapper.listCompanyByStatus(map);
        //如果无项目返回顶级父目录
        if(companyList.size() == 0) {
            CompanyVO c = new CompanyVO();
            c.setLevel(1);
            return companyMapper.listCompanys(c);
        }
        List<String> idList = new ArrayList<>();
        boolean isFa ;
        List<CompanyVO> hasFaCompanyVOList = new ArrayList<>();
        CompanyVO c = new CompanyVO();
        for(CompanyVO companyVO : companyList) {
            idList.add(companyVO.getId());
            hasFaCompanyVOList.add(companyVO);
        }
        for(CompanyVO companyVO : companyList){
            //判断是否为根节点
            isFa = companyVO.getLevel() == (Integer)1;
            while(!isFa && idList.indexOf(companyVO.getParentId()) == -1) {
                //查出父对象
                c.setId(companyVO.getParentId());
                List<CompanyVO> list = companyMapper.listCompanys(c);
                if(list.size() == 0)
                    break;
                companyVO = list.get(0);
                idList.add(companyVO.getId());
                hasFaCompanyVOList.add(companyVO);
                isFa = companyVO.getLevel() == (Integer)1;
            }
        }
        return hasFaCompanyVOList;
    }
}
