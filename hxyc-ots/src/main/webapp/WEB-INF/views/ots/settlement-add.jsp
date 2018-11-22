<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../public/head.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
	<link rel="stylesheet" type="text/css"  href="${hxycStatic}/vendors/H-ui/lib/zTree/v3/css/zTreeStyle/zTreeStyle.css" />
	<!--[if IE 6]>
	<script type="text/javascript" src="${hxycStatic}/vendors/H-ui/lib/DD_belatedPNG_0.0.8a-min.js" ></script>
	<![endif]-->
	<title>新增结算单</title>
	<style type="text/css">
		.layui-table-page {
			position:fixed;
			width: 380px;
		}
		.modal-dialog{
			width: 850px;
		}
	</style>
</head>
<body>
<article class="page-container">
	<form class="form form-horizontal" id="form-settlement-add" style="white-space:nowrap;" action="${hxycStatic}/settlement-save" method="post">
		<input type="hidden" id="id" name="id" value="${settlementVO.id}" />
		<div class="row cl">
			<label class="form-label col-xs-2 col-sm-2"><span class="c-red">*</span>项目名称(点击选择)：</label>
			<div class="formControls col-xs-4 col-sm-4">
				<input type="text" class="input-text" style="display: none" value="${settlementVO.companyId}"  id="companyId" name="companyId" >
				<input type="text" class="input-text" style="display: none" value="${settlementVO.projectId}"  id="projectId" name="projectId" >
				<input type="text" class="input-text" readonly id="projectSelect" placeholder="选择项目" value="${settlementVO.projectName}" />
			</div>
			<label class="form-label col-xs-2 col-sm-2"><span class="c-red">*</span>订单号(点击选择)：</label>
			<div class="formControls col-xs-4 col-sm-4">
				<input type="text" class="input-text hidden" readonly value="${settlementVO.orderId}" placeholder="" id="orderId" name="orderId">
				<input type="text" class="input-text" readonly id="orderNoSelect" placeholder="选择订单" value="${settlementVO.orderId}" />
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-2 col-sm-2"><span class="c-red">*</span>结算单号：</label>
			<div class="formControls col-xs-8 col-sm-8">
				<input type="text" class="input-text" value="${settlementVO.settlementCode}" placeholder="" id="settlementCode" name="settlementCode" >
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-2 col-sm-2"><span class="c-red">*</span>供方结算时间：</label>
			<div class="formControls col-xs-4 col-sm-4">
				<input type="text" onfocus="WdatePicker({ maxDate:'#F{\'%y-%M-%d\'}' })" readonly value="<fmt:formatDate value="${settlementVO.supplierSettlementTime}" pattern="yyyy-MM-dd" ></fmt:formatDate>" id="supplierSettlementTime" name="supplierSettlementTime" class="input-text Wdate">
			</div>
			<label class="form-label col-xs-2 col-sm-2"><span class="c-red">*</span>供方结算状态：</label>
			<div class="formControls col-xs-4 col-sm-4">
				<select id="supplierSettlementStatus" name="supplierSettlementStatus" value="${settlementVO.supplierSettlementStatus}">
					<option value="1" <c:if test="${1==settlementVO.supplierSettlementStatus}">selected</c:if>>正常</option>
					<option value="2" <c:if test="${2==settlementVO.supplierSettlementStatus}">selected</c:if>>异常</option>
				</select>
				<input type="text" class="input-text" value="${settlementVO.supplierSettlementRemark}" placeholder="情况说明" id="supplierSettlementRemark" name="supplierSettlementRemark">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-2 col-sm-2"><span class="c-red">*</span>供方结算单据送达时间：</label>
			<div class="formControls col-xs-4 col-sm-4">
				<input type="text" onfocus="WdatePicker({ maxDate:'#F{\'%y-%M-%d\'}' })" readonly value="<fmt:formatDate value="${settlementVO.settlementDeliveryTime}" pattern="yyyy-MM-dd" ></fmt:formatDate>" id="settlementDeliveryTime" name="settlementDeliveryTime" class="input-text Wdate">
			</div>
			<label class="form-label col-xs-2 col-sm-2"><span class="c-red">*</span>供方结算单据送达状态：</label>
			<div class="formControls col-xs-4 col-sm-4">
				<select id="settlementDeliveryStatus" name="settlementDeliveryStatus">
					<option value="1" <c:if test="${1==settlementVO.settlementDeliveryStatus}">selected</c:if>>正常</option>
					<option value="2" <c:if test="${2==settlementVO.settlementDeliveryStatus}">selected</c:if>>异常</option>
				</select>
				<input type="text" class="input-text" value="${settlementVO.settlementDeliveryRemark}" placeholder="情况说明" id="settlementDeliveryRemark" name="settlementDeliveryRemark">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-2 col-sm-2"><span class="c-red">*</span>供方发票送达时间：</label>
			<div class="formControls col-xs-4 col-sm-4">
				<input type="text" onfocus="WdatePicker({ maxDate:'#F{\'%y-%M-%d\'}' })" readonly value="<fmt:formatDate value="${settlementVO.billDeliveryTime}" pattern="yyyy-MM-dd" ></fmt:formatDate>" id="billDeliveryTime" name="billDeliveryTime" class="input-text Wdate">
			</div>
			<label class="form-label col-xs-2 col-sm-2"><span class="c-red">*</span>供方发票送达状态：</label>
			<div class="formControls col-xs-4 col-sm-4">
				<select id="billDeliveryStatus" name="billDeliveryStatus">
					<option value="1" <c:if test="${1==settlementVO.billDeliveryStatus}">selected</c:if>>正常</option>
					<option value="2" <c:if test="${2==settlementVO.billDeliveryStatus}">selected</c:if>>异常</option>
				</select>
				<input type="text" class="input-text" value="${settlementVO.billDeliveryRemark}" placeholder="情况说明" id="billDeliveryRemark" name="billDeliveryRemark">
			</div>
		</div>
		<div class="row cl">
			<label  class="form-label col-xs-2 col-sm-2"><span class="c-red">*</span>需方结算时间：</label>
			<div class="formControls col-xs-4 col-sm-4">
				<input type="text" onfocus="WdatePicker({ maxDate:'#F{\'%y-%M-%d\'}' })" readonly value="<fmt:formatDate value="${settlementVO.buyerSettlementTime}" pattern="yyyy-MM-dd" ></fmt:formatDate>" id="buyerSettlementTime" name="buyerSettlementTime" class="input-text Wdate">
			</div>
			<label  class="form-label col-xs-2 col-sm-2"><span class="c-red">*</span>需方结算状态：</label>
			<div class="formControls col-xs-4 col-sm-4">
				<select id="buyerSettlementStatus" name="buyerSettlementStatus">
					<option value="1" <c:if test="${1==settlementVO.buyerSettlementStatus}">selected</c:if>>正常</option>
					<option value="2" <c:if test="${2==settlementVO.buyerSettlementStatus}">selected</c:if>>异常</option>
				</select>
				<input type="text" class="input-text" value="${settlementVO.buyerSettlementRemark}" placeholder="情况说明" id="buyerSettlementRemark" name="buyerSettlementRemark">
			</div>
		</div>
		<%--<div class="row cl">--%>
			<%--<label class="form-label col-xs-2 col-sm-2"><span class="c-red">*</span>发票开立时间：</label>--%>
			<%--<div class="formControls col-xs-4 col-sm-4">--%>
				<%--<input type="text" onfocus="WdatePicker({ maxDate:'#F{\'%y-%M-%d\'}' })" readonly value="<fmt:formatDate value="${settlementVO.billOpenTime}" pattern="yyyy-MM-dd" ></fmt:formatDate>" id="billOpenTime" name="billOpenTime" class="input-text Wdate">--%>
			<%--</div>--%>
			<%--<label class="form-label col-xs-2 col-sm-2"><span class="c-red">*</span>发票开立状态：</label>--%>
			<%--<div class="formControls col-xs-4 col-sm-4">--%>
				<%--<select id="billOpenStatus" name="billOpenStatus">--%>
					<%--<option value="1" <c:if test="${1==settlementVO.billOpenStatus}">selected</c:if>>正常</option>--%>
					<%--<option value="2" <c:if test="${2==settlementVO.billOpenStatus}">selected</c:if>>异常</option>--%>
				<%--</select>--%>
				<%--<input type="text" class="input-text" value="${settlementVO.billOpenRemark}" placeholder="情况说明" id="billOpenRemark" name="billOpenRemark">--%>
			<%--</div>--%>
		<%--</div>--%>
		<div class="row cl">
			<label class="form-label col-xs-2 col-sm-2"><span class="c-red">*</span>结算方式：</label>
			<div class="formControls col-xs-4 col-sm-4">
				<select id="settlementMode" name="settlementMode">
					<option value="1" <c:if test="${1==settlementVO.settlementMode}">selected</c:if>>信用证</option>
					<option value="2" <c:if test="${2==settlementVO.settlementMode}">selected</c:if>>代购</option>
					<option value="3" <c:if test="${3==settlementVO.settlementMode}">selected</c:if>>信用证-例外</option>
				</select>
			</div>
			<label class="form-label col-xs-2 col-sm-2"><span class="c-red">*</span>结算金额(元)：</label>
			<div class="formControls col-xs-4 col-sm-4">
				<input type="text" class="input-text" value="${settlementVO.settlementAmount}" placeholder="" id="settlementAmount" name="settlementAmount">
			</div>
		</div>
		<div class="row cl">
			<div style="text-align: center">
				<input id="saveBtn" class="btn btn-primary radius" type="button" value="&nbsp;&nbsp;保 存&nbsp;&nbsp;">
				<input id="delBtn" class="btn btn-primary radius" type="button" value="&nbsp;&nbsp;取 消&nbsp;&nbsp;">
			</div>
		</div>
	</form>
