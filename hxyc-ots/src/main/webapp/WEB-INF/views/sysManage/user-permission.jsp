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

	<!-- BEGIN PAGE LEVEL PLUGINS -->
	<link href="${hxycStatic}/vendors/metronic4.5.2/global/plugins/select2/css/select2.min.css" rel="stylesheet" type="text/css" />
	<link href="${hxycStatic}/vendors/metronic4.5.2/global/plugins/select2/css/select2-bootstrap.min.css" rel="stylesheet" type="text/css" />
	<!-- END PAGE LEVEL PLUGINS -->
	<title>权限分配</title>
	<style>
		#select2-parentId-results {max-height: 100px;}
	</style>
</head>
<body>
<article class="page-container">
	<form class="form form-horizontal" id="form-user-permission-assign">
		<input type="hidden" id="id" name="id" value="1">
		<div class="row cl">
			<label class="form-label col-xs-2 col-sm-2">用户名：</label>
			<div class="formControls col-xs-4 col-sm-4">
				<input type="text" class="input-text" value="admin"  id="userName" name="userName">
			</div>
			<label class="form-label col-xs-2 col-sm-2" style="margin: right;">账号：</label>
			<div class="formControls col-xs-4 col-sm-4">
				<input type="text" class="input-text" value="admin" id="account" name="account">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-2 col-sm-2">菜单功能：</label>
			<div class="formControls col-xs-10 col-sm-10">
				<shiro:hasPermission name="01">
					<dl class="permission-list">
						<dt><label><input type="checkbox" value="01" name="BaseInfo" id="01">基础信息</label></dt>
						<dd>
							<shiro:hasPermission name="0101">
								<dl class="cl permission-list2">
									<dt><label class=""><input type="checkbox" value="0101" name="user-Character-0-0" id="0101">公司管理</label></dt>
									<dd>
										<shiro:hasPermission name="0101-0001">
											<label class=""><input type="checkbox" value="0101-0001" name="user-Character-0-0-0" id="0101-0001">新增</label>
										</shiro:hasPermission>
										<shiro:hasPermission name="0101-0002">
											<label class=""><input type="checkbox" value="0101-0002" name="user-Character-0-0-0" id="0101-0002">修改</label>
										</shiro:hasPermission>
										<shiro:hasPermission name="0101-0003">
											<label class=""><input type="checkbox" value="0101-0003" name="user-Character-0-0-0" id="0101-0003">收款</label>
										</shiro:hasPermission>
										<shiro:hasPermission name="0101-0004">
											<label class=""><input type="checkbox" value="0101-0004" name="user-Character-0-0-0" id="0101-0004">信用证</label>
										</shiro:hasPermission>
									</dd>
								</dl>
							</shiro:hasPermission>
							<shiro:hasPermission name="0102">
							<dl class="cl permission-list2">
								<shiro:hasPermission name="0102">
									<dt><label class=""><input type="checkbox" value="0102" name="user-Character-0-1" id="0102">信用证管理</label></dt>
								</shiro:hasPermission>
								<shiro:hasPermission name="0102-0002">
								<dd>
									<label class=""><input type="checkbox" value="0102-0002" name="user-Character-0-1-0" id="0102-0002">修改</label>
								</dd>
								</shiro:hasPermission>
							</dl>
							</shiro:hasPermission>
						</dd>
					</dl>
				</shiro:hasPermission>
				<shiro:hasPermission name="02">
				<dl class="permission-list">
					<dt><label><input type="checkbox" value="02" name="user-Character-0" id="02">订单跟踪</label></dt>
					<dd>
						<shiro:hasPermission name="0201">
						<dl class="cl permission-list2">
							<dt>
								<label class=""><input type="checkbox" value="0201" name="user-Character-1-0" id="0201">项目管理</label>
							</dt>
							<dd>
								<shiro:hasPermission name="0201-0001">
									<label class=""><input type="checkbox" value="0201-0001" name="user-Character-1-0-0" id="0201-0001">新增</label>
								</shiro:hasPermission>
								<shiro:hasPermission name="0201-0002">
									<label class=""><input type="checkbox" value="0201-0002" name="user-Character-1-0-0" id="0201-0002">修改</label>
								</shiro:hasPermission>
							</dd>
						</dl>
						</shiro:hasPermission>
						<shiro:hasPermission name="0202">
						<dl class="cl permission-list2">
							<dt>
								<label class=""><input type="checkbox" value="0202" name="user-Character-1-0" id="0202">订单管理</label>
							</dt>
							<dd>
								<shiro:hasPermission name="0202-0001">
									<label class=""><input type="checkbox" value="0202-0001" name="user-Character-1-0-0" id="0202-0001">新增</label>
								</shiro:hasPermission>
								<shiro:hasPermission name="0202-0002">
									<label class=""><input type="checkbox" value="0202-0002" name="user-Character-1-0-0" id="0202-0002">修改</label>
								</shiro:hasPermission>
							</dd>
						</dl>
						</shiro:hasPermission>
						<shiro:hasPermission name="0203">
							<dl class="cl permission-list2">
								<dt>
									<label class=""><input type="checkbox" value="0203" name="user-Character-1-0" id="0203">结算管理</label>
								</dt>
								<dd>
									<shiro:hasPermission name="0203-0001">
										<label class=""><input type="checkbox" value="0203-0001" name="user-Character-1-0-0" id="0203-0001">新增</label>
									</shiro:hasPermission>
									<shiro:hasPermission name="0203-0002">
										<label class=""><input type="checkbox" value="0203-0002" name="user-Character-1-0-0" id="0203-0002">修改</label>
									</shiro:hasPermission>
								</dd>
							</dl>
						</shiro:hasPermission>
						<shiro:hasPermission name="0204">
						<dl class="cl permission-list2">
							<dt>
								<label class=""><input type="checkbox" value="0204" name="user-Character-1-0" id="0204">支付管理</label>
							</dt>
							<dd>
								<shiro:hasPermission name="0204-0001">
									<label class=""><input type="checkbox" value="0204-0001" name="user-Character-1-0-0" id="0204-0001">新增</label>
								</shiro:hasPermission>
								<shiro:hasPermission name="0204-0002">
									<label class=""><input type="checkbox" value="0204-0002" name="user-Character-1-0-0" id="0204-0002">修改</label>
								</shiro:hasPermission>
							</dd>
						</dl>
						</shiro:hasPermission>
						<shiro:hasPermission name="0205">
						<dl class="cl permission-list2">
							<dt>
								<label class=""><input type="checkbox" value="0205" name="user-Character-1-0" id="0205">收款管理</label>
							</dt>
							<dd>
								<shiro:hasPermission name="0205-0002">
									<label class=""><input type="checkbox" value="0205-0002" name="0202-0002" id="0205-0002">修改</label>
								</shiro:hasPermission>
							</dd>
						</dl>
						</shiro:hasPermission>
					</dd>
				</dl>
				</shiro:hasPermission>
				<shiro:hasPermission name="03">
				<dl class="permission-list">
					<dt><label><input type="checkbox" value="03" name="user-Character-0" id="03">系统管理</label></dt>
					<dd>
						<shiro:hasPermission name="0301">
							<dl class="cl permission-list2">
								<dt>
									<label class=""><input type="checkbox" value="0301" name="user-Character-1-0" id="0301">权限管理</label>
								</dt>
								<dd>
									<shiro:hasPermission name="0301-0005">
										<label class=""><input type="checkbox" value="0301-0005" name="user-Character-1-0-0" id="0301-0005">添加用户</label>
									</shiro:hasPermission>
									<shiro:hasPermission name="0301-0006">
										<label class=""><input type="checkbox" value="0301-0006" name="user-Character-1-0-0" id="0301-0006">分配权限</label>
									</shiro:hasPermission>
									<shiro:hasPermission name="0301-0007">
										<label class=""><input type="checkbox" value="0301-0007" name="user-Character-1-0-0" id="0301-0007">启用</label>
									</shiro:hasPermission>
									<shiro:hasPermission name="0301-0008">
										<label class=""><input type="checkbox" value="0301-0008" name="user-Character-1-0-0" id="0301-0008">停用</label>
									</shiro:hasPermission>
									<shiro:hasPermission name="0301-0010">
										<label class=""><input type="checkbox" value="0301-0010" name="user-Character-1-0-0" id="0301-0010">编辑</label>
									</shiro:hasPermission>
									<shiro:hasPermission name="0301-0009">
										<label class=""><input type="checkbox" value="0301-0009" name="user-Character-1-0-0" id="0301-0009">删除</label>
									</shiro:hasPermission>
									<shiro:hasPermission name="0301-0011">
										<label class=""><input type="checkbox" value="0301-0011" name="user-Character-1-0-0" id="0301-0011">密码初始化</label>
									</shiro:hasPermission>
								</dd>
							</dl>
						</shiro:hasPermission>
						<shiro:hasPermission name="0302">
							<dl class="cl permission-list2">
								<dt>
									<label class=""><input type="checkbox" value="0302" name="user-Character-1-0" id="0302">系统日志</label>
								</dt>
							</dl>
						</shiro:hasPermission>
					</dd>
				</dl>
				</shiro:hasPermission>
			</div>
		</div>
		<div class="row cl">
			<div class="col-xs-10 col-sm-10 col-xs-offset-2 col-sm-offset-2">
				<button type="button" class="btn btn-success radius" id="saveBtn" name="admin-role-save"><i class="icon-ok"></i>保存</button>
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

	// 菜单功能级联
    $(".permission-list dt input:checkbox").click(function(){
        $(this).closest("dl").find("dd input:checkbox").prop("checked",$(this).prop("checked"));
    });
    $(".permission-list2 dt input:checkbox").click(function () {
        var len=$(this).parents(".permission-list").find(".permission-list2").find("dt input:checked").length;
        if($(this).prop("checked")) {
            $(this).parents(".permission-list").find("dt").first().find("input:checkbox").prop("checked",true);
		} else {
            if(len==0) {
                $(this).parents(".permission-list").find("dt").first().find("input:checkbox").prop("checked",false);
			}
		}
    });
    $(".permission-list2 dd input:checkbox").click(function(){
        var l =$(this).parent().parent().find("input:checked").length;
        var l2=$(this).parents(".permission-list").find(".permission-list2 dd").find("input:checked").length;
        if($(this).prop("checked")){
            $(this).closest("dl").find("dt input:checkbox").prop("checked",true);
            $(this).parents(".permission-list").find("dt").first().find("input:checkbox").prop("checked",true);
        } else{
            if(l==0){
                $(this).closest("dl").find("dt input:checkbox").prop("checked",false);
            }
            if(l2==0){
                $(this).parents(".permission-list").find("dt").first().find("input:checkbox").prop("checked",false);
            }
        }
    });
	
	$("#saveBtn").click(function () {
	    var id=$("#id").val();
	    if(id=='') {
            layer.msg("分配权限账号不存在！", {icon: 5, time: 2000});
            return false;
		}
	    var chk_value=[];
        $(".permission-list input:checkbox:checked").each(function () {
            chk_value.push($(this).val());
        });
        var params = {
            userId: id,
            permissions: JSON.stringify(chk_value)
		};
        $.ajaxSetup({
            async : false
        });
        $.post("permission-save",params,function(data) {
           if (data.success) {
                layer.msg(data.message, {icon: 6, time: 2000});
            } else {
                layer.msg(data.message, {icon: 5, time: 2000});
            }
        });
        $.ajaxSetup({
            async : true
        });
    });
});
</script> 
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>