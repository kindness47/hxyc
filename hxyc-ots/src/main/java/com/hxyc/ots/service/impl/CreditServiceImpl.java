package com.hxyc.ots.service.impl;

import com.hxyc.ots.mapper.CreditMapper;
import com.hxyc.ots.model.Company;
import com.hxyc.ots.model.Credit;
import com.hxyc.ots.service.CreditService;
import com.hxyc.ots.vo.CreditVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @Author: 于金谷
 * @Date: 2018/7/16 16:12
 * @Description: 信用证业务实现
 */
@Service
public class CreditServiceImpl implements CreditService {

    @Autowired
    private CreditMapper creditMapper;

    /**
     * 功能描述:信用证列表
     * @param creditVO 信用证VO对象
     * @Auther: 于金谷
     * @Date create in 2018/7/16 16:11
     */
    @Override
    public List<CreditVO> listCredit(CreditVO creditVO) {
        List<CreditVO> creditList = creditMapper.listCredit(creditVO);
        return creditList;
    }

    /**
     * 功能描述: 新增信用证
     * @param credit
     * @Auther: 于金谷
     * @Date create in 2018/7/17 16:58
     */
    @Override
    @Transactional
    public void saveCredit(Credit credit) {
        creditMapper.insertSelective(credit);
    }

    /**
     * 功能描述:根据ID获取信用证信息
     * @param id 信用证ID
     * @Auther: 于金谷
     * @Date create in 2018/7/23 17:10
     */
    @Override
    public CreditVO getCreditById(String id) {
        CreditVO vo = creditMapper.getCreditById(id);
        return vo;
    }

    /**
     * 功能描述:修改信用证
     * @param credit
     * @Auther: 于金谷
     * @Date create in 2018/7/24 15:00
     */
    @Override
    @Transactional
    public void updateCredit(Credit credit) {
        creditMapper.updateByPrimaryKeySelective(credit);
    }
}
