<div class="page-header">
	<h1>请核对已转账信息</h1>
</div>

<div class="widget-box">
	<div class="widget-header">
		<h4 class="smaller">
			返额订单
			<small>${order.number}</small>
		</h4>
	</div>

	<div class="widget-body">
		<div class="widget-main">
			<div>返额日期：${pay.dueTime?string('yyyy-MM-dd')}</div>
			<div>今日日期：<#if (pay.dueTime < .now)><span class="green">${.now?string('yyyy-MM-dd')}</span><#else><span class="text-warning" title="未到返额日期">${.now?string('yyyy-MM-dd')}</span></#if></div>
			<div>返点金额：<b class="red">￥#{pay.money}</b></div>

			<hr>
			<div>转账银行：${client.bankName}</div>
			<div>银行卡号：${client.bankNumber}</div>
			<div>开户人名：${client.bankUser}</div>

			<hr>
			<p>
			
			<form method="post" action="${request.contextPath}/pay/update" class="form-horizontal" role="form">
			<input name="id" value="${(pay.id)!}" type="hidden">
			<input name="state" value="1" type="hidden">
			<input name="adminId" value="${Session.admin.id}" type="hidden">
				<#if pay.state==0>
				<#if (pay.dueTime >= .now)>
				<button class="btn btn-danger btn-sm" type="button" onclick="tq(this)">
					<i class="ace-icon fa fa-check bigger-110"></i>
					提前支付
				</button>
				</#if>
				<button class="btn btn-info btn-sm" type="button" id="sub" style="display:${(pay.dueTime >= .now)?string('none','')}">
					<i class="ace-icon fa fa-check bigger-110"></i>
					已转确认
				</button>
				</#if>
				<button class="btn btn-sm" type="button" onclick="self.location=document.referrer;">
					<i class="ace-icon fa fa-undo bigger-110"></i>
					返回
				</button>
				<input name="url" type="hidden" value="${url!}">
			</form>
			</p>
		</div>
	</div>
</div>
<script>
$(function(){
	$("#sub").click(function(){
		<#if (pay.dueTime >= .now)>
		bootbox.confirm({
			title : "时间确认",
			message: "尚未到达支付日期，是否继续支付？", 
			buttons: {
				confirm: {
					label: "确定"
				},
				cancel:{
					label:"取消"
				}
			},        
			callback: function(result) {
				if(result) {
					$("form").submit();
				}
			}
		});
		<#else>
		$("form").submit();
		</#if>
	});
});
function tq(obj){
	$(obj).animate({bottom:'-50px'}).fadeOut(300,function(){
		$("#sub").fadeIn("500");
	});
	
}
</script>