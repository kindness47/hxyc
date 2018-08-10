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
<script type="text/javascript" src="${hxycStatic}/vendors/H-ui/lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<![endif]-->
<title>订单管理</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 订单跟踪 <span class="c-gray en">&gt;</span> 订单管理 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
    <form id="searchForm" name="searchForm" method="get" action="order-list">
	<div class="text-c"> 订单日期：
		<input type="text" onclick="WdatePicker()" id="datemin" name="sta
		rtDate"  class="input-text Wdate" readonly style="width:120px;">
		-
		<input type="text" onclick="WdatePicker({ minDate:'#F{$dp.$D(\'datemin\')}'})" id="datemax" name="endDate"  class="input-text Wdate" readonly style="width:120px;">
		<input type="text" class="input-text" style="width:250px" name="receiveNum" placeholder="请输入验收数量">
		<button type="submit" class="btn btn-success radius" id="" name=""><i class="Hui-iconfont">&#xe665;</i> 查询</button>
	</div>
    </form>
    <shiro:hasPermission name="0202-0001">
        <div class="cl pd-5 bg-1 bk-gray mt-20">
            <a href="javascript:;" onclick="order_add('新增订单','order-add','','320')" class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i> 新增订单</a>
        </div>
    </shiro:hasPermission>
    <div class="clearfix"> </div>
    <div class="mt-20">
        <table id="orderTable" class="table table-border table-bordered table-hover table-bg table-sort">
            <thead>
                <tr class="text-c">
                    <th width="80">操作</th>
                    <th width="180">公司名称</th>
                    <th width="180">项目名称</th>
                    <th width="180">订单时间</th>
                    <th width="180">校验时间</th>
                    <th width="180">验收数量</th>
                    <th width="180">质量</th>
                    <th width="180">服务</th>
                    <th width="180">创建日期</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${orderList}" var="order">
                    <tr class="text-c">
                        <td>
                            <shiro:hasPermission name="0202-0002">
                                <a title="修改" href="javascript:;" onclick="order_edit('修改','order-add','','320', '${order.id}')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6df;</i></a>
                            </shiro:hasPermission>
                        </td>
                        <td>${order.companyName}</td>
                        <td>${order.projectName}</td>
                        <td><f:formatDate value="${order.orderTime}" pattern="yyyy-MM-dd"/></td>
                        <td><f:formatDate value="${order.deliveryTime}" pattern="yyyy-MM-dd"/></td>
                        <td>${order.receiveNum}</td>
                        <td>${order.quality}</td>
                        <td>${order.service}</td>
                        <td><f:formatDate value="${order.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
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
<script src="${hxycStatic}/js/ots/order-table.js" type="text/javascript"></script>
<!-- END PAGE LEVEL SCRIPTS -->
<script type="text/javascript">
    $(function(){
        TableDatatablesScroller.init();
    });

    /*新增订单*/
    function order_add(title,url,w,h){
        layer_show(title,url,w,h);
    }

    /*订单修改*/
    function order_edit(title,url,w,h, id){
        if (title == null || title == '') {
            title=false;
        };
        if (url == null || url == '') {
            url="404.html";
        };
        if (w == null || w == '') {
            w=800;
        };
        if (h == null || h == '') {
            h=($(window).height() - 50);
        };
        layer.open({
            type: 2,
            area: [w+'px', h +'px'],
            fix: false, //不固定
            maxmin: true,
            shade:0.4,
            title: title,
            content: url,
            success:function (layero, index) {
                var url = "order/" + id;
                $.post(url, function(obj){
                    var body = layer.getChildFrame('body', index);
                    body.find("#id").val(obj.id);

                    // 项目选中赋值
                    body.find("#projectId").val(obj.projectId).trigger('change');
                    var optionId = "#" + obj.projectId;
                    var optionText = body.find(optionId).text();
                    body.find("#select2-projectId-container").text(optionText);
                    body.find("#orderTime").val(obj.orderTime);
                    body.find("#orderExceptionDesc").val(obj.orderExceptionDesc);
                    body.find("#deliveryTime").val(obj.deliveryTime);
                    body.find("#deliveryExceptionDesc").val(obj.deliveryExceptionDesc);
                    body.find("#receiveNum").val(obj.receiveNum);
                });
            }
        });
    }
</script>
</body>
</html>