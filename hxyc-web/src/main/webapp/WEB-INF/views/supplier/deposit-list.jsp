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
<!--[if IE 6]>
<script type="text/javascript" src="${hxycStatic}/vendors/H-ui/lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<![endif]-->
<title>保证金退款</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 采购管理 <span class="c-gray en">&gt;</span> 保证金管理 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<div class="text-c"> 日期范围：
		<input type="text" onfocus="WdatePicker({ maxDate:'#F{$dp.$D(\'datemax\')||\'%y-%M-%d\'}' })" id="datemin" class="input-text Wdate" style="width:120px;">
		-
		<input type="text" onfocus="WdatePicker({ minDate:'#F{$dp.$D(\'datemin\')}',maxDate:'%y-%M-%d' })" id="datemax" class="input-text Wdate" style="width:120px;">
		<input type="text" class="input-text" style="width:250px" placeholder="输入项目名称">
		<button type="submit" class="btn btn-success radius" id="" name=""><i class="Hui-iconfont">&#xe665;</i> 查询</button>
	</div>
	<div class="cl pd-5 bg-1 bk-gray mt-20"><span class="l">
        <a href="javascript:;" onclick="deposit_sync()" class="btn btn-success radius"><i class="Hui-iconfont">&#xe640;</i> 同步数据</a>
        <a href="javascript:;" onclick="" class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i> 批量退款</a>
    </span></div>

    <div class="clearfix"> </div>
    <div class="mt-20">
        <table id="depositTable" class="table table-border table-bordered table-hover table-bg table-sort">
            <thead>
                <tr class="text-c">
                    <th width="30"><input id="checkboxAll" type="checkbox" name="" value=""></th>
                    <th width="180">招标编号</th>
                    <th width="230">招标名称</th>
                    <th width="180">项目名称</th>
                    <th width="180">供应商</th>
                    <th width="120">联系人</th>
                    <th width="80">联系电话</th>
                    <th width="100">邮箱</th>
                    <th width="80">付费类型</th>
                    <th width="120">子账号</th>
                    <th width="180">收款人</th>
                    <th width="230">交易流水号</th>
                    <th width="80">交易金额</th>
                    <th width="120">保证金状态</th>
                    <th width="180">付款方开户行</th>
                    <th width="100">付款人</th>
                    <th width="180">付款人账号</th>
                    <th width="100">联行号</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${depositList}" var="supplierDeposit">
                    <tr class="text-c">
                        <td><input type="checkbox" value="${supplierDeposit.id}"></td>
                        <td>${supplierDeposit.tenderCode}</td>
                        <td>${supplierDeposit.tenderName}</td>
                        <td>${supplierDeposit.projectName}</td>
                        <td>${supplierDeposit.supplierName}</td>
                        <td>${supplierDeposit.contactPerson}</td>
                        <td>${supplierDeposit.mobile}</td>
                        <td>${supplierDeposit.email}</td>
                        <td>${supplierDeposit.accType}</td>
                        <td>${supplierDeposit.payeeAccNo}</td>
                        <td>${supplierDeposit.payeeAccName}</td>
                        <td>${supplierDeposit.payeesEq}</td>
                        <td>${supplierDeposit.tranAmount}</td>
                        <td>${supplierDeposit.depositStatus}</td>
                        <td>${supplierDeposit.draweePartyName}</td>
                        <td>${supplierDeposit.draweeAccName}</td>
                        <td>${supplierDeposit.draweeAccNo}</td>
                        <td>${supplierDeposit.draweePartyId}</td>
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
<script src="${hxycStatic}/vendors/metronic4.5.2/pages/scripts/table-datatables-scroller.js" type="text/javascript"></script>
<!-- END PAGE LEVEL SCRIPTS -->
<script type="text/javascript">
$(function(){
    TableDatatablesScroller.init();
});

/*用户-停用*/
function deposit_sync(){
    $.ajaxSetup({
        async : false
    });
    parent.layer.confirm('确认从集采库同步数据吗？',function(){
        var url = 'deposit-sync';
        $.post(url,function(data){
            if(data.success){
                parent.layer.msg('同步成功!',{icon: 5,time:1000});
                window.location.reload();
            }
            parent.layer.msg(data.message,{icon: 1,time:1000});
        });

    });
    $.ajaxSetup({
        async : true
    });
}
</script>
</body>
</html>