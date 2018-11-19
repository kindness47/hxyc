package com.hxyc.ots.base;

import java.util.HashMap;
import java.util.Map;

/**
 * @Author: 于金谷
 * @Date: 2018/7/26 10:57
 * @Description: 常量类
 */
public class Constants {
    public final static String INIT_PD  = "123";

    /**
     *  数字常量
     */
    public final static Integer ZERO = 0;
    public final static Integer ONE = 1;
    public final static Integer TWO = 2;
    public final static Integer THREE = 3;

    /**
     *  字符串常量
     */
    public final static String ZERO_STR = "0";
    public final static String ONE_STR = "1";
    public final static String TWO_STR = "2";
    public final static String THREE_STR = "3";

    /**角色名称*/
    public final static String SUPER_ADMIN = "超级管理员";
    public final static String ADMIN = "管理员";
    public final static String INVITING_ADMIN  = "招采人员";
    public final static String OPERATOR_ADMIN  = "运营人员";
    public final static String SETTLEMENT_ADMIN  = "结算人员";
    public final static String FINANCE_ADMIN  = "财务人员";

    /**
     *  结算模式
     */
    public final static String XINYONGZHENG = "信用证";
    public final static String DAIGOU = "代购";
    public final static String XINYONGZHENG_LIWAI = "信用证-例外";

    /**
     *  质量&服务
     */
    public final static String HAO = "好";
    public final static String CHA = "差";

    /**
     * 记录公司的项目数
     */
    public final static Map<String,Integer> noCompletionCountMap = new HashMap<>();
    public final static Map<String,Integer> completionCountMap = new HashMap<>();
    public final static Map<String,Integer> exceptionCountMap = new HashMap<>();

}
