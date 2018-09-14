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
<script type="text/javascript" src="${hxycStatic}/vendors/H-ui/lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<![endif]-->
<title>公司管理</title>
</head>
<body>
<div><a class="btn btn-success radius r" style="line-height:0.8em;margin-top:1px;margin-right:1px;padding-left: 3px;padding-right: 3px;height: 22px;" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></div>
<div class="page-container">
    <form id="searchForm" name="searchForm" method="get" action="company-list">
    <input type="hidden" id="companyId" name="companyId" value="">
	<div class="text-c"> 日期范围：
		<input type="text" onclick="WdatePicker()" id="datemin" name="sta
		rtDate"  class="input-text Wdate" readonly style="width:120px;">
		-
		<input type="text" onclick="WdatePicker({ minDate:'#F{$dp.$D(\'datemin\')}'})" id="datemax" name="endDate"  class="input-text Wdate" readonly style="width:120px;">
		<input type="text" class="input-text" style="width:250px" name="companyName" placeholder="输入公司名称">
		<button type="submit" class="btn btn-success radius" id="" name=""><i class="Hui-iconfont">&#xe665;</i> 查询</button>
	</div>
    </form>
    <shiro:hasPermission name="0101-0001">
        <div class="cl pd-5 bg-1 bk-gray mt-20">
                <%--<a href="javascript:;" onclick="deposit_sync()" class="btn btn-success radius"><i class="Hui-iconfont">&#xe640;</i> 同步数据</a>--%>
            <a href="javascript:;" onclick="company_add('新增公司','company-add','','320')" class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i> 新增公司</a>
        </div>
    </shiro:hasPermission>
    <div class="clearfix"> </div>
    <div class="mt-20">
        <table id="companyTable" class="table table-border table-bordered table-hover table-bg table-sort">
            <thead>
                <tr class="text-c">
                    <th width="100">操作</th>
                    <th width="180">公司名称</th>
                    <th width="180">公司简称</th>
                    <th width="180">上级公司</th>
                    <th width="180">创建时间</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${companyVOList}" var="companyVO">
                    <tr class="text-c">
                        <td>
                            <shiro:hasPermission name="0101-0004">
                                <a title="新增信用证" href="javascript:;" onclick="credit_add('新增信用证','credit-add','500','250','${companyVO.id}','${companyVO.companyName}')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe70d;</i></a>
                            </shiro:hasPermission>
                            <shiro:hasPermission name="0101-0002">
                                <a title="修改" href="javascript:;" onclick="company_edit('修改','company-add','','320', '${companyVO.id}')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6df;</i></a>
                            </shiro:hasPermission>
                        </td>
                        <td>${companyVO.companyName}</td>
                        <td>${companyVO.companyShortName}</td>
                        <td>${companyVO.parentCompanyName}</td>
                        <td><f:formatDate value="${companyVO.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
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
<script src="${hxycStatic}/js/ots/company-table.js" type="text/javascript"></script>
<!-- END PAGE LEVEL SCRIPTS -->
<script type="text/javascript">
    $(function(){
        TableDatatablesScroller.init();
    });

    /*新增信用证*/
    function company_add(title,url,w,h){
        layer_show(title,url,w,h);
    }

    /*新增信用证*/
    function credit_add(title,url,w,h, companyId, companyName){
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
                body.find("#companyId").val(companyId);
                body.find("#creditType").val("1");
                body.find("#openCreditDiv").text("开证公司：");
                body.find("#companyNameDiv").text(companyName);
            }
        });
    }

    /*公司编辑*/
    function company_edit(title,url,w,h, id){
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
                var url = "company/" + id;
                $.post(url, function(obj){
                    var body = layer.getChildFrame('body', index);
                    body.find("#id").val(obj.id);
                    body.find("#companyName").val(obj.companyName);
                    body.find("#companyShortName").val(obj.companyShortName);

                    // Select2 选中赋值
                    body.find("#parentId").val(obj.parentId).trigger('change');
                    var optionId = "#" + obj.parentId;
                    var optionText = body.find(optionId).text();
                    body.find("#select2-parentId-container").text(optionText);

                    body.find("#sort").val(obj.sort);
                    body.find("#level").val(obj.level);

                });
            }
        });
    }
</script>
</body>
</html>