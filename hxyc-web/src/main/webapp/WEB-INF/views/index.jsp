<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="public/head.jsp"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<link rel="Bookmark" href="/favicon.ico" >
<link rel="Shortcut Icon" href="/favicon.ico" />
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
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>华西云采系统</title>
</head>
<body>
<header class="navbar-wrapper">
	<div class="navbar navbar-fixed-top">
		<div class="container-fluid cl">
			<%--<a class="logo navbar-logo f-l mr-10 hidden-xs"><img src="${hxycStatic}/vendors/H-ui/static/h-ui.admin/images/logo.jpg" style="height:30px;"/></a>--%>
			<a class="logo navbar-logo f-l mr-10 hidden-xs" href="/aboutHui.shtml">华西云采管理系统</a>
			<a aria-hidden="false" class="nav-toggle Hui-iconfont visible-xs" href="javascript:;">&#xe667;</a>
			<nav class="nav navbar-nav">
				<ul class="cl">
					<li class="dropDown dropDown_hover"><a href="javascript:;" class="dropDown_A">一级采购</a>
						<ul class="dropDown-menu menu radius box-shadow">
							<li class="navbar-levelone"><a href="javascript:;"><i class="Hui-iconfont">&#xe616;</i> 物资采购</a></li>
							<li class="navbar-levelone current"><a href="javascript:;"><i class="Hui-iconfont">&#xe613;</i> 采购管理</a></li>
						</ul>
					</li>
					<li class="dropDown dropDown_hover"><a href="javascript:;" class="dropDown_A">二级采购</a>
						<ul class="dropDown-menu menu radius box-shadow">
							<li class="navbar-levelone current"><a href="javascript:;"><i class="Hui-iconfont">&#xe616;</i> 物资采购</a></li>
							<li class="navbar-levelone"><a href="javascript:;"><i class="Hui-iconfont">&#xe613;</i> 劳务分包</a></li>
							<li class="navbar-levelone"><a href="javascript:;"><i class="Hui-iconfont">&#xe620;</i> 专业分包</a></li>
							<li class="navbar-levelone"><a href="javascript:;"><i class="Hui-iconfont">&#xe60d;</i> 设备租赁</a></li>
						</ul>
					</li>
				</ul>
			</nav>
			<nav id="Hui-userbar" class="nav navbar-nav navbar-userbar hidden-xs">
				<ul class="cl">
					<li>超级管理员</li>
					<li class="dropDown dropDown_hover">
						<a href="#" class="dropDown_A">admin <i class="Hui-iconfont">&#xe6d5;</i></a>
						<ul class="dropDown-menu menu radius box-shadow">
							<li><a href="#">退出</a></li>
						</ul>
					</li>
					<li id="Hui-msg"> <a href="#" title="消息"><span class="badge badge-danger">1</span><i class="Hui-iconfont" style="font-size:18px">&#xe68a;</i></a> </li>
				</ul>
			</nav>
	</div>
