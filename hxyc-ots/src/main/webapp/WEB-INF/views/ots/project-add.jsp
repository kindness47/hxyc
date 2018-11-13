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
	<link rel="stylesheet" type="text/css" href="${hxycStatic}/vendors/metronic4.5.2/global/plugins/font-awesome/css/font-awesome.min.css"/>
	<link rel="stylesheet" type="text/css" href="${hxycStatic}/vendors/metronic4.5.2/global/plugins/bootstrap/css/bootstrap.min.css" />
	<link rel="stylesheet" type="text/css" href="${hxycStatic}/vendors/H-ui/static/h-ui.admin/skin/green/skin.css" id="skin" />
	<link rel="stylesheet" type="text/css" href="${hxycStatic}/vendors/H-ui/static/h-ui.admin/css/style.css" />
	<!--[if IE 6]>
	<script type="text/javascript" src="${hxycStatic}/vendors/H-ui/lib/DD_belatedPNG_0.0.8a-min.js" ></script>
	<![endif]-->

	<!-- BEGIN PAGE LEVEL PLUGINS -->
	<link href="${hxycStatic}/vendors/metronic4.5.2/global/plugins/bootstrap-select/css/bootstrap-select.min.css" rel="stylesheet" type="text/css" />
	<link href="${hxycStatic}/vendors/metronic4.5.2/global/plugins/select2/css/select2.min.css" rel="stylesheet" type="text/css" />
	<link href="${hxycStatic}/vendors/metronic4.5.2/global/plugins/select2/css/select2-bootstrap.min.css" rel="stylesheet" type="text/css" />
	<!-- END PAGE LEVEL PLUGINS -->
	<title>新增项目</title>
</head>
<body>
<article class="page-container">
	<form class="form form-horizontal" id="form-project-add" name="form-project-add" style="white-space:nowrap;">
		<input type="hidden" id="id" name="id" value="${project.id}" />
		<div class="row cl">
			<label class="form-label col-xs-2 col-sm-2"><span class="c-red">*</span>公司名称：</label>
			<div class="formControls col-xs-4 col-sm-4">
				<select id="companyId" class="form-control select2" name="companyId" placeholder="请选择公司名称">
					<option></option>
					<c:forEach items="${companyList}" var="company">
						<option id="${company.id}" value="${company.id}">${company.companyName}</option>
					</c:forEach>
				</select>
			</div>
			<label class="form-label col-xs-2 col-sm-2"><span class="c-red">*</span>项目名称：</label>
			<div class="formControls col-xs-4 col-sm-4">
				<input type="text" class="input-text" value="${project.projectName}" placeholder="请输入项目名称" id="projectName" name="projectName" >
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-2 col-sm-2">年份：</label>
			<div class="formControls col-xs-4 col-sm-4">
				<select id="year" class="form-control select2" name="year" placeholder="请选择年份">
					<option value="-1">---请选择---</option>
					<option value="2017">2017</option>
					<option value="2018">2018</option>
					<option value="2019">2019</option>
					<option value="2020">2020</option>
					<option value="2021">2021</option>
				</select>
			</div>
			<label class="form-label col-xs-2 col-sm-2">供应单位：</label>
			<div class="formControls col-xs-4 col-sm-4">
				<input type="text" class="input-text" value="${project.supplyUnit}" placeholder="请输入供应单位" id="supplyUnit" name="supplyUnit">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-2 col-sm-2">合同签订时间：</label>
			<div class="formControls col-xs-4 col-sm-4">
				<input type="text" onclick="WdatePicker()" id="contractSignTime" name="contractSignTime" value="${project.contractSignTime}" placeholder="请选择合同签订时间" readonly  class="input-text Wdate">
			</div>
			<label class="form-label col-xs-2 col-sm-2">供货时间段：</label>
			<div class="formControls col-xs-4 col-sm-4">
				<input type="text" class="input-text" value="${project.supplyTime}" placeholder="请输入供货时间段" id="supplyTime" name="supplyTime">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-2 col-sm-2">合同数量(T)：</label>
			<div class="formControls col-xs-4 col-sm-4">
				<input type="text" class="input-text" value="${project.contractNum}" placeholder="请输入合同数量" id="contractNum" name="contractNum">
			</div>
			<label class="form-label col-xs-2 col-sm-2">合同金额（万元）：</label>
			<div class="formControls col-xs-4 col-sm-4">
				<input type="text" class="input-text" value="${project.contractAmount}" placeholder="请输入合同金额" id="contractAmount" name="contractAmount">
			</div>
		</div>
		<div class="row cl">
			<label  class="form-label col-xs-2 col-sm-2">结算模式：</label>
			<div class="formControls col-xs-4 col-sm-4">
				<select id="settlementMode" name="settlementMode" class="bs-select form-control">
				<option value="1" <c:if test="${'1'==project.settlementMode}">selected</c:if>>信用证</option>
				<option value="2" <c:if test="${'2'==project.settlementMode}">selected</c:if>>代购</option>
				<option value="3" <c:if test="${'3'==project.settlementMode}">selected</c:if>>信用证-例外</option>
			</select>
			</div>
			<label  class="form-label col-xs-2 col-sm-2">浮动值（元）：</label>
			<div class="formControls col-xs-4 col-sm-4">
				<input type="text" class="input-text" value="${project.baseFloatValue}" placeholder="请输入基价浮动值" id="baseFloatValue" name="baseFloatValue">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-2 col-sm-2">垫资额（万元）：</label>
			<div class="formControls col-xs-4 col-sm-4">
				<input type="text" class="input-text" value="${project.extraCapitalAmount}" placeholder="请输入例外垫资" id="extraCapitalAmount" name="extraCapitalAmount">
			</div>
			<label class="form-label col-xs-2 col-sm-2">垫资期限（天）：</label>
			<div class="formControls col-xs-4 col-sm-4">
				<input type="text" class="input-text" value="${project.capitalTimeLimit}" placeholder="请输入垫资期限" id="capitalTimeLimit" name="capitalTimeLimit">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-2 col-sm-2">利息标准：</label>
			<div class="formControls col-xs-4 col-sm-4">
				<input type="text" class="input-text" value="${project.interestRate}" placeholder="请输入利息标准" id="interestRate" name="interestRate">
			</div>
			<label  class="form-label col-xs-2 col-sm-2">是否在建：</label>
			<div class="formControls col-xs-4 col-sm-4">
				<select id="completion" name="completion" class="bs-select form-control">
					<option value=fasle <c:if test="${false==project.completion}">selected</c:if>>在建</option>
					<option value=true <c:if test="${true==project.completion}">selected</c:if>>竣工</option>
				</select>
			</div>
		</div>
		<div class="row cl">
			<div style="text-align: center">
				<input id="saveBtn" class="btn btn-primary radius" type="submit" value="保存">
				<input id="delBtn" class="btn btn-primary radius" type="button" value="取消">
			</div>
		</div>
	</form>
