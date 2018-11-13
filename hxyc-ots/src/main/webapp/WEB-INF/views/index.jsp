<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="public/head.jsp"%>
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
<link rel="stylesheet" type="text/css" href="${hxycStatic}/vendors/H-ui/static/h-ui.admin/css/style.css" />
<link rel="stylesheet" type="text/css" href="${hxycStatic}/vendors/H-ui/static/h-ui.admin/skin/green/skin.css"/>
<!--[if IE 6]>
<script type="text/javascript" src="${hxycStatic}/vendors/H-ui/lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>订单跟踪系统</title>
</head>
<body>
<header class="navbar-wrapper">
	<div class="navbar navbar-fixed-top">
		<div class="container-fluid cl">
			<%--<a class="logo navbar-logo f-l mr-10 hidden-xs"><img src="${hxycStatic}/vendors/H-ui/static/h-ui.admin/images/logo.jpg" style="height:30px;"/></a>--%>
			<a class="logo navbar-logo f-l mr-10 hidden-xs" href="#">订单跟踪系统</a>
			<a aria-hidden="false" class="nav-toggle Hui-iconfont visible-xs" href="javascript:;">&#xe667;</a>
			<nav id="Hui-userbar" class="nav navbar-nav navbar-userbar hidden-xs">
				<ul class="cl">
					<li>${user.roleName}</li>
					<li class="dropDown dropDown_hover">
						<a href="#" class="dropDown_A">${user.userName} <i class="Hui-iconfont">&#xe6d5;</i></a>
						<ul class="dropDown-menu menu radius box-shadow">
							<li><a href="javascript:;" onclick="user_mod('账号修改', 'user-mod','450','300')">账号修改</a></li>
							<li><a href="logout">退出</a></li>
						</ul>
					</li>
				</ul>
			</nav>
	</div>
</div>
</header>
<aside class="Hui-aside">
	<div class="menu_dropdown bk_2">
		<dl id="menu-base">
			<shiro:hasPermission name="01">
				<dt><i class="Hui-iconfont">&#xe61a;</i> 基础信息<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			</shiro:hasPermission>
			<dd>
				<ul>
					<shiro:hasPermission name="0101">
						<li><a data-href="company-list" data-title="公司管理" href="javascript:void(0)">公司管理</a></li>
					</shiro:hasPermission>
					<shiro:hasPermission name="0102">
						<li><a data-href="credit-list" data-title="信用证管理" href="javascript:void(0)">信用证管理</a></li>
					</shiro:hasPermission>
				</ul>
			</dd>
		</dl>
		<dl id="menu-order">
			<shiro:hasPermission name="02">
				<dt><i class="Hui-iconfont">&#xe616;</i> 订单跟踪<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			</shiro:hasPermission>
			<dd style="display: none;">
				<ul>
					<shiro:hasPermission name="0201">
                    	<li><a data-href="project-list" data-title="项目管理" href="javascript:void(0)">项目管理</a></li>
					</shiro:hasPermission>
					<shiro:hasPermission name="0202">
                    	<li><a data-href="order-list" data-title="订单管理" href="javascript:void(0)">订单管理</a></li>
					</shiro:hasPermission>
					<shiro:hasPermission name="0203">
                    	<li><a data-href="settlement-list" data-title="结算管理" href="javascript:void(0)">结算管理</a></li>
					</shiro:hasPermission>
					<shiro:hasPermission name="0204">
                    	<li><a data-href="payment-list" data-title="支付管理" href="javascript:void(0)">支付管理</a></li>
					</shiro:hasPermission>
					<shiro:hasPermission name="0205">
                    	<li><a data-href="receipt-list" data-title="收款管理" href="javascript:void(0)">收款管理</a></li>
					</shiro:hasPermission>
					<shiro:hasPermission name="0206">
					<li><a data-href="order-aduit" data-title="订单追踪" href="javascript:void(0)">订单追踪</a></li>
					</shiro:hasPermission>
					<shiro:hasPermission name="0206">
						<li><a data-href="order-archiving" data-title="归档订单" href="javascript:void(0)">归档订单</a></li>
					</shiro:hasPermission>
                    <shiro:hasPermission name="0206">
                        <li><a data-href="order-exception" data-title="异常订单" href="javascript:void(0)">异常订单</a></li>
                    </shiro:hasPermission>
				</ul>
			</dd>
		</dl>
        <dl id="menu-system">
			<shiro:hasPermission name="03">
           	<dt><i class="Hui-iconfont">&#xe62d;</i> 系统管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			</shiro:hasPermission>
            <dd>
                <ul>
					<shiro:hasPermission name="0301">
                    	<li><a data-href="user-list" data-title="权限管理" href="javascript:void(0)">权限管理</a></li>
					</shiro:hasPermission>
					<shiro:hasPermission name="0302">
                    	<li><a data-href="company-list" data-title="系统日志" href="javascript:void(0)">系统日志</a></li>
					</shiro:hasPermission>
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
					<em></em>
				</li>
			</ul>
		</div>
		<div class="Hui-tabNav-more btn-group">
			<a id="js-tabNav-prev" class="btn radius btn-default size-S" href="javascript:;"><i class="Hui-iconfont">&#xe6d4;</i></a><a id="js-tabNav-next" class="btn radius btn-default size-S" href="javascript:;"><i class="Hui-iconfont">&#xe6d7;</i></a>
		</div>
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
/*账号修改*/
function user_mod(title,url,w,h){
    layer_show(title,url,w,h);
}
</script>

</body>
</html>