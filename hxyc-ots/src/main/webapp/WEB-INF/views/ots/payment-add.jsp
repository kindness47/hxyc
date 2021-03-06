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
	<link rel="stylesheet" type="text/css"  href="${hxycStatic}/js/ots/css/jquery-ui.min.css" />
	<!--[if IE 6]>
	<script type="text/javascript" src="${hxycStatic}/vendors/H-ui/lib/DD_belatedPNG_0.0.8a-min.js" ></script>
	<![endif]-->
	<title>新增支付单</title>
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
	<form class="form form-horizontal" id="form-payment-add" style="white-space:nowrap;" action="${hxycStatic}/payment-save" method="post">
		<input type="hidden" id="id" name="id" value="${paymentVO.id}" />
		<div class="row cl">
			<label class="form-label col-xs-2 col-sm-2"><span class="c-red">*</span>结算单号(点击选择)：</label>
			<div class="formControls col-xs-6 col-sm-6">
				<input type="text" class="input-text hidden" value="${paymentVO.settlementId}" placeholder="" id="settlementId" name="settlementId">
				<input type="text" class="input-text" readonly id="settlementCodeSelect" placeholder="选择结算单" value="${paymentVO.settlementCode}" />
			</div>
			<label class="form-label col-xs-2 col-sm-2"><span class="c-red"></span>结算模式(仅展示信息)：</label>
			<div class="formControls col-xs-2 col-sm-2">
				<select id="settlementMode" name="settlementMode" disabled class="selectpicker" style="height: 32px;">
					<option value="0" selected></option>
					<option value="1" <c:if test="${1==paymentVO.settlementMode}">selected</c:if>>信用证</option>
					<option value="2" <c:if test="${2==paymentVO.settlementMode}">selected</c:if>>代购</option>
					<option value="3" <c:if test="${3==paymentVO.settlementMode}">selected</c:if>>信用证-例外</option>
				</select>
			</div>
		</div>
        <%--
        <div class="row cl">
        <label class="form-label col-xs-2 col-sm-2"><span class="c-red">*</span>需方发票开立时间：</label>
        <div class="formControls col-xs-4 col-sm-4">
        <input type="text" onfocus="WdatePicker({ maxDate:'#F{\'%y-%M-%d\'}' })" readonly value="<fmt:formatDate value="${paymentVO.billOpenTime}" pattern="yyyy-MM-dd" ></fmt:formatDate>" id="billOpenTime" name="billOpenTime" class="input-text Wdate">
        </div>
        <label class="form-label col-xs-2 col-sm-2"><span class="c-red">*</span>需方发票开立状态：</label>
        <div class="formControls col-xs-4 col-sm-4">
        <select id="billOpenStatus" name="billOpenStatus">
        <option value="1" <c:if test="${1==paymentVO.billOpenStatus}">selected</c:if>>正常</option>
        <option value="2" <c:if test="${2==paymentVO.billOpenStatus}">selected</c:if>>异常</option>
        </select>
        <input type="text" class="input-text" value="${paymentVO.billOpenRemark}" placeholder="情况说明" id="billOpenRemark" name="billOpenRemark">
        </div>
        </div>
        --%>
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
			<label class="form-label col-xs-2 col-sm-2"><span class="c-red">*</span>选择付款账户：</label>
			<div class="formControls col-xs-8 col-sm-8">
				<%--<select id="paymentSourceId" name="paymentSourceId" onchange="writeRestAmount()" style="height: 32px;">
					<c:forEach items="${creditVOList}" var="credit">
						<option value="${credit.id}" <c:if test="${credit.id==paymentVO.paymentSourceId}">selected</c:if>>余额：${credit.restAmount} ||开证金额：${credit.openAmount} ||开证日期：<f:formatDate value="${credit.openTime}" pattern="yyyy-MM-dd"/> ||编码：${credit.creditCode}</option>
					</c:forEach>
					<c:forEach items="${receiptVOList}" var="receipt">
						<option value="${receipt.id}" <c:if test="${receipt.id==paymentVO.paymentSourceId}">selected</c:if>>余额：${receipt.receiptBalance} ||收款金额：${receipt.receiptAmount} ||收款日期：<f:formatDate value="${receipt.receiptTime}" pattern="yyyy-MM-dd"/>||编号: ${receipt.id}</option>
					</c:forEach>
				</select>--%>
				<div paymentSourceId="${paymentVO.paymentSourceId}" id="paymentSourceIdDiv"></div>
				<select id="paymentSourceId" name="paymentSourceId" class="select" style="height:30px;" readonly="" onchange="changeMode()">

				</select>
			</div>

		</div>
		<div class="row cl">
			<label class="form-label col-xs-2 col-sm-2"><span class="c-red">*</span>付款金额(万元)：</label>
			<div class="formControls col-xs-4 col-sm-4">
				<input type="text" class="input-text" value="${paymentVO.paymentAmount}" placeholder="" id="paymentAmount" name="paymentAmount">
			</div>
			<label class="form-label col-xs-2 col-sm-2"><span class="c-red">*</span>
                <a id="show-option" title="信用证和代购模式结算时余额已减,例外模式将在点击保存后从选取的信用证/代购中减去需方结算金额" style="color: #2a6496">账户余额</a>
                (悬停查看详情)(万)：</label>
			<div class="formControls col-xs-4 col-sm-4">
				<input type="text" class="input-text hidden" placeholder="" id="originAmount">
				<input type="text" class="input-text" value="${paymentVO.creditSurplusAmount}" placeholder="" id="creditSurplusAmount" name="creditSurplusAmount">
			</div>

		</div>
		<div class="row cl">
			<label class="form-label col-xs-2 col-sm-2">供方结算金额(仅展示)(元)：</label>
			<label class="form-label col-xs-2 col-sm-2" style="text-align: left;">
				<input type="text" class="input-text" id="supplierSettleAmount" disabled="true">
			</label>
			<label class="form-label col-xs-2 col-sm-2 col-xs-offset-2">已付供方(仅展示)(元)：</label>
			<label class="form-label col-xs-2 col-sm-2" style="text-align: left;">
				<input type="text" class="input-text" id="paidSettleAmount" disabled="true">
			</label>
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
	<input disabled type="hidden" value="${paymentVO.id}" id="paymentId" >
	<input type="hidden" value="${paymentVO.projectId}" id="projectId">
	<input type="hidden" value="" id="companyId">
	<input type="hidden" value="" id="settlementAmount">
