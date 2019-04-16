<div class="page-header">
	<h1>
	<i class="ace-icon fa fa-user"></i> <small>${((vo.id)??)?string('编辑','新增')}代理商</small>
	</h1>
</div>
<div class="alert alert-success">
<i class="ace-icon fa fa-angle-double-right"></i>
<#if (parent.username)??>
<a href="${request.contextPath}/client/get/#{parent.id}">${parent.username}</a> 的下级代理商
<#else>
顶级代理商
</#if>
</div>
<form method="post" action="${request.contextPath}/${viewName?substring(0,viewName?index_of('_') )}/${((vo.id)??)?string('update','add')}" class="form-horizontal" role="form">
<input name="id" value="${(vo.id)!}" type="hidden">
<#if (vo.id)??>
<input name="parentId" value="${(vo.parentId)!}" type="hidden">
<#else>
<input name="parentId" value="${(parent.id)!'0'}" type="hidden">
</#if>
<#if RequestParameters['orderType']??>
<input name="orderType" value="${RequestParameters['orderType']}" type="hidden">
</#if>
<div class="form-group">
	<label class="col-sm-3 control-label no-padding-right">名称：</label>
	<div class="col-sm-9">
	<input name="username" value="${(vo.username)!}" class="form-control"></div>
</div>
<div class="form-group">
	<label class="col-sm-3 control-label no-padding-right">微信号：</label>
	<div class="col-sm-9">
	<input name="weixin" value="${(vo.weixin)!}" class="form-control"></div>
</div>
<div class="form-group">
	<label class="col-sm-3 control-label no-padding-right">身份证号：</label>
	<div class="col-sm-9">
	<input name="userIdCard" value="${(vo.userIdCard)!}" class="form-control"></div>
</div>
<div class="form-group">
	<label class="col-sm-3 control-label no-padding-right">联系电话：</label>
	<div class="col-sm-9">
	<input name="phone" value="${(vo.phone)!}" class="form-control"></div>
</div>
<div class="form-group">
	<label class="col-sm-3 control-label no-padding-right">地址：</label>
	<div class="col-sm-9">
	<input name="address" value="${(vo.address)!}" class="form-control"></div>
</div>

<div class="hr hr-24"></div>

<div class="form-group">
	<label class="col-sm-3 control-label no-padding-right">级别类型：</label>
	<div class="col-sm-9">
	<select name="companyId" id="companyId">
		<option value="0">普通代理商</option>
		<option value="1">一级城市代理商</option>
		<option value="2">省/市级代理商</option>
		<option value="3">区域合伙人</option>
	</select>
	</div>
</div>

<#if (vo.id)??>
<div class="hr hr-24"></div>
<div class="form-group">
	<label class="col-sm-3 control-label no-padding-right">累积销售数量：</label>
	<div class="col-sm-9">
		<label class="control-label no-padding-left">${(vo.sellCount)!}</label>
	</div>
</div>
<div class="form-group">
	<label class="col-sm-3 control-label no-padding-right">录入时间：</label>
	<div class="col-sm-9">
		<label class="control-label no-padding-left">${(vo.addTime)!}</label>
	</div>
</div>

<div class="widget-box collapsed widget-color-blue2" id="widget-box-2">
	<div class="widget-header widget-header-small">
		<h5 class="widget-title bigger lighter">
			<i class="ace-icon fa fa-sort-amount-desc"></i>
			现有下级 ${children?size} 人（点击最右侧箭头展开）
		</h5>
		<div class="widget-toolbar">
			<a href="#" data-action="collapse">
				<i class="ace-icon fa fa-chevron-down"></i>
			</a>
		</div>
	</div>

	<div class="widget-body">
		<div class="widget-main no-padding">
			<table class="table table-striped table-bordered table-hover">
				<thead class="thin-border-bottom">
					<tr>
						<th>
							<i class="ace-icon fa fa-user"></i>
							姓名
						</th>

						<th>
							电话
						</th>
						<th>微信</th>
						<th>累积销量</th>
					</tr>
				</thead>

				<tbody>
				<#list children as child>
					<tr>
						<td class="">
							<a href="${request.contextPath}/client/get/#{child.id}">${child.username!}</a>
						</td>
						<td>
							${child.phone!}
						</td>

						<td>
							${child.weixin!}
						</td>
						<td>
							#{child.sellCount!0}
						</td>
					</tr>
				</#list>
				</tbody>
			</table>
		</div>
	</div>
</div>
</#if>

<div class="clearfix form-actions">
	<div class="col-md-offset-3 col-md-9">
		<button class="btn btn-info" type="submit">
			<i class="ace-icon fa fa-check bigger-110"></i>
			提交
		</button>

		&nbsp; &nbsp; &nbsp;
		<button class="btn" type="button" onclick="self.location=document.referrer;">
			<i class="ace-icon fa fa-undo bigger-110"></i>
			返回
		</button>
		<#if (vo.id)??>
		&nbsp; &nbsp; &nbsp;
		<a class="btn btn-success" href="${request.contextPath}/client/new/#{vo.id}">
			<i class="ace-icon fa fa-plus bigger-110"></i>
			添加下级
		</a>
		</#if>
	</div>
</div>

</form>
<script>
$(function(){
	<#if (vo.companyId)??>
	$("#companyId").val("${vo.companyId}");
	</#if>
});
</script>