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
	<link rel="stylesheet" type="text/css" href="${hxycStatic}/vendors/H-ui/static/h-ui.admin/skin/default/skin.css" id="skin" />
	<link rel="stylesheet" type="text/css" href="${hxycStatic}/vendors/H-ui/static/h-ui.admin/css/style.css" />
	<link rel="stylesheet" type="text/css" href="${hxycStatic}/js/ots/css/layui.css"  media="all">
	<link rel="stylesheet" type="text/css"  href="${hxycStatic}/vendors/H-ui/lib/zTree/v3/css/zTreeStyle/zTreeStyle.css" />
	<!--[if IE 6]>
	<script type="text/javascript" src="${hxycStatic}/vendors/H-ui/lib/DD_belatedPNG_0.0.8a-min.js" ></script>
	<![endif]-->
	<title>新增支付单</title>
	<style type="text/css">
		.layui-table-page {
			position:fixed;
			width: 380px;
		}
	</style>
</head>
<body>
<article class="page-container">
	<form class="form form-horizontal" id="form-payment-add" style="white-space:nowrap;" action="${hxycStatic}/payment-save" method="post">
		<input type="hidden" id="id" name="id" value="${paymentVO.id}" />
		<div class="row cl">
			<label class="form-label col-xs-2 col-sm-2"><span class="c-red">*</span>结算单号(点击选择)：</label>
			<div class="formControls col-xs-4 col-sm-4">
				<input type="text" class="input-text hidden" value="${paymentVO.settlementId}" placeholder="" id="settlementId" name="settlementId">
				<input type="text" class="input-text" readonly id="settlementCodeSelect" placeholder="选择结算单" value="${paymentVO.settlementCode}" />
			</div>

		</div>
		<div class="row cl">
			<label class="form-label col-xs-2 col-sm-2"><span class="c-red">*</span>审批完成时间：</label>
			<div class="formControls col-xs-4 col-sm-4">
				<input type="text" onfocus="WdatePicker({ maxDate:'#F{\'%y-%M-%d\'}' })" readonly value="<fmt:formatDate value="${paymentVO.approvalTime}" pattern="yyyy-MM-dd" ></fmt:formatDate>" id="approvalTime" name="approvalTime" class="input-text Wdate">
			</div>
			<label class="form-label col-xs-2 col-sm-2"><span class="c-red">*</span>审批完成状态：</label>
			<div class="formControls col-xs-4 col-sm-4">
				<select id="approvalStatus" name="approvalStatus" value="${paymentVO.approvalStatus}">
					<option value="1" <c:if test="${1==paymentVO.approvalStatus}">selected</c:if>>正常</option>
					<option value="2" <c:if test="${2==paymentVO.approvalStatus}">selected</c:if>>异常</option>
				</select>
				<input type="text" class="input-text" value="${paymentVO.approvalRemark}" placeholder="情况说明" id="approvalRemark" name="approvalRemark">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-2 col-sm-2"><span class="c-red">*</span>付款时间：</label>
			<div class="formControls col-xs-4 col-sm-4">
				<input type="text" onfocus="WdatePicker({ maxDate:'#F{\'%y-%M-%d\'}' })" readonly value="<fmt:formatDate value="${paymentVO.paymentTime}" pattern="yyyy-MM-dd" ></fmt:formatDate>" id="paymentTime" name="paymentTime" class="input-text Wdate">
			</div>
			<label class="form-label col-xs-2 col-sm-2"><span class="c-red">*</span>付款状态：</label>
			<div class="formControls col-xs-4 col-sm-4">
				<select id="paymentStatus" name="paymentStatus">
					<option value="1" <c:if test="${1==paymentVO.paymentStatus}">selected</c:if>>正常</option>
					<option value="2" <c:if test="${2==paymentVO.paymentStatus}">selected</c:if>>异常</option>
				</select>
				<input type="text" class="input-text" value="${paymentVO.paymentRemark}" placeholder="情况说明" id="paymentRemark" name="paymentRemark">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-2 col-sm-2"><span class="c-red">*</span>付款金额(万元)：</label>
			<div class="formControls col-xs-4 col-sm-4">
				<input type="text" class="input-text" value="${paymentVO.paymentAmount}" placeholder="" id="paymentAmount" name="paymentAmount">
			</div>
			<label class="form-label col-xs-2 col-sm-2"><span class="c-red">*</span>信用证余额/余额(万元)：</label>
			<div class="formControls col-xs-4 col-sm-4">
				<input type="text" class="input-text" value="${paymentVO.creditSurplusAmount}" placeholder="" id="creditSurplusAmount" name="creditSurplusAmount">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-2 col-sm-2"><span class="c-red">*</span>其他备注：</label>
			<div class="formControls col-xs-4 col-sm-4">
				<input type="text" class="input-text" value="${paymentVO.remarks}" placeholder="" id="remarks" name="remarks">
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
<div id="modal-payment-select" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content radius">
			<div class="modal-header" style="padding-top: 1px;">
				<h3 class="modal-title">结算单选择列表</h3>
				<a class="close" data-dismiss="modal" aria-hidden="true" href="javascript:void();">×</a>
			</div>
			<div class="modal-body">
				<table class="table">
					<tr>
						<td width="150" class="va-t"><ul id="deptTree" class="ztree"></ul></td>
						<td class="va-t">
								<%--<div class="layui-btn-group demoTable">--%>
									<%--<button class="layui-btn" data-type="getCheckData">确认</button>--%>
								<%--</div>--%>
								<div class="demoTable">
									搜索结算单号：
									<div class="layui-inline">
										<input class="layui-input" name="id" id="demoReload" autocomplete="off">
									</div>
									<button class="layui-btn" data-type="reload">搜索</button>
								</div>
								<table id="paymentPopTable" class="layui-hide" lay-filter="demo"></table>

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
            url: '${hxycStatic}/payment-save',
            type: 'post',
            dataType:'json',
            data: $("#form-payment-add").serializeArray(),
            success: function(msg) {
                parent.layer.msg(msg.message, {icon: 6, time: 1000}, function () {
                    var index = parent.layer.getFrameIndex(window.name);
                    parent.location.reload();
                    parent.layer.close(index);
                });
            },
			error:function (msg) {
				//alert('失败，'+msg.message);
                parent.layer.msg(msg.message, {icon: 5, time: 1000});
            }
        });
    });

});

