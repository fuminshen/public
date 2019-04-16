<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<#include "${request.contextPath}/public/header.ftl">
		<!--[if !IE]> -->
		<meta name="description" content="">
	    <meta name="author" content="">
		<meta name="keywords" content="">
	</head>
	<body>
		<div class="col-md-6 col-md-offset-3">
<div class="error-container">
	<div class="well">
		<h1 class="grey lighter smaller">
			<span class="blue bigger-125">
				<i class="ace-icon fa fa-sitemap"></i>
				${code!}
			</span>
			错误信息
		</h1>
		
		<hr />
		<h3 class="lighter smaller">
			<div>${message!}</div>
		</h3>
		
		<hr />
		<div class="space"></div>

		<div class="center">
			<a href="javascript:history.back()" class="btn btn-grey">
				<i class="ace-icon fa fa-arrow-left"></i>
				返回
			</a>

			<a href="${request.contextPath}/" class="btn btn-primary">
				<i class="ace-icon fa fa-tachometer"></i>
				首页
			</a>
		</div>
	</div>
</div>
		</div>
	</body>
</html>