</article>

<!-- 弹出框 begin -->
<div id="modal-payment-select" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content radius">
			<div class="modal-header" style="padding-top: 1px;">
				<h3 class="modal-title">结算单选择列表</h3>
				<a class="close" data-dismiss="modal" aria-hidden="true" href="javascript:void(0);">×</a>
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
										<input class="layui-input" placeholder="输入结算单号" name="id" id="demoReload" autocomplete="off">
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
<script type="text/javascript" src="${hxycStatic}/js/ots/decimal.js"></script>
<script type="text/javascript" src="${hxycStatic}/js/ots/jquery-ui.min.js"></script>
<script type="text/javascript">
$(function(){
	$('.skin-minimal input').iCheck({
		checkboxClass: 'icheckbox-blue',
		radioClass: 'iradio-blue',
		increaseArea: '20%'
	});
    $( "#show-option" ).tooltip({
        show: {
            effect: "slideDown",
            delay: 250
        }
    });

    $("#delBtn").on("click",function () {
        var index = parent.layer.getFrameIndex(window.name);
        parent.layer.close(index);
    });

    $("#saveBtn").click(function () {
        if($("#paymentAmount").val() == ""){
            alert("支付金额未填，我改付多少?")
			return;
		}
        //当付款金额大于供方结算金额，不允许保存
        if($("#supplierSettleAmount").val() != "" && $("#paidSettleAmount").val() != "" ){
            if($("#settlementId").val()!= null){
                //修改  减去
                if(new Decimal($("#paymentAmount").val()).mul(new Decimal(10000)).toNumber() > new Decimal($("#supplierSettleAmount").val()).sub(new Decimal($("#paidSettleAmount").val())).toNumber()){
                    layui.use("layer",function () {
                        var layer = layui.layer;
                        layer.open({
                            title:"提示"
                            ,content:"付款金额大于供方剩余结算金额，请仔细检查是否填写错误，点击确定调整付款金额为供方结算金额！"
                            ,yes:function (index,layero) {
                                $("#paymentAmount").val(new Decimal($("#supplierSettleAmount").val()).sub(new Decimal($("#paidSettleAmount").val())).div(new Decimal(10000)).toNumber());
                                layer.close(index);
                            }
                        });
                    });
                    return false;
                }
			}else{

                if(new Decimal($("#paymentAmount").val()).mul(new Decimal(10000)).toNumber() >$("#supplierSettleAmount").val()){
                    layui.use("layer",function () {
                        var layer = layui.layer;
                        layer.open({
                            title:"提示"
                            ,content:"付款金额大于供方剩余结算金额，请仔细检查是否填写错误，点击确定调整付款金额为供方结算金额！"
                            ,yes:function (index,layero) {
                                $("#paymentAmount").val(new Decimal($("#supplierSettleAmount").val()).sub(new Decimal($("#paidSettleAmount").val())).div(new Decimal(10000)).toNumber());
                                layer.close(index);
                            }
                        });
                    });
                    return false;
                }
			}

		}

        $.ajax({
            url: '${hxycStatic}/payment-save',
            type: 'post',
            dataType:'json',
            data: $("#form-payment-add").serializeArray(),
            beforeSend: function () {
                $("#loading").modal('show');
            },
            success: function(msg) {
                if(msg.success) {
                    parent.layer.msg(msg.message, {icon: 6, time: 1000}, function () {
                        var index = parent.layer.getFrameIndex(window.name);
                        parent.location.reload();
                        parent.layer.close(index);
                    });
                    $("#loading").modal('hide');
                }else{
                    parent.layer.msg(msg.message, {icon: 2, time: 1000});
                    $("#loading").modal('hide');
                }
            },
			error:function (msg) {
				//alert('失败，'+msg.message);
                parent.layer.msg(msg.message, {icon: 5, time: 1000});
                $("#loading").modal('hide');
            }
        });
    });
    //初始化余额信息
	/*var settlementCode = $("#settlementCodeSelect").val();
	if (settlementCode != ''){
        writeRestAmount();
	}*/

});