</article>


<!-- 弹出框 begin -->
<div id="modal-project-select" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content radius">
			<div class="modal-header">
				<h3 class="modal-title">项目选择列表</h3>
				<a class="close" data-dismiss="modal" aria-hidden="true" href="javascript:void();">×</a>
			</div>
			<div class="modal-body">
				<table class="table">
					<tr>
						<td width="150" class="va-t"><ul id="projectDeptTree" class="ztree"></ul></td>
						<td class="va-t">

							<%--<div class="layui-btn-group demoTable">--%>
							<%--<button class="layui-btn" data-type="getCheckData">确认</button>--%>
							<%--</div>--%>
							<div class="demoTable">
								搜索项目：
								<div class="layui-inline">
									<input class="layui-input" name="id" placeholder="输入项目名称" id="projectReload" autocomplete="off">
								</div>
								<button class="layui-btn" data-type="reload">搜索</button>
							</div>
							<table id="projectPopTable" class="layui-hide" lay-filter="demo"></table>

							<script type="text/html" id="barRadio">
								<a lay-event="radio"><input type='radio' name='radio'></a>
							</script>
						</td>
					</tr>
				</table>
			</div>
			<div class="modal-footer">
				<button class="btn btn-primary" onclick="" style="display: none">确定</button>
				<button class="btn" data-dismiss="modal" aria-hidden="true">关闭</button>
			</div>
		</div>
	</div>
