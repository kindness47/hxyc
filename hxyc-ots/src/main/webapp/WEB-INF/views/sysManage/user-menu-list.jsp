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
<script type="text/javascript" src="${hxycStatic}/vendors/H-ui/lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<![endif]-->
<title>公司管理</title>
</head>
<body>
<div><a class="btn btn-success radius r" style="line-height:0.8em;margin-top:1px;margin-right:1px;padding-left: 3px;padding-right: 3px;height: 22px;" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></div>
<div class="page-container">
   <%-- <form id="searchForm" name="searchForm" method="get" action="user-list">
        <input type="hidden" id="companyId" name="companyId" value="">
        <div class="text-c"> 创建日期：
            <input type="text" onclick="WdatePicker()" id="datemin" name="startDate"  class="input-text Wdate" readonly style="width:120px;">
            -
            <input type="text" onclick="WdatePicker({ minDate:'#F{$dp.$D(\'datemin\')}'})" id="datemax" name="endDate"  class="input-text Wdate" readonly style="width:120px;">
            <input type="text" class="input-text" style="width:250px" name="account" placeholder="请输入用户账号">
            <button type="submit" class="btn btn-success radius" id="" name=""><i class="Hui-iconfont">&#xe665;</i> 查询</button>
        </div>
    </form>--%>
    <%--<shiro:hasPermission name="0301-0005">--%>
        <div class="cl pd-5 bg-1 bk-gray mt-20">
            <%--<a href="javascript:;" onclick="deposit_sync()" class="btn btn-success radius"><i class="Hui-iconfont">&#xe640;</i> 同步数据</a>--%>
            <a href="javascript:;" onclick="menu_add('添加菜单','menu-add','450','400')" class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i> 添加菜单</a>
        </div>
    <%--</shiro:hasPermission>--%>
    <div class="mt-10">
        <table id="userTable" class="table table-border table-bordered table-hover table-bg table-sort">
            <thead>
                <tr class="text-c">
                    <th width="90">菜单名称</th>
                    <th width="80">菜单编码</th>
                    <th width="60">父级编码</th>
                    <th width="110">url</th>
                    <th width="60">菜单级别</th>
                    <th width="50">图标</th>
                    <th width="60">按钮功能</th>
                    <th width="80">排序</th>
                    <th width="80">标题</th>
                    <th width="80">创建人</th>
                    <th width="150">创建时间</th>
                    <th width="40">状态</th>
                    <th width="70">操作</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${menuList}" var="menu">
                    <tr class="text-c">
                        <td>${menu.menuName}</td>
                        <td>${menu.menuCode}</td>
                        <td>${menu.parentCode}</td>
                        <td>${menu.url}</td>
                        <td>${menu.level}</td>
                        <td><i class="Hui-iconfont">${menu.menuClass}</i></td>
                        <td>${menu.functionType}</td>
                        <td>${menu.sort}</td>
                        <td>${menu.title}</td>
                        <td>${menu.createBy}</td>
                        <td><f:formatDate value="${menu.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                        <td>
                            <c:if test="${menu.status == 1}">启用</c:if>
                            <c:if test="${menu.status == 0}">停用</c:if>
                        </td>
                        <td>
                            <c:if test="${menu.status == 1}">
                                <a title="停用" href="javascript:;" onclick="change_menu_status('停用',${menu.id})"class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe631;</i></a>
                            </c:if>
                            <c:if test="${menu.status == 0}">
                                <a title="启用" href="javascript:;" onclick="change_menu_status('启用',${menu.id})"class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe601;</i></a>
                            </c:if>
                            <a title="修改" href="javascript:;" onclick="menu_edit('修改菜单','menu-add','450','400','${menu.id}')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6df;</i></a>
                            <a title="删除" href="javascript:;" onclick="menu_del(this,'${menu.id}')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6e2;</i></a>
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
<script type="text/javascript" src="${hxycStatic}/js/ots/layui.js" charset="utf-8"></script>

<!-- BEGIN PAGE LEVEL SCRIPTS -->
<script src="${hxycStatic}/js/ots/user-permission-table.js" type="text/javascript"></script>
<!-- END PAGE LEVEL SCRIPTS -->
<script type="text/javascript">
    $(function(){
        TableDatatablesScroller.init();
    });

    /*添加菜单*/
    function menu_add(title,url,w,h){
        layer_show(title,url,w,h);
    }


    /*删除菜单*/
    function menu_del(obj,id){
        $.ajaxSetup({
            async : false
        });
        layer.confirm('确认要删除吗？',function(){
            var url = "menu-del/" + id;
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


    /*菜单编辑*/
    function menu_edit(title,url,w,h, id){
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
        var index = layer.open({
            type: 2,
            area: [w+'px', h +'px'],
            fix: false, //不固定
            maxmin: true,
            shade:0.4,
            title: title,
            content: url,
            success:function (layero, index) {
                var url = "menu/" + id;
                $.post(url, function(obj){
                    layui.use('form', function() {
                        var body = layer.getChildFrame('body', index);
                        var form = layui.form;
                        body.find("#id").val(obj.result.id);
                        body.find("#menuName").val(obj.result.menuName);
                        body.find("#title").val(obj.result.title);
                        body.find("#menuCode").val(obj.result.menuCode);
                        body.find("#url").val(obj.result.url);
                        body.find("#sort").val(obj.result.sort);
                        // Select选中赋值
                        body.find("#level").val(obj.result.level).trigger('change');
                        body.find("#level").attr("disabled",true);
                        body.find("#level").css("color","rgb(200,200,200)");
                        form.render('select');
                        body.find("#parentCode").val(obj.result.parentCode).trigger('change');
                        body.find("#menuClass").val(obj.result.menuClass).trigger('change');
                    });
                });
            }
        });
        layer.full(index);
    }

    function change_menu_status(title,id){
        layer.open({
            fix: false, //不固定
            shade: 0.4,
            title: "确认操作",
            content: "确定"+title+"此功能吗?",
            yes:function (index) {
                var url="menu-change-status/"+id;
                $.post(url,function (obj) {
                    if(obj.success){
                        layer.msg(obj.message,{icon: 1,time:1000},function () {
                            window.location.reload()
                        });
                    }
                });
                layer_close(index);
            }
        });
    }
</script>
</body>
</html>