/*function computeRest() {
    var originAmount = $("#originAmount").val();
    var paymentAmount = $("#paymentAmount").val();
    var creditSurplusAmount = $("#creditSurplusAmount").val();
    var restAmount = parseFloat(originAmount)-parseFloat(paymentAmount);

    if (restAmount < 0){
        layer.msg('付款金额不能大于余额！');
        $("#paymentAmount").val('');
        $("#creditSurplusAmount").val(originAmount);
        return false;
	}
    $("#creditSurplusAmount").val(restAmount.toFixed(2));
}*/

/*function writeRestAmount() {
	var paySourceId = $("#paymentSourceId").val();
	var settlementMode = $("#settlementMode").val();
    $("#creditSurplusAmount").val(0);
	if (1 == settlementMode){
	    //信用证
		$.ajax({
            url: '\${hxycStatic}/credit/'+paySourceId,
            type: 'post',
            dataType:'json',
            async:false,
            success: function(msg) {
                $("#creditSurplusAmount").val(msg.restAmount);
                $("#originAmount").val(msg.restAmount);
            },
            error:function (msg) {
                alert('未找到可用信用证账户，无法发起付款，'+msg.message);
                var index = parent.layer.getFrameIndex(window.name);
                parent.layer.close(index);
            }
		});
	}else {
	    //例外 代购
        $.ajax({
            url: '\${hxycStatic}/receipt/'+paySourceId,
            type: 'post',
            dataType:'json',
            async:false,
            success: function(msg) {
                $("#creditSurplusAmount").val(msg.receiptBalance);
                $("#originAmount").val(msg.receiptBalance);
            },
            error:function (msg) {
                alert('未找到可用收款账户，无法发起付款，'+msg.message);
                var index = parent.layer.getFrameIndex(window.name);
                parent.layer.close(index);
            }
        });
	}
}*/

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
    //t.expandAll(true);
    var treeObj = $.fn.zTree.getZTreeObj("deptTree");
    var nodeList = treeObj.getNodes();
    treeObj.expandNode(nodeList[0], true);
    //返回一个根节点
    var node = treeObj.getNodesByFilter(function (node) { return node.level == 0 }, true);
    //initSettlementTable(node.id);
    initSettlementTable2('');
    $("#modal-payment-select").modal("show");
}

