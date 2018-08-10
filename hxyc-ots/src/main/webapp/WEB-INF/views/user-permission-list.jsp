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
<script type="text/javascript" src="${hxycStatic}/vendors/H-ui/lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<![endif]-->
<title>公司管理</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span>系统管理<span class="c-gray en">&gt;</span>权限管理<a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
    <form id="searchForm" name="searchForm" method="get" action="user-list">
        <input type="hidden" id="companyId" name="companyId" value="">
        <div class="text-c"> 创建日期：
            <input type="text" onclick="WdatePicker()" id="datemin" name="startDate"  class="input-text Wdate" readonly style="width:120px;">
            -
            <input type="text" onclick="WdatePicker({ minDate:'#F{$dp.$D(\'datemin\')}'})" id="datemax" name="endDate"  class="input-text Wdate" readonly style="width:120px;">
            <input type="text" class="input-text" style="width:250px" name="account" placeholder="请输入用户账号">
            <button type="submit" class="btn btn-success radius" id="" name=""><i class="Hui-iconfont">&#xe665;</i> 查询</button>
        </div>
    </form>
    <shiro:hasPermission name="0301-0005">
        <div class="cl pd-5 bg-1 bk-gray mt-20">
            <%--<a href="javascript:;" onclick="deposit_sync()" class="btn btn-success radius"><i class="Hui-iconfont">&#xe640;</i> 同步数据</a>--%>
            <a href="javascript:;" onclick="user_add('添加用户','user-add','450','300')" class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i> 添加用户</a>
        </div>
    </shiro:hasPermission>
    <div class="mt-10">
        <table id="userTable" class="table table-border table-bordered table-hover table-bg table-sort">
            <thead>
                <tr class="text-c">
                    <th width="100">用户名称</th>
                    <th width="120">用户账号</th>
                    <th width="120">角色</th>
                    <th width="180">创建时间</th>
                    <th width="120">状态</th>
                    <th width="100">操作</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${userList}" var="user">
                    <tr class="text-c">
                        <td>${user.userName}</td>
                        <td>${user.account}</td>
                        <td>${user.roleName}</td>
                        <td><f:formatDate value="${user.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                        <td class="td-status">
                            <c:choose>
                                <c:when test="${user.isUse == 1}">
                                    <span class="label label-success radius">已启用</span>
                                </c:when>
                                <c:otherwise>
                                    <span class="label label-defaunt radius">已停用</span>
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td class="td-manage">
                            <c:choose>
                                <c:when test="${user.isUse == 1}">
                                    <shiro:hasPermission name="0301-0008">
                                        <a style="text-decoration:none" onClick="user_stop(this,'${user.id}')" href="javascript:;" title="停用"><i class="Hui-iconfont">&#xe631;</i></a>
                                    </shiro:hasPermission>
                                </c:when>
                                <c:otherwise>
                                    <shiro:hasPermission name="0301-0007">
                                        <a style="text-decoration:none" onClick="user_start(this,'${user.id}')" href="javascript:;" title="启用"><i class="Hui-iconfont">&#xe6e1;</i></a>
                                    </shiro:hasPermission>
                                </c:otherwise>
                            </c:choose>
                            <shiro:hasPermission name="0301-0010">
                                <a title="修改" href="javascript:;" onclick="user_edit('修改用户','user-add','450','300','${user.id}')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6df;</i></a>
                            </shiro:hasPermission>
                            <shiro:hasPermission name="0301-0009">
                                <a title="删除" href="javascript:;" onclick="user_del(this,'${user.id}')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6e2;</i></a>
                            </shiro:hasPermission>
                            <shiro:hasPermission name="0301-0006">
                                <a title="分配权限" href="javascript:;" onclick="assign_permission('分配权限', 'user-permission','', '', '${user.id}','${user.userName}','${user.account}')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe62e;</i></a>
                            </shiro:hasPermission>
                            <shiro:hasPermission name="0301-0011">
                                <a title="初始化密码" href="javascript:;" onclick="user_init(this,'${user.id}')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe63f;</i></a>
                            </shiro:hasPermission>
                        </td>
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
<script src="${hxycStatic}/js/ots/user-permission-table.js" type="text/javascript"></script>
<!-- END PAGE LEVEL SCRIPTS -->
<script type="text/javascript">
    $(function(){
        TableDatatablesScroller.init();
    });

    /*权限分配*/
    function assign_permission(title,url,w, h, id, userName, account) {
        var index = layer.open({
            type: 2,
            title: title,
            content: url,
            success:function (layero, index) {
                var body = layer.getChildFrame('body', index);
                var body = layer.getChildFrame('body', index);
                body.find("#id").val(id);
                body.find("#userName").val(userName);
                body.find("#account").val(account);
                
                var url = "permission-list/" + id;
                $.post(url, function (data) {
                    $.each(data,function(index,obj){
                        body.find("#" + obj.permissions).attr("checked", true);
                    });
                });
            }
        });
        layer.full(index);
    }

    /*添加用户*/
    function user_add(title,url,w,h){
        layer_show(title,url,w,h);
    }


    /*删除用户*/
    function user_del(obj,id){
        $.ajaxSetup({
            async : false
        });
        layer.confirm('确认要删除吗？',function(){
            var url = "user-del/" + id;
            $.post(url,function(data){
                if(data.success){
                    $(obj).parents("tr").remove();
                    window.location.reload();
                }
                layer.msg(data.message,{icon: 1,time:1000});
            });

        });
        $.ajaxSetup({
            async : true
        });
    }

    /*管理员-停用*/
    function user_stop(obj,id){
        $.ajaxSetup({
            async : false
        });
        layer.confirm('确认要停用吗？',function(){
            var url = "user-stop/" + id;
            $.post(url,function(data){
                if(data.success){
                    $(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="user_start(this, \''+ id + '\')" href="javascript:;" title="启用"><i class="Hui-iconfont">&#xe6e1;</i></a>');
                    $(obj).parents("tr").find(".td-status").html('<span class="label label-defaunt radius">已停用</span>');
                    $(obj).remove();

                }
                layer.msg(data.message,{icon: 5,time:1000});
            });
        });
        $.ajaxSetup({
            async : true
        });
    }

    /*管理员-启用*/
    function user_start(obj,id){
        $.ajaxSetup({
            async : false
        });
        layer.confirm('确认要启用吗？',function(){
            var url = "user-start/" + id;
            $.post(url,function(data){
                if(data.success){
                    $(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="user_stop(this,\''+ id + '\')" href="javascript:;" title="停用"><i class="Hui-iconfont">&#xe631;</i></a>');
                    $(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已启用</span>');
                    $(obj).remove();
                }
                layer.msg(data.message,{icon: 5,time:1000});
            });
        });
        $.ajaxSetup({
            async : true
        });
    }

    /*用户初始化*/
    function user_init(obj,id){
        $.ajaxSetup({
            async : false
        });
        layer.confirm('确认要初始化用户密码吗？',function(){
            var url = "user-init/" + id;
            $.post(url,function(data){
                if(data.success){
                    $(obj).parents("tr").remove();
                    window.location.reload();
                }
                layer.msg(data.message,{icon: 1,time:1000});
            });

        });
        $.ajaxSetup({
            async : true
        });
    }

    /*用户编辑*/
    function user_edit(title,url,w,h, id){
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
                var url = "user/" + id;
                $.post(url, function(obj){
                    var body = layer.getChildFrame('body', index);
                    body.find("#id").val(obj.id);
                    body.find("#userName").val(obj.userName);
                    body.find("#account").val(obj.account);

                    // Select2 选中赋值
                    body.find("#roleName").val(obj.roleName).trigger('change');
                    body.find("#select2-roleName-container").text(obj.roleName);
                });
            }
        });
    }
</script>
</body>
</html>