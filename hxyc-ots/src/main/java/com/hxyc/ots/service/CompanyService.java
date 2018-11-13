package com.hxyc.ots.service;

import com.hxyc.ots.model.Company;
import com.hxyc.ots.vo.CompanyVO;

import java.util.List;
import java.util.Map;

/**
 * @Author: 于金谷
 * @Date: 2018/7/13 17:17
 * @Description: g公司业务实现接口
 */
public interface CompanyService {
    /**
     * 功能描述:获取公司信息列表
     * @Auther: 于金谷
     * @Date create in 2018/7/13 17:18
     */
    List<CompanyVO> listCompany(CompanyVO companyVO);

    /**
     * 功能描述:根据ID获取公司信息
     * @Auther: 于金谷
     * @Date create in 2018/7/16 15:46
     */
    Company getCompanyById(String id);

    /**
     * 功能描述:修改公司信息
     * @Auther: 于金谷
     * @Date create in 2018/7/16 15:46
     */
    void updateCompany(Company oldCompany);

    /**
     * 功能描述:获取公司名称或公司简称是否存在
     * @Auther: 于金谷
     * @Date create in 2018/7/16 15:47
     */
    int getCompanyCountByName(String companyName);

    /**
     * 功能描述: 保持公司信息
     * @Auther: 于金谷
     * @Date create in 2018/7/16 15:48
     */
    void saveCompany(Company company);
    /**
     * Description： 查询有异常的公司列表
     * Author: 刘永红
     * Date: Created in 2018/11/13 9:08
     */
    List<CompanyVO> listExceptionCompanys(CompanyVO companyVO);

    /**
     * Description： 根据Project状态(completion=true|fasle)查询CompanyVO对象
     * Author: 刘永红
     * Date: Created in 2018/11/13 10:59
     */
    List<CompanyVO> listCompanyByStatus(Map map);
}
