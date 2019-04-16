<style>
.btn:focus,.btn:active,.btn:hover{outline:none;}
.error{color:red}
</style>
<div class="widget-box">
	<div class="widget-header widget-header-blue widget-header-flat">
		<h4 class="widget-title lighter">下订单</h4>

	</div>

	<div class="widget-body">
		<div class="widget-main">
			<div id="fuelux-wizard-container">
				<div class="steps-container">
					<ul class="steps">
						<li data-step="1" class="active">
							<span class="step">1</span>
							<span class="title">选择业务员</span>
						</li>
						
						<li data-step="2">
							<span class="step">2</span>
							<span class="title">选择产品</span>
						</li>

						<!--<li data-step="3">
							<span class="step">3</span>
							<span class="title">确认信息</span>
						</li>-->

					</ul>
				</div>

				<hr />

				<div class="step-content pos-rel">

					<div class="step-pane active" data-step="1">
						<h4 class="lighter block blue">选择下单的代理商
						</h4>
						
						<div class="profile-user-info profile-user-info-striped">
							<div class="profile-info-row">
								<div class="profile-info-name"> 名称 </div>

								<div class="profile-info-value">
									<span class="editable" id="username">${(Session['chooseClient'].username)!}</span>
								</div>
							</div>
							
							<div class="profile-info-row">
								<div class="profile-info-name"> 电话 </div>

								<div class="profile-info-value">
									<span class="editable" id="phone">${(Session['chooseClient'].phone)!}</span>
								</div>
							</div>

							<div class="profile-info-row">
								<div class="profile-info-name"> 身份证号 </div>

								<div class="profile-info-value">
									<span class="editable" id="idCard">${(Session['chooseClient'].userIdCard)!}</span>
								</div>
							</div>
							<div class="profile-info-row">
								<div class="profile-info-name"> 微信号 </div>

								<div class="profile-info-value">
									<span class="editable" id="weixin">${(Session['chooseClient'].weixin)!}</span>
								</div>
							</div>
							<div class="profile-info-row">
								<div class="profile-info-name"> 地址 </div>

								<div class="profile-info-value">
									<span class="editable" id="address">${(Session['chooseClient'].address)!}</span>
								</div>
							</div>
							<div class="profile-info-row">
								<div class="profile-info-name"> 代理商类别 </div>

								<div class="profile-info-value">
									<span class="editable" id="companyId">${(Session['chooseClient'].companyId)!}</span>
								</div>
							</div>
						</div>
						
						<div class="space-10"></div>
						
						<div class="form-group center">
							<button id="modal" class="btn btn-info btn-white" type="button">
								<span class="ace-icon fa fa-hand-pointer-o icon-on-right bigger-110"></span>
								选择代理商
							</button>
							<button id="add-client-btn" class="btn btn-inverse btn-white" type="button">
								<span class="ace-icon fa fa-plus icon-on-right bigger-110"></span>
								添加新代理商
							</button>
						</div>
					</div>
					
					<div class="step-pane" data-step="2">
						<h4 class="lighter block blue">在下方选择一种产品类型</h4>

						<select id="type" class="form-control">
							<option value="">请选择一个产品</option>
							<#list products as prt>
							<option value="${prt.id}" price="#{prt.price}" payCommission="#{prt.payCommission}" adCommission="#{prt.adCommission}" descript="${prt.descript!}">${prt.name}</option>
							</#list>
						</select>
						<div id="prt_div" class="hide" style="padding:10px">
							<div class="form-group">
								产品价格：<span id="price_span" class="red"></span>
							</div>
							<div class="form-group">
								销售佣金：<span id="payCommission_span"></span>
							</div>
							<div class="form-group">
								推广佣金：<span id="adCommission_span"></span>
							</div>
							<div class="form-group">
								产品说明：<span id="descript_span"></span>
							</div>
							<form id="validation-form" class="form-horizontal" action="${request.contextPath}/order/deposit" method="post">
								<input id="productId" name="order.productId" type="hidden">
								<input name="order.companyId" value="${(Session["admin"].companyId)!}" type="hidden">
								<input id="clientId" name="order.clientId" type="hidden" value="${(Session['chooseClient'].id)!}">
								<input name="add_order_token" value="${.now?string["hhmmSSsss"]}" type="hidden">
								
								<div class="form-group">
									<label class="control-label no-padding-right">购买数量：</label>
									<div>
									<input name="order.count" type="text" id="spinner3" value="1" />
									</div>
								</div>
							</form>
						</div>
					</div>

					<div class="step-pane" data-step="3">
						<div>
							
						</div>
					</div>
				</div>
			</div>

			<hr />
			<div class="wizard-actions">
				<button class="btn btn-prev">
					<i class="ace-icon fa fa-arrow-left"></i>
					上一步
				</button>

				<button id="btn-next" class="btn btn-success btn-next" data-last="完成">
					下一步
					<i class="ace-icon fa fa-arrow-right icon-on-right"></i>
				</button>
			</div>
		</div>
	</div>
