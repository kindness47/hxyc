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
<link rel="stylesheet" type="text/css" href="${hxycStatic}/vendors/H-ui/lib/zTree/v3/css/zTreeStyle/zTreeStyle.css">
<link rel="stylesheet" type="text/css" href="${hxycStatic}/js/ots/css/ots-table.css" />
<script type="text/javascript" src="${hxycStatic}/vendors/H-ui/lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<![endif]-->
<title>结算管理</title>
</head>
<body>
<div><a class="btn btn-success radius r" style="line-height:0.8em;margin-top:1px;margin-right:1px;padding-left: 3px;padding-right: 3px;height: 22px;" href="javascript:location.replace(location.href);" onclick="location.replace(location.href)" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></div>
<div class="page-container">
    <form id="searchForm" name="searchForm" method="get" action="settlement-list">
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
        <a href="javascript:;" onclick="settlement_add('新增结算','settlement-add','1000','620')" class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i> 新增结算</a>
    </div>
    <div class="clearfix"> </div>
        <div class="mt-20">
            <table id="settlementTable" class="table table-border table-bordered table-hover table-bg table-sort">
                <thead>
                <tr class="text-c">
                    <th width="60">操作</th>
                    <th width="80">公司名称</th>
                    <th width="100">项目名称</th>
                    <th width="60">订单号</th>
                    <th width="180">结算单号</th>
                    <th width="100">供方结算时间</th>
                    <th width="30">异常否</th>
                    <th width="100">供方结算单据送达时间</th>
                    <th width="30">异常否</th>
                    <th width="100">供方发票送达时间</th>
                    <th width="30">异常否</th>
                    <th width="100">需方结算时间</th>
                    <th width="30">异常否</th>
                    <%--<th width="100">需方发票开立时间</th>--%>
                    <%--<th width="30">异常否</th>--%>
                    <th width="80">结算方式</th>
                    <th width="140">结算金额(元)</th>
                    <th width="100">创建人</th>
                    <th width="120">创建时间</th>

                </tr>
                </thead>
                <tbody>
                <c:forEach items="${settlementVOList}" var="settlementVO">
                    <tr class="text-c">
                        <td>
                            <a title="编辑" href="javascript:;" onclick="settlement_edit('编辑','settlement-edit?id=${settlementVO.id}','1000','620')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6df;</i></a>
                        </td>
                        <td><span class="long-text-hidden" style="width: 80px">${settlementVO.companyName}</span></td>
                        <td><span class="long-text-hidden" style="width: 100px">${settlementVO.projectName}</span></td>
                        <td><span class="long-text-hidden" style="width: 60px">${settlementVO.orderId}</span></td>
                        <td><span style="width: 100px">${settlementVO.settlementCode}</span></td>
                        <td><f:formatDate value="${settlementVO.supplierSettlementTime}" pattern="yyyy-MM-dd"/></td>
                        <td><c:if test="${1==settlementVO.supplierSettlementStatus}"><span style="color: green">√</span></c:if><c:if test="${2==settlementVO.supplierSettlementStatus}"><a href="javascript:void(0);" data-toggle="tooltip" data-placement="top" title="${settlementVO.supplierSettlementRemark}"><span style="color: red">×</span></a></c:if></td>
                        <td><f:formatDate value="${settlementVO.settlementDeliveryTime}" pattern="yyyy-MM-dd"/></td>
                        <td><c:if test="${1==settlementVO.settlementDeliveryStatus}"><span style="color: green">√</span></c:if><c:if test="${2==settlementVO.settlementDeliveryStatus}"><a href="javascript:void(0);" data-toggle="tooltip" data-placement="top" title="${settlementVO.settlementDeliveryRemark}"><span style="color: red">×</span></a></c:if></td>
                        <td><f:formatDate value="${settlementVO.billDeliveryTime}" pattern="yyyy-MM-dd"/></td>
                        <td><c:if test="${1==settlementVO.billDeliveryStatus}"><span style="color: green">√</span></c:if><c:if test="${2==settlementVO.billDeliveryStatus}"><a href="javascript:void(0);" data-toggle="tooltip" data-placement="top" title="${settlementVO.billDeliveryRemark}"><span style="color: red">×</span></a></c:if></td>
                        <td><f:formatDate value="${settlementVO.buyerSettlementTime}" pattern="yyyy-MM-dd"/></td>
                        <td><c:if test="${1==settlementVO.buyerSettlementStatus}"><span style="color: green">√</span></c:if><c:if test="${2==settlementVO.buyerSettlementStatus}"><a href="javascript:void(0);" data-toggle="tooltip" data-placement="top" title="${settlementVO.buyerSettlementRemark}"><span style="color: red">×</span></a></c:if></td>
                        <%--<td><f:formatDate value="${settlementVO.billOpenTime}" pattern="yyyy-MM-dd"/></td>--%>
                        <%--<td><c:if test="${1==settlementVO.billOpenStatus}"><span style="color: green">√</span></c:if><c:if test="${2==settlementVO.billOpenStatus}"><a href="javascript:void(0);" data-toggle="tooltip" data-placement="top" title="${settlementVO.billOpenRemark}"><span style="color: red">×</span></a></c:if></td>--%>
                        <td><c:if test="${1==settlementVO.settlementMode}">信用证</c:if><c:if test="${2==settlementVO.settlementMode}">代购</c:if><c:if test="${3==settlementVO.settlementMode}">信用证-例外</c:if></td>
                        <td>${settlementVO.settlementAmount}</td>
                        <td>${settlementVO.createBy}</td>
                        <td><span class="long-text-hidden" style="width: 120px"><f:formatDate value="${settlementVO.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></span></td>
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
<script type="text/javascript" src="${hxycStatic}/vendors/H-ui/lib/zTree/v3/js/jquery.ztree.all-3.5.min.js"></script>
<script src="${hxycStatic}/js/ots/settlement-table.js" type="text/javascript"></script>
<!-- END PAGE LEVEL SCRIPTS -->
<script type="text/javascript">
    $(function(){
        TableDatatablesScroller.init();
        $("[data-toggle='tooltip']").tooltip();
    });

    /*新增*/
    function settlement_add(title,url,w,h){
        layer_show(title,url,w,h);
    }

    /*修改*/
    function settlement_edit(title,url,w,h){
        layer_show(title,url,w,h);
    }

</script>
</body>
</html>