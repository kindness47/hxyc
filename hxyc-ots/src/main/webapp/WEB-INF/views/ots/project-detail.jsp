<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<link rel="stylesheet" type="text/css" href="${hxycStatic}/vendors/H-ui/static/h-ui.admin/css/style.css" />
<![endif]-->
<title>项目详细信息</title>
    <style type="text/css">
        .pages{
            padding: 0px 25px ;
        }
        a:link {
            color:#3C3C3C;
            text-decoration:underline;
        }
        a:hover {
            color:#FF00FF;
            text-decoration:none;
        }
        .font-strong{
            font-weight: bold;
        }
        table{table-layout: fixed;}
        td{ word-break: break-all;
            word-wrap:break-word;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
        }
        table td:hover{
            white-space:normal;
            overflow:auto;
        }
        .table th, .table td {
            padding: 6px;
            line-height: 20px;
            word-break: break-all;
        }
    </style>
</head>
<body>
<div class="pages">
    <div class="clearfix"> </div>

    <div class="mt-20">
        <table class="table table-border table-bordered table-hover table-bg" style="width: 700px;">
            <tr class="text-c" style="text-align: left">
                <td>项目专员：</td><td>${project.projectAssistant}</td>
                <td>财务专员：</td><td>${project.financeAssistant}</td>
            </tr>
            <tr class="text-c" style="text-align: left">
                <td>运营专员:</td><td>${project.operateAssistant}</td>
                <td>结算专员：</td><td>${project.settlementAssistant}</td>
            </tr>
        </table>
    </div>
    <div class="clearfix"> </div>

	<div class="cl bg-1 bk-gray mt-20" style="width: 700px;">
        <table class="table table-border table-bordered table-hover table-bg" style="width: 700px;">
            <tr class="text-c"><td>供应单位：</td><td class="font-strong">${project.supplyUnit}</td><td>合同签订时间：</td><td class="font-strong">${project.contractSignTime}</td>
            <tr class="text-c">
            <td>供货时间段：</td><td class="font-strong"><a href="javascript:void(0);">${project.supplyTime}</a></td><td>合同数量（T）：</td><td class="font-strong">${project.contractNum}</td>
            </tr>
            <tr class="text-c">
                <td>结算模式：</td><td class="font-strong"><c:if test="${1==project.settlementMode}">信用证</c:if>
                <c:if test="${2==project.settlementMode}">代购</c:if><c:if test="${3==project.settlementMode}">信用证-例外</c:if></td>
                <td>合同金额（万元）：</td><td class="font-strong">${project.contractAmount}</td></tr>
            </tr>
            <tr class="text-c">
                <td>基价浮动值(元/吨)：</td><td class="font-strong">${project.baseFloatValue}</td><td>例外垫资(万元):</td><td class="font-strong">${project.extraCapitalAmount}</td>
            </tr>
            <tr class="text-c">
                <td>垫资期限：</td><td class="font-strong">${project.capitalTimeLimit}</td><td>利息标准：</td><td class="font-strong">${project.interestRate}</td>
            </tr>
        </table>
    </div>

</div>
</body>
</html>