</div>

<script src="${request.contextPath}/assets/js/wizard.min.js"></script>
<script src="${request.contextPath}/assets/js/jquery.validate.min.js"></script>
<script src="${request.contextPath}/js/bootstrap-modal-iframe.js"></script>
<script src="${request.contextPath}/js/validate.zh.js"></script>
<script src="${request.contextPath}/assets/js/spinbox.min.js"></script>

<script>
$(function(){
	$().ready(function() {
	    $("#validation-form").validate();
	});
	
	<#if RequestParameters['orderType']??>
	$("#type").val("");
	</#if>
	$('#fuelux-wizard-container').ace_wizard()
	.on('actionclicked.fu.wizard' , function(e, info){
		if(info.step == 2 && info.direction != "previous") {
			if($("#productId").val()==""){
				bootbox.alert("请选择一个产品");
				e.preventDefault();
			}
		}
		else if(info.step == 1 ) {
			if($("#clientId").val()=="" && info.direction != "previous"){
				bootbox.alert("请选择代理商");
				e.preventDefault();
			}
		}
	})
	.on('finished.fu.wizard', function(e) {
		$("#validation-form").submit();
	});
	
	var result = $("#modal").showModal("${request.contextPath}/client/modal","选择代理商",function(data){
    	$("#clientId").val(data.id);
    	$("#username").text(data.username);
    	$("#phone").text(data.phone);
    	$("#idCard").text(data.userIdCard);
    	$("#address").text(data.address);
    	$("#weixin").text(data.weixin);
    	$("#companyId").text(function(){
	    	switch(data.companyId)
			{
				case '1':
				  return "一级城市代理商";
				case '2':
				  return "省/市级代理商";
				case '3':
				  return "区域合伙人";
				default:
				  return "普通代理商";
			}
		});
    });
    $("#clientName").click(function(){$("#modal").click();return false;});
    
    
    $("#add-client-btn").click(function(){
    	location.href="${request.contextPath}/client/new?orderType=1";
    });
    
    sumMoney();
    
    $("#type").change(function(){
    	if( $("#type").val()!=""){
	    	$("#price_span").text($("#type option:selected").attr("price"));
	    	$("#payCommission_span").text($("#type option:selected").attr("payCommission"));
	    	$("#adCommission_span").text($("#type option:selected").attr("adCommission"));
	    	$("#descript_span").text($("#type option:selected").attr("descript"));
	    	$("#prt_div").removeClass("hide");
	    }else{
	    	$("#prt_div").addClass("hide");
	    }
	    $("#productId").val($("#type").val());
    });
    
    $('#spinner3').ace_spinner({min:0,max:100,on_sides: true, icon_up:'ace-icon fa fa-plus bigger-110', icon_down:'ace-icon fa fa-minus bigger-110'}).on("change",function(){
    });
    
    $("#companyId").text(function(){
		switch($(this).text())
		{
			case '1':
			  return "一级城市代理商";
			case '2':
			  return "省/市级代理商";
			case '3':
			  return "区域合伙人";
			case '0':
			  return "普通代理商";
			default :
			  return $(this).text();
		}
	});
});
function sumMoney(){
    	var weightObjs=$("input[name='orderInfo.weight']");
    	var weight=0;
    	for(var i=0;i<weightObjs.length;i++){
    		weightObj = weightObjs.eq(i);
    		weight += parseFloat( weightObj.val() );
    	}
    	if( weight>0 && $("#price").val()!="" ){
    		var sum=weight * parseFloat($("#price").val());
    		$("#money").val(sum.toFixed(1));
    		$("#weight").val(weight);
    	}
    }
function addGold(){
	var t=$(".gold-row:last");
	t.after(t.prop("outerHTML"));
}
function delGold(obj){
	if($(".gold-row").length==1){
		return false;
	}
	$(obj).parent().parent().remove();
	sumMoney();
}
function dipositChange(obj){
	if( parseFloat($(obj).val()) > parseFloat($("#money").val()) ){
		$(obj).val("");
		bootbox.alert("定金金额不能大于订单总价值");
	}
}
</script>