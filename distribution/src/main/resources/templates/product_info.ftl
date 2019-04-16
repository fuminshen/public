<div class="page-header">
	<h1>
	<i class="ace-icon fa fa-shopping-bag"></i> <small>${((vo.id)??)?string('编辑','新增')}产品</small>
	</h1>
</div>
<form method="post" action="${request.contextPath}/${viewName?substring(0,viewName?index_of('_') )}/${((vo.id)??)?string('update','add')}" class="form-horizontal" role="form">
<input name="id" value="${(vo.id)!}" type="hidden">
<div class="form-group">
	<label class="col-sm-3 control-label no-padding-right">名称：</label>
	<div class="col-sm-9">
	<input name="name" value="${(vo.name)!}" class="form-control" placeholder="必填"></div>
</div>
<div class="form-group">
	<label class="col-sm-3 control-label no-padding-right">单价：</label>
	<div class="col-sm-9">
	<input name="price" value="#{(vo.price)!0}" class="form-control" placeholder="必填"></div>
</div>
<div class="form-group">
	<label class="col-sm-3 control-label no-padding-right">销售佣金：</label>
	<div class="col-sm-9">
	<input name="payCommission" value="#{(vo.payCommission)!0}" class="form-control" placeholder="必填"></div>
</div>
<div class="form-group">
	<label class="col-sm-3 control-label no-padding-right">推广佣金：</label>
	<div class="col-sm-9">
	<input name="adCommission" value="#{(vo.adCommission)!500}" class="form-control" placeholder="必填"></div>
</div>

<div class="hr"></div>
<div class="form-group">
	<label class="col-sm-3 control-label no-padding-right">产品描述：</label>
	<div class="col-sm-9">
	<textarea name="descript" class="form-control" placeholder="选填">${(vo.descript)!}</textarea>
	</div>
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
