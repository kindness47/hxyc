package com.hxyc.ots.controller;

import com.hxyc.ots.base.Response;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @Author: 于金谷
 * @Date: 2018/6/4 11:41
 * @Description: 基础控制返回
 */
public class BaseController {
    protected final Logger log = LoggerFactory.getLogger(getClass());


    public Response returnSuccess() {
        return returnSuccess(null);
    }

    public Response returnSuccess(String successMsg) {
        return returnSuccess(null, successMsg);
    }

    public Response returnSuccess(Object object) {
        return returnSuccess(object, null);
    }

    public Response returnSuccess(Object object, String successMsg) {
        Response response = new Response();
        response.setSuccess(true);
        response.setHasBusinessException(false);
        response.setMessage(successMsg);
        response.setResult(object);

        return response;
    }

    public Response returnValidateError(String errorMsg) {
        Response response = new Response();
        response.setSuccess(false);
        response.setHasBusinessException(true);
        response.setMessage(errorMsg);
        response.setErrorMsg(errorMsg);
        return response;
    }

}
