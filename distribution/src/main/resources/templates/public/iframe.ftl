<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<#include "${request.contextPath}/public/header.ftl">
		<title>三级分销-交易管理系统</title>
		<meta name="description" content="">
	    <meta name="author" content="FM">
		<meta name="keywords" content="">
	</head>
<body class="no-skin">
	<div id="navbar" class="navbar navbar-default ace-save-state">
			<div class="navbar-container ace-save-state" id="navbar-container">
				<button type="button" class="navbar-toggle menu-toggler pull-left" id="menu-toggler" data-target="#sidebar">
					<span class="sr-only">Toggle sidebar</span>

					<span class="icon-bar"></span>

					<span class="icon-bar"></span>

					<span class="icon-bar"></span>
				</button>

				<div class="navbar-header pull-left">
					<a href="index.html" class="navbar-brand">
						<small>
							<i class="ace-icon fa fa-cart-plus"></i>
							三级分销交易管理系统
						</small>
					</a>
				</div>

				<div class="navbar-buttons navbar-header pull-right" role="navigation">
					<ul class="nav ace-nav">

						<li class="light-blue dropdown-modal">
							<a data-toggle="dropdown" href="#" class="dropdown-toggle">
								<img class="nav-user-photo" src="${request.contextPath}/img/user.jpg" alt="Jason's Photo" />
								<span class="user-info">
									<small>欢迎登录，</small>
									${(Session.admin.username)!}
								</span>

								<i class="ace-icon fa fa-caret-down"></i>
							</a>

							<ul class="user-menu dropdown-menu-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">

								<li>
									<a href="${request.contextPath}/admin/get/${(Session.admin.id)!}">
										<i class="ace-icon fa fa-user"></i>
										个人信息
									</a>
								</li>

								<li class="divider"></li>

								<li>
									<a href="${request.contextPath}/logout">
										<i class="ace-icon fa fa-power-off"></i>
										注销登录
									</a>
								</li>
							</ul>
						</li>
					</ul>
				</div>
			</div><!-- /.navbar-container -->
		</div>

		<div class="main-container ace-save-state" id="main-container">
			<script type="text/javascript">
				try{ace.settings.loadState('main-container')}catch(e){}
			</script>

			<div id="sidebar" class="sidebar                  responsive                    ace-save-state">
				<script type="text/javascript">
					try{ace.settings.loadState('sidebar')}catch(e){}
				</script>

				<div class="sidebar-shortcuts" id="sidebar-shortcuts">
					<div class="sidebar-shortcuts-large" id="sidebar-shortcuts-large">
						<a class="btn btn-success" href="${request.contextPath}/client/index">
							<i class="ace-icon fa fa-user"></i>
						</a>

						<a class="btn btn-info" href="${request.contextPath}/order/index">
							<i class="ace-icon fa fa-paperclip"></i>
						</a>

						<a class="btn btn-warning" href="${request.contextPath}/admin/index">
							<i class="ace-icon fa fa-user-secret"></i>
						</a>

						<a class="btn btn-danger" href="${request.contextPath}/pay/index">
							<i class="ace-icon fa fa-balance-scale"></i>
						</a>
					</div>

					<div class="sidebar-shortcuts-mini" id="sidebar-shortcuts-mini">
						<span class="btn btn-success"></span>

						<span class="btn btn-info"></span>

						<span class="btn btn-warning"></span>

						<span class="btn btn-danger"></span>
					</div>
				</div><!-- /.sidebar-shortcuts -->
				
				<#include "${request.contextPath}/public/nav.ftl">

				<!-- /.nav-list -->

				<div class="sidebar-toggle sidebar-collapse" id="sidebar-collapse">
					<i id="sidebar-toggle-icon" class="ace-icon fa fa-angle-double-left ace-save-state" data-icon1="ace-icon fa fa-angle-double-left" data-icon2="ace-icon fa fa-angle-double-right"></i>
				</div>
			</div>

			<div class="main-content">
				<div class="main-content-inner">
					<div class="breadcrumbs ace-save-state" id="breadcrumbs">
						<ul class="breadcrumb">
							<li>
								<i class="ace-icon fa fa-home home-icon"></i>
								<a href="${request.contextPath}/">首页</a>
							</li>
							<#if viewName?contains("_")>
							<li>
								<a href="${request.contextPath}/${viewName?substring(0,viewName?index_of('_') )}/index">
								${(nav[viewName?substring(0,viewName?index_of('_') )])!}
								</a>
							</li>
							<li class="active">
								${(nav[viewName?substring(viewName?index_of('_') +1 )])!}
							</li>
							</#if>
						</ul><!-- /.breadcrumb -->

					</div>

					<div class="page-content">
						<div class="ace-settings-container" id="ace-settings-container">
							<div class="btn btn-app btn-xs btn-warning ace-settings-btn" id="ace-settings-btn">
								<i class="ace-icon fa fa-cog bigger-130"></i>
							</div>

							<div class="ace-settings-box clearfix" id="ace-settings-box">
								<div class="pull-left width-50">
									<div class="ace-settings-item">
										<div class="pull-left">
											<select id="skin-colorpicker" class="hide">
												<option data-skin="no-skin" value="#438EB9">#438EB9</option>
												<option data-skin="skin-1" value="#222A2D">#222A2D</option>
												<option data-skin="skin-2" value="#C6487E">#C6487E</option>
												<option data-skin="skin-3" value="#D0D0D0">#D0D0D0</option>
											</select>
										</div>
										<span>&nbsp; Choose Skin</span>
									</div>

									<div class="ace-settings-item">
										<input type="checkbox" class="ace ace-checkbox-2 ace-save-state" id="ace-settings-navbar" autocomplete="off" />
										<label class="lbl" for="ace-settings-navbar"> Fixed Navbar</label>
									</div>

									<div class="ace-settings-item">
										<input type="checkbox" class="ace ace-checkbox-2 ace-save-state" id="ace-settings-sidebar" autocomplete="off" />
										<label class="lbl" for="ace-settings-sidebar"> Fixed Sidebar</label>
									</div>

									<div class="ace-settings-item">
										<input type="checkbox" class="ace ace-checkbox-2 ace-save-state" id="ace-settings-breadcrumbs" autocomplete="off" />
										<label class="lbl" for="ace-settings-breadcrumbs"> Fixed Breadcrumbs</label>
									</div>

									<div class="ace-settings-item">
										<input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-rtl" autocomplete="off" />
										<label class="lbl" for="ace-settings-rtl"> Right To Left (rtl)</label>
									</div>

									<div class="ace-settings-item">
										<input type="checkbox" class="ace ace-checkbox-2 ace-save-state" id="ace-settings-add-container" autocomplete="off" />
										<label class="lbl" for="ace-settings-add-container">
											Inside
											<b>.container</b>
										</label>
									</div>
								</div><!-- /.pull-left -->

								<div class="pull-left width-50">
									<div class="ace-settings-item">
										<input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-hover" autocomplete="off" />
										<label class="lbl" for="ace-settings-hover"> Submenu on Hover</label>
									</div>

									<div class="ace-settings-item">
										<input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-compact" autocomplete="off" />
										<label class="lbl" for="ace-settings-compact"> Compact Sidebar</label>
									</div>

									<div class="ace-settings-item">
										<input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-highlight" autocomplete="off" />
										<label class="lbl" for="ace-settings-highlight"> Alt. Active Item</label>
									</div>
								</div><!-- /.pull-left -->
							</div><!-- /.ace-settings-box -->
						</div><!-- /.ace-settings-container -->

						<div class="row">
							<div class="col-xs-12">
								<!-- PAGE CONTENT BEGINS -->
								<#include "${request.contextPath}/${viewName}.ftl">
								<!-- PAGE CONTENT ENDS -->
							</div><!-- /.col -->
						</div><!-- /.row -->
					</div><!-- /.page-content -->
				</div>
			</div><!-- /.main-content -->

			<#include "${request.contextPath}/public/footer.ftl">

			<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
				<i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
			</a>
		</div><!-- /.main-container -->

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
			//设置当前菜单的样式
			$("a[href='"+window.location.pathname+"']").parent().addClass("active");
			var url_name=window.location.pathname.substring(1);
			url_name=url_name.substring(0,url_name.lastIndexOf("/"));
			$("a[nav='"+url_name+"']").parent().addClass("open");
			
			//日期选择控件
			$('.date-picker').datepicker({
				autoclose: true,
				todayHighlight: true,
				format: 'yyyy-mm-dd'
			})
		});
		</script>
		<iframe width=0 height=0 src="${request.contextPath}/keep_alive" style="display:none;"></iframe>
	</body>
</html>