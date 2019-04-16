<div class="page-header">
	<h1>
		<i class="ace-icon fa fa-balance-scale"></i> <small>返点情况查询</small>
	</h1>
</div>

<div class="widget-box widget-color-blue" id="widget-box-2">
	<div class="widget-header">
		<h5 class="widget-title bigger lighter">
			<i class="ace-icon fa fa-search"></i>
			条件查询
		</h5>
		<div class="widget-toolbar">
			<a href="#" data-action="collapse">
				<i class="1 ace-icon fa fa-chevron-up bigger-125"></i>
			</a>
		</div>
		
	</div>
	
	<div class="widget-body">
		<div class="widget-main padding-6">
		<form id="sreachfrm" class="form-inline">
			<div class="input-group">
				<span class="input-group-addon">
				金额
				</span>
				<input name="money" type="text" placeholder="">
			</div>
			
			<div class="input-group">
				<span class="input-group-btn">
					<a id="modal1" class="btn btn-inverse btn-white">
						<span class="ace-icon fa fa-hand-pointer-o icon-on-right bigger-110"></span>
						选择
					</a>
				</span>
				<input id="clientId" name="clientId" class="form-control search-query" placeholder="选择业务员">
			</div>
			
			<div class="input-group">
				<span class="input-group-addon">
					订单日期
				</span>
				<input type="text" class="form-control date-picker" name="addTime_start" data-date-format="yyyy-mm-dd" placeholder="起始"/>
				<span class="input-group-addon">
					至
				</span>
				<input type="text" name="addTime_end" class="form-control date-picker" type="text" data-date-format="dd-mm-yyyy" placeholder="截止"/>
			</div>
			
			<button type="button" class="btn btn-purple btn-sm" id="reachbtn">
				<span class="ace-icon fa fa-search icon-on-right bigger-110"></span>
				搜索
			</button>
		</form>
		</div>
	</div>
</div>
<table id="grid-table"></table>

<div id="grid-pager"></div>

<script src="${request.contextPath}/js/pager.js"></script>

<script type="text/javascript">
var pagerData={};

pagerData.header = ['ID','订单','业务员','业务员电话','业务员微信','金额','状态','下单时间'/*,''*/];
pagerData.data = [
		{name:'id',index:'id', width:40, sorttype:"int",sortable:true,key:true,hidden:true},
		{name:'number',index:'number'},
		{name:'clientName',index:'clientName'},
		{name:'phone',index:'phone'},
		{name:'weixin',index:'weixin'},
		{name:'money',index:'money'},
		{name:'state',index:'state',formatter:'select',editoptions:{value:"1:销售佣金;2:推广佣金;3:激励佣金"}},
		{name:'addTime',index:'addTime', width:100, formatter: 'date', sorttype:"date"}/*,
		{name:'myac',index:'', width:40, fixed:true, sortable:false, resize:false,
				formatter:function (value, grid, rows, state) {
					var text="<a style=\"float:left;margin-left:8px;\" class=\"ui-pg-div ui-inline\" onmouseover=\"jQuery(this).addClass('ui-state-hover');\" href=\"${request.contextPath}/order/pay/"+rows.id+"\" data-original-title=\"查看/支付\"><span class='ui-icon ui-icon-pencil bigger-120'></span></a>";
					return text;
				}
			}*/
	];
pagerData.grid_selector = "#grid-table";
pagerData.pager_selector = "#grid-pager";
pagerData.sreach_btn = "#reachbtn";
pagerData.sreach_frm = "#sreachfrm";
pagerData.not_action_btn = true;
<#if (isModal??)>
pagerData.modal = true;
</#if>
</script>
<script src="${request.contextPath}/js/bootstrap-modal-iframe.js"></script>
<script>
$(function(){
    var result = $("#modal").showModal("${request.contextPath}/company/modal","选择所属分公司",function(data){$("#companyId").val(data.id);});
    var result1 = $("#modal1").showModal("${request.contextPath}/client/modal","选择客户",function(data){$("#clientId").val(data.id);});
});
</script>