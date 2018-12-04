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
	<title>新增菜单</title>
	<style>
		#select2-roleName-results {max-height: 80px;}
		.select{height: 30px !important;}
	</style>
</head>
<body>

<article class="page-container">
	<form class="form form-horizontal" id="form-user-add">
		<input type="hidden" id="id" name="id">
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3" style="text-align: right"><span class="c-red">*</span>菜单名称：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" placeholder="请输入菜单名称" id="menuName" name="menuName">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3" style="text-align: right"><span class="c-red">*</span>菜单层级：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<select id="level" class="form-control select" name="level" onchange="changeLevel()">
					<option value="2">一级目录</option>
					<option value="3">二级目录</option>
					<option value="4">页面级</option>
				</select>
			</div>
		</div>
		<div class="row cl menu-title-div">
			<label class="form-label col-xs-4 col-sm-3" style="text-align: right">显示标题：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" placeholder="请输入显示标题" id="title" name="title">
			</div>
		</div>
		<div class="row cl parent-code-select hidden">
			<label class="form-label col-xs-4 col-sm-3" style="text-align: right"><span class="c-red">*</span>父级目录：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<select id="parentCode" class="form-control select" name="parentCode" onchange="changeLevel()">
					<option value="0">--- 非一级目录必选 ---</option>
					<c:forEach items="${menus}" var="menu">
						<c:if test="${menu.level != '4'}">
							<option value="${menu.menuCode}">${menu.menuName}</option>
						</c:if>
					</c:forEach>
				</select>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3" style="text-align: right"><span class="c-red">*</span>菜单编码：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" placeholder="请输入菜单编码" id="menuCode" name="menuCode">
			</div>
		</div>
		<div class="row cl menu-class-icon">
			<label class="form-label col-xs-4 col-sm-3" style="text-align: right">菜单图标：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<select id="menuClass" class="form-control select" name="menuClass">
					<option value="">--- 一级目录选择(内置图标) ---</option>
					<option value="&-#xe603;" class="Hui-iconfont">&#xe603;</option>
					<option value="&-#xe617;" class="Hui-iconfont">&#xe617;</option>
					<option value="&-#xe720;" class="Hui-iconfont">&#xe720;</option>
					<option value="&-#xe6bd;" class="Hui-iconfont">&#xe6bd;</option>
					<option value="&-#xe641;" class="Hui-iconfont">&#xe641;</option>
				</select>
			</div>
		</div>
		<div class="row cl menu-url hidden ">
			<label class="form-label col-xs-4 col-sm-3" style="text-align: right">菜单url：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" placeholder="二级菜单必填" id="url" name="url">
			</div>
		</div>
		<div class="row cl hidden function-type-select">
			<label class="form-label col-xs-4 col-sm-3" style="text-align: right">按钮功能：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<select id="functionType" class="form-control select" name="functionType">
					<option value="0">通用控制</option>
					<option value="1">按钮</option>
					<option value="2">图标按钮</option>
				</select>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3" style="text-align: right">排序：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" placeholder="请输入菜单排序,非必需,默认0" id="sort" name="sort">
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
            menuName:{
				required:true,
				minlength:1,
				maxlength:60
			},
            level:{
                required:true
			},
            menuCode:{
                required:true
			}
		},
		onkeyup:false,
		focusCleanup:true,
		success:"valid",
		submitHandler:function(form){
            $(form).ajaxSubmit({
                url: "menu-save",
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
                },
				error:function () {
                    parent.layer.msg("系统错误", {icon: 5, time: 2000});
                }
            });
            return false;
		}
	});
});
function changeLevel(){
    var level = $("#level").val();

    //LEVEL1菜单目录(一级目录);LEVEL2功能菜单(二级目录);LEVEL3菜单功能(页面级)
    var LEVEL1 = '2',LEVEL2 = '3',LEVEL3 = '4';

    if(level != LEVEL1){
        $(".menu-class-icon").removeClass("block").addClass("hidden");
        $(".parent-code-select").removeClass("hidden").addClass("block");
	}else {
        $(".menu-class-icon").removeClass("hidden").addClass("block");
        $(".parent-code-select").removeClass("block").addClass("hidden");
    }
    if(level == LEVEL2)
        $(".menu-url").removeClass("hidden").addClass("block");
	else
        $(".menu-url").removeClass("block").addClass("hidden");
    if(level == LEVEL3){
        $(".menu-title-div").removeClass("block").addClass("hidden");
    	$(".function-type-select").removeClass("hidden").addClass("block");
    }else {
        $(".menu-title-div").removeClass("hidden").addClass("block");
        $(".function-type-select").removeClass("block").addClass("hidden");
    }
	/*if($("#level").prop("disabled")){

	}*/
}
</script> 
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>