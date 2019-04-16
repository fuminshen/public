<div class="page-header">
	<h1>
		<i class="ace-icon fa fa-paperclip"></i> ${order.number}
		<small>
			<#if order.type == 0>
			<span class="text-warning"><i class="ace-icon fa fa-line-chart"></i> 投资金</span>
			<#else>
			<span class="text-primary"><i class="ace-icon fa fa-diamond"></i> 饰　金</span>
			</#if> 
			| 
			<#if order.state==0>
			<a class="text-danger"><i class="fa fa-truck"></i> 预订中</a>
			<#elseif order.state==1>
			<span class="text-success"><i class="fa fa-check"></i> 交易完成</span>
			<#else>
			<span class="text-default"><i class="fa fa-check"></i> 黄金已退还</span>
			</#if>
		</small>
	</h1>
</div>

<#if client.id??>
<div class="col-xs-12 ${(pays??)?string('col-sm-7','')}" style="padding:0">
<div class="profile-user-info profile-user-info-striped" style="margin:0;">
	<div class="profile-info-row">
		<div class="profile-info-name"> 姓名 </div>

		<div class="profile-info-value">
			<span class="editable" id="username">${(client.username)!}</span>
		</div>
	</div>
	
	<div class="profile-info-row">
		<div class="profile-info-name"> 电话 </div>

		<div class="profile-info-value">
			<span class="editable" id="phone">${(client.phone)!}</span>
		</div>
	</div>

	<div class="profile-info-row">
		<div class="profile-info-name"> 身份证号 </div>

		<div class="profile-info-value">
			<span class="editable" id="idCard">${(client.userIdCard)!}</span>
		</div>
	</div>
	<div class="profile-info-row">
		<div class="profile-info-name"> 地址 </div>

		<div class="profile-info-value">
			<span class="editable" id="address">${(client.address)!}</span>
		</div>
	</div>
	<div class="profile-info-row">
		<div class="profile-info-name"> 开户行 </div>

		<div class="profile-info-value">
			<span class="editable" id="bankName">${(client.bankName)!}</span>
		</div>
	</div>
	<div class="profile-info-row">
		<div class="profile-info-name"> 银行卡号 </div>

		<div class="profile-info-value">
			<span class="editable" id="bankNumber">${(client.bankNumber)!}</span>
		</div>
	</div>
	<div class="profile-info-row">
		<div class="profile-info-name"> 开户人 </div>

		<div class="profile-info-value">
			<span class="editable" id="bankUser">${(client.bankUser)!}</span>
		</div>
	</div>
	<div class="profile-info-row">
		<div class="profile-info-name"> 共同享有人 </div>

		<div class="profile-info-value">
			<span class="editable">${(client.friends)!}</span>
		</div>
	</div>
</div>
</div>

<#if pays??>
<div class="col-xs-12 col-sm-5" style="height:257px;overflow:auto">
	<div class="timeline-container">
		<div class="timeline-label">
			<span class="label label-primary arrowed-in-right label-lg">
				<b>返点情况</b>
			</span>
		</div>
		<div class="timeline-items">
			
			<#list pays as pay>
			<div class="timeline-item clearfix">
				<div class="timeline-info">
					<#if pay.state==1>
					<i class="timeline-indicator ace-icon fa fa-check btn-success btn no-hover"></i>
					<#else>
					<#if order.state==2>
					<i class="timeline-indicator ace-icon fa fa-close btn-success btn no-hover"></i>
					<#else>
					<a href="${request.contextPath}/order/pay/#{pay.id}">
					<i class="timeline-indicator ace-icon fa fa-${(pay.dueTime <= .now)?string('hand-pointer-o','balance-scale')} btn-${(pay.dueTime <= .now)?string('info','default')} btn" style="cursor:pointer"></i>
					</a>
					</#if>
					</#if>
				</div>

				<div class="widget-box transparent">
					<div class="widget-body">
						<div class="widget-main">
							
							金额：￥#{pay.money}
							<#if (order.state==1)>
							<#if (pay.dueTime <= .now)><#if (pay.state==0)>
							<a href="${request.contextPath}/order/pay/#{pay.id}" title="去返点">已到期</a></#if>
							<#else><a href="${request.contextPath}/order/pay/#{pay.id}" title="提前返点" class="orange">未到期</a></#if>
							</#if>
							<div class="pull-right">
								<i class="ace-icon fa fa-calendar bigger-110"></i>
								${pay.dueTime?string('yyyy-MM-dd')}
							</div>
						</div>
					</div>
				</div>
			</div>
			</#list>

		</div>
	</div>
</div>
</#if>
<div class="clearfix"></div>
</#if>
<div class="space-10"></div>

