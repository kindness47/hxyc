﻿﻿<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    <link rel="stylesheet" type="text/css" href="${hxycStatic}/js/ots/css/layui.css"  media="all">
    <link rel="stylesheet" type="text/css" href="${hxycStatic}/js/ots/css/ots-table.css" />
    <link rel="stylesheet" href="${hxycStatic}/vendors/H-ui/lib/zTree/v3/css/zTreeStyle/zTreeStyle.css" type="text/css">
    <script type="text/javascript" src="${hxycStatic}/vendors/H-ui/lib/DD_belatedPNG_0.0.8a-min.js" ></script>
    <![endif]-->
    <title>订单审查</title>
    <style type="text/css">
        .Hui-aside{position: absolute;top:-3px;bottom:0;left:0;padding-top:10px;width:200px;z-index:99;overflow:auto; background-color:rgba(238,238,238,0.5);border-right: 1px solid #e5e5e5;border-radius:1%}
        .Hui-article-box{position: absolute;top:-3px;right:0px;bottom: 0;left:200px; overflow:hidden; z-index:1; background-color:#fff;border-radius:1%}
        .row{box-sizing:border-box;margin-left:0px !important;margin-right:0px !important;}
    </style>
</head>
<body>
<%--
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 订单跟踪 <span class="c-gray en">&gt;</span> 订单审查 <a class="btn btn-success radius r" style="line-height:0.8em;margin-top:1px;margin-right:1px;padding-left: 3px;padding-right: 3px;height: 22px;" href="javascript:location.replace(location.href);" onclick="location.replace(location.href)" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
--%>

<aside class="Hui-aside">
    <ul id="compDeptTree" class="ztree"></ul>
</aside>
<div class="dislpayArrow hidden-xs"><a class="pngfix" href="javascript:void(0);" onClick="displaynavbar(this)"></a></div>
<section class="Hui-article-box">
    <div id="iframe_box" class="Hui-article" style="margin-left: 20px">

        <script type="text/html" id="toolbarDemo">
            <div class="demoTable">
                <div class="row cl">
                    <div class="col-xs-2 col-sm-2">搜索项目：</div>
                    <div class="form-group formControls col-xs-2 col-sm-2">
                        <input class="input-text radius size-M" name="id" placeholder="输入公司名称" id="companyName" autocomplete="off">
                    </div>
                    <div class="form-group formControls col-xs-2 col-sm-2">
                        <input class="input-text radius size-M" name="id" placeholder="输入项目名称" id="projectName" autocomplete="off">
                    </div>
                    <button class="layui-btn layui-btn-sm" data-type="reload">搜索</button>

                    <shiro:hasPermission name="0206-0002">
                        <button class="layui-btn layui-btn-sm" lay-event="getFinish">
                            <i class="layui-icon">&#xe605;</i>归档
                        </button>
                    </shiro:hasPermission>
                   <%--
                   <a class="btn btn-success radius r" style="line-height:0.8em;margin-top:1px;margin-right:1px;padding-left: 3px;padding-right: 3px;height: 22px;" href="javascript:location.replace(location.href);" onclick="location.replace(location.href)" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a>
                    --%>
                </div>
            </div>
        </script>
        <table id="projectTable" class="layui-hide" lay-filter="demotable"></table>

        <script type="text/html" id="view">
            <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="view">查看</a>
        </script>
    </div>
</section>

<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="${hxycStatic}/vendors/H-ui/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="${hxycStatic}/vendors/H-ui/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="${hxycStatic}/vendors/H-ui/static/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript" src="${hxycStatic}/vendors/H-ui/static/h-ui.admin/js/H-ui.admin.js"></script>
<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="${hxycStatic}/js/ots/layui.js" charset="utf-8"></script>

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="${hxycStatic}/vendors/H-ui/lib/My97DatePicker/4.8/WdatePicker.js"></script>
<!-- BEGIN PAGE LEVEL SCRIPTS -->
<script type="text/javascript" src="${hxycStatic}/vendors/H-ui/lib/zTree/v3/js/jquery.ztree.all-3.5.min.js"></script>
<!-- END PAGE LEVEL SCRIPTS -->
<script type="text/javascript">
    $(function(){
        $("[data-toggle='tooltip']").tooltip();
        $("body").Huitab({
            tabBar:".navbar-wrapper .navbar-levelone",
            tabCon:".Hui-aside .menu_dropdown",
            className:"current",
            index:0,
        });
        //初始化机构树
        initCompDeptTree();
    });
    var setting = {
        view: {
            dblClickExpand: false,
            showLine: false,
            selectedMulti: false
        },
        data: {
            simpleData: {
                enable:true,
                idKey: "id",
                pIdKey: "parentId",
                rootPId: ""
            },
            key: {
                name: "companyShortName"
            }
        },
        callback: {
            onClick:findCompanyProject
        }
    };

    function findCompanyProject(event, treeId, treeNode, clickFlag) {
        if (treeNode.level == 0){
            initProjectTable2('');
            return;
        }
        initProjectTable2(treeNode.id);
    }

    var zNodes =[
        { id:1, pId:0, name:"一级分类", open:true},
        { id:11, pId:1, name:"二级分类"},
        { id:111, pId:11, name:"三级分类"},
        { id:112, pId:11, name:"三级分类"},
        { id:113, pId:11, name:"三级分类"},
        { id:114, pId:11, name:"三级分类"},
        { id:115, pId:11, name:"三级分类"},
        { id:12, pId:1, name:"二级分类 1-2"},
        { id:121, pId:12, name:"三级分类 1-2-1"},
        { id:122, pId:12, name:"三级分类 1-2-2"},
    ];

    function initCompDeptTree(){
        $.ajax({
            url: '${hxycStatic}/company-tree-list-by-status?completion=' + false,
            type: 'get',
            dataType:'json',
            async:false,
            success: function(msg) {
                var result = msg.result;
                zNodes = result;
            },
            error:function (msg) {
                alert('失败，'+msg.message);
            }
        });
        var t = $("#compDeptTree");
        t = $.fn.zTree.init(t, setting, zNodes);
        //t.expandAll(true);
        var treeObj = $.fn.zTree.getZTreeObj("compDeptTree");
        var nodeList = treeObj.getNodes();
        treeObj.expandNode(nodeList[0], true);
        //默认返回所有项目信息
        //var node = treeObj.getNodesByFilter(function (node) { return node.level == 0 }, true);
        initProjectTable2('');
    }

    function initProjectTable2(companyId) {
        var requrl = '${hxycStatic}/project-list-by-param?completion=false';
        if ('' != companyId){
            requrl = '${hxycStatic}/project-list-by-param?companyId='+companyId+'&completion=false';
        }
        layui.use('table', function(){
            var laytable = layui.table;
            //渲染
            laytable.render({
                elem: '#projectTable'
                ,height: 550
                ,url: requrl
                ,toolbar:'#toolbarDemo'
                //,size: 'sm'
                ,page: true
                ,limit: 10
                ,cols: [[
                    {title:'选择',type: 'radio', fixed: 'left'},
                    {title:'操作', toolbar: '#view', width:66},
                    {field:'companyName', title:'公司名称', width:211, sort: true},
                    {field:'projectName', title:'项目名称', width:520, sort: true}

                ]]
            });

            //监听工具条
            laytable.on('tool(demotable)', function(obj){
                var data = obj.data;
                if(obj.event === 'view'){
                    layer.msg('选择项目：'+ data.projectName );
                    //layer_show(data.projectName,'showView?projectId='+data.projectId,800,600);
                    var index = layer.open({
                        type: 2,
                        content:'aduit-list?projectId='+data.id,
                        area: ['800px', '500px'],
                        title: data.projectName+' --订单跟踪详情',
                        maxmin: true,
                        closeBtn:1
                    });
                    layer.full(index);
                }
            });
            //头工具栏事件
            laytable.on('toolbar(demotable)', function(obj){
                var checkStatus = laytable.checkStatus(obj.config.id);
                switch(obj.event){
                    case 'getFinish':
                        var data = checkStatus.data;
                        var jsonData = JSON.stringify(data);
                        //layer.alert(jsonData);
                        layer.open({
                            title:'提示信息'
                            ,content:'是否设置为已完成'
                            ,yes:function () {
                                getFinish(jsonData);
                            }
                        });
                        break;
                };
            });

            var $ = layui.$, active = {
                reload: function(){
                    var projectName = $('#projectName');
                    var companyName = $('#companyName');
                    //执行重载
                    laytable.reload('projectTable', {
                        page: {
                            curr: 1 //重新从第 1 页开始
                        }
                        ,where: {
                            projectName: projectName.val(),
                            companyName: companyName.val(),
                        }
                    });
                }
            };

            $('.demoTable .layui-btn').on('click', function(){
                var type = $(this).data('type');
                active[type] ? active[type].call(this) : '';
            });
        });
    }
    var getFinish = function (jsonData) {
        $.ajax({
            url: '${hxycStatic}/project-list-setfinish',
            type: 'get',
            data:{"jsonData":jsonData},
            dataType:'json',
            async:false,
            success: function(msg) {
                layer.open({
                    title:'操作结果'
                    ,content:'成功'
                    , end: function () {
                        location.reload();
                    }
                });
            },
            error:function (msg) {
                layer.open({
                    title:'操作结果'
                    ,content:'失败'
                    , end: function () {
                        location.reload();
                    }
                });
            }
        });
    }
</script>
</body>
</html>