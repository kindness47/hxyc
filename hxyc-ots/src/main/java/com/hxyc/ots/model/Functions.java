package com.hxyc.ots.model;

import java.util.Date;

/**
 * @Description: 功能实体对象
 * @Author: 于金谷
 * @Date: 2018/7/26 9:53
 */
public class Functions extends BaseModel {

    /**功能编码*/
    private String functionCode;

    /**功能名称*/
    private String functionName;

    /**功能样式*/
    private String functionClass;

    public String getFunctionCode() {
        return functionCode;
    }

    public void setFunctionCode(String functionCode) {
        this.functionCode = functionCode == null ? null : functionCode.trim();
    }

    public String getFunctionName() {
        return functionName;
    }

    public void setFunctionName(String functionName) {
        this.functionName = functionName == null ? null : functionName.trim();
    }

    public String getFunctionClass() {
        return functionClass;
    }

    public void setFunctionClass(String functionClass) {
        this.functionClass = functionClass == null ? null : functionClass.trim();
    }
}