<div class="widget-container-col" id="widget-container-col-2">
	<div class="widget-box widget-color-green" id="widget-box-2">
		<div class="widget-header">
			<h5 class="widget-title bigger lighter">
				<i class="ace-icon fa fa-table"></i>
				黄金信息
			</h5>

		</div>

		<div class="widget-body">
			<div class="widget-main no-padding">
			<table class="table table-bordered table-hover">
				<thead class="thin-border-bottom">
					<tr>
						<th width="60">序号
						</th>
						<th>编号
						</th>
						<th>重量（克）
						</th>
					</tr>
				</thead>
				<tbody>
					<#list orderInfoes as orderInfo>
					<tr>
						<td>
							${orderInfo_index+1}
						</td>
						<td>
							${(orderInfo.number)!}
						</td>
						<td>
							${(orderInfo.weight)!}
						</td>
					</tr>
					</#list>
					<tfoot>
						<td colspan="3" style="text-align:right;line-height:22px;">
							<div>总重量：<span class="info-text">${order.weight} （克）</span></div>
							<div>单　价：<span class="info-text">￥${order.price}</span>
							<div class="strong">总价格：<span class="info-text" style="color:red">￥#{order.money}</span></div>
							<div class="strong">预付款：<span class="info-text">￥#{order.deposit}</span></div>
						</td>
					</tfoot>
				</tbody>
			</table>
			</div>
		</div>
	</div>
</div>

<#if order.type==0 && contracts??>
<div class="space-10"></div>
<div id="contract" class="widget-box transparent">
	<div class="widget-header widget-header-small">
		<h4 class="widget-title blue smaller">
			<i class="ace-icon fa fa-file-text-o black"></i>
			订单合同
		</h4>

	</div>

	<div class="widget-body">
		<div class="widget-main padding-8">
			<#list contracts as contract>
			<div class="well well-sm">
				<span class="text-info">${contract.name}</span> 
				<button type="button" class="btn-link ace-ico fa fa-remove red" ct_id="${contract.id}" onclick="delContract(this)"></button>
				<#if (contract.images)??>
				<ul class="ace-thumbnails clearfix ">
				<#list contract.images as image>
				<li>
					<a href="${image.path}" data-rel="colorbox" target="_blank">
						<img src="${image.path}" width="100" height="100" />
					</a>
				</li>
				</#list>
				</ul>
				</#if>
			</div>
			</#list>
		</div>
	</div>
</div>
</#if>

<#if order.state!=2>
<div class="clearfix form-actions">
	<#if order.type==0>
	<a class="btn btn-white btn-success btn-round" href="${request.contextPath}/order/constract/#{order.id}" title="下载合同"><i class='ace-icon fa fa-download'></i>
	下载销售合同
	</a>
	<a class="btn btn-white btn-warning btn-round" href="${request.contextPath}/contract/new/#{order.id}" title="上传合同"><i class='ace-icon fa fa-upload'></i>
	上传新合同照片
	</a>
	</#if>
	<#if order.state==0>
	<button type="button" class="btn btn-primary btn-round" onclick="giveGold()"><i class='ace-icon fa fa-check'></i>
	交货并完成订单
	</button>
	<#elseif order.state==1>
		<#if order.type==0>
			<#if ((order.endTime)??) && (order.endTime)?date <= (.now?long+86400000*3)?number_to_datetime?date>
		<button type="button" class="btn btn-success btn-round" onclick="backGold('确认后交易完成并封存，不能再进行任何操作，是否确认？')"><i class='ace-icon fa fa-money'></i>
		到期还金
		</button>
			<#else>
		<button type="button" class="btn btn-danger btn-round" onclick="backGold('提前退单交易作废，并收回客户已领取的返额，是否已经收回或做好其他处理？')"><i class='ace-icon fa fa-close'></i>
		提前退单
		</button>
			</#if>
		<#else>
		<button type="button" class="btn btn-danger btn-round" onclick="backGold('退还后该订单交易作废，不能再进行任何操作，是否现在退还？')"><i class='ace-icon fa fa-close'></i>
		退单还金
		</button>
		</#if>
	
	</#if>
</div>
</#if>
<style>
th,td{text-align:center}
.strong{font-size:14px;font-weight:bold;}
.info-text{width:100px;text-align:right;display:inline-block;}
</style>
<script>
function delContract(obj){
	bootbox.confirm({
                title : "删除确认",
                message: "是否删除该合同", 
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
                        var data={};
						data.id=$(obj).attr("ct_id");
						$.post("${request.contextPath}/contract/delete",data,function(result){
							result = eval("("+result+")");
							if(result.state=="success"){
								$(obj).parent().remove();
							}
						});
                    }
                }
            });
	
}
function backGold(msg){
	bootbox.confirm({
		title : "退还确认",
		message: msg, 
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
				var form = document.createElement("form");
            	document.body.appendChild(form);
            	form.method = "post";
            	form.action = "${request.contextPath}/order/back/#{order.id}";
            	form.submit();
			}
		}
	});
}
function giveGold(){
	<#if order.type==0 && !(contracts??)>
	bootbox.confirm({
		title : "交付确认",
		message: "尚未上传任何合同，是否现在交付？", 
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
				location.href="${request.contextPath}/order/finish/#{order.id}";
			}
		}
	});
	<#else>
	location.href="${request.contextPath}/order/finish/#{order.id}";
	</#if>
}
</script>