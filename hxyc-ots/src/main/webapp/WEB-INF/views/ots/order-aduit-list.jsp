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
<link rel="stylesheet" type="text/css" href="${hxycStatic}/vendors/H-ui/static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="${hxycStatic}/vendors/H-ui/lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="${hxycStatic}/vendors/H-ui/static/h-ui.admin/skin/green/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="${hxycStatic}/vendors/H-ui/static/h-ui.admin/css/style.css" />
<link rel="stylesheet" href="${hxycStatic}/vendors/H-ui/lib/zTree/v3/css/zTreeStyle/zTreeStyle.css" type="text/css">
<script type="text/javascript" src="${hxycStatic}/vendors/H-ui/lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<![endif]-->
<title>审查订单列表</title>
    <style type="text/css">
        .myspan {
            font-weight: bold;
            margin-left: 10px;
            color: #01a0e4;

        }
        .bgcolor {
            color:#FF00FF;
            text-decoration:none;
        }
        a:link {
            color:#3C3C3C;
            text-decoration:underline;
        }
        a:hover {
            color:#FF00FF;
            text-decoration:none;
        }
        .remark {
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
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
        .scroll-table-head{
            width: 1700px;
            padding-right: 17px
        }
        .scroll-table-body{
            width: 1700px;
            height: 315px;
            margin-top: -2px;
        }
    </style>
</head>
<body>
<div class="page-container">
    <div class="clearfix"> </div>

    <div class="">
        <table class="table table-border table-bordered table-hover table-bg" style="width: 1700px;">
            <tr class="text-c" style="text-align: left">
                <td>项目专员：</td><td>${projectCreator}</td>
                <td>财务专员：</td><td>${financialCerator}</td>
                <td>运营专员:</td><td>${orderCreator}</td>
                <td>结算专员：</td><td>${settlementCreator}</td>
            </tr>
        </table>
    </div>
    <div class="clearfix"> </div>

	<div class="cl pd-5 bg-1 bk-gray mt-20">
        <div class="row cl">
            <table class="table table-border table-bordered table-hover table-bg" style="width: 1700px;">
                <tr class="text-c"><td>供应单位：</td><td>${project.supplyUnit}</td><td>合同签订时间：</td><td>${project.contractSignTime}</td><td>供货时间段：</td><td>${project.supplyTime}</td>
                    <td>合同数量（T）：</td><td>${project.contractNum}</td><td>合同金额（万元）：</td><td>${project.contractAmount}</td></tr>

                <tr class="text-c"><td>结算模式：</td><td><c:if test="${1==project.settlementMode}">信用证</c:if><c:if test="${2==project.settlementMode}">代购</c:if><c:if test="${3==project.settlementMode}">信用证-例外</c:if></td>
                    <td>基价浮动值(元/吨)：</td><td>${project.baseFloatValue}</td><td>例外垫资(万元):</td><td>${project.extraCapitalAmount}</td>
                    <td>垫资期限：</td><td>${project.capitalTimeLimit}</td><td>利息标准：</td><td>${project.interestRate}</td>
                </tr>
            </table>
        </div>
    </div>

    <div style="font-weight: bold;font-size: 18px;text-align: center">
        <span><a class="myspan" onclick="fullScreen();" style="font-size: 10px;">新窗口打开</a></span>【${project.projectName}】订单跟踪表 - <span id="viewSettlementType"></span>
    </div>
    <div class="clearfix"> </div>
    <!-- 订单及结算信息部分-->
    <div style="margin: 5 5;" id="mynav">
        <%--<span><a class="myspan bgcolor" onclick="init();">全部</a></span>--%>
        <span><a class="myspan" onclick="xyz();">信用证</a></span>
        <span><a class="myspan" onclick="daigou();">代购</a></span><span><a class="myspan" onclick="liwai();">例外</a></span>
    </div>
    <!-- 收款信息部分-->
    <div class="clearfix"> </div>
    <div class="mt-20" id="fukuaninfo" style="height:315px;">
        <div>
        <span style="font-weight: bold">付款信息：</span>
        <table id="" class="table table-border table-bordered table-hover table-bg scroll-table-head">
            <thead>
            <tr class="text-c">
                <th width="50">序号</th>
                <th width="100">收款金额(万元)</th>
                <th width="100">收款时间</th>
                <th width="100">发票开立</th>
                <th width="30">√×</th>
                <th width="100">审批完成</th>
                <th width="30">√×</th>
                <th width="100">付款时间</th>
                <th width="30">√×</th>
                <th width="80">付款金额</th>
                <th width="80">余额</th>
                <th width="120">其他备注</th>
            </tr>
            </thead>
        </table>
        </div>
        <div class="pre-scrollable scroll-table-body">
        <table class="table table-border table-bordered table-hover table-bg table-sort">
            <tbody id="daigoufukuan">
            <c:forEach items="${daigouFukuanVOList}" var="receipt"  varStatus="rstatus">
                <tr class="text-c">
                    <td width="50">
                            ${rstatus.index+1}
                    </td>
                    <td width="100">${receipt.receiptAmount}</td>
                    <td width="100"><f:formatDate value="${receipt.receiptTime}" pattern="MM-dd"/></td>
                    <td width="100"><f:formatDate value="${receipt.billOpenTime}" pattern="MM-dd"/></td>
                    <td width="30"><c:if test="${1==receipt.billOpenStatus}"><span style="color: green">√</span></c:if><c:if test="${2==receipt.billOpenStatus}"><a href="javascript:void(0);" data-toggle="tooltip" data-placement="top" title="${receipt.billOpenRemark}"><span style="color: red">×</span></a></c:if></td>
                    <td width="100"><f:formatDate value="${receipt.approvalTime}" pattern="MM-dd"/></td>
                    <td width="30">
                        <c:if test="${1==receipt.approvalStatus}"><span style="color: green">√</span></c:if><c:if test="${2==receipt.approvalStatus}"><a href="javascript:void(0);" data-toggle="tooltip" data-placement="top" title="${receipt.approvalRemark}"><span style="color: red">×</span></a></c:if>
                    </td>
                    <td width="100"><f:formatDate value="${receipt.paymentTime}" pattern="MM-dd"/></td>
                    <td width="30">
                        <c:if test="${1==receipt.paymentStatus}"><span style="color: green">√</span></c:if><c:if test="${2==receipt.paymentStatus}"><a href="javascript:void(0);" data-toggle="tooltip" data-placement="top" title="${receipt.paymentRemark}"><span style="color: red">×</span></a></c:if>
                    </td>
                    <td width="80">${receipt.paymentAmount}</td>
                    <td width="80">${receipt.creditSurplusAmount}</td>
                    <td width="120"><a href="javascript:void(0);" class="remark" data-toggle="tooltip" data-placement="top" title="${receipt.remarks}">${receipt.remarks}</a></td>
                </tr>
            </c:forEach>
            <tr class="text-c" style="background-color: #c0edf1"  id="daigoufukuanTotalRow"></tr>
            </tbody>
            <tbody id="liwaifukuan">
            <c:forEach items="${liwaiFukuanVOList}" var="receipt"  varStatus="rstatus">
                <tr class="text-c">
                    <td width="50">
                            ${rstatus.index+1}
                    </td>
                    <td width="100">${receipt.receiptAmount}</td>
                    <td width="100"><f:formatDate value="${receipt.receiptTime}" pattern="MM-dd"/></td>
                    <td width="100"><f:formatDate value="${receipt.billOpenTime}" pattern="MM-dd"/></td>
                    <td width="30"><c:if test="${1==receipt.billOpenStatus}"><span style="color: green">√</span></c:if><c:if test="${2==receipt.billOpenStatus}"><a href="javascript:void(0);" data-toggle="tooltip" data-placement="top" title="${receipt.billOpenRemark}"><span style="color: red">×</span></a></c:if></td>
                    <td width="100"><f:formatDate value="${receipt.approvalTime}" pattern="MM-dd"/></td>
                    <td width="30">
                        <c:if test="${1==receipt.approvalStatus}"><span style="color: green">√</span></c:if><c:if test="${2==receipt.approvalStatus}"><a href="javascript:void(0);" data-toggle="tooltip" data-placement="top" title="${receipt.approvalRemark}"><span style="color: red">×</span></a></c:if>
                    </td>
                    <td width="100"><f:formatDate value="${receipt.paymentTime}" pattern="MM-dd"/></td>
                    <td width="30">
                        <c:if test="${1==receipt.paymentStatus}"><span style="color: green">√</span></c:if><c:if test="${2==receipt.paymentStatus}"><a href="javascript:void(0);" data-toggle="tooltip" data-placement="top" title="${receipt.paymentRemark}"><span style="color: red">×</span></a></c:if>
                    </td>
                    <td width="80">${receipt.paymentAmount}</td>
                    <td width="80">${receipt.creditSurplusAmount}</td>
                    <td width="120"><a href="javascript:void(0);" class="remark" data-toggle="tooltip" data-placement="top" title="${receipt.remarks}">${receipt.remarks}</a></td>
                </tr>
            </c:forEach>
            <tr class="text-c" style="background-color: #c0edf1"  id="liwaifukuanTotalRow"></tr>
            </tbody>
        </table>
    </div>
    </div>

    <div class="clearfix"> </div>
        <div class="mt-20" style="height:315px;">
            <div>
            <table id="orderAduitTable" class="table table-border table-bordered table-hover table-bg table-sort scroll-table-head">
                <thead>
                <tr class="text-c">
                    <th colspan="3">跟踪节点</th>
                    <%--<th colspan="2">--%>
                        <%--<span><a class="myspan" onclick="init();">全部</a></span><span><a class="myspan" onclick="xyz();">信用证</a></span>--%>
                        <%--<span><a class="myspan" onclick="daigou();">代购</a></span><span><a class="myspan" onclick="liwai();">例外</a></span>--%>
                    <%--</th>--%>
                    <th colspan="6">订单信息</th>
                    <th colspan="6">供方结算</th>
                    <th colspan="4">需方结算</th>
                    <th colspan="7">支付流程</th>
                </tr>
                <tr class="text-c">
                    <th width="20">序号</th>
                    <th width="120">开证金额</th>
                    <th width="120">开证日期</th>
                    <th width="50" class="hidden">结算模式</th>
                    <th width="100" class="hidden">订单号</th>
                    <th width="120">订单时间</th>
                    <th width="120">交验时间</th>
                    <th width="20">√×</th>
                    <th width="120">验收数量</th>
                    <th width="30">质量</th>
                    <th width="30">服务</th>
                    <th width="100" class="hidden">结算单号</th>
                    <th width="120">结算时间</th>
                    <th width="20">√×</th>
                    <th width="120">单据送达</th>
                    <th width="20">√×</th>
                    <th width="120">发票送达</th>
                    <th width="20">√×</th>
                    <th width="120">结算时间</th>
                    <th width="20">√×</th>
                    <th width="120">发票开立</th>
                    <th width="20">√×</th>
                    <th width="120">审批完成</th>
                    <th width="20">√×</th>
                    <th width="120">付款时间</th>
                    <th width="20">√×</th>
                    <th width="80">付款金额</th>
                    <th width="80">余额</th>
                    <th width="140">其他备注</th>

                </tr>
                </thead>
            </table>
            </div>
            <div class="pre-scrollable scroll-table-body">
                <table class="table table-border table-bordered table-hover table-bg table-sort">
                <tbody id="init">
                <c:forEach items="${orderAduitVOList}" var="orderAduitVO" varStatus="status">
                    <tr class="text-c">
                        <td>
                           ${status.index+1}
                        </td>
                        <td></td>
                        <td></td>
                        <%--<td>${orderAduitVO.openAmount}</td>--%>
                        <%--<td><f:formatDate value="${orderAduitVO.openTime}" pattern="MM-dd"/></td>--%>
                        <td class="hidden">
                            <c:if test="${1==orderAduitVO.settlementMode}">信用证</c:if><c:if test="${2==orderAduitVO.settlementMode}">代购</c:if><c:if test="${3==orderAduitVO.settlementMode}">信用证-例外</c:if>
                        </td>
                        <td class="hidden">${orderAduitVO.orderCode}</td>
                        <td><f:formatDate value="${orderAduitVO.orderTime}" pattern="MM-dd"/></td>
                        <td><f:formatDate value="${orderAduitVO.deliveryTime}" pattern="MM-dd"/></td>
                        <td>
                            <c:if test="${1==orderAduitVO.deliveryStatus}"><span style="color: green">√</span></c:if><c:if test="${0==orderAduitVO.deliveryStatus}"><a href="javascript:void(0);" data-toggle="tooltip" data-placement="top" title="${orderAduitVO.deliveryExceptionDesc}"><span style="color: red">×</span></a></c:if>
                        </td>
                        <td>${orderAduitVO.receiveNum}</td>
                        <td>
                            <c:if test="${1==orderAduitVO.quality}"><span style="color: green">好</span></c:if><c:if test="${0==orderAduitVO.quality}"><a href="javascript:void(0);" data-toggle="tooltip" data-placement="top" title="${orderAduitVO.qualityRemark}"><span style="color: red">差</span></a></c:if>
                        </td>
                        <td>
                            <c:if test="${1==orderAduitVO.service}"><span style="color: green">好</span></c:if><c:if test="${0==orderAduitVO.service}"><a href="javascript:void(0);" data-toggle="tooltip" data-placement="top" title="${orderAduitVO.serviceRemark}"><span style="color: red">差</span></a></c:if>
                        </td>
                        <td class="hidden">${orderAduitVO.settlementCode}</td>
                        <td><f:formatDate value="${orderAduitVO.supplierSettlementTime}" pattern="MM-dd"/></td>
                        <td><c:if test="${1==orderAduitVO.supplierSettlementStatus}"><span style="color: green">√</span></c:if><c:if test="${2==orderAduitVO.supplierSettlementStatus}"><a href="javascript:void(0);" data-toggle="tooltip" data-placement="top" title="${orderAduitVO.supplierSettlementRemark}"><span style="color: red">×</span></a></c:if></td>
                        <td><f:formatDate value="${orderAduitVO.settlementDeliveryTime}" pattern="MM-dd"/></td>
                        <td><c:if test="${1==orderAduitVO.settlementDeliveryStatus}"><span style="color: green">√</span></c:if><c:if test="${2==orderAduitVO.settlementDeliveryStatus}"><a href="javascript:void(0);" data-toggle="tooltip" data-placement="top" title="${orderAduitVO.settlementDeliveryRemark}"><span style="color: red">×</span></a></c:if></td>
                        <td><f:formatDate value="${orderAduitVO.billDeliveryTime}" pattern="MM-dd"/></td>
                        <td><c:if test="${1==orderAduitVO.billDeliveryStatus}"><span style="color: green">√</span></c:if><c:if test="${2==orderAduitVO.billDeliveryStatus}"><a href="javascript:void(0);" data-toggle="tooltip" data-placement="top" title="${orderAduitVO.billDeliveryRemark}"><span style="color: red">×</span></a></c:if></td>
                        <td><f:formatDate value="${orderAduitVO.buyerSettlementTime}" pattern="MM-dd"/></td>
                        <td><c:if test="${1==orderAduitVO.buyerSettlementStatus}"><span style="color: green">√</span></c:if><c:if test="${2==orderAduitVO.buyerSettlementStatus}"><a href="javascript:void(0);" data-toggle="tooltip" data-placement="top" title="${orderAduitVO.buyerSettlementRemark}"><span style="color: red">×</span></a></c:if></td>
                        <td><f:formatDate value="${orderAduitVO.billOpenTime}" pattern="MM-dd"/></td>
                        <td><c:if test="${1==orderAduitVO.billOpenStatus}"><span style="color: green">√</span></c:if><c:if test="${2==orderAduitVO.billOpenStatus}"><a href="javascript:void(0);" data-toggle="tooltip" data-placement="top" title="${orderAduitVO.billOpenRemark}"><span style="color: red">×</span></a></c:if></td>
                        <td><f:formatDate value="${orderAduitVO.approvalTime}" pattern="MM-dd"/></td>
                        <td>
                            <c:if test="${1==orderAduitVO.approvalStatus}"><span style="color: green">√</span></c:if><c:if test="${2==orderAduitVO.approvalStatus}"><a href="javascript:void(0);" data-toggle="tooltip" data-placement="top" title="${orderAduitVO.approvalRemark}"><span style="color: red">×</span></a></c:if>
                        </td>
                        <td><f:formatDate value="${orderAduitVO.paymentTime}" pattern="MM-dd"/></td>
                        <td>
                            <c:if test="${1==orderAduitVO.paymentStatus}"><span style="color: green">√</span></c:if><c:if test="${2==orderAduitVO.paymentStatus}"><a href="javascript:void(0);" data-toggle="tooltip" data-placement="top" title="${orderAduitVO.paymentRemark}"><span style="color: red">×</span></a></c:if>
                        </td>
                        <td>${orderAduitVO.paymentAmount}</td>
                        <td>${orderAduitVO.creditSurplusAmount}</td>
                        <td><a href="javascript:void(0);" class="remark" data-toggle="tooltip" data-placement="top" title="${orderAduitVO.remarks}">${orderAduitVO.remarks}</a></td>
                    </tr>
                </c:forEach>
                </tbody>
                <tbody id="xyz">
                <c:set value="0" var="xyzindex"></c:set>
                <c:forEach items="${xyzOrderAduitVOList}" var="orderAduitVO" varStatus="status">
                    <tr class="text-c">
                        <td>
                            <c:set value="${xyzindex+1}" var="xyzindex"></c:set> ${xyzindex}
                        </td>
                        <td>${orderAduitVO.openAmount}</td>
                        <td><f:formatDate value="${orderAduitVO.openTime}" pattern="MM-dd"/></td>
                        <td class="hidden">
                            <c:if test="${1==orderAduitVO.settlementMode}">信用证</c:if><c:if test="${2==orderAduitVO.settlementMode}">代购</c:if><c:if test="${3==orderAduitVO.settlementMode}">信用证-例外</c:if>
                        </td>
                        <td class="hidden">${orderAduitVO.orderCode}</td>
                        <td><f:formatDate value="${orderAduitVO.orderTime}" pattern="MM-dd"/></td>
                        <td><f:formatDate value="${orderAduitVO.deliveryTime}" pattern="MM-dd"/></td>
                        <td>
                            <c:if test="${1==orderAduitVO.deliveryStatus}"><span style="color: green">√</span></c:if><c:if test="${0==orderAduitVO.deliveryStatus}"><a href="javascript:void(0);" data-toggle="tooltip" data-placement="top" title="${orderAduitVO.deliveryExceptionDesc}"><span style="color: red">×</span></a></c:if>
                        </td>
                        <td>${orderAduitVO.receiveNum}</td>
                        <td>
                            <c:if test="${1==orderAduitVO.quality}"><span style="color: green">好</span></c:if><c:if test="${0==orderAduitVO.quality}"><a href="javascript:void(0);" data-toggle="tooltip" data-placement="top" title="${orderAduitVO.qualityRemark}"><span style="color: red">差</span></a></c:if>
                        </td>
                        <td>
                            <c:if test="${1==orderAduitVO.service}"><span style="color: green">好</span></c:if><c:if test="${0==orderAduitVO.service}"><a href="javascript:void(0);" data-toggle="tooltip" data-placement="top" title="${orderAduitVO.serviceRemark}"><span style="color: red">差</span></a></c:if>
                        </td>
                        <td class="hidden">${orderAduitVO.settlementCode}</td>
                        <td><f:formatDate value="${orderAduitVO.supplierSettlementTime}" pattern="MM-dd"/></td>
                        <td><c:if test="${1==orderAduitVO.supplierSettlementStatus}"><span style="color: green">√</span></c:if><c:if test="${2==orderAduitVO.supplierSettlementStatus}"><a href="javascript:void(0);" data-toggle="tooltip" data-placement="top" title="${orderAduitVO.supplierSettlementRemark}"><span style="color: red">×</span></a></c:if></td>
                        <td><f:formatDate value="${orderAduitVO.settlementDeliveryTime}" pattern="MM-dd"/></td>
                        <td><c:if test="${1==orderAduitVO.settlementDeliveryStatus}"><span style="color: green">√</span></c:if><c:if test="${2==orderAduitVO.settlementDeliveryStatus}"><a href="javascript:void(0);" data-toggle="tooltip" data-placement="top" title="${orderAduitVO.settlementDeliveryRemark}"><span style="color: red">×</span></a></c:if></td>
                        <td><f:formatDate value="${orderAduitVO.billDeliveryTime}" pattern="MM-dd"/></td>
                        <td><c:if test="${1==orderAduitVO.billDeliveryStatus}"><span style="color: green">√</span></c:if><c:if test="${2==orderAduitVO.billDeliveryStatus}"><a href="javascript:void(0);" data-toggle="tooltip" data-placement="top" title="${orderAduitVO.billDeliveryRemark}"><span style="color: red">×</span></a></c:if></td>
                        <td><f:formatDate value="${orderAduitVO.buyerSettlementTime}" pattern="MM-dd"/></td>
                        <td><c:if test="${1==orderAduitVO.buyerSettlementStatus}"><span style="color: green">√</span></c:if><c:if test="${2==orderAduitVO.buyerSettlementStatus}"><a href="javascript:void(0);" data-toggle="tooltip" data-placement="top" title="${orderAduitVO.buyerSettlementRemark}"><span style="color: red">×</span></a></c:if></td>
                        <td><f:formatDate value="${orderAduitVO.billOpenTime}" pattern="MM-dd"/></td>
                        <td><c:if test="${1==orderAduitVO.billOpenStatus}"><span style="color: green">√</span></c:if><c:if test="${2==orderAduitVO.billOpenStatus}"><a href="javascript:void(0);" data-toggle="tooltip" data-placement="top" title="${orderAduitVO.billOpenRemark}"><span style="color: red">×</span></a></c:if></td>
                        <td><f:formatDate value="${orderAduitVO.approvalTime}" pattern="MM-dd"/></td>
                        <td>
                            <c:if test="${1==orderAduitVO.approvalStatus}"><span style="color: green">√</span></c:if><c:if test="${2==orderAduitVO.approvalStatus}"><a href="javascript:void(0);" data-toggle="tooltip" data-placement="top" title="${orderAduitVO.approvalRemark}"><span style="color: red">×</span></a></c:if>
                        </td>
                        <td><f:formatDate value="${orderAduitVO.paymentTime}" pattern="MM-dd"/></td>
                        <td>
                            <c:if test="${1==orderAduitVO.paymentStatus}"><span style="color: green">√</span></c:if><c:if test="${2==orderAduitVO.paymentStatus}"><a href="javascript:void(0);" data-toggle="tooltip" data-placement="top" title="${orderAduitVO.paymentRemark}"><span style="color: red">×</span></a></c:if>
                        </td>
                        <td>${orderAduitVO.paymentAmount}</td>
                        <td>${orderAduitVO.creditSurplusAmount}</td>
                        <td><a href="javascript:void(0);" class="remark" data-toggle="tooltip" data-placement="top" title="${orderAduitVO.remarks}">${orderAduitVO.remarks}</a></td>
                    </tr>
                </c:forEach>
                <tr class="text-c" style="background-color: #c0edf1"  id="xyzTotalRow"></tr>
                </tbody>
                <tbody id="daigou">
                <c:set value="0" var="dgindex"></c:set>
                <c:forEach items="${daigouOrderAduitVOList}" var="orderAduitVO" varStatus="status">
                    <tr class="text-c">
                        <td>
                            <c:set value="${dgindex+1}" var="dgindex"></c:set> ${dgindex}
                        </td>
                        <td colspan="2">
                            <c:if test="${1==orderAduitVO.settlementMode}">信用证</c:if><c:if test="${2==orderAduitVO.settlementMode}">代购</c:if><c:if test="${3==orderAduitVO.settlementMode}">信用证-例外</c:if>
                        </td>
                        <td class="hidden">${orderAduitVO.orderCode}</td>
                        <td><f:formatDate value="${orderAduitVO.orderTime}" pattern="MM-dd"/></td>
                        <td><f:formatDate value="${orderAduitVO.deliveryTime}" pattern="MM-dd"/></td>
                        <td>
                            <c:if test="${1==orderAduitVO.deliveryStatus}"><span style="color: green">√</span></c:if><c:if test="${0==orderAduitVO.deliveryStatus}"><a href="javascript:void(0);" data-toggle="tooltip" data-placement="top" title="${orderAduitVO.deliveryExceptionDesc}"><span style="color: red">×</span></a></c:if>
                        </td>
                        <td>${orderAduitVO.receiveNum}</td>
                        <td>
                            <c:if test="${1==orderAduitVO.quality}"><span style="color: green">好</span></c:if><c:if test="${0==orderAduitVO.quality}"><a href="javascript:void(0);" data-toggle="tooltip" data-placement="top" title="${orderAduitVO.qualityRemark}"><span style="color: red">差</span></a></c:if>
                        </td>
                        <td>
                            <c:if test="${1==orderAduitVO.service}"><span style="color: green">好</span></c:if><c:if test="${0==orderAduitVO.service}"><a href="javascript:void(0);" data-toggle="tooltip" data-placement="top" title="${orderAduitVO.serviceRemark}"><span style="color: red">差</span></a></c:if>
                        </td>
                        <td class="hidden">${orderAduitVO.settlementCode}</td>
                        <td><f:formatDate value="${orderAduitVO.supplierSettlementTime}" pattern="MM-dd"/></td>
                        <td><c:if test="${1==orderAduitVO.supplierSettlementStatus}"><span style="color: green">√</span></c:if><c:if test="${2==orderAduitVO.supplierSettlementStatus}"><a href="javascript:void(0);" data-toggle="tooltip" data-placement="top" title="${orderAduitVO.supplierSettlementRemark}"><span style="color: red">×</span></a></c:if></td>
                        <td><f:formatDate value="${orderAduitVO.settlementDeliveryTime}" pattern="MM-dd"/></td>
                        <td><c:if test="${1==orderAduitVO.settlementDeliveryStatus}"><span style="color: green">√</span></c:if><c:if test="${2==orderAduitVO.settlementDeliveryStatus}"><a href="javascript:void(0);" data-toggle="tooltip" data-placement="top" title="${orderAduitVO.settlementDeliveryRemark}"><span style="color: red">×</span></a></c:if></td>
                        <td><f:formatDate value="${orderAduitVO.billDeliveryTime}" pattern="MM-dd"/></td>
                        <td><c:if test="${1==orderAduitVO.billDeliveryStatus}"><span style="color: green">√</span></c:if><c:if test="${2==orderAduitVO.billDeliveryStatus}"><a href="javascript:void(0);" data-toggle="tooltip" data-placement="top" title="${orderAduitVO.billDeliveryRemark}"><span style="color: red">×</span></a></c:if></td>
                        <td><f:formatDate value="${orderAduitVO.buyerSettlementTime}" pattern="MM-dd"/></td>
                        <td><c:if test="${1==orderAduitVO.buyerSettlementStatus}"><span style="color: green">√</span></c:if><c:if test="${2==orderAduitVO.buyerSettlementStatus}"><a href="javascript:void(0);" data-toggle="tooltip" data-placement="top" title="${orderAduitVO.buyerSettlementRemark}"><span style="color: red">×</span></a></c:if></td>

                        <td colspan="9"></td>
                    </tr>
                </c:forEach>
                <tr class="text-c" style="background-color: #c0edf1"  id="daigouTotalRow"></tr>
                </tbody>
                <tbody id="liwai">
                <c:set value="0" var="lwindex"></c:set>
                <c:forEach items="${liwaiOrderAduitVOList}" var="orderAduitVO" varStatus="status">
                    <tr class="text-c">
                        <td>
                            <c:set value="${lwindex+1}" var="lwindex"></c:set> ${lwindex}
                        </td>
                        <td colspan="2">
                            <c:if test="${1==orderAduitVO.settlementMode}">信用证</c:if><c:if test="${2==orderAduitVO.settlementMode}">代购</c:if><c:if test="${3==orderAduitVO.settlementMode}">信用证-例外</c:if>
                        </td>
                        <td class="hidden">${orderAduitVO.orderCode}</td>
                        <td><f:formatDate value="${orderAduitVO.orderTime}" pattern="MM-dd"/></td>
                        <td><f:formatDate value="${orderAduitVO.deliveryTime}" pattern="MM-dd"/></td>
                        <td>
                            <c:if test="${1==orderAduitVO.deliveryStatus}"><span style="color: green">√</span></c:if><c:if test="${0==orderAduitVO.deliveryStatus}"><a href="javascript:void(0);" data-toggle="tooltip" data-placement="top" title="${orderAduitVO.deliveryExceptionDesc}"><span style="color: red">×</span></a></c:if>
                        </td>
                        <td>${orderAduitVO.receiveNum}</td>
                        <td>
                            <c:if test="${1==orderAduitVO.quality}"><span style="color: green">好</span></c:if><c:if test="${0==orderAduitVO.quality}"><a href="javascript:void(0);" data-toggle="tooltip" data-placement="top" title="${orderAduitVO.qualityRemark}"><span style="color: red">差</span></a></c:if>
                        </td>
                        <td>
                            <c:if test="${1==orderAduitVO.service}"><span style="color: green">好</span></c:if><c:if test="${0==orderAduitVO.service}"><a href="javascript:void(0);" data-toggle="tooltip" data-placement="top" title="${orderAduitVO.serviceRemark}"><span style="color: red">差</span></a></c:if>
                        </td>
                        <td class="hidden">${orderAduitVO.settlementCode}</td>
                        <td><f:formatDate value="${orderAduitVO.supplierSettlementTime}" pattern="MM-dd"/></td>
                        <td><c:if test="${1==orderAduitVO.supplierSettlementStatus}"><span style="color: green">√</span></c:if><c:if test="${2==orderAduitVO.supplierSettlementStatus}"><a href="javascript:void(0);" data-toggle="tooltip" data-placement="top" title="${orderAduitVO.supplierSettlementRemark}"><span style="color: red">×</span></a></c:if></td>
                        <td><f:formatDate value="${orderAduitVO.settlementDeliveryTime}" pattern="MM-dd"/></td>
                        <td><c:if test="${1==orderAduitVO.settlementDeliveryStatus}"><span style="color: green">√</span></c:if><c:if test="${2==orderAduitVO.settlementDeliveryStatus}"><a href="javascript:void(0);" data-toggle="tooltip" data-placement="top" title="${orderAduitVO.settlementDeliveryRemark}"><span style="color: red">×</span></a></c:if></td>
                        <td><f:formatDate value="${orderAduitVO.billDeliveryTime}" pattern="MM-dd"/></td>
                        <td><c:if test="${1==orderAduitVO.billDeliveryStatus}"><span style="color: green">√</span></c:if><c:if test="${2==orderAduitVO.billDeliveryStatus}"><a href="javascript:void(0);" data-toggle="tooltip" data-placement="top" title="${orderAduitVO.billDeliveryRemark}"><span style="color: red">×</span></a></c:if></td>
                        <td><f:formatDate value="${orderAduitVO.buyerSettlementTime}" pattern="MM-dd"/></td>
                        <td><c:if test="${1==orderAduitVO.buyerSettlementStatus}"><span style="color: green">√</span></c:if><c:if test="${2==orderAduitVO.buyerSettlementStatus}"><a href="javascript:void(0);" data-toggle="tooltip" data-placement="top" title="${orderAduitVO.buyerSettlementRemark}"><span style="color: red">×</span></a></c:if></td>

                        <td colspan="9"></td>
                    </tr>
                </c:forEach>
                <tr class="text-c" style="background-color: #c0edf1" id="liwaiTotalRow"></tr>
                </tbody>
            </table>
        </div>
        </div>

</div>
<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="${hxycStatic}/vendors/H-ui/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="${hxycStatic}/vendors/H-ui/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="${hxycStatic}/vendors/H-ui/static/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript" src="${hxycStatic}/vendors/H-ui/static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="${hxycStatic}/vendors/H-ui/lib/My97DatePicker/4.8/WdatePicker.js"></script>

<!-- BEGIN PAGE LEVEL SCRIPTS -->
<script type="text/javascript" src="${hxycStatic}/vendors/H-ui/lib/zTree/v3/js/jquery.ztree.all-3.5.min.js"></script>
<!-- END PAGE LEVEL SCRIPTS -->
<script type="text/javascript">
    $(function(){
        $("[data-toggle='tooltip']").tooltip();
//        init();
        xyz();
        $("#mynav a").on("click",function(){
            $("#mynav a").removeClass("bgcolor");
            $(this).addClass("bgcolor");
        })
    });
    function fullScreen() {
        window.open('${hxycStatic}/aduit-list?projectId=${project.id}');
    }

    function init() {
        $("#init").show();
        $("#xyz").hide();
        $("#liwai").hide();
        $("#daigou").hide();
        $("#fukuaninfo").hide();
        $("#viewSettlementType").html('');
    }

    function xyz() {
        $("#init").hide();
        $("#xyz").show();
        $("#liwai").hide();
        $("#daigou").hide();
        $("#fukuaninfo").hide();
        $("#viewSettlementType").html('信用证模式');
    }

    function liwai() {
        $("#init").hide();
        $("#xyz").hide();
        $("#liwai").show();
        $("#daigou").hide();
        $("#fukuaninfo").show();
        $("#daigoufukuan").hide();
        $("#liwaifukuan").show();
        $("#viewSettlementType").html('例外模式');
    }

    function daigou() {
        $("#init").hide();
        $("#xyz").hide();
        $("#liwai").hide();
        $("#daigou").show();
        $("#fukuaninfo").show();
        $("#daigoufukuan").show();
        $("#liwaifukuan").hide();
        $("#viewSettlementType").html('代购模式');
    }

    var fixLength = 2;
    function checkIsNaN(value) {
        return value == '' || value == null || value.length == 0 || value.trim() == '';
    }

    var xyzTotalRow = [0,0,0];//1,6,23
    var liwaiTotalRow = [0,0,0];//6;fk:1,9
    var daigouTotalRow = [0,0,0];//6;fk:1,9

    //信用证合计
    $('#xyz tr').each(function() {
        $(this).find('td:eq(1)').each(function(){
            if(!checkIsNaN($(this).text())){
                xyzTotalRow[0] += parseFloat($(this).text());
            }
        });
        $(this).find('td:eq(8)').each(function(){
            if(!checkIsNaN($(this).text())){
                xyzTotalRow[1] += parseFloat($(this).text());
            }
        });
        $(this).find('td:eq(26)').each(function(){
            if(!checkIsNaN($(this).text())){
                xyzTotalRow[2] += parseFloat($(this).text());
            }
        });
    });

    $('#xyzTotalRow').append('<td>合计</td><td>'+xyzTotalRow[0].toFixed(fixLength)+'</td><td></td><td></td><td></td><td></td><td>'+xyzTotalRow[1].toFixed(fixLength)+'</td><td></td><td></td><td></td><td></td><td></td>' +
        '<td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td>'+xyzTotalRow[2].toFixed(fixLength)+'</td><td></td><td></td>');

    //代购合计
    $('#daigou tr').each(function() {
        $(this).find('td:eq(6)').each(function(){
            daigouTotalRow[0] += checkIsNaN($(this).text())?parseFloat(0):parseFloat($(this).text());
        });
    });
    $('#daigouTotalRow').append('<td>合计</td><td colspan="2"></td><td></td><td></td><td></td><td>'+daigouTotalRow[0].toFixed(fixLength)+'</td><td></td><td></td><td></td><td></td><td></td>' +
        '<td></td><td></td><td></td><td></td><td></td><td colspan="9"></td>');

    $('#daigoufukuan tr').each(function() {
        $(this).find('td:eq(1)').each(function(){
            daigouTotalRow[1] += checkIsNaN($(this).text())?parseFloat(0):parseFloat($(this).text());
        });
        $(this).find('td:eq(9)').each(function(){
            daigouTotalRow[2] += checkIsNaN($(this).text())?parseFloat(0):parseFloat($(this).text());
        });
    });
    $('#daigoufukuanTotalRow').append('<td>合计</td><td>'+daigouTotalRow[1].toFixed(fixLength)+'</td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td>'+daigouTotalRow[2].toFixed(fixLength)+'</td><td></td><td></td>');

    //例外合计
    $('#liwai tr').each(function() {
        $(this).find('td:eq(6)').each(function(){
            liwaiTotalRow[0] += checkIsNaN($(this).text())?parseFloat(0):parseFloat($(this).text());
        });
    });
    $('#liwaiTotalRow').append('<td>合计</td><td colspan="2"></td><td></td><td></td><td></td><td>'+liwaiTotalRow[0].toFixed(fixLength)+'</td><td></td><td></td><td></td><td></td><td></td>' +
        '<td></td><td></td><td></td><td></td><td></td><td colspan="9"></td>');

    $('#liwaifukuan tr').each(function() {
        $(this).find('td:eq(1)').each(function(){
            liwaiTotalRow[1] += checkIsNaN($(this).text())?parseFloat(0):parseFloat($(this).text());
        });
        $(this).find('td:eq(9)').each(function(){
            liwaiTotalRow[2] += checkIsNaN($(this).text())?parseFloat(0):parseFloat($(this).text());
        });
    });
    $('#liwaifukuanTotalRow').append('<td>合计</td><td>'+liwaiTotalRow[1].toFixed(fixLength)+'</td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td>'+liwaiTotalRow[2].toFixed(fixLength)+'</td><td></td><td></td>');


</script>
</body>
</html>