</div>

<div id="modal-order-select" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content radius">
			<div class="modal-header">
				<h3 class="modal-title">订单选择列表</h3>
				<a class="close" data-dismiss="modal" aria-hidden="true" href="javascript:void();">×</a>
			</div>
			<div class="modal-body">

				<div class="demoTable">
					搜索订单：
					<div class="layui-inline">
						<input class="layui-input" name="orderId" placeholder="输入订单号" id="orderCodeReload" autocomplete="off">
					</div>
					<button class="layui-btn" data-type="reload">搜索</button>
				</div>
				<table id="orderPopTable" class="layui-hide" lay-filter="demo"></table>

				<script type="text/html" id="barRadio1">
					<a lay-event="radio"><input type='radio' name='radio'></a>
				</script>

			</div>
			<div class="modal-footer">
				<button class="btn btn-primary" onclick="" style="display: none">确定</button>
				<button class="btn" data-dismiss="modal" aria-hidden="true">关闭</button>
			</div>
		</div>
	</div>
</div>
<!-- 弹出框 end -->

<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="${hxycStatic}/vendors/H-ui/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="${hxycStatic}/vendors/H-ui/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="${hxycStatic}/vendors/H-ui/static/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript" src="${hxycStatic}/vendors/H-ui/static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->
<script type="text/javascript" src="${hxycStatic}/js/ots/layui.js" charset="utf-8"></script>

