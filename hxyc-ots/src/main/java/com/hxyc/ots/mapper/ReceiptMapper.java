package com.hxyc.ots.mapper;

import com.hxjc.core.utils.DataSource;
import com.hxyc.ots.model.Receipt;
import com.hxyc.ots.vo.ReceiptVO;

import java.util.List;

import java.util.List;

/**
 * 订单跟踪
 * <p>
 * 收款信息mapper接口
 *
 * @author bin.wu 2018-7-16
 */
@DataSource(value="dataSourceOts")
public interface ReceiptMapper {

    /**
     * 根据ID删除收款信息
     * @param id
     * @return
     */
    int delete(String id);

    /**
     * 新增收款信息
     * @param receipt
     * @return
     */
    int insert(Receipt receipt);

    /**
     * 根据ID查询收款信息
     * @param id
     * @return
     */
    Receipt selectById(String id);

    /**
     * 更新收款信息
     * @param receipt
     * @return
     */
    int update(Receipt receipt);

    /**
     * 获取收款信息列表
     * @param receipt
     * @return
     */
    List<Receipt> select(Receipt receipt);

    /**
     * 功能描述: 收款信息列表
     * @Auther: 于金谷
     * @Date create in 2018/7/24 15:34
     */
    List<ReceiptVO> listReceipt(ReceiptVO receiptVO);

    /**
     * 功能描述: 根据ID获取收款信息
     * @Auther: 于金谷
     * @Date create in 2018/7/24 15:43
     */
    ReceiptVO getReceiptById(String id);
}