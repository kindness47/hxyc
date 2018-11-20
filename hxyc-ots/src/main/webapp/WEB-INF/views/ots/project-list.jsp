<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../public/head.jsp"%>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="utf-8">
    <!--[if lt IE 9]>
    <script type="text/javascript" src="${hxycStatic}/vendors/H-ui/lib/html5shiv.js"></script>
    <script type="text/javascript" src="${hxycStatic}/vendors/H-ui/lib/respond.min.js"></script>
    <![endif]-->
    <link rel="stylesheet" type="text/css" href="${hxycStatic}/vendors/H-ui/static/h-ui/css/H-ui.min.css" />
    <link rel="stylesheet" type="text/css" href="${hxycStatic}/vendors/H-ui/static/h-ui.admin/css/H-ui.admin.css" />
    <link rel="stylesheet" type="text/css" href="${hxycStatic}/vendors/H-ui/lib/Hui-iconfont/1.0.8/iconfont.css" />
    <link rel="stylesheet" type="text/css" href="${hxycStatic}/vendors/H-ui/static/h-ui.admin/skin/green/skin.css" id="skin" />
    <link rel="stylesheet" type="text/css" href="${hxycStatic}/vendors/H-ui/static/h-ui.admin/css/style.css" />
    <link rel="stylesheet" type="text/css" href="${hxycStatic}/js/ots/css/ots-table.css" />
    <script type="text/javascript" src="${hxycStatic}/vendors/H-ui/lib/DD_belatedPNG_0.0.8a-min.js" ></script>
    <![endif]-->
    <title>项目管理</title>
    <style>
        #projectTable{
            width: 2234px !important;
        }
    </style>
</head>
<body>
<div><a class="btn btn-success radius r" style="line-height:0.8em;margin-top:1px;margin-right:1px;padding-left: 3px;padding-right: 3px;height: 22px;" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></div>
<div class="page-container">
    <form id="searchForm" name="searchForm" method="get" action="project-list">
	<div class="text-c"> 日期范围：
        <input type="text" onclick="WdatePicker()" id="datemin" name="startDate"  class="input-text Wdate" readonly style="width:120px;">
        -
        <input type="text" onclick="WdatePicker({ minDate:'#F{$dp.$D(\'datemin\')}'})" id="datemax" name="endDate"  class="input-text Wdate" readonly style="width:120px;">
		<input type="text" class="input-text" id="projectName" name="projectName" style="width:250px" placeholder="输入项目名称">
		<button type="submit" class="btn btn-success radius"><i class="Hui-iconfont">&#xe665;</i> 查询</button>
        <shiro:hasPermission name="0201-0006">
            <a href="project/exportExcel" class="btn btn-primary upload-btn"><i class="Hui-iconfont">&#xe642;</i> 导出</a>
        </shiro:hasPermission>
	</div>
    </form>
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
                    <th width="80">操作</th>
                    <th width="180">公司名称</th>
                    <th width="180">项目名称</th>
                    <th width="80">年份</th>
                    <th width="120">供应单位</th>
                    <th width="100">签订时间</th>
                    <th width="120">供货时间</th>
                    <th width="80">合同数量（T）</th>
                    <th width="80">合同金额（万元）</th>
                    <th width="100">结算模式</th>
                    <th width="80">浮动值（元）</th>
                    <th width="100">垫资额</th>
                    <th width="80">垫资期限</th>
                    <th width="200">利息标准</th>
                    <th width="150">创建时间</th>
                    <th width="50">是否完工</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${projectList}" var="project">
                    <tr class="text-c">
                        <td>
                            <shiro:hasPermission name="0201-0004">
                                <a title="新增信用证" href="javascript:;" onclick="credit_add('新增信用证','credit-add','500','250','${project.companyId}', '${project.id}', '${project.projectName}')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe70d;</i></a>
                            </shiro:hasPermission>
                            <shiro:hasPermission name="0201-0003">
                                <a title="收款" href="javascript:;" onclick="receipt_add('新增收款','receipt-add','500','250','${project.companyId}','${project.id}', '${project.projectName}')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe63a;</i></a>
                            </shiro:hasPermission>
                            <shiro:hasPermission name="0201-0002">
                                <a title="编辑" onclick="project_edit('编辑','project-add','','380','${project.id}')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6df;</i></a>
                            </shiro:hasPermission>
                        </td>
                        <td><span class="long-text-hidden">${project.companyName}</span></td>
                        <td><span class="long-text-hidden">${project.projectName}</span></td>
                        <td>${project.year}</td>
                        <td><span class="long-text-hidden">${project.supplyUnit}</span></td>
                        <td>${project.contractSignTime}</td>
                        <td><span class="long-text-hidden" style="width: 80px">${project.supplyTime}</span></td>
                        <td>${project.contractNum}</td>
                        <td>${project.contractAmount}</td>
                        <td>
                            <c:choose>
                                <c:when test="${project.settlementMode == '2'}">代购</c:when>
                                <c:when test="${project.settlementMode == '3'}">信用证-例外</c:when>
                                <c:otherwise>信用证</c:otherwise>
                            </c:choose>
                        </td>
                        <td>${project.baseFloatValue}</td>
                        <td>${project.extraCapitalAmount}</td>
                        <td>${project.capitalTimeLimit}</td>
                        <td><span class="long-text-hidden">${project.interestRate}</span></td>
                        <td><f:formatDate value="${project.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                        <td>
                            <c:choose>
                            <c:when test="${project.completion == false}">在建</c:when>
                            <c:when test="${project.completion == true}">竣工</c:when>
                        </c:choose></td>
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

    /*新增项目*/
    function project_add(title,url,w,h){
        layer_show(title,url,w,h);
    }

    /*新增信用证*/
    function credit_add(title,url,w,h, companyId, projectId, projectName){
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
                body.find("#projectId").val(projectId);
                body.find("#creditType").val("2");
                body.find("#openCreditDiv").text("开证项目：");
                body.find("#companyNameDiv").text(projectName);
            }
        });
    }

    /*新增收款*/
    function receipt_add(title,url,w,h,companyId,projectId, projectName){
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
                body.find("#projectId").val(projectId);
                body.find("#companyNameDiv").text(projectName);
                body.find('input[name="companyId"]').val(companyId);
            }
        });
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
                    body.find("#supplyTime").val(obj.supplyTime);
                    body.find("#contractNum").val(obj.contractNum);
                    body.find("#contractAmount").val(obj.contractAmount);
                    body.find("#settlementModel").val(obj.settlementModel);
                    body.find("#baseFloatValue").val(obj.baseFloatValue);
                    body.find("#extraCapitalAmount").val(obj.extraCapitalAmount);
                    body.find("#capitalTimeLimit").val(obj.capitalTimeLimit);
                    body.find("#interestRate").val(obj.interestRate);
                    body.find("#settlementMode").val(obj.settlementMode).trigger('change');
                    body.find("#completion").val(obj.completion);
                });
            }
        });
    }
</script>
</body>
</html>