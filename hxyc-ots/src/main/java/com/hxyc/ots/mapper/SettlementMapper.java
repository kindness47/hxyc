package com.hxyc.ots.mapper;

import com.hxjc.core.utils.DataSource;
import com.hxyc.ots.model.Settlement;
import com.hxyc.ots.vo.OrderAduitVO;
import com.hxyc.ots.vo.SettlementVO;

import java.util.List;

/**
 * 订单跟踪
 * <p>
 * 结算信息mapper接口
 *
 * @author bin.wu 2018-7-16
 */
@DataSource(value="dataSourceOts")
public interface SettlementMapper {

    /**
     * 根据结算单编号删除
     * @param settlementCode
     * @return
     */
    int deleteBySettlementCode(String settlementCode);

    /**
     * 新增结算信息
     * @param settlement
     * @return
     */
    int insert(Settlement settlement);

    /**
     * 根据结算单编号查询结算
     * @param id
     * @return
     */
    SettlementVO selectById(String id);

    /**
     * 更新结算信息
     * @param settlement
     * @return
     */
    int update(Settlement settlement);

    /**
     * 查询结算信息列表
     * @param settlement
     * @return
     */
    List<SettlementVO> select(SettlementVO settlement);

    /**
     * 查询总条数
     * @param settlementVO
     * @return
     */
    Integer selectCount(SettlementVO settlementVO);

    /**
     * 项目订单审计查询
     * @param projectId
     * @return
     */
    List<OrderAduitVO> selectAduitOrder(String projectId);
}