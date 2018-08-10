<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="public/head.jsp"%>
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

	<!-- BEGIN PAGE LEVEL PLUGINS -->
	<link href="${hxycStatic}/vendors/metronic4.5.2/global/plugins/select2/css/select2.min.css" rel="stylesheet" type="text/css" />
	<link href="${hxycStatic}/vendors/metronic4.5.2/global/plugins/select2/css/select2-bootstrap.min.css" rel="stylesheet" type="text/css" />
	<!-- END PAGE LEVEL PLUGINS -->
	<title>新增用戶</title>
	<style>
		#select2-roleName-results {max-height: 80px;}
	</style>
</head>
<body>
<article class="page-container">
	<form class="form form-horizontal" id="form-user-add">
		<input type="hidden" id="id" name="id">
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3" style="text-align: right"><span class="c-red">*</span>用户名称：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" placeholder=" 请输入用户名称" id="userName" name="userName">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3" style="text-align: right"><span class="c-red">*</span>用户账号：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" placeholder=" 请输入用户账号" id="account" name="account">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3" style="text-align: right"><span class="c-red">*</span>账号角色：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<select id="roleName" class="form-control select2" name="roleName" placeholder="请选择账号角色">
					<option value="普通人员">---请选择---</option>
					<option value="管理员">管理员</option>
					<option value="招采人员">招采人员</option>
					<option value="运营人员">运营人员</option>
					<option value="结算人员">结算人员</option>
					<option value="财务人员">财务人员</option>
				</select>
			</div>
		</div>
		<div class="row cl">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
				<input class="btn btn-primary radius" type="submit" value="&nbsp;&nbsp;保存&nbsp;&nbsp;">
				<input id="delBtn" class="btn btn-primary radius" type="button" value="&nbsp;&nbsp;关闭&nbsp;&nbsp;">
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
	
	$("#form-user-add").validate({
		rules:{
			userName:{
				required:true,
				minlength:1,
				maxlength:60
			},
            account:{
                required:true,
                minlength:1,
                maxlength:60
			}
		},
		onkeyup:false,
		focusCleanup:true,
		success:"valid",
		submitHandler:function(form){
            $(form).ajaxSubmit({
                url: "user-save",
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