</div>
</header>
<aside class="Hui-aside">
	<div class="menu_dropdown bk_2">
		<dl id="menu-base">
			<dt class="selected"><i class="Hui-iconfont">&#xe616;</i> 基础管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd style="display: block;">
				<ul>
					<li><a data-href="deposit-list" data-title="部门管理" href="javascript:void(0)">部门管理</a></li>
					<li><a data-href="deposit-list" data-title="岗位管理" href="javascript:void(0)">岗位管理</a></li>
					<li><a data-href="deposit-list" data-title="用户管理" href="javascript:void(0)">用户管理</a></li>
				</ul>
			</dd>
		</dl>
		<dl id="menu-article">
			<dt><i class="Hui-iconfont">&#xe613;</i> 采购管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd style="display: none;">
				<ul>
					<li><a data-href="deposit-list" data-title="保证金管理" href="javascript:void(0)">保证金管理</a></li>
				</ul>
		  	</dd>
	    </dl>
		<dl id="menu-right">
			<dt><i class="Hui-iconfont">&#xe62d;</i> 权限管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd style="display: none;">
				<ul>
					<li><a data-href="deposit-list" data-title="功能管理" href="javascript:void(0)">功能管理</a></li>
					<li><a data-href="deposit-list" data-title="菜单管理" href="javascript:void(0)">菜单管理</a></li>
					<li><a data-href="deposit-list" data-title="角色管理" href="javascript:void(0)">角色管理</a></li>
					<li><a data-href="deposit-list" data-title="用户权限" href="javascript:void(0)">用户权限</a></li>
					<li><a data-href="deposit-list" data-title="数据权限" href="javascript:void(0)">数据权限</a></li>
				</ul>
			</dd>
		</dl>
		<dl id="menu-system">
			<dt><i class="Hui-iconfont">&#xe62e;</i> 系统管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd style="display: none;">
				<ul>
					<li><a data-href="deposit-list" data-title="数据字典" href="javascript:void(0)">数据字典</a></li>
					<li><a data-href="deposit-list" data-title="系统日志" href="javascript:void(0)">系统日志</a></li>
				</ul>
			</dd>
		</dl>
	</div>
	<div class="menu_dropdown bk_2" style="display:none">
		<dl id="menu-aaaaa">
			<dt><i class="Hui-iconfont">&#xe616;</i> 二级导航1<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li><a data-href="deposit-list" data-title="资讯管理" href="javascript:void(0)">三级导航</a></li>
				</ul>
			</dd>
		</dl>
	</div>

	<div class="menu_dropdown bk_2" style="display:none">
		<dl id="menu-bbbbb">
			<dt><i class="Hui-iconfont">&#xe616;</i> 二级导航2<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li><a data-href="deposit-list" data-title="资讯管理" href="javascript:void(0)">三级导航</a></li>
				</ul>
			</dd>
		</dl>
	</div>

	<div class="menu_dropdown bk_2" style="display:none">
		<dl id="menu-ccccc">
			<dt><i class="Hui-iconfont">&#xe616;</i> 二级导航3<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li><a data-href="deposit-list" data-title="资讯管理" href="javascript:void(0)">三级导航</a></li>
				</ul>
			</dd>
		</dl>
	</div>

	<div class="menu_dropdown bk_2" style="display:none">
		<dl id="menu-ddddd">
			<dt><i class="Hui-iconfont">&#xe616;</i> 二级导航4<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li><a data-href="deposit-list" data-title="资讯管理" href="javascript:void(0)">三级导航</a></li>
				</ul>
			</dd>
		</dl>
	</div>

	<div class="menu_dropdown bk_2" style="display:none">
		<dl id="menu-eeeee">
			<dt><i class="Hui-iconfont">&#xe616;</i> 二级导航5<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li><a data-href="deposit-list" data-title="资讯管理" href="javascript:void(0)">三级导航</a></li>
				</ul>
			</dd>
		</dl>
	</div>
</aside>
<div class="dislpayArrow hidden-xs"><a class="pngfix" href="javascript:void(0);" onClick="displaynavbar(this)"></a></div>
<section class="Hui-article-box">
	<div id="Hui-tabNav" class="Hui-tabNav hidden-xs">
		<div class="Hui-tabNav-wp">
			<ul id="min_title_list" class="acrossTab cl">
				<li class="active">
					<span title="我的桌面" data-href="welcome.html">我的桌面</span>
					<em></em></li>
		</ul>
	</div>
		<div class="Hui-tabNav-more btn-group"><a id="js-tabNav-prev" class="btn radius btn-default size-S" href="javascript:;"><i class="Hui-iconfont">&#xe6d4;</i></a><a id="js-tabNav-next" class="btn radius btn-default size-S" href="javascript:;"><i class="Hui-iconfont">&#xe6d7;</i></a></div>
</div>
	<div id="iframe_box" class="Hui-article">
		<div class="show_iframe">
			<div style="display:none" class="loading"></div>
			<iframe scrolling="yes" frameborder="0" src="welcome"></iframe>
	</div>
</div>
</section>

<div class="contextMenu" id="Huiadminmenu">
	<ul>
		<li id="closethis">关闭当前 </li>
		<li id="closeall">关闭全部 </li>
</ul>
</div>
<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="${hxycStatic}/vendors/H-ui/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="${hxycStatic}/vendors/H-ui/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="${hxycStatic}/vendors/H-ui/static/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript" src="${hxycStatic}/vendors/H-ui/static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="${hxycStatic}/vendors/H-ui/lib/jquery.contextmenu/jquery.contextmenu.r2.js"></script>
<script type="text/javascript">
$(function(){
    $("body").Huitab({
        tabBar:".navbar-wrapper .navbar-levelone",
        tabCon:".Hui-aside .menu_dropdown",
        className:"current",
        index:0,
    });
});
</script> 

</body>
</html>