<div class="page-header">
	<h1>
	<i class="ace-icon fa fa-user"></i> <small>新增代理商</small>
	</h1>
</div>

<h4 class="lighter block blue">选择一种代理商</h4>

<div class="form-group">
	<a class="btn btn-success btn-block btn-white radius-5 btn-lg" href="${request.contextPath}/client/new/0${(RequestParameters.orderType??)?string('?orderType=1','')}">
	<i class="ace-icon fa fa-user"></i> 顶级代理商（没有上级）
	</a>
</div>

<div class="form-group">
	<button id="modal1" class="btn btn-info btn-block btn-white radius-5 btn-lg" type="button" data="1">
	<i class="ace-icon fa fa-users"></i> 下级代理商（选择上级）
	</button>
</div>
<script src="${request.contextPath}/js/bootstrap-modal-iframe.js"></script>
<script>
$(function(){
    var result1 = $("#modal1").showModal("${request.contextPath}/client/modal","选择上级代理商",function(data){
    	location.href="${request.contextPath}/client/new/"+data.id+"${(RequestParameters.orderType??)?string('?orderType=1','')}";
    });
});
</script>