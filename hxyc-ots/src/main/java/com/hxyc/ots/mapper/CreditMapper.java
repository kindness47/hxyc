package com.hxyc.ots.mapper;

import com.hxjc.core.utils.DataSource;
import com.hxyc.ots.model.Credit;
import com.hxyc.ots.vo.CreditVO;

import java.util.List;

@DataSource(value="dataSourceOts")
public interface CreditMapper {
    int deleteByPrimaryKey(String id);

    int insert(Credit record);

    int insertSelective(Credit record);

    Credit selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(Credit record);

    int updateByPrimaryKey(Credit record);

    /**
     * 功能描述:根据ID获取信用证信息
     * @Auther: 于金谷
     * @Date create in 2018/7/23 17:12
     */
    CreditVO getCreditById(String id);


    /**
     * 功能描述:信用证列表
     * @Auther: 于金谷
     * @Date create in 2018/7/23 17:21
     */
    List<CreditVO> listCredit(CreditVO creditVO);
}