</article>

<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="${hxycStatic}/vendors/H-ui/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="${hxycStatic}/vendors/metronic4.5.2/global/plugins/bootstrap/js/bootstrap.min.js" ></script>
<script type="text/javascript" src="${hxycStatic}/vendors/H-ui/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="${hxycStatic}/vendors/H-ui/static/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript" src="${hxycStatic}/vendors/H-ui/static/h-ui.admin/js/H-ui.admin.js"></script>

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="${hxycStatic}/vendors/H-ui/lib/My97DatePicker/4.8/WdatePicker.js"></script>
<script type="text/javascript" src="${hxycStatic}/vendors/H-ui/lib/jquery.validation/1.14.0/jquery.validate.js"></script>
<script type="text/javascript" src="${hxycStatic}/vendors/H-ui/lib/jquery.validation/1.14.0/validate-methods.js"></script>
<script type="text/javascript" src="${hxycStatic}/vendors/H-ui/lib/jquery.validation/1.14.0/messages_zh.js"></script>

<!-- BEGIN PAGE LEVEL PLUGINS -->
<script src="${hxycStatic}/vendors/metronic4.5.2//global/plugins/bootstrap-select/js/bootstrap-select.min.js" type="text/javascript"></script>
<script src="${hxycStatic}/vendors/metronic4.5.2/global/plugins/select2/js/select2.full.min.js" type="text/javascript"></script>
<script src="${hxycStatic}/vendors/metronic4.5.2/global/scripts/app.min.js" type="text/javascript"></script>
<script src="${hxycStatic}/vendors/metronic4.5.2/pages/scripts/components-bootstrap-select.min.js" type="text/javascript"></script>
<script src="${hxycStatic}/js/ots/company-select2.js" type="text/javascript"></script>
<!-- END PAGE LEVEL PLUGINS -->

<script type="text/javascript">
    $(function(){
        $('.skin-minimal input').iCheck({
            checkboxClass: 'icheckbox-blue',
            radioClass: 'iradio-blue',
            increaseArea: '20%'
        });

        $("#form-project-add").validate({
            rules:{
                companyId:{
                    required:true
                },
                projectName:{
                    required:true,
                    minlength:1,
                    maxlength:40
                }
            },
            onkeyup:false,
            focusCleanup:true,
            success:"valid",
            submitHandler: function (form) {
                $(form).ajaxSubmit({
                    url: "project-save",
                    type:"post",
                    async:false,
                    success: function (data) {
                        if (data.success) {
                            parent.layer.msg(data.message, {icon: 6, time: 2000}, function () {
                                var index = parent.layer.getFrameIndex(window.name);
                                parent.location.reload();
                                parent.layer.close(index);
                            });
                        } else {
                            parent.layer.msg(data.message, {icon: 5, time: 2000});
                        }
                    }
                });
                return false;
            }
        });

        $("#delBtn").on("click",function () {
            var index = parent.layer.getFrameIndex(window.name);
            parent.layer.close(index);
        });
    });
</script>
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>