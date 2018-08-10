package com.hxjc.core.utils;

import org.springframework.core.convert.converter.Converter;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @Author: 于金谷
 * @Date: 2018/7/24 14:37
 * @Description: 日期转换器
 */
public class DateConvert implements Converter<String, Date> {
    private final SimpleDateFormat yyyyMMdd = new SimpleDateFormat("yyyy-MM-dd");
    private final SimpleDateFormat yyyyMMddHHmmss = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    private final int leng_yyyyMMdd = 10;
    private final int leng_yyyyMMddHHmmss = 19;

    @Override
    public Date convert(String source) {
        if(source.length() == leng_yyyyMMdd) {
            try {
                return yyyyMMdd.parse(source);
            } catch (ParseException e) {
                e.printStackTrace();

            }
        } else if(source.length() == leng_yyyyMMddHHmmss) {
            try {
                return yyyyMMddHHmmss.parse(source);
            } catch (ParseException e) {
                e.printStackTrace();
            }
        }
        return null;
    }
}
