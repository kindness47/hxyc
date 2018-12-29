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
    <title>项目详情</title>
    <style>
        #projectDetailTable {
            width: 2234px !important;
        }
    </style>
</head>
<body>
<div><a class="btn btn-success radius r" style="line-height:0.8em;margin-top:1px;margin-right:1px;padding-left: 3px;padding-right: 3px;height: 22px;" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></div>
<div class="page-container">
    <div class="mt-20">
        <table id="projectDetailTable" class="table table-border table-bordered table-hover table-bg table-sort">
            <thead>
                <tr class="text-c">
                    <th width="200">公司名称</th>
                    <th width="200">项目名称</th>
                    <th width="100">年份</th>
                    <th width="200">供应单位</th>
                    <th width="120">签订时间</th>
                    <th width="140">供货时间</th>
                    <th width="130">合同数量（T）</th>
                    <th width="170">合同金额（万元）</th>
                    <th width="120">结算模式</th>
                    <th width="240">裸价浮动值（元）</th>
                    <th width="120">垫资额</th>
                    <th width="100">垫资期限</th>
                    <th width="220">利息标准</th>
                    <th width="170">创建时间</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${projectList}" var="project">
                    <tr class="text-c">
                        <td><span class="long-text-hidden">${project.companyName}</span></td>
                        <td><span class="long-text-hidden">${project.projectName}</span></td>
                        <td>${project.year}</td>
                        <td><span class="long-text-hidden">${project.supplyUnit}</span></td>
                        <td>${project.contractSignTime}</td>
                        <td><span class="long-text-hidden" style="width: 140px">${project.supplyTime}</span></td>
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
<script src="${hxycStatic}/js/ots/project-detail-table.js" type="text/javascript"></script>
<!-- END PAGE LEVEL SCRIPTS -->
</body>
</html>