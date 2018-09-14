package com.hxyc.ots.service;

import com.hxyc.ots.model.Receipt;
import com.hxyc.ots.vo.ReceiptVO;

import java.util.List;

/**
 * @Author: 于金谷
 * @Date: 2018/7/16 16:21
 * @Description: 收款管理业务接口
 */
public interface ReceiptService {

    /**
     * 功能描述: 收款信息列表
     * @Auther: 于金谷
     * @Date create in 2018/7/16 16:22
     */
    List<ReceiptVO> listReceipt(ReceiptVO receiptVO);

    /**
     * 功能描述:
     * @Auther: 于金谷 新增收款信息
     * @Date create in 2018/7/23 16:41
     */
    void saveReceipt(Receipt receipt);

    /**
     * 功能描述:根据ID获取收款信息
     * @Auther: 于金谷
     * @Date create in 2018/7/24 15:41
     */
    ReceiptVO getReceiptById(String id);

    /**
     * 功能描述:修改收款信息
     * @Auther: 于金谷
     * @Date create in 2018/7/24 16:02
     */
    void updateReceipt(Receipt receipt);

    /**
     * 修改收款余额
     * @Auther: bin.wu
     * @Date create in 2018/8/21
     */
    void updateReceiptBanlance(Receipt receipt);
}
