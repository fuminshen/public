<#if !(isModal??)>
<div>
	<a href="${request.contextPath}/${viewName?substring(0,viewName?index_of('_') )}/new" class="btn btn-link btn-info bigger">
		<i class="ace-icon fa fa-plus"></i>
		新增
	</a>
</div>
</#if>

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
				合同号
				</span>
				<input name="number" type="text" placeholder="合同号" like="1">
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

pagerData.header = ['ID','合同号','合同照片','签订时间'];
pagerData.data = [
		{name:'id',index:'id', width:40, sorttype:"int",sortable:true,key:true,hidden:true},
		{name:'number',index:'number'},
		{name:'photo',index:'photo'},
		{name:'addTime',index:'addTime', width:150, formatter: 'date', sorttype:"date"}
	];
pagerData.grid_selector = "#grid-table";
pagerData.pager_selector = "#grid-pager";
pagerData.sreach_btn = "#reachbtn";
pagerData.sreach_frm = "#sreachfrm";
<#if (isModal??)>
pagerData.modal = true;
</#if>
</script>