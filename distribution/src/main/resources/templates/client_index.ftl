<#if !(isModal??)>
<div class="page-header">
	<h1>
	<i class="ace-icon fa fa-user" title="代理商列表"></i>
	<small>
	<i class="ace-icon fa fa-angle-double-right"></i>
	<a href="${request.contextPath}/${viewName?substring(0,viewName?index_of('_') )}/new" class="btn btn-link btn-info bigger">
		<i class="ace-icon fa fa-plus"></i>新增代理商
	</a>
	</small>
	</h1>
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
				名称
				</span>
				<input name="username" type="text" placeholder="名称" like="1">
			</div>
			
			<div class="input-group">
				<span class="input-group-addon">
				电话
				</span>
				<input name="phone" type="text" placeholder="电话">
			</div>
			
			<div class="input-group">
				<span class="input-group-addon">
				微信
				</span>
				<input name="weixin" type="text" placeholder="微信">
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

pagerData.header = ['ID','名称','微信号','电话','地址','开户行','账户','开户人','级别类型','添加时间'<#if !(isModal??)>,'上级','下级'</#if>];
pagerData.data = [
		{name:'id',index:'id', width:40, sorttype:"int",sortable:true,key:true,hidden:true},
		{name:'username',index:'username'},
		{name:'weixin',index:'weixin'},
		{name:'phone',index:'phone'},
		{name:'address',index:'address'},
		{name:'bankName',hidden:true},
		{name:'bankNumber',hidden:true},
		{name:'bankUser',hidden:true},
		{name:'companyId',formatter:'select',editoptions:{value:"0:普通代理商;1:一级城市代理商;2:省/市级代理商;3:区域合伙人"}},
		{name:'addTime',index:'addTime', width:100, formatter: 'date', sorttype:"date"}
		<#if !(isModal??)>
		,
		{name:'parentId',index:'parentId', width:80,formatter:function(v){return v>0?'<a href="${request.contextPath}/client/get/'+v+'">查看上级</a>':'无上级';}},
		{name:'myac',index:'', width:50, fixed:true, sortable:false, resize:false,
				formatter:function (value, grid, rows, state) {
					var text="<a style=\"float:left;margin-left:8px;\" class=\"ui-pg-div ui-inline\" onmouseover=\"jQuery(this).addClass('ui-state-hover');\" onmouseout=\"jQuery(this).removeClass('ui-state-hover');\" href=\"${request.contextPath}/client/new/"+rows.id+"\" data-original-title=\"添加下级\"><span class='ui-icon fa fa-plus bigger-120 green'></span></a>";
					return text;
				}
		}
		</#if>
	];
pagerData.grid_selector = "#grid-table";
pagerData.pager_selector = "#grid-pager";
pagerData.sreach_btn = "#reachbtn";
pagerData.sreach_frm = "#sreachfrm";
<#if (isModal??)>
pagerData.modal = true;
</#if>
</script>
<script src="${request.contextPath}/js/bootstrap-modal-iframe.js"></script>
<script>
$(function(){
    var result = $("#modal").showModal("${request.contextPath}/company/modal","选择所属分公司",function(data){$("#companyId").val(data.id);});
});
</script>