<!--请在下方写此页面业务相关的脚本--> 
<script type="text/javascript" src="${hxycStatic}/vendors/H-ui/lib/My97DatePicker/4.8/WdatePicker.js"></script>
<script type="text/javascript" src="${hxycStatic}/vendors/H-ui/lib/zTree/v3/js/jquery.ztree.all-3.5.min.js"></script>
<script type="text/javascript" src="${hxycStatic}/vendors/H-ui/lib/jquery.validation/1.14.0/jquery.validate.js"></script>
<script type="text/javascript" src="${hxycStatic}/vendors/H-ui/lib/jquery.validation/1.14.0/validate-methods.js"></script>
<script type="text/javascript" src="${hxycStatic}/vendors/H-ui/lib/jquery.validation/1.14.0/messages_zh.js"></script>
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

    $("#saveBtn").click(function () {
        $.ajax({
            url: '${hxycStatic}/settlement-save',
            type: 'post',
            dataType:'json',
            data: $("#form-settlement-add").serializeArray(),
            beforeSend: function () {
                $("#loading").modal('show');
            },
            success: function(msg) {
                parent.layer.msg(msg.message, {icon: 6, time: 1000}, function () {
                    var index = parent.layer.getFrameIndex(window.name);
                    parent.location.reload();
                    parent.layer.close(index);
                });
                $("#loading").modal('hide');
            },
            error:function (msg) {
                //alert('失败，'+msg.message);
                parent.layer.msg(msg.message, {icon: 5, time: 1000});
                $("#loading").modal('hide');
            }
        });
    });
});
	$("#projectSelect").click(function () {
    	initProjectDeptTree();

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

    function initProjectDeptTree(){
        $.ajax({
            url: '${hxycStatic}/company-tree-list',
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
        var t = $("#projectDeptTree");
        t = $.fn.zTree.init(t, setting, zNodes);
        //t.expandAll(true);
        var treeObj = $.fn.zTree.getZTreeObj("projectDeptTree");
        var nodeList = treeObj.getNodes();
        treeObj.expandNode(nodeList[0], true);
        //返回一个根节点
        //var node = treeObj.getNodesByFilter(function (node) { return node.level == 0 }, true);
        initProjectTable2('');
    }



function initProjectTable2(compnayId) {
    var requrl = '${hxycStatic}/project-list-by-param'
    if ('' != compnayId){
        requrl = '${hxycStatic}/project-list-by-param?companyId='+compnayId
    }
    layui.use('table', function(){
        var laytable = layui.table;

        //渲染
        laytable.render({
            elem: '#projectPopTable'
            ,width: 500
            ,height: 350
            ,url: requrl
            //,size: 'sm'
            ,page: true
            ,limit: 8
            ,cols: [[
                //{type: 'checkbox', fixed: 'left'},
                {fixed: 'center', title:'选择', toolbar: '#barRadio', width:50},
                {field:'projectName', title:'项目名称', width:300, sort: true}
            ]]
        });

        //监听工具条
        laytable.on('tool(demo)', function(obj){
            var data = obj.data;
            if(obj.event === 'radio'){
                layer.msg('选择项目：'+ data.projectName );
            }

            $("#projectSelect").val(data.projectName);
            $("#projectId").val(data.id);
            $("#companyId").val(data.companyId);
            $("#orderNoSelect").val('');
            $("#orderId").val('');
            $("#modal-project-select").modal("hide");
        });

        var $ = layui.$, active = {
            getCheckData: function(){ //获取选中数据
                $("#modal-project-select").modal("hide");
            },
            reload: function(){
                var projectReload = $('#projectReload');

                //执行重载
                laytable.reload('projectPopTable', {
                    page: {
                        curr: 1 //重新从第 1 页开始
                    }
                    ,where: {
                        projectName: projectReload.val()
                    }
                });
            }
        };

        $('.demoTable .layui-btn').on('click', function(){
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });
        $("#modal-project-select").modal("show");
    });
}


$("#orderNoSelect").click(function () {
    var projectId = $("#projectId").val();
    if ('' == projectId){
        alert('请选择项目!');
        return;
    }
    layui.use('table', function(){
        var laytable = layui.table;

        //渲染
        laytable.render({
            elem: '#orderPopTable'
            ,width: 650
            ,height: 360
            ,url: '${hxycStatic}/order-list-by-projId?projectId='+projectId
            //,size: 'sm'
            ,page: true
            ,limit: 8
            ,cols: [[
                //{type: 'checkbox', fixed: 'left'},
                {fixed: 'center', title:'选择', toolbar: '#barRadio1', width:50},
                {field:'projectName', title:'项目名称', width:100},
                {field:'orderCode', title:'订单号', width:350, sort: true},
				{field:'orderBatchNo', title:'批次号', width:180}
            ]]
        });

        //监听工具条
        laytable.on('tool(demo)', function(obj){
            var data = obj.data;
            if(obj.event === 'radio'){
                layer.msg('选择订单：'+ data.orderCode );
            }

            $("#orderNoSelect").val(data.orderCode);
            $("#orderId").val(data.orderCode);
            $("#modal-order-select").modal("hide");
        });

        var $ = layui.$, active = {
            getCheckData: function(){ //获取选中数据
                $("#modal-order-select").modal("hide");
            },
            reload: function(){
                var orderCodeReload = $('#orderCodeReload');

                //执行重载
                laytable.reload('orderPopTable', {
                    page: {
                        curr: 1 //重新从第 1 页开始
                    }
                    ,where: {
                        orderCode: orderCodeReload.val()
                    }
                });
            }
        };

        $('.demoTable .layui-btn').on('click', function(){
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });
        $("#modal-order-select").modal("show");
    });
});


</script> 
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>