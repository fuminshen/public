<div class="page-header">
	<h1>
	<i class="ace-icon fa fa-paperclip" title="订单列表"></i>
	<small>
	<i class="ace-icon fa fa-angle-double-right"></i>
	<a href="${request.contextPath}/${viewName?substring(0,viewName?index_of('_') )}/new" class="btn btn-link btn-info bigger">
		<i class="ace-icon fa fa-plus"></i>下订单
	</a>
	</small>
	</h1>
</div>
<div class="widget-box widget-color-blue visible-lg" id="widget-box-2">
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
				订单号
				</span>
				<input name="number" type="text" placeholder="订单号" class="form-control search-query">
			</div>
			
			
			<div class="input-group">
				<span class="input-group-addon">
					下单日期
				</span>
				<input type="text" class="form-control date-picker" name="addTime_start" data-date-format="yyyy-mm-dd" placeholder="起始"/>
				<span class="input-group-addon">
					至
				</span>
				<input type="text" name="addTime_end" class="form-control date-picker" type="text" data-date-format="dd-mm-yyyy" placeholder="截止"/>
			</div>

<!--
			<div class="input-group">
				<span class="input-group-btn">
					<a id="modal" class="btn btn-inverse btn-white">
						<span class="ace-icon fa fa-hand-pointer-o icon-on-right bigger-110"></span>
						选择
					</a>
				</span>
				<input id="companyId" name="companyId" class="form-control search-query" placeholder="选择分公司">
			</div>
-->
			
			<div class="input-group">
				<span class="input-group-btn">
					<a id="modal1" class="btn btn-inverse btn-white">
						<span class="ace-icon fa fa-hand-pointer-o icon-on-right bigger-110"></span>
						选择
					</a>
				</span>
				<input id="clientId" name="clientId" class="form-control search-query" placeholder="搜索代理商">
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

pagerData.header = ['ID','订单号','代理商','产品','单价','总金额','数量','下单时间'];
pagerData.data = [
			{name:'id',index:'id', width:40, sorttype:"int",sortable:true,key:true,hidden:true},
			{name:'number',index:'number',sortable:false},
			{name:'clientName',index:'clientName', sortable:false},
			{name:'productName',index:'productName', sortable:false},
			{name:'price',index:'price', width:90,sortable:false},
			{name:'money',index:'money', width:90,sortable:false},
			{name:'count',index:'count', sortable:false},
			{name:'addTime',index:'addTime', width:100, formatter: 'date', sorttype:"date",sortable:false}
		];
pagerData.grid_selector = "#grid-table";
pagerData.pager_selector = "#grid-pager";
pagerData.sreach_btn = "#reachbtn";
pagerData.sreach_frm = "#sreachfrm";
pagerData.not_action_btn = true;
</script>
<script src="${request.contextPath}/js/bootstrap-modal-iframe.js"></script>
<script>
$(function(){
    var result = $("#modal").showModal("${request.contextPath}/company/modal","选择所属分公司",function(data){$("#companyId").val(data.id);});
    var result1 = $("#modal1").showModal("${request.contextPath}/client/modal","选择代理商",function(data){$("#clientId").val(data.id);});
});
</script>