package com.hxjc.core.utils;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.Calendar;
import java.util.Random;

/**
 * @Author: 于金谷
 * @Date: 2018/7/18 15:55
 * @Description: 编码生成工具类
 */
public class CodeUtils {

    public static String getRuleCode(String code) {
        // IP地址
        String ipStr = "001";
        try {
            InetAddress address = InetAddress.getLocalHost();
            String hostAddress = address.getHostAddress();
            ipStr = hostAddress.substring( hostAddress.lastIndexOf(".") + 1, hostAddress.length());
            int len = ipStr.length();
            if(len == 1) {
                ipStr = "00" + ipStr;
            } else if(len == 2) {
                ipStr = "0" + ipStr;
            }

        } catch (UnknownHostException uhe) {
            String logMsg = "获取主机IP地址异常： " + uhe.getMessage();
            System.out.println(logMsg);
            uhe.printStackTrace();
        }

        // 随机数
        Random random=new Random();
        int randomNum = random.nextInt(10);

        Calendar cal = Calendar.getInstance();
        int year = cal.get(Calendar.YEAR);

        // 月份
        int month = cal.get(Calendar.MONTH);
        String monthStr= fillNum(String.valueOf(month));

        int date = cal.get(Calendar.DATE);
        String dateStr= fillNum(String.valueOf(date));

        int hour = cal.get(Calendar.HOUR_OF_DAY);
        String hourStr= fillNum(String.valueOf(hour));

        int mi = cal.get(Calendar.MINUTE);
        String miStr= fillNum(String.valueOf(mi));

        int second = cal.get(Calendar.SECOND);
        String secondStr= fillNum(String.valueOf(second));

        String creditCode = code + randomNum + ipStr + "-" + year + monthStr + dateStr + hourStr + miStr + secondStr;

        return creditCode;
    }

    /**
     * 功能描述:补位填数
     * @Auther: 于金谷
     * @Date create in 2018/7/18 17:25
     */
    private static String fillNum(String str) {
        int len = str.length();
        if(len < 2) {
            str = "0" + str;
        }

        return str;
    }
}
