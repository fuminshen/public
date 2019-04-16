<div class="page-header">
	<h1>
	<i class="ace-icon fa fa-building-o"></i> <small>${((vo.id)??)?string('编辑','新增')}分公司</small>
	</h1>
</div>
<form method="post" action="${request.contextPath}/${viewName?substring(0,viewName?index_of('_') )}/${((vo.id)??)?string('update','add')}" class="form-horizontal" role="form">
<input name="id" value="${(vo.id)!}" type="hidden">
<div class="form-group">
	<label class="col-sm-3 control-label no-padding-right">公司名：</label>
	<div class="col-sm-9">
	<input name="name" value="${(vo.name)!}" class="form-control" ${((vo.id)??)?string('readonly','')}></div>
</div>
<div class="form-group">
	<label class="col-sm-3 control-label no-padding-right">公司电话：</label>
	<div class="col-sm-9">
	<input name="phone" value="${(vo.phone)!}" class="form-control"></div>
</div>
<div class="form-group">
	<label class="col-sm-3 control-label no-padding-right">传真号码：</label>
	<div class="col-sm-9">
	<input name="fax" value="${(vo.fax)!}" class="form-control"></div>
</div>
<div class="form-group">
	<label class="col-sm-3 control-label no-padding-right">公司地址：</label>
	<div class="col-sm-9">
	<input name="address" value="${(vo.address)!}" class="form-control"></div>
</div>

<div class="hr"></div>
<div class="form-group">
	<label class="col-sm-3 control-label no-padding-right">开户行：</label>
	<div class="col-sm-9">
	<input name="bankName" value="${(vo.bankName)!}" class="form-control"></div>
</div>
<div class="form-group">
	<label class="col-sm-3 control-label no-padding-right">银行帐号：</label>
	<div class="col-sm-9">
	<input name="bankNumber" value="${(vo.bankNumber)!}" class="form-control"></div>
</div>
<div class="form-group">
	<label class="col-sm-3 control-label no-padding-right">开户名：</label>
	<div class="col-sm-9">
	<input name="bankUser" value="${(vo.bankUser)!}" class="form-control"></div>
</div>
<#if (vo.id)??>
<div class="form-group">
	<label class="col-sm-3 control-label no-padding-right">录入时间：</label>
	<div class="col-sm-9">
		<label class="control-label no-padding-left">${(vo.addTime)!}</label>
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
	</div>
</div>

</form>
<#if (RequestParameters['companyUpdate']?? && RequestParameters['companyUpdate']=='1')>
<script>
$(function(){bootbox.alert("修改成功");});
</script>
</#if>