$("#settlementCodeSelect").click(function () {
    initDeptTree();
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
		onClick:findCompanySettlement
    }
};

function findCompanySettlement(event, treeId, treeNode, clickFlag) {
	initSettlementTable2(treeNode.id);
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

function initDeptTree(){
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
    var t = $("#deptTree");
    t = $.fn.zTree.init(t, setting, zNodes);
    t.expandAll(true);
    var treeObj = $.fn.zTree.getZTreeObj("deptTree");
    //返回一个根节点
    var node = treeObj.getNodesByFilter(function (node) { return node.level == 0 }, true);
    //initSettlementTable(node.id);
    initSettlementTable2(node.id);
    $("#modal-payment-select").modal("show");
}

function initSettlementTable2(compnayId) {
    layui.use('table', function(){
        var laytable = layui.table;

        //渲染
        laytable.render({
            elem: '#paymentPopTable'
            ,width: 400
            ,height: 350
            ,url: '${hxycStatic}/settlement-code-list?companyId='+compnayId
            //,size: 'sm'
            ,page: true
            ,limit: 10
            ,cols: [[
                //{type: 'checkbox', fixed: 'left'},
                {fixed: 'center', title:'选择', toolbar: '#barRadio', width:50},
                {field:'projectName', title:'项目名称', width:150, fixed: 'left', unresize: true},
                {field:'settlementCode', title:'结算单号', width:200, sort: true}
            ]]
        });

        //监听工具条
        laytable.on('tool(demo)', function(obj){
            var data = obj.data;
            if(obj.event === 'radio'){
                layer.msg('选择结算单：'+ data.settlementCode );
            }
            $("#settlementCodeSelect").val(data.settlementCode);
			$("#settlementId").val(data.id);
            $("#modal-payment-select").modal("hide");
        });

        var $ = layui.$, active = {
            getCheckData: function(){ //获取选中数据
                $("#modal-payment-select").modal("hide");
            },
            reload: function(){
                var demoReload = $('#demoReload');

                //执行重载
                laytable.reload('paymentPopTable', {
                    page: {
                        curr: 1 //重新从第 1 页开始
                    }
                    ,where: {
                        settlementCode: demoReload.val()
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


</script> 
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>