/*function initXYZPaySelect(projectId) {
    $.ajax({
        url: '\${hxycStatic}/credit-select?projectId='+projectId,
        type: 'get',
        dataType:'json',
        async:false,
        success: function(msg) {
            var result = [];
            result = msg.result;
            var selelctStr = "";
            for (var i=0;i<result.length;i++){
                selelctStr +="<option value="+result[i].id+">余额："+result[i].restAmount+" ||开证金额："+result[i].openAmount+" || 开证日期:"+result[i].openTime+" || 编码:"+result[i].creditCode+"</option>";
            }
            $("#paymentSourceId").html(selelctStr);
        },
        error:function (msg) {
            alert('失败，'+msg.message);
        }
    });
}

function initDaigouPaySelect(projectId) {
    $.ajax({
        url: '\${hxycStatic}/receipt-select?projectId='+projectId,
        type: 'get',
        dataType:'json',
        async:false,
        success: function(msg) {
            var result = [];
            result = msg.result;
            var selelctStr = "";
            for (var i=0;i<result.length;i++){
                selelctStr +="<option value="+result[i].id+">余额:"+result[i].receiptBalance+" ||收款金额:"+result[i].receiptAmount+" || 收款日期:"+result[i].receiptTime+" || 编号:"+result[i].id+"</option>";
			}
            $("#paymentSourceId").html(selelctStr);
        },
        error:function (msg) {
            alert('失败，'+msg.message);
        }
    });
}*/
//格式化时间函数   时间戳->字符串
var formatDate = function(timestamp){
    var date = new Date(timestamp);
    var year = date.getFullYear()
        ,month = date.getMonth()+1
        ,day = date.getDate()
        //,hour = date.getHours()
        //,minute = date.getMinutes()
        //,second = date.getSeconds()
    ;
    return year+"-"+month+"-"+day;
}
var changeMode = function () {
    $("#creditSurplusAmount").val(new Decimal($("#paymentSourceId").find("option:selected").attr("rest")).mul(new Decimal(10000)).sub(new Decimal($("#settlementAmount").val())).div(new Decimal(10000)).toNumber());
}

var initsettlementMode = function (settlementMode,settlementModeId,settlementId) {
    var url ="";
    if(settlementMode == "1" || settlementMode == "2"){
        if(settlementModeId != null && settlementModeId != ""){
            url = settlementMode == "1"?"${hxycStatic}/credit/"+settlementModeId:"${hxycStatic}/receipt/"+settlementModeId;
            $.post(url,function (modeInfo) {
                var htmlStr = "";
                if(settlementMode == "1") {
                    var creditType = modeInfo.creditType == "1" ? "大证":"小证";
                    htmlStr = "<option value='" + modeInfo.id + "'>" + creditType + "||余额:" + modeInfo.restAmount +
                        "||开证金额:" + modeInfo.openAmount + "||编码:" + modeInfo.creditCode + "</option>"
                }else if(settlementMode == "2")
                    htmlStr ="<option value='"+modeInfo.id+"'>余额:"+modeInfo.receiptBalance+
                        "||收款金额:"+modeInfo.receiptAmount+"||收款日期:"+formatDate(modeInfo.createTime)+"</option>";
                $("#paymentSourceId").html(htmlStr);
            });
        }else{
            if(settlementMode == "1"){
				$.post("credit-select",{"companyId":$("#companyId").val()},function(data) {
					if (data.result.length > 0) {
						var htmlStr = "";
						for(var i = 0; i<data.result.length; i++){
							var credit = data.result[i],
								creditType = credit.creditType == 1 ? "大证":"小证";
							htmlStr += "<option value='"+credit.id+"' rest='"+credit.restAmount+"'>"+creditType+"||余额:"+credit.restAmount+
								"||开证金额:"+credit.openAmount+"||编码:"+credit.creditCode+"</option>";
						}
						$("#paymentSourceId").html(htmlStr);
					} else
						alert("该项目没有开立信用证");
				});
            }else if(settlementMode == "2"){
			    $.post("receipt-select",{"projectId":$("#projectId").val()},function(data){
                    if(data.result.length >0){
                        var htmlStr = "";
                        for(var i = 0; i<data.result.length; i++){
                            var receipt = data.result[i];
                            htmlStr += "<option value='"+receipt.id+"' rest='"+receipt.receiptBalance+"'>余额:"+receipt.receiptBalance+
                                "||收款金额:"+receipt.receiptAmount+"||收款日期:"+formatDate(receipt.createTime)+"</option>";
                        }
                        $("#paymentSourceId").html(htmlStr);

                    }else
                        alert("该项目没有收款");
				});
            }
        }
    }else if(settlementMode == 3){
        if(settlementId != null){
			url = "${hxycStatic}/getcredit-or-receipt/"+settlementId;
			$.post(url,function (data) {
				if(data.success){
					var list = data.result;
					var htmlStr = "";
					var paymentSourceId = $("#paymentSourceIdDiv").attr("paymentSourceId");
					if($("#paymentId").val() != ""){
						//修改
                        for (var i = 0; i < list.length; i++) {
                            var modeInfo = list[i];
                            if (paymentSourceId == modeInfo.id) {
                                if (modeInfo.creditCode != null)
                                    htmlStr = "<option value='" + modeInfo.id + "'>信用证||余额:" + modeInfo.restAmount +
                                        "||开证金额:" + modeInfo.openAmount + "||编码:" + modeInfo.creditCode + "</option>";
                                else
                                    htmlStr = "<option value='" + modeInfo.id + "'>收款||余额:" + modeInfo.receiptBalance +
                                        "||收款金额:" + modeInfo.receiptAmount + "||收款日期:" + formatDate(modeInfo.createTime) + "</option>";
                            }
                        }
					}else {
					    //初始化
                        for (var i = 0; i < list.length; i++) {
                            var modeInfo = list[i];
                            var isSelected = paymentSourceId == modeInfo.id ? "selected" : "";
                            if (modeInfo.creditCode != null)
                                htmlStr += "<option value='" + modeInfo.id + "' " + isSelected + ">信用证||余额:" + modeInfo.restAmount +
                                    "||开证金额:" + modeInfo.openAmount + "||编码:" + modeInfo.creditCode + "</option>";
                            else
                                htmlStr += "<option value='" + modeInfo.id + "' " + isSelected+ ">收款||余额:" + modeInfo.receiptBalance +
                                    "||收款金额:" + modeInfo.receiptAmount + "||收款日期:" + formatDate(modeInfo.createTime) + "</option>";
                        }
                    }
                    $("#paymentSourceId").html(htmlStr);
				}else
					alert("未找到信用证/收款信息");
			});
        }
	}
	if($("#settlementId").val() != null && $("#settlementId").val() != "")
		$.post("settlement/"+$("#settlementId").val(),function(settlementVO){
			$("#settlementAmount").val(settlementVO.settlementAmount);
		});
}



