
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
	<!--[if IE 6]>
	<script type="text/javascript" src="${hxycStatic}/vendors/H-ui/lib/DD_belatedPNG_0.0.8a-min.js" ></script>
	<![endif]-->

	<!-- BEGIN PAGE LEVEL PLUGINS -->
	<link href="${hxycStatic}/vendors/metronic4.5.2/global/plugins/select2/css/select2.min.css" rel="stylesheet" type="text/css" />
	<link href="${hxycStatic}/vendors/metronic4.5.2/global/plugins/select2/css/select2-bootstrap.min.css" rel="stylesheet" type="text/css" />
	<!-- END PAGE LEVEL PLUGINS -->
	<title>新增项目</title>
	<style>
		#select2-projectId-results {max-height: 100px;}
	</style>
</head>
<body>
<article class="page-container">
	<form class="form form-horizontal" id="form-order-add" style="white-space:nowrap;">
		<input type="hidden" id="id" name="id" value="${project.id}">
		<div class="row cl">
			<label class="form-label col-xs-2 col-sm-2"><span class="c-red">*</span>项目：</label>
			<div class="form-group formControls col-xs-10 col-sm-10">
				<select id="projectId" class="form-control select2" name="projectId">
					<option></option>
					<c:forEach items="${projectList}" var="project">
						<option id="${project.id}" value="${project.id}">${project.projectName}</option>
					</c:forEach>
				</select>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-2 col-sm-2"><span class="c-red">*</span>订单批次号：</label>
			<div class="form-group formControls col-xs-10 col-sm-10">
				<input type="text" class="input-text" value="${order.orderBatchNo}" placeholder="请输入订批次号" id="orderBatchNo" name="orderBatchNo">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-2 col-sm-2">订单时间：</label>
			<div class="form-group formControls col-xs-4 col-sm-4">
				<input type="text"  onclick="WdatePicker()" readonly id="orderTime" name="orderTime" class="input-text Wdate">
			</div>
			<label class="form-label col-xs-2 col-sm-2">验收数量(T)：</label>
			<div class="form-group formControls col-xs-4 col-sm-4">
				<input type="text" class="input-text" value="${order.receiveNum}" placeholder="请输入验证数量" id="receiveNum" name="receiveNum">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-2 col-sm-2">交验时间：</label>
			<div class="formControls col-xs-10 col-sm-10">
				<input type="text" onclick="WdatePicker()" readonly  id="deliveryTime" name="deliveryTime" class="input-text Wdate" style="width:37%;">
				<select id="deliveryStatus" name="deliveryStatus" value="${order.deliveryStatus}" style="width: 10%;">
					<option value="1" <c:if test="${1==order.deliveryStatus}">selected</c:if>>正常</option>
					<option value="0" <c:if test="${0==order.deliveryStatus}">selected</c:if>>异常</option>
				</select>
				<input type="text" class="input-text" value="${order.deliveryExceptionDesc}" placeholder="交验说明" id="deliveryExceptionDesc" name="deliveryExceptionDesc" style="width: 51%;">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-2 col-sm-2">质量：</label>
			<div class="formControls col-xs-4 col-sm-4">
				<select id="quality" name="quality" value="${order.quality}">
					<option value="1" <c:if test="${1==order.quality}">selected</c:if>>好</option>
					<option value="0" <c:if test="${0==order.quality}">selected</c:if>>差</option>
				</select>
				<input type="text" class="input-text" value="${order.qualityRemark}" placeholder="质量备注" id="qualityRemark" name="qualityRemark" style="width: 82%;">
			</div>
			<label class="form-label col-xs-2 col-sm-2">服务：</label>
			<div class="formControls col-xs-4 col-sm-4">
				<select id="service" name="service" value="${order.service}">
					<option value="1" <c:if test="${1==order.service}">selected</c:if>>好</option>
					<option value="0" <c:if test="${0==order.service}">selected</c:if>>差</option>
				</select>
				<input type="text" class="input-text" value="${order.serviceRemark}" placeholder="服务备注" id="serviceRemark" name="serviceRemark" style="width: 82%;">
			</div>
		</div>
		<div class="row cl">
			<div class="col-xs-10 col-sm-10 col-xs-offset-2 col-sm-offset-2">
				<input class="btn btn-primary radius" type="submit" value="&nbsp;&nbsp;保存&nbsp;&nbsp;">
				<input id="delBtn" class="btn btn-primary radius" type="button" value="&nbsp;&nbsp;取消&nbsp;&nbsp;">
			</div>
		</div>
	</form>
</article>

<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="${hxycStatic}/vendors/H-ui/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="${hxycStatic}/vendors/H-ui/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="${hxycStatic}/vendors/H-ui/static/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript" src="${hxycStatic}/vendors/H-ui/static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本--> 
<script type="text/javascript" src="${hxycStatic}/vendors/H-ui/lib/My97DatePicker/4.8/WdatePicker.js"></script>
<script type="text/javascript" src="${hxycStatic}/vendors/H-ui/lib/jquery.validation/1.14.0/jquery.validate.js"></script>
<script type="text/javascript" src="${hxycStatic}/vendors/H-ui/lib/jquery.validation/1.14.0/validate-methods.js"></script>
<script type="text/javascript" src="${hxycStatic}/vendors/H-ui/lib/jquery.validation/1.14.0/messages_zh.js"></script>

<!-- BEGIN PAGE LEVEL PLUGINS -->
<script src="${hxycStatic}/vendors/metronic4.5.2/global/plugins/select2/js/select2.full.min.js" type="text/javascript"></script>
<script src="${hxycStatic}/vendors/metronic4.5.2/global/scripts/app.min.js" type="text/javascript"></script>
<script src="${hxycStatic}/js/ots/company-add-select2.js" type="text/javascript"></script>
<!-- END PAGE LEVEL PLUGINS -->

<script type="text/javascript">

$(function(){
	$('.skin-minimal input').iCheck({
		checkboxClass: 'icheckbox-blue',
		radioClass: 'iradio-blue',
		increaseArea: '20%'
	});

    $("#delBtn").on("click",function () {
        var index = parent.layer.getFrameIndex(window.name);
        parent.layer.close(index);
    });
	
	$("#form-order-add").validate({
		onkeyup:false,
		focusCleanup:true,
		success:"valid",
		submitHandler:function(form){
            $(form).ajaxSubmit({
                url: "order-save",
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
});
</script> 
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>