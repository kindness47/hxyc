package com.hxyc.ots.service.impl;

import com.hxyc.ots.mapper.ReceiptMapper;
import com.hxyc.ots.model.Receipt;
import com.hxyc.ots.service.ReceiptService;
import com.hxyc.ots.vo.ReceiptVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @Author: 于金谷
 * @Date: 2018/7/16 16:23
 * @Description: 收款信息业务实现
 */
@Service
public class ReceiptServiceImpl implements ReceiptService {

    @Autowired
    private ReceiptMapper receiptMapper;


    /**
     * 功能描述: 收款信息列表
     * @param receiptVO 收款VO对象
     * @Auther: 于金谷
     * @Date create in 2018/7/16 16:22
     */
    @Override
    public List<ReceiptVO> listReceipt(ReceiptVO receiptVO) {
        List<ReceiptVO> list = receiptMapper.listReceipt(receiptVO);
        return list;
    }

    /**
     * 功能描述:
     * @param receipt 收款对象
     * @Auther: 于金谷 新增收款信息
     * @Date create in 2018/7/23 16:41
     */
    @Override
    @Transactional
    public void saveReceipt(Receipt receipt) {
        receiptMapper.insert(receipt);
    }

    /**
     * 功能描述:根据ID获取收款信息
     * @param id 收款ID
     * @Auther: 于金谷
     * @Date create in 2018/7/24 15:41
     */
    @Override
    public ReceiptVO getReceiptById(String id) {
        ReceiptVO vo = receiptMapper.getReceiptById(id);
        return vo;
    }

    /**
     * 功能描述:修改收款信息
     * @param receipt 收款信息
     * @Auther: 于金谷
     * @Date create in 2018/7/24 16:02
     */
    @Override
    @Transactional
    public void updateReceipt(Receipt receipt) {
        receiptMapper.update(receipt);
    }

    @Override
    public synchronized void updateReceiptBanlance(Receipt receipt) {
        /*if (0 > receipt.getReceiptBalance()){
            throw new RuntimeException("账户余额不能小于0");
        }*/
        receiptMapper.update(receipt);
    }
}
