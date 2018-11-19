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
<link rel="stylesheet" type="text/css" href="${hxycStatic}/js/ots/css/ots-table.css" />
<script type="text/javascript" src="${hxycStatic}/vendors/H-ui/lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<![endif]-->
<title>审查订单列表</title>
    <style type="text/css">
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
        .scroll-table-content-height{
            height: 270px;
        }
    </style>
</head>
<body>
<div class="page-container">

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
                    <th >项目信息</th>
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
                    <th width="220">项目名称</th>
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
            <div class="pre-scrollable scroll-table-body scroll-table-content-height">
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
                        <td>
                            <a href="javascript:;" onclick="checkProjectInfo(this)">${orderAduitVO.projectName}</a>
                        </td>
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
                        <%--<td>${orderAduitVO.creditSurplusAmount}</td>--%>
                        <td>${orderAduitVO.creditSurplusAmount}</td>
                        <td><a href="javascript:void(0);" class="remark" data-toggle="tooltip" data-placement="top" title="${orderAduitVO.remarks}">${orderAduitVO.remarks}</a></td>
                    </tr>
                </c:forEach>
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
    function checkProjectInfo(obj) {
        var projectName =  $(obj).text()+"";
        var index = layer.open({
            type:2
            ,content:"${hxycStatic}/project-detail?projectName="+projectName
            ,area: ['800px', '400px']
            ,title: projectName+' --项目详情'
            ,maxmin: true
            ,resize:true
        });
        //layer.full(index);
    }

</script>
</body>
</html>