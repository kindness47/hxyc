﻿<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../public/head.jsp"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<!--[if lt IE 9]>
<script type="text/javascript" src="${hxycStatic}/vendors/H-ui/lib/html5shiv.js"></script>
<script type="text/javascript" src="${hxycStatic}/vendors/H-ui/lib/respond.min.js"></script>
<![endif]-->
<link rel="stylesheet" type="text/css" href="${hxycStatic}/vendors/H-ui/static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="${hxycStatic}/vendors/H-ui/static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="${hxycStatic}/vendors/H-ui/lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="${hxycStatic}/vendors/H-ui/static/h-ui.admin/skin/green/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="${hxycStatic}/vendors/H-ui/static/h-ui.admin/css/style.css" />
<link rel="stylesheet" type="text/css" href="${hxycStatic}/js/ots/css/ots-table.css" />
<script type="text/javascript" src="${hxycStatic}/vendors/H-ui/lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<![endif]-->
<title>支付管理</title>
    <style>
        #paymentTable{
            width: 2185px !important;
        }
    </style>
</head>
<body>
<div><a class="btn btn-success radius r" style="line-height:0.8em;margin-top:1px;margin-right:1px;padding-left: 3px;padding-right: 3px;height: 22px;" href="javascript:location.replace(location.href);" onclick="location.replace(location.href)" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></div>
<div class="page-container">
    <form id="searchForm" name="searchForm" method="get" action="payment-list">
	<div class="text-c"> 日期范围：
		<input type="text" onfocus="WdatePicker({ maxDate:'#F{$dp.$D(\'datemax\')||\'%y-%M-%d\'}' })" id="datemin" class="input-text Wdate" style="width:120px;">
		-
		<input type="text" onfocus="WdatePicker({ minDate:'#F{$dp.$D(\'datemin\')}',maxDate:'%y-%M-%d' })" id="datemax" class="input-text Wdate" style="width:120px;">
		<input type="text" class="input-text" name="projectName" style="width:250px" placeholder="输入项目名称">
		<button type="submit" class="btn btn-success radius" id="queryBtn" name=""><i class="Hui-iconfont">&#xe665;</i> 查询</button>
	</div>
    </form>
	<div class="cl pd-5 bg-1 bk-gray mt-20">
        <%--<a href="javascript:;" onclick="deposit_sync()" class="btn btn-success radius"><i class="Hui-iconfont">&#xe640;</i> 同步数据</a>--%>
        <a href="javascript:;" onclick="payment_add('新增支付','payment-add','1000','620')" class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i> 新增支付</a>
    </div>
    <div class="clearfix"> </div>
    <div class="mt-20">
        <table id="paymentTable" class="table table-border table-bordered table-hover table-bg table-sort">
            <thead>
                <tr class="text-c">
                    <th width="100">操作</th>
                    <th width="160">公司名称</th>
                    <th width="200">项目名称</th>
                    <th width="180">结算单号</th>
                    <th width="160">需方发票开立时间</th>
                    <th width="90">异常否</th>
                    <th width="120">审批完成时间</th>
                    <th width="90">异常否</th>
                    <th width="120">付款时间</th>
                    <th width="90">异常否</th>
                    <th width="140">付款金额(万元)</th>
                    <th width="100">余额(万元)</th>
                    <th width="120">创建人</th>
                    <th width="140">创建时间</th>
                    <th width="120">其他备注</th>

                </tr>
            </thead>
            <tbody>
                <c:forEach items="${paymentList}" var="payment">
                    <tr class="text-c">
                        <td>
                            <a title="编辑" href="javascript:;" onclick="payment_edit('编辑','payment-edit?id=${payment.id}','1000','510')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6df;</i></a>
                            <a title="发票开立" href="javascript:;" onclick="bill_open('发票开立','payment-bill-open?id=${payment.id}','699','432')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6b6;</i></a>

                        </td>
                        <td><span class="long-text-hidden">${payment.companyName}</span></td>
                        <td><span class="long-text-hidden">${payment.projectName}</span></td>
                        <td><span class="long-text-hidden">${payment.settlementCode}</span></td>
                        <td><f:formatDate value="${payment.billOpenTime}" pattern="yyyy-MM-dd"/></td>
                        <td><c:if test="${1==payment.billOpenStatus}"><span style="color: green">√</span></c:if><c:if test="${2==payment.billOpenStatus}"><a href="javascript:void(0);" data-toggle="tooltip" data-placement="top" title="${payment.billOpenRemark}"><span style="color: red">×</span></a></c:if></td>
                        <td><f:formatDate value="${payment.approvalTime}" pattern="yyyy-MM-dd"/></td>
                        <td><c:if test="${1==payment.approvalStatus}"><span style="color: green">√</span></c:if><c:if test="${2==payment.approvalStatus}"><a href="javascript:void(0);" data-toggle="tooltip" data-placement="top" title="${payment.approvalRemark}"><span style="color: red">×</span></a></c:if></td>
                        <td><f:formatDate value="${payment.paymentTime}" pattern="yyyy-MM-dd"/></td>
                        <td><c:if test="${1==payment.paymentStatus}"><span style="color: green">√</span></c:if><c:if test="${2==payment.paymentStatus}"><a href="javascript:void(0);" data-toggle="tooltip" data-placement="top" title="${payment.paymentRemark}"><span style="color: red">×</span></a></c:if></td>
                        <td>${payment.paymentAmount}</td>
                        <td>${payment.creditSurplusAmount}</td>
                        <td>${payment.createBy}</td>
                        <td><f:formatDate value="${payment.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                        <td><span class="long-text-hidden">${payment.remarks}</span></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
	</div>
</div>
<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="${hxycStatic}/vendors/H-ui/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="${hxycStatic}/vendors/H-ui/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="${hxycStatic}/vendors/H-ui/static/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript" src="${hxycStatic}/vendors/H-ui/static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="${hxycStatic}/vendors/H-ui/lib/My97DatePicker/4.8/WdatePicker.js"></script>
<script type="text/javascript" src="${hxycStatic}/vendors/H-ui/lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="${hxycStatic}/vendors/H-ui/lib/laypage/1.2/laypage.js"></script>

<!-- BEGIN PAGE LEVEL SCRIPTS -->
<script src="${hxycStatic}/js/ots/payment-table.js" type="text/javascript"></script>
<!-- END PAGE LEVEL SCRIPTS -->
<script type="text/javascript">
    $(function(){
        TableDatatablesScroller.init();
        $("[data-toggle='tooltip']").tooltip();
    });

    /*新增*/
    function payment_add(title,url,w,h){
        layer_show(title,url,w,h);
    }

    /*修改*/
    function payment_edit(title,url,w,h){
        layer_show(title,url,w,h);
    }

    /* 发票开立 */
    function bill_open(title,url,w,h){
        layer.open({
            type: 2,
            area: [w+'px', h +'px'],
            fix: false, //不固定
            maxmin: true,
            shade: 0.4,
            title: "<h4>"+title+"</h4>",
            content: url
        });
    }
</script>
</body>
</html>