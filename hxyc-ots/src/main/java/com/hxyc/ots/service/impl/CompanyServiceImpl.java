package com.hxyc.ots.service.impl;

import com.hxyc.ots.mapper.CompanyMapper;
import com.hxyc.ots.model.Company;
import com.hxyc.ots.service.CompanyService;
import com.hxyc.ots.vo.CompanyVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

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
}
