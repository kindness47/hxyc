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
<link rel="stylesheet" type="text/css" href="${hxycStatic}/vendors/H-ui/static/h-ui.admin/skin/default/skin.css" id="skin" />
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
    </style>
</head>
<body>
<div class="page-container">
    <div style="font-weight: bold;font-size: 18px;text-align: center">
        【${project.projectName}】订单跟踪表 - ${project.settlementModel}模式
    </div>
    <div class="clearfix"> </div>

    <div class="">
        <span style="font-weight: bold">责任人：</span>
        <table class="table table-border table-bordered table-hover table-bg">
            <tr class="text-c" style="text-align: left"><td width="20%">信用证、收款信息录入/结算/支付(财务人员)：</td><td>${financialCerator}</td><td width="20%">订单信息/支付流程(运营专员):</td><td>${orderCreator}</td><td width="20%">结算(结算专员)：</td><td>${settlementCreator}</td></tr>
        </table>
    </div>
    <div class="clearfix"> </div>

	<div class="cl pd-5 bg-1 bk-gray mt-20">
        <span style="font-weight: bold">合同信息：</span>
        <div class="row cl">
            <table class="table table-border table-bordered table-hover table-bg">
                <tr class="text-c"><td>供应单位：</td><td>${project.supplyUnit}</td><td>合同签订时间：</td><td>${project.contractSignTime}</td><td>供货时间段：</td><td>${project.supplyTime}</td>
                    <td>合同数量（T）：</td><td>${project.contractNum}</td><td>合同金额（万元）：</td><td>${project.contractAmount}</td></tr>

                <tr class="text-c"><td>结算模式：</td><td>${project.settlementModel}</td><td>基价浮动值(元/吨)：</td><td>${project.baseFloatValue}</td><td>例外垫资(万元):</td><td>${project.extraCapitalAmount}</td><td>垫资期限：</td><td>${project.capitalTimeLimit}</td><td>利息标准：</td><td>${project.interestRate}</td></tr>
            </table>
        </div>
    </div>

    <!-- 收款信息部分-->
    <div class="clearfix"> </div>
    <div class="mt-20">
        <span style="font-weight: bold">收款信息：</span>
        <table id="" class="table table-border table-bordered table-hover table-bg">
            <thead>
            <tr class="text-c">
                <th width="50">序号</th>
                <th width="180">收款金额(万元)</th>
                <th width="180">收款时间</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${receiptVOList}" var="receipt"  varStatus="rstatus">
                <tr class="text-c">
                    <td>
                            ${rstatus.index+1}
                    </td>
                    <td>${receipt.receiptAmount}</td>
                    <td><f:formatDate value="${receipt.receiptTime}" pattern="yyyy-MM-dd"/></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>

    <div class="clearfix"> </div>
    <!-- 订单及结算信息部分-->

        <div class="mt-20">
            <table id="orderAduitTable" class="table table-border table-bordered table-hover table-bg table-sort" style="">
                <thead>
                <tr class="text-c">
                    <th width="50">跟踪节点</th>
                    <th colspan="3">
                        <span><a class="myspan" onclick="init();">全部</a></span><span><a class="myspan" onclick="xyz();">信用证</a></span>
                        <span><a class="myspan" onclick="daigou();">代购</a></span><span><a class="myspan" onclick="liwai();">例外</a></span>
                    </th>
                    <th colspan="7">订单信息</th>
                    <th colspan="7">供方结算</th>
                    <th colspan="4">需方结算</th>
                    <th colspan="7">支付流程</th>
                </tr>
                <tr class="text-c">
                    <th width="50">序号</th>
                    <th width="100">开证金额(万元)</th>
                    <th width="100">开证日期</th>
                    <th width="50">结算模式</th>
                    <th width="100">订单号</th>
                    <th width="100">订单时间</th>
                    <th width="100">交验时间</th>
                    <th width="20">异常否</th>
                    <th width="30">验收数量(T)</th>
                    <th width="20">质量</th>
                    <th width="20">服务</th>
                    <th width="100">结算单号</th>
                    <th width="100">结算时间</th>
                    <th width="20">异常否</th>
                    <th width="100">结算单据送达时间</th>
                    <th width="20">异常否</th>
                    <th width="100">发票送达时间</th>
                    <th width="20">异常否</th>
                    <th width="100">结算时间</th>
                    <th width="20">异常否</th>
                    <th width="100">发票开立时间</th>
                    <th width="20">异常否</th>
                    <th width="100">审批完成时间</th>
                    <th width="20">异常否</th>
                    <th width="100">付款时间</th>
                    <th width="20">异常否</th>
                    <th width="80">付款金额(万元)</th>
                    <th width="80">信用证/收款余额(万元)</th>
                    <th width="120">其他备注</th>

                </tr>
                </thead>
                <tbody id="init">
                <c:forEach items="${orderAduitVOList}" var="orderAduitVO" varStatus="status">
                    <tr class="text-c">
                        <td>
                           ${status.index+1}
                        </td>
                        <td>${orderAduitVO.openAmount}</td>
                        <td><f:formatDate value="${orderAduitVO.openTime}" pattern="yyyy-MM-dd"/></td>
                        <td>
                            <c:if test="${1==orderAduitVO.settlementMode}">信用证</c:if><c:if test="${2==orderAduitVO.settlementMode}">代购</c:if><c:if test="${3==orderAduitVO.settlementMode}">信用证-例外</c:if>
                        </td>
                        <td>${orderAduitVO.orderCode}</td>
                        <td><f:formatDate value="${orderAduitVO.orderTime}" pattern="yyyy-MM-dd"/></td>
                        <td><f:formatDate value="${orderAduitVO.deliveryTime}" pattern="yyyy-MM-dd"/></td>
                        <td>
                            <c:if test="${1==orderAduitVO.deliveryStatus}"><span style="color: green">√</span></c:if><c:if test="${0==orderAduitVO.deliveryStatus}"><a href="javascript:void(0);" data-toggle="tooltip" data-placement="top" title="${orderAduitVO.deliveryExceptionDesc}"><span style="color: red">×</span></a></c:if>
                        </td>
                        <td>${orderAduitVO.receiveNum}</td>
                        <td>
                            <c:if test="${1==orderAduitVO.quality}"><span style="color: green">好</span></c:if><c:if test="${0==orderAduitVO.quality}"><a href="javascript:void(0);" data-toggle="tooltip" data-placement="top" title=""><span style="color: red">差</span></a></c:if>
                        </td>
                        <td>
                            <c:if test="${1==orderAduitVO.service}"><span style="color: green">好</span></c:if><c:if test="${0==orderAduitVO.service}"><a href="javascript:void(0);" data-toggle="tooltip" data-placement="top" title=""><span style="color: red">差</span></a></c:if>
                        </td>
                        <td>${orderAduitVO.settlementCode}</td>
                        <td><f:formatDate value="${orderAduitVO.supplierSettlementTime}" pattern="yyyy-MM-dd"/></td>
                        <td><c:if test="${1==orderAduitVO.supplierSettlementStatus}"><span style="color: green">√</span></c:if><c:if test="${2==orderAduitVO.supplierSettlementStatus}"><a href="javascript:void(0);" data-toggle="tooltip" data-placement="top" title="${orderAduitVO.supplierSettlementRemark}"><span style="color: red">×</span></a></c:if></td>
                        <td><f:formatDate value="${orderAduitVO.settlementDeliveryTime}" pattern="yyyy-MM-dd"/></td>
                        <td><c:if test="${1==orderAduitVO.settlementDeliveryStatus}"><span style="color: green">√</span></c:if><c:if test="${2==orderAduitVO.settlementDeliveryStatus}"><a href="javascript:void(0);" data-toggle="tooltip" data-placement="top" title="${orderAduitVO.settlementDeliveryRemark}"><span style="color: red">×</span></a></c:if></td>
                        <td><f:formatDate value="${orderAduitVO.billDeliveryTime}" pattern="yyyy-MM-dd"/></td>
                        <td><c:if test="${1==orderAduitVO.billDeliveryStatus}"><span style="color: green">√</span></c:if><c:if test="${2==orderAduitVO.billDeliveryStatus}"><a href="javascript:void(0);" data-toggle="tooltip" data-placement="top" title="${orderAduitVO.billDeliveryRemark}"><span style="color: red">×</span></a></c:if></td>
                        <td><f:formatDate value="${orderAduitVO.buyerSettlementTime}" pattern="yyyy-MM-dd"/></td>
                        <td><c:if test="${1==orderAduitVO.buyerSettlementStatus}"><span style="color: green">√</span></c:if><c:if test="${2==orderAduitVO.buyerSettlementStatus}"><a href="javascript:void(0);" data-toggle="tooltip" data-placement="top" title="${orderAduitVO.buyerSettlementRemark}"><span style="color: red">×</span></a></c:if></td>
                        <td><f:formatDate value="${orderAduitVO.billOpenTime}" pattern="yyyy-MM-dd"/></td>
                        <td><c:if test="${1==orderAduitVO.billOpenStatus}"><span style="color: green">√</span></c:if><c:if test="${2==orderAduitVO.billOpenStatus}"><a href="javascript:void(0);" data-toggle="tooltip" data-placement="top" title="${orderAduitVO.billOpenRemark}"><span style="color: red">×</span></a></c:if></td>
                        <td><f:formatDate value="${orderAduitVO.approvalTime}" pattern="yyyy-MM-dd"/></td>
                        <td>
                            <c:if test="${1==orderAduitVO.approvalStatus}"><span style="color: green">√</span></c:if><c:if test="${2==orderAduitVO.approvalStatus}"><a href="javascript:void(0);" data-toggle="tooltip" data-placement="top" title="${orderAduitVO.approvalRemark}"><span style="color: red">×</span></a></c:if>
                        </td>
                        <td><f:formatDate value="${orderAduitVO.paymentTime}" pattern="yyyy-MM-dd"/></td>
                        <td>
                            <c:if test="${1==orderAduitVO.paymentStatus}"><span style="color: green">√</span></c:if><c:if test="${2==orderAduitVO.paymentStatus}"><a href="javascript:void(0);" data-toggle="tooltip" data-placement="top" title="${orderAduitVO.paymentRemark}"><span style="color: red">×</span></a></c:if>
                        </td>
                        <td>${orderAduitVO.paymentAmount}</td>
                        <td>${orderAduitVO.creditSurplusAmount}</td>
                        <td>${orderAduitVO.remarks}</td>
                    </tr>
                </c:forEach>
                </tbody>
                <tbody id="xyz">
                <c:forEach items="${orderAduitVOList}" var="orderAduitVO" varStatus="status">
                    <c:if test="${1==orderAduitVO.settlementMode}">
                    <tr class="text-c">
                        <td>
                                ${status.index+1}
                        </td>
                        <td>${orderAduitVO.openAmount}</td>
                        <td><f:formatDate value="${orderAduitVO.openTime}" pattern="yyyy-MM-dd"/></td>
                        <td>
                            <c:if test="${1==orderAduitVO.settlementMode}">信用证</c:if><c:if test="${2==orderAduitVO.settlementMode}">代购</c:if><c:if test="${3==orderAduitVO.settlementMode}">信用证-例外</c:if>
                        </td>
                        <td>${orderAduitVO.orderCode}</td>
                        <td><f:formatDate value="${orderAduitVO.orderTime}" pattern="yyyy-MM-dd"/></td>
                        <td><f:formatDate value="${orderAduitVO.deliveryTime}" pattern="yyyy-MM-dd"/></td>
                        <td>
                            <c:if test="${1==orderAduitVO.deliveryStatus}"><span style="color: green">√</span></c:if><c:if test="${0==orderAduitVO.deliveryStatus}"><a href="javascript:void(0);" data-toggle="tooltip" data-placement="top" title="${orderAduitVO.deliveryExceptionDesc}"><span style="color: red">×</span></a></c:if>
                        </td>
                        <td>${orderAduitVO.receiveNum}</td>
                        <td>
                            <c:if test="${1==orderAduitVO.quality}"><span style="color: green">好</span></c:if><c:if test="${0==orderAduitVO.quality}"><a href="javascript:void(0);" data-toggle="tooltip" data-placement="top" title=""><span style="color: red">差</span></a></c:if>
                        </td>
                        <td>
                            <c:if test="${1==orderAduitVO.service}"><span style="color: green">好</span></c:if><c:if test="${0==orderAduitVO.service}"><a href="javascript:void(0);" data-toggle="tooltip" data-placement="top" title=""><span style="color: red">差</span></a></c:if>
                        </td>
                        <td>${orderAduitVO.settlementCode}</td>
                        <td><f:formatDate value="${orderAduitVO.supplierSettlementTime}" pattern="yyyy-MM-dd"/></td>
                        <td><c:if test="${1==orderAduitVO.supplierSettlementStatus}"><span style="color: green">√</span></c:if><c:if test="${2==orderAduitVO.supplierSettlementStatus}"><a href="javascript:void(0);" data-toggle="tooltip" data-placement="top" title="${orderAduitVO.supplierSettlementRemark}"><span style="color: red">×</span></a></c:if></td>
                        <td><f:formatDate value="${orderAduitVO.settlementDeliveryTime}" pattern="yyyy-MM-dd"/></td>
                        <td><c:if test="${1==orderAduitVO.settlementDeliveryStatus}"><span style="color: green">√</span></c:if><c:if test="${2==orderAduitVO.settlementDeliveryStatus}"><a href="javascript:void(0);" data-toggle="tooltip" data-placement="top" title="${orderAduitVO.settlementDeliveryRemark}"><span style="color: red">×</span></a></c:if></td>
                        <td><f:formatDate value="${orderAduitVO.billDeliveryTime}" pattern="yyyy-MM-dd"/></td>
                        <td><c:if test="${1==orderAduitVO.billDeliveryStatus}"><span style="color: green">√</span></c:if><c:if test="${2==orderAduitVO.billDeliveryStatus}"><a href="javascript:void(0);" data-toggle="tooltip" data-placement="top" title="${orderAduitVO.billDeliveryRemark}"><span style="color: red">×</span></a></c:if></td>
                        <td><f:formatDate value="${orderAduitVO.buyerSettlementTime}" pattern="yyyy-MM-dd"/></td>
                        <td><c:if test="${1==orderAduitVO.buyerSettlementStatus}"><span style="color: green">√</span></c:if><c:if test="${2==orderAduitVO.buyerSettlementStatus}"><a href="javascript:void(0);" data-toggle="tooltip" data-placement="top" title="${orderAduitVO.buyerSettlementRemark}"><span style="color: red">×</span></a></c:if></td>
                        <td><f:formatDate value="${orderAduitVO.billOpenTime}" pattern="yyyy-MM-dd"/></td>
                        <td><c:if test="${1==orderAduitVO.billOpenStatus}"><span style="color: green">√</span></c:if><c:if test="${2==orderAduitVO.billOpenStatus}"><a href="javascript:void(0);" data-toggle="tooltip" data-placement="top" title="${orderAduitVO.billOpenRemark}"><span style="color: red">×</span></a></c:if></td>
                        <td><f:formatDate value="${orderAduitVO.approvalTime}" pattern="yyyy-MM-dd"/></td>
                        <td>
                            <c:if test="${1==orderAduitVO.approvalStatus}"><span style="color: green">√</span></c:if><c:if test="${2==orderAduitVO.approvalStatus}"><a href="javascript:void(0);" data-toggle="tooltip" data-placement="top" title="${orderAduitVO.approvalRemark}"><span style="color: red">×</span></a></c:if>
                        </td>
                        <td><f:formatDate value="${orderAduitVO.paymentTime}" pattern="yyyy-MM-dd"/></td>
                        <td>
                            <c:if test="${1==orderAduitVO.paymentStatus}"><span style="color: green">√</span></c:if><c:if test="${2==orderAduitVO.paymentStatus}"><a href="javascript:void(0);" data-toggle="tooltip" data-placement="top" title="${orderAduitVO.paymentRemark}"><span style="color: red">×</span></a></c:if>
                        </td>
                        <td>${orderAduitVO.paymentAmount}</td>
                        <td>${orderAduitVO.creditSurplusAmount}</td>
                        <td>${orderAduitVO.remarks}</td>
                    </tr>
                    </c:if>
                </c:forEach>
                </tbody>
                <tbody id="daigou">
                <c:forEach items="${orderAduitVOList}" var="orderAduitVO" varStatus="status">
                    <c:if test="${2==orderAduitVO.settlementMode}">
                    <tr class="text-c">
                        <td>
                                ${status.index+1}
                        </td>
                        <td></td>
                        <td></td>
                        <td>
                            <c:if test="${1==orderAduitVO.settlementMode}">信用证</c:if><c:if test="${2==orderAduitVO.settlementMode}">代购</c:if><c:if test="${3==orderAduitVO.settlementMode}">信用证-例外</c:if>
                        </td>
                        <td>${orderAduitVO.orderCode}</td>
                        <td><f:formatDate value="${orderAduitVO.orderTime}" pattern="yyyy-MM-dd"/></td>
                        <td><f:formatDate value="${orderAduitVO.deliveryTime}" pattern="yyyy-MM-dd"/></td>
                        <td>
                            <c:if test="${1==orderAduitVO.deliveryStatus}"><span style="color: green">√</span></c:if><c:if test="${0==orderAduitVO.deliveryStatus}"><a href="javascript:void(0);" data-toggle="tooltip" data-placement="top" title="${orderAduitVO.deliveryExceptionDesc}"><span style="color: red">×</span></a></c:if>
                        </td>
                        <td>${orderAduitVO.receiveNum}</td>
                        <td>
                            <c:if test="${1==orderAduitVO.quality}"><span style="color: green">好</span></c:if><c:if test="${0==orderAduitVO.quality}"><a href="javascript:void(0);" data-toggle="tooltip" data-placement="top" title=""><span style="color: red">差</span></a></c:if>
                        </td>
                        <td>
                            <c:if test="${1==orderAduitVO.service}"><span style="color: green">好</span></c:if><c:if test="${0==orderAduitVO.service}"><a href="javascript:void(0);" data-toggle="tooltip" data-placement="top" title=""><span style="color: red">差</span></a></c:if>
                        </td>
                        <td>${orderAduitVO.settlementCode}</td>
                        <td><f:formatDate value="${orderAduitVO.supplierSettlementTime}" pattern="yyyy-MM-dd"/></td>
                        <td><c:if test="${1==orderAduitVO.supplierSettlementStatus}"><span style="color: green">√</span></c:if><c:if test="${2==orderAduitVO.supplierSettlementStatus}"><a href="javascript:void(0);" data-toggle="tooltip" data-placement="top" title="${orderAduitVO.supplierSettlementRemark}"><span style="color: red">×</span></a></c:if></td>
                        <td><f:formatDate value="${orderAduitVO.settlementDeliveryTime}" pattern="yyyy-MM-dd"/></td>
                        <td><c:if test="${1==orderAduitVO.settlementDeliveryStatus}"><span style="color: green">√</span></c:if><c:if test="${2==orderAduitVO.settlementDeliveryStatus}"><a href="javascript:void(0);" data-toggle="tooltip" data-placement="top" title="${orderAduitVO.settlementDeliveryRemark}"><span style="color: red">×</span></a></c:if></td>
                        <td><f:formatDate value="${orderAduitVO.billDeliveryTime}" pattern="yyyy-MM-dd"/></td>
                        <td><c:if test="${1==orderAduitVO.billDeliveryStatus}"><span style="color: green">√</span></c:if><c:if test="${2==orderAduitVO.billDeliveryStatus}"><a href="javascript:void(0);" data-toggle="tooltip" data-placement="top" title="${orderAduitVO.billDeliveryRemark}"><span style="color: red">×</span></a></c:if></td>
                        <td><f:formatDate value="${orderAduitVO.buyerSettlementTime}" pattern="yyyy-MM-dd"/></td>
                        <td><c:if test="${1==orderAduitVO.buyerSettlementStatus}"><span style="color: green">√</span></c:if><c:if test="${2==orderAduitVO.buyerSettlementStatus}"><a href="javascript:void(0);" data-toggle="tooltip" data-placement="top" title="${orderAduitVO.buyerSettlementRemark}"><span style="color: red">×</span></a></c:if></td>
                        <td><f:formatDate value="${orderAduitVO.billOpenTime}" pattern="yyyy-MM-dd"/></td>
                        <td><c:if test="${1==orderAduitVO.billOpenStatus}"><span style="color: green">√</span></c:if><c:if test="${2==orderAduitVO.billOpenStatus}"><a href="javascript:void(0);" data-toggle="tooltip" data-placement="top" title="${orderAduitVO.billOpenRemark}"><span style="color: red">×</span></a></c:if></td>
                        <td><f:formatDate value="${orderAduitVO.approvalTime}" pattern="yyyy-MM-dd"/></td>
                        <td>
                            <c:if test="${1==orderAduitVO.approvalStatus}"><span style="color: green">√</span></c:if><c:if test="${2==orderAduitVO.approvalStatus}"><a href="javascript:void(0);" data-toggle="tooltip" data-placement="top" title="${orderAduitVO.approvalRemark}"><span style="color: red">×</span></a></c:if>
                        </td>
                        <td><f:formatDate value="${orderAduitVO.paymentTime}" pattern="yyyy-MM-dd"/></td>
                        <td>
                            <c:if test="${1==orderAduitVO.paymentStatus}"><span style="color: green">√</span></c:if><c:if test="${2==orderAduitVO.paymentStatus}"><a href="javascript:void(0);" data-toggle="tooltip" data-placement="top" title="${orderAduitVO.paymentRemark}"><span style="color: red">×</span></a></c:if>
                        </td>
                        <td>${orderAduitVO.paymentAmount}</td>
                        <td>${orderAduitVO.creditSurplusAmount}</td>
                        <td>${orderAduitVO.remarks}</td>
                    </tr>
                    </c:if>
                </c:forEach>
                </tbody>
                <tbody id="liwai">
                <c:forEach items="${orderAduitVOList}" var="orderAduitVO" varStatus="status">
                    <c:if test="${3==orderAduitVO.settlementMode}">
                    <tr class="text-c">
                        <td>
                                ${status.index+1}
                        </td>
                        <td></td>
                        <td></td>
                        <td>
                            <c:if test="${1==orderAduitVO.settlementMode}">信用证</c:if><c:if test="${2==orderAduitVO.settlementMode}">代购</c:if><c:if test="${3==orderAduitVO.settlementMode}">信用证-例外</c:if>
                        </td>
                        <td>${orderAduitVO.orderCode}</td>
                        <td><f:formatDate value="${orderAduitVO.orderTime}" pattern="yyyy-MM-dd"/></td>
                        <td><f:formatDate value="${orderAduitVO.deliveryTime}" pattern="yyyy-MM-dd"/></td>
                        <td>
                            <c:if test="${1==orderAduitVO.deliveryStatus}"><span style="color: green">√</span></c:if><c:if test="${0==orderAduitVO.deliveryStatus}"><a href="javascript:void(0);" data-toggle="tooltip" data-placement="top" title="${orderAduitVO.deliveryExceptionDesc}"><span style="color: red">×</span></a></c:if>
                        </td>
                        <td>${orderAduitVO.receiveNum}</td>
                        <td>
                            <c:if test="${1==orderAduitVO.quality}"><span style="color: green">好</span></c:if><c:if test="${0==orderAduitVO.quality}"><a href="javascript:void(0);" data-toggle="tooltip" data-placement="top" title=""><span style="color: red">差</span></a></c:if>
                        </td>
                        <td>
                            <c:if test="${1==orderAduitVO.service}"><span style="color: green">好</span></c:if><c:if test="${0==orderAduitVO.service}"><a href="javascript:void(0);" data-toggle="tooltip" data-placement="top" title=""><span style="color: red">差</span></a></c:if>
                        </td>
                        <td>${orderAduitVO.settlementCode}</td>
                        <td><f:formatDate value="${orderAduitVO.supplierSettlementTime}" pattern="yyyy-MM-dd"/></td>
                        <td><c:if test="${1==orderAduitVO.supplierSettlementStatus}"><span style="color: green">√</span></c:if><c:if test="${2==orderAduitVO.supplierSettlementStatus}"><a href="javascript:void(0);" data-toggle="tooltip" data-placement="top" title="${orderAduitVO.supplierSettlementRemark}"><span style="color: red">×</span></a></c:if></td>
                        <td><f:formatDate value="${orderAduitVO.settlementDeliveryTime}" pattern="yyyy-MM-dd"/></td>
                        <td><c:if test="${1==orderAduitVO.settlementDeliveryStatus}"><span style="color: green">√</span></c:if><c:if test="${2==orderAduitVO.settlementDeliveryStatus}"><a href="javascript:void(0);" data-toggle="tooltip" data-placement="top" title="${orderAduitVO.settlementDeliveryRemark}"><span style="color: red">×</span></a></c:if></td>
                        <td><f:formatDate value="${orderAduitVO.billDeliveryTime}" pattern="yyyy-MM-dd"/></td>
                        <td><c:if test="${1==orderAduitVO.billDeliveryStatus}"><span style="color: green">√</span></c:if><c:if test="${2==orderAduitVO.billDeliveryStatus}"><a href="javascript:void(0);" data-toggle="tooltip" data-placement="top" title="${orderAduitVO.billDeliveryRemark}"><span style="color: red">×</span></a></c:if></td>
                        <td><f:formatDate value="${orderAduitVO.buyerSettlementTime}" pattern="yyyy-MM-dd"/></td>
                        <td><c:if test="${1==orderAduitVO.buyerSettlementStatus}"><span style="color: green">√</span></c:if><c:if test="${2==orderAduitVO.buyerSettlementStatus}"><a href="javascript:void(0);" data-toggle="tooltip" data-placement="top" title="${orderAduitVO.buyerSettlementRemark}"><span style="color: red">×</span></a></c:if></td>
                        <td><f:formatDate value="${orderAduitVO.billOpenTime}" pattern="yyyy-MM-dd"/></td>
                        <td><c:if test="${1==orderAduitVO.billOpenStatus}"><span style="color: green">√</span></c:if><c:if test="${2==orderAduitVO.billOpenStatus}"><a href="javascript:void(0);" data-toggle="tooltip" data-placement="top" title="${orderAduitVO.billOpenRemark}"><span style="color: red">×</span></a></c:if></td>
                        <td><f:formatDate value="${orderAduitVO.approvalTime}" pattern="yyyy-MM-dd"/></td>
                        <td>
                            <c:if test="${1==orderAduitVO.approvalStatus}"><span style="color: green">√</span></c:if><c:if test="${2==orderAduitVO.approvalStatus}"><a href="javascript:void(0);" data-toggle="tooltip" data-placement="top" title="${orderAduitVO.approvalRemark}"><span style="color: red">×</span></a></c:if>
                        </td>
                        <td><f:formatDate value="${orderAduitVO.paymentTime}" pattern="yyyy-MM-dd"/></td>
                        <td>
                            <c:if test="${1==orderAduitVO.paymentStatus}"><span style="color: green">√</span></c:if><c:if test="${2==orderAduitVO.paymentStatus}"><a href="javascript:void(0);" data-toggle="tooltip" data-placement="top" title="${orderAduitVO.paymentRemark}"><span style="color: red">×</span></a></c:if>
                        </td>
                        <td>${orderAduitVO.paymentAmount}</td>
                        <td>${orderAduitVO.creditSurplusAmount}</td>
                        <td>${orderAduitVO.remarks}</td>
                    </tr>
                    </c:if>
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

<!-- BEGIN PAGE LEVEL SCRIPTS -->
<script type="text/javascript" src="${hxycStatic}/vendors/H-ui/lib/zTree/v3/js/jquery.ztree.all-3.5.min.js"></script>
<!-- END PAGE LEVEL SCRIPTS -->
<script type="text/javascript">
    $(function(){
        $("[data-toggle='tooltip']").tooltip();
        init();
    });

    function init() {
        $("#init").show();
        $("#xyz").hide();
        $("#liwai").hide();
        $("#daigou").hide();
    }

    function xyz() {
        $("#init").hide();
        $("#xyz").show();
        $("#liwai").hide();
        $("#daigou").hide();
    }

    function liwai() {
        $("#init").hide();
        $("#xyz").hide();
        $("#liwai").show();
        $("#daigou").hide();
    }

    function daigou() {
        $("#init").hide();
        $("#xyz").hide();
        $("#liwai").hide();
        $("#daigou").show();
    }
</script>
</body>
</html>