package com.hxyc.ots.mapper;

import com.hxjc.core.utils.DataSource;
import com.hxyc.ots.model.Company;
import com.hxyc.ots.vo.CompanyVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

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