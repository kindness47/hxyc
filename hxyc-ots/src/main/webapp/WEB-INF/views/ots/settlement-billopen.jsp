﻿﻿<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../public/head.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="stylesheet" type="text/css" href="${hxycStatic}/vendors/H-ui/static/h-ui/css/H-ui.min.css" />
    <link rel="stylesheet" type="text/css" href="${hxycStatic}/vendors/H-ui/lib/Hui-iconfont/1.0.8/iconfont.css" />
    <link rel="stylesheet" type="text/css" href="${hxycStatic}/js/ots/css/layui.css"  media="all">
    <title>发票开立详情</title>
    <style type="text/css">
        .page-container{
            padding: 20px;
        }
        .text-near-right{
            text-align: right !important;
        }
    </style>
</head>
<body>
<div class="page-container">
    <div class="row c1 f-20">
        <label class="form-label text-near-right col-xs-3">公司名称:</label>
        <label class="form-label col-xs-8">${paymentVO.companyName}</label>
    </div>
    <div class="row c1 f-20">
        <label class="form-label text-near-right col-xs-3">项目名称:</label>
        <label class="form-label col-xs-8">${paymentVO.projectName}</label>
    </div>
    <div class="clearfix"></div>
    <form action="${hxycStatic}/payment-save" method="post" class="form form-horizontal" id="payment-billopen">
        <div class="row cl">
            <label class="form-label text-near-right col-xs-3">结算单号:</label>
            <div class="formControls col-xs-8">
                <c:if test="${paymentVO.id != null}">
                    <input type="hidden" name="id" value="${paymentVO.id}">
                    <input type="hidden" name="settlementId" value="${paymentVO.settlementId}">
                    <input type="text" name="settlementCode" readonly class="input-text"  value="${paymentVO.settlementCode}">
                </c:if>
                <c:if test="${paymentVO.id == null}">
                    <input type="hidden" name="settlementId" value="${paymentVO.settlementId}">
                    <input type="text" name="settlementCode" class="input-text"  value="${paymentVO.settlementCode}">
                </c:if>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label text-near-right col-xs-3">发票开立时间:</label>
            <div class="formControls col-xs-8">
                <input type="text" onfocus="WdatePicker({ maxDate:'#F{\'%y-%M-%d\'}' })" readonly
                       value="<fmt:formatDate value="${paymentVO.billOpenTime}" pattern="yyyy-MM-dd" ></fmt:formatDate>"
                       id="billOpenTime" name="billOpenTime" class="input-text Wdate">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label text-near-right col-xs-3">发票开立状态:</label>
            <div class="formControls col-xs-8">
                    <select name="billOpenStatus" class="select">
                        <option value="1" <c:if test="${1==paymentVO.billOpenStatus}">selected</c:if>>正常</option>
                        <option value="2" <c:if test="${2==paymentVO.billOpenStatus}">selected</c:if>>异常</option>
                    </select>
                </span>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label text-near-right col-xs-3">发票开立备注:</label>
            <div class="formControls col-xs-8">
                <textarea name="billOpenRemark" cols="2" rows="" class="textarea" value="${paymentVO.billOpenRemark}"></textarea>
            </div>
        </div>
        <div class="row cl">
            <div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2">
                <button class="btn btn-primary radius" id="submitButton">
                    <i class="Hui-iconfont">&#xe632;</i> 保存
                </button>
                <button onClick="javascript:void (0);" id="cancelButton" class="btn btn-default radius" type="button">&nbsp;&nbsp;取消&nbsp;&nbsp;</button>
            </div>
        </div>
    </form>
</div>

<script type="text/javascript" src="${hxycStatic}/vendors/H-ui/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="${hxycStatic}/vendors/H-ui/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="${hxycStatic}/js/ots/layui.js" charset="utf-8"></script>
<script type="text/javascript" src="${hxycStatic}/vendors/H-ui/lib/My97DatePicker/4.8/WdatePicker.js"></script>

<script type="text/javascript">
    $(function() {

        $("#cancelButton").on('click',function(){
            var index = parent.layer.getFrameIndex(window.name);
            parent.layer.close(index);
        });
        $("#submitButton").click(function(){
            $.ajax({
                type:'post',
                url:'${hxycStatic}/payment-save',
                data:$("#payment-billopen").serializeArray(),
                dataType:'json',
                success:function (data) {
                    parent.layer.msg(data.message,{icon:1,time:500});
                    var index = parent.layer.getFrameIndex(window.name);
                    parent.location.reload();
                    parent.layer.close(index);
                },
                error:function (data) {
                    parent.layer.msg(data.message,{icon:2,time:500});
                }
            });
        });
    })
</script>
</body>
</html>