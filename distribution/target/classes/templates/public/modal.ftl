<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<#include "${request.contextPath}/public/header.ftl">
		<meta name="description" content="">
	    <meta name="author" content="">
		<meta name="keywords" content="">
	</head>
	<body>
		<div class="modal-body" style="padding:0;margin:0;background:#fff">
		
			<div class="row">
				<div class="col-xs-12">
					<!-- PAGE CONTENT BEGINS -->
					<#include "${request.contextPath}/${viewName}.ftl">
					<!-- PAGE CONTENT ENDS -->
				</div><!-- /.col -->
			</div>
			
		</div><!-- /.main-content -->
		
		<!-- basic scripts -->
		<script src="${request.contextPath}/assets/js/bootstrap.min.js"></script>

		<!-- page specific plugin scripts -->
		<script src="${request.contextPath}/assets/js/bootstrap-datepicker.min.js"></script>
		<script src="${request.contextPath}/assets/js/bootstrap-datepicker.zh-CN.min.js"></script>
		<script src="${request.contextPath}/assets/js/jquery.jqGrid.min.js"></script>
		<script src="${request.contextPath}/assets/js/grid.locale-cn.js"></script>

		<!-- ace scripts -->
		<script src="${request.contextPath}/assets/js/ace-elements.min.js"></script>
		<script src="${request.contextPath}/assets/js/ace.min.js"></script>
		
		<script>
		$(function(){
			//日期选择控件
			$('.date-picker').datepicker({
				autoclose: true,
				todayHighlight: true,
				format: 'yyyy-mm-dd'
			})
		});
		</script>
	</body>
<html>