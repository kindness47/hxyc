package com.hxyc.ots.mapper;

import com.hxjc.core.utils.DataSource;
import com.hxyc.ots.model.Company;
import com.hxyc.ots.vo.CompanyVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@DataSource(value="dataSourceOts")
public interface CompanyMapper {
    int deleteByPrimaryKey(String id);

    int insert(Company record);

    int insertSelective(Company record);

    Company selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(Company record);

    int updateByPrimaryKey(Company record);

    /**
     * 功能描述:获取公司信息列表
     * @Auther: 于金谷
     * @Date create in 2018/7/13 17:20
     */
    List<CompanyVO> listCompanys(CompanyVO companyVO);

    /**
     * 功能描述:获取公司名称或公司简称是否存在
     * @Auther: 于金谷
     * @Date create in 2018/7/16 15:53
     */
    int getCompanyCountByName(@Param("name") String name);
}