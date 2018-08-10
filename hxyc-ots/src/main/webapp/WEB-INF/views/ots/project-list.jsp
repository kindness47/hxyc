<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../public/head.jsp"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
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
<title>项目管理</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 订单跟踪 <span class="c-gray en">&gt;</span> 项目管理 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<div class="text-c"> 日期范围：
		<input type="text" onfocus="WdatePicker({ maxDate:'#F{$dp.$D(\'datemax\')||\'%y-%M-%d\'}' })" id="datemin" class="input-text Wdate" style="width:120px;">
		-
		<input type="text" onfocus="WdatePicker({ minDate:'#F{$dp.$D(\'datemin\')}',maxDate:'%y-%M-%d' })" id="datemax" class="input-text Wdate" style="width:120px;">
		<input type="text" class="input-text" style="width:250px" placeholder="输入项目名称">
		<button type="submit" class="btn btn-success radius" id="" name=""><i class="Hui-iconfont">&#xe665;</i> 查询</button>
	</div>
    <shiro:hasPermission name="0201-0001">
	<div class="cl pd-5 bg-1 bk-gray mt-20">
        <%--<a href="javascript:;" onclick="deposit_sync()" class="btn btn-success radius"><i class="Hui-iconfont">&#xe640;</i> 同步数据</a>--%>
        <a href="javascript:;" onclick="project_add('新增项目','project-add','','380')" class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i> 新增项目</a>
    </div>
    </shiro:hasPermission>
    <div class="clearfix"> </div>
    <div class="mt-20">
        <table id="projectTable" class="table table-border table-bordered table-hover table-bg table-sort">
            <thead>
                <tr class="text-c">
                    <th width="60">操作</th>
                    <th width="180">公司名称</th>
                    <th width="180">项目名称</th>
                    <th width="180">年份</th>
                    <th width="180">供应单位</th>
                    <th width="180">合同签订时间</th>
                    <th width="180">供货时间段</th>
                    <th width="180">合同数量（T）</th>
                    <th width="180">合同金额（万元）</th>
                    <th width="180">结算模式</th>
                    <th width="180">基价浮动值</th>
                    <th width="180">例外垫资额度</th>
                    <th width="180">垫资期限</th>
                    <th width="180">利息标准</th>
                    <th width="180">创建时间</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${projectList}" var="project">
                    <tr class="text-c">
                        <td>
                            <shiro:hasPermission name="0201-0002">
                                <a title="编辑" onclick="project_edit('修改信用证','project-add','','380','${project.id}')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6df;</i></a>
                            </shiro:hasPermission>
                        </td>
                        <td>${project.companyName}</td>
                        <td>${project.projectName}</td>
                        <td>${project.year}</td>
                        <td>${project.supplyUnit}</td>
                        <td>${project.contractSignTime}</td>
                        <td>${project.supplyTime}</td>
                        <td>${project.contractNum}</td>
                        <td>${project.contractAmount}</td>
                        <td>${project.settlementModel}</td>
                        <td>${project.baseFloatValue}</td>
                        <td>${project.extraCapitalAmount}</td>
                        <td>${project.capitalTimeLimit}</td>
                        <td>${project.interestRate}</td>
                        <td><f:formatDate value="${project.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
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
<script src="${hxycStatic}/js/ots/project-table.js" type="text/javascript"></script>
<!-- END PAGE LEVEL SCRIPTS -->
<script type="text/javascript">
    $(function(){
        TableDatatablesScroller.init();
    });

    /*新增项目*/
    function project_add(title,url,w,h){
        layer_show(title,url,w,h);
    }

    /*项目修改*/
    function project_edit(title,url,w,h,id){
        if (title == null || title === '') {
            title=false;
        };
        if (url == null || url === '') {
            url="404.html";
        };
        if (w == null || w === '') {
            w=800;
        };
        if (h == null || h === '') {
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
                var url = "project/" + id;
                $.post(url, function(obj){
                    var body = layer.getChildFrame('body', index);
                    // 公司赋值
                    body.find("#companyId").val(obj.companyId).trigger('change');
                    var optionId = "#" + obj.companyId;
                    var optionText = body.find(optionId).text();
                    body.find("#select2-companyId-container").text(optionText);

                    // 年份
                    body.find("#year").val(obj.year).trigger('change');
                    body.find("#select2-year-container").text(obj.year);

                    body.find("#id").val(obj.id);
                    body.find("#projectName").val(obj.projectName);
                    body.find("#supplyUnit").val(obj.supplyUnit);
                    body.find("#contractSignTime").val(obj.contractSignTime);
                    body.find("#supplyTime").val(obj.contractNum);
                    body.find("#contractNum").val(obj.contractNum);
                    body.find("#contractAmount").val(obj.contractAmount);
                    body.find("#settlementModel").val(obj.settlementModel);
                    body.find("#baseFloatValue").val(obj.baseFloatValue);
                    body.find("#extraCapitalAmount").val(obj.extraCapitalAmount);
                    body.find("#capitalTimeLimit").val(obj.capitalTimeLimit);
                    body.find("#interestRate").val(obj.interestRate);
                });
            }
        });
    }
</script>
</body>
</html>