//获取已支付金额
var paidSettleAmount = function(settlementId){
    if(settlementId != null)
        $.post("${hxycStatic}/getpaidSettleAmount/"+settlementId,function (data) {
            //alert(data.result);
            if(data.success){
                if(data.result == 0)
                    $("#paidSettleAmount").val("0");
                else
                    $("#paidSettleAmount").val(new Decimal(data.result).mul(new Decimal(10000)).toNumber());
            }else {
                $("#paidSettleAmount").val("0");
            }
        });
}

function initSettlementTable2(compnayId) {
    var requrl = '${hxycStatic}/settlement-code-list'
    if ('' != compnayId){
        requrl = '${hxycStatic}/settlement-code-list?companyId='+compnayId
    }
    layui.use('table', function(){
        var laytable = layui.table;

        //渲染
        laytable.render({
            elem: '#paymentPopTable'
            ,width: 600
            ,height: 354
            ,url: requrl
            //,size: 'sm'
            ,page: true
            ,limit: 7
            ,cols: [[
                //{type: 'checkbox', fixed: 'left'},
                {fixed: 'center', title:'选择', toolbar: '#barRadio', width:60},
                {field:'projectName', title:'项目名称', width:150},
                {field:'settlementCode', title:'结算单号', width:380, sort: true}
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
			$("#settlementMode").val(data.settlementMode);
			$("#creditSurplusAmount").val(data.balanceOfSettlement);
			$("#supplierSettleAmount").val(data.supplierSettleAmount);
			$("#settlementAmount").val(data.settlementAmount);
			$("#projectId").val(data.projectId);
			$("#companyId").val(data.companyId);

            paidSettleAmount(data.id);

			//$("#paymentSourceId").val(data.settlementModeId);
			//初始化paymentSourceId对应的信息
			initsettlementMode(data.settlementMode,data.settlementModeId,data.id);

			/*if (1 == data.settlementMode){//信用证
                initXYZPaySelect(data.projectId);
			}else {//例外 代购
                initDaigouPaySelect(data.projectId);
			}*/
			//设置余额
            //writeRestAmount();
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

//供方结算金额展示
var showSupplierSettleAmount = function () {
    var settlementId = $("#settlementId").val();
    if(settlementId != ""){
        $.ajax({
            type:"post",
            url:"${hxycStatic}/settlement/"+settlementId,
            dataType:"json",
			async:false,
            success:function (data) {
                //alert("success");
                var settlementVO = data;
                if(settlementVO.supplierSettleAmount != null)
                	$("#supplierSettleAmount").val(settlementVO.supplierSettleAmount);
            },
            error:function (data) {
				alert("获取供方结算金额失败");
            }
        });
    }
}


showSupplierSettleAmount();
//初始化已支付金额
var settlementId = $("#settlementId").val();
if(settlementId != null && settlementId != "") {
    paidSettleAmount(settlementId);
    //初始化付款账户
    initsettlementMode($("#settlementMode").val(),$("#paymentSourceIdDiv").attr("paymentSourceId"),$("#settlementId").val());

}


</script>
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>