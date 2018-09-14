package com.hxyc.ots.service;

import com.hxyc.ots.model.Credit;
import com.hxyc.ots.vo.CreditVO;

import java.util.List;

/**
 * @Author: 于金谷
 * @Date: 2018/7/16 16:10
 * @Description: 信用证业务接口
 */
public interface CreditService {
    /**
     * 功能描述:信用证列表
     * @Auther: 于金谷
     * @Date create in 2018/7/16 16:11
     */
    List<CreditVO> listCredit(CreditVO creditVO);

    /**
     * 功能描述: 新增信用证
     * @Auther: 于金谷
     * @Date create in 2018/7/17 16:58
     */
    void saveCredit(Credit credit);

    /**
     * 功能描述:根据ID获取信用证信息
     * @Auther: 于金谷
     * @Date create in 2018/7/23 17:10
     */
    CreditVO getCreditById(String id);

    /**
     * 功能描述:修改信用证
     * @Auther: 于金谷
     * @Date create in 2018/7/24 15:00
     */
    void updateCredit(Credit credit);

    /**
     * 修改信用证余额
     * @Auther: bin.wu
     * @Date create in 2018/8/21
     */
    void updateCreditBalance(Credit credit);
}
