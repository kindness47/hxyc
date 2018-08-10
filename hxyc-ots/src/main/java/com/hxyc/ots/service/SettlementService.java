package com.hxyc.ots.service;

import com.hxyc.ots.model.Settlement;
import com.hxyc.ots.vo.SettlementVO;

import java.util.List;

/**
 * @Author: 于金谷
 * @Date: 2018/7/16 16:38
 * @Description:结算管理业务接口
 */
public interface SettlementService {
    /**
     * 功能描述: 结算信息列表
     * @Auther: 于金谷
     * @Date create in 2018/7/16 16:39
     */
    List<SettlementVO> listSettlement(SettlementVO settlement);

    /**
     * 新增结算单
     * @param settlement
     */
    void addSettlement(Settlement settlement);

    /**
     * 修改结算单
     * @param settlement
     */
    void updateSettlement(Settlement settlement);

    /**
     * 根据结算id获取
     * @param id
     * @return
     */
    SettlementVO getSettlement(String id);

    /**
     * 获取总条数
     * @param settlementVO
     * @return
     */
    Integer getCount(SettlementVO settlementVO);
}
