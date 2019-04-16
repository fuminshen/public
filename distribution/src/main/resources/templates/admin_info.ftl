<div class="page-header">
	<h1>
	<i class="ace-icon fa fa-user-secret"></i> <small>${((vo.id)??)?string('编辑','新增')}管理员</small>
	</h1>
</div>
<form method="post" action="${request.contextPath}/${viewName?substring(0,viewName?index_of('_') )}/${((vo.id)??)?string('update','add')}" class="form-horizontal" role="form">
<input name="id" value="${(vo.id)!}" type="hidden">
<div class="form-group">
	<label class="col-sm-3 control-label no-padding-right">用户名：</label>
	<div class="col-sm-9">
	<input name="username" value="${(vo.username)!}" class="form-control" ${((vo.id)??)?string('readonly','')}></div>
</div>
<div class="form-group">
	<label class="col-sm-3 control-label no-padding-right">密码：</label>
	<div class="col-sm-9">
	<input name="password" class="form-control" type="password"></div>
</div>
<div class="form-group">
	<label class="col-sm-3 control-label no-padding-right">重复密码：</label>
	<div class="col-sm-9">
	<input name="repassword" class="form-control" type="password"></div>
</div>
<hr>
<div class="form-group">
	<label class="col-sm-3 control-label no-padding-right">姓名：</label>
	<div class="col-sm-9">
	<input name="name" class="form-control" value="${(vo.name)!}"></div>
</div>
<div class="form-group">
	<label class="col-sm-3 control-label no-padding-right">手机号：</label>
	<div class="col-sm-9">
	<input name="phone" class="form-control" value="${(vo.phone)!}"></div>
</div>
<div class="form-group">
	<label class="col-sm-3 control-label no-padding-right">微信号：</label>
	<div class="col-sm-9">
	<input name="weixin" class="form-control" value="${(vo.weixin)!}"></div>
</div>
<div class="form-group">
	<label class="col-sm-3 control-label no-padding-right">Email：</label>
	<div class="col-sm-9">
	<input name="email" class="form-control" value="${(vo.email)!}"></div>
</div>

<#--
<div class="form-group">
	<label class="col-sm-3 control-label no-padding-right">分公司：</label>
	<div class="col-sm-9">
	
	<div class="input-group">
		
		<span class="input-group-btn">
			<a id="modal" class="btn btn-inverse btn-white">
				<span class="ace-icon fa fa-hand-pointer-o icon-on-right bigger-110"></span>
				选择
			</a>
		</span>
		<input id="companyId" name="companyId" value="${(vo.companyId)!}" class="form-control search-query" readonly>
	</div>
	</div>
	
</div>
-->
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