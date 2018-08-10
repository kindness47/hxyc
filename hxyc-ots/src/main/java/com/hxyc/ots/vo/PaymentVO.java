package com.hxyc.ots.vo;

import com.hxyc.ots.model.Payment;

/**
 * @Author: 于金谷
 * @Date: 2018/7/16 16:51
 * @Description: 支付信息VO对象
 */
public class PaymentVO extends Payment {

    /**
     * 公司名称
     */
    private String companyName;

    /**
     * 项目名称
     */
    private String projectName;

    private String settlementCode;

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    public String getProjectName() {
        return projectName;
    }

    public void setProjectName(String projectName) {
        this.projectName = projectName;
    }

    public String getSettlementCode() {
        return settlementCode;
    }

    public void setSettlementCode(String settlementCode) {
        this.settlementCode = settlementCode;
    }
}
