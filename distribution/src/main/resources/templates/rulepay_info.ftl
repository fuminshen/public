<div class="page-header">
	<h1>
	<i class="ace-icon fa fa-gavel"></i> <small>${((vo.id)??)?string('编辑','新增')}规则</small>
	</h1>
</div>
<form method="post" action="${request.contextPath}/rulepay/${((vo.id)??)?string('update','add')}" class="form-horizontal" role="form">
<input name="id" value="${(vo.id)!}" type="hidden">
<input name="adminId" value="${(Session.admin.id)!}" type="hidden">
<div class="form-group">
	<label class="col-sm-3 control-label no-padding-right">销售量：</label>
	<div class="col-sm-9">
	<input name="count" value="#{(vo.count)!0}" class="form-control" placeholder="必填"></div>
</div>
<div class="form-group">
	<label class="col-sm-3 control-label no-padding-right">提成金额：</label>
	<div class="col-sm-9">
	<input name="money" value="#{(vo.money)!0}" class="form-control" placeholder="必填"></div>
</div>
<div class="form-group">
	<label class="col-sm-3 control-label no-padding-right">规则说明：</label>
	<div class="col-sm-9">
	<input name="descript" value="${(vo.descript)!}" class="form-control" placeholder="选填"></div>
</div>
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
