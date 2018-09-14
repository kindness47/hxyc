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
<!--[if lt IE 9]>
<script type="text/javascript" src="${hxycStatic}/vendors/H-ui/lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<![endif]-->
<title>收款管理</title>
</head>
<body>
<div><a class="btn btn-success radius r" style="line-height:0.8em;margin-top:1px;margin-right:1px;padding-left: 3px;padding-right: 3px;height: 22px;" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></div>
<div class="page-container">
    <form id="searchForm" name="searchForm" method="get" action="receipt-list">
        <input type="hidden" id="companyId" name="companyId" value="">
        <div class="text-c"> 收款日期：
            <input type="text" onclick="WdatePicker()" id="datemin" name="startDate"  class="input-text Wdate" readonly style="width:120px;">
            -
            <input type="text" onclick="WdatePicker({ minDate:'#F{$dp.$D(\'datemin\')}'})" id="datemax" name="endDate"  class="input-text Wdate" readonly style="width:120px;">
            <input type="text" class="input-text" style="width:250px" name="receiptAmount" value="${receipt.receiptAmount}" placeholder="请输入收款金额">
            <button type="submit" class="btn btn-success radius" id="queryBtn" name=""><i class="Hui-iconfont">&#xe665;</i> 查询</button>
        </div>
    </form>
    <div class="clearfix"> </div>
    <div class="mt-20">
        <table id="receiptTable" class="table table-border table-bordered table-hover table-bg table-sort">
            <thead>
                <tr class="text-c">
                    <th width="100">操作</th>
                    <th width="180">项目名称</th>
                    <th width="180">公司名称</th>
                    <th width="180">收款金额</th>
                    <th width="180">收款时期</th>
                    <th width="180">创建时间</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${receiptList}" var="receipt">
                    <tr class="text-c">
                        <td>
                            <shiro:hasPermission name="0205-0002">
                                <a title="修改收款信息" href="javascript:;" onclick="receipt_edit('修改收款信息','receipt-add','500','250','${receipt.id}')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6df;</i></a>
                            </shiro:hasPermission>
                        </td>
                        <td>${receipt.projectName}</td>
                        <td>${receipt.companyName}</td>
                        <td>${receipt.receiptAmount}</td>
                        <td><f:formatDate value="${receipt.receiptTime}" pattern="yyyy-MM-dd"/></td>
                        <td><f:formatDate value="${receipt.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
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
<script type="text/javascript" src="${hxycStatic}/vendors/H-ui/lib/jquery.validation/1.14.0/jquery.validate.js"></script>
<script type="text/javascript" src="${hxycStatic}/vendors/H-ui/lib/jquery.validation/1.14.0/validate-methods.js"></script>
<script type="text/javascript" src="${hxycStatic}/vendors/H-ui/lib/jquery.validation/1.14.0/messages_zh.js"></script>

<!-- BEGIN PAGE LEVEL SCRIPTS -->
<script src="${hxycStatic}/js/ots/receipt-table.js" type="text/javascript"></script>
<!-- END PAGE LEVEL SCRIPTS -->
<script type="text/javascript">
    $(function(){
        TableDatatablesScroller.init();

        // 查询验证
        $("#searchForm").validate({
            rules:{
                receiptAmount: {
                    digits: true
                }
            },
            onkeyup:false,
            focusCleanup:true,
            success:"valid"
        });
    });


    /*信用证修改*/
    function receipt_edit(title,url,w,h,id){
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
                var body = layer.getChildFrame('body', index);
                var url = "receipt/" + id;
                $.post(url, function(obj){
                    var body = layer.getChildFrame('body', index);
                    body.find("#id").val(obj.id);
                    body.find("#companyId").val(obj.companyId);
                    body.find("#companyNameDiv").text(obj.companyName);
                    body.find("#receiptAmount").val(obj.receiptAmount);
                    body.find("#receiptTime").val(obj.receiptTime);
                });
            }
        });
    }
</script>
</body>
</html>