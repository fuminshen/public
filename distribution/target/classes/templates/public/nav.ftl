<ul class="nav nav-list">
					<li class="">
						<a href="${request.contextPath}/">
							<i class="menu-icon fa fa-home"></i>
							<span class="menu-text"> 首页 </span>
						</a>

						<b class="arrow"></b>
					</li>
					
					<li class="">
						<a href="${request.contextPath}/order/index" nav="order" class="dropdown-toggle">
							<i class="menu-icon fa fa-paperclip"></i>
							<span class="menu-text"> 订单管理 </span>
							<b class="arrow fa fa-angle-down"></b>
						</a>

						<b class="arrow"></b>
						
						<ul class="submenu">
							<li class="">
								<a href="${request.contextPath}/order/index">
									<i class="menu-icon fa fa-caret-right"></i>
									订单列表
								</a>

								<b class="arrow"></b>
							</li>

							<li class="">
								<a href="${request.contextPath}/order/new">
									<i class="menu-icon fa fa-caret-right"></i>
									下订单
								</a>

								<b class="arrow"></b>
							</li>
						</ul>
					</li>
					
					<li class="">
						<a href="${request.contextPath}/product/index" nav="product" class="dropdown-toggle">
							<i class="menu-icon fa fa-shopping-bag"></i>
							<span class="menu-text"> 产品管理 </span>
							
							<b class="arrow fa fa-angle-down"></b>
						</a>

						<b class="arrow"></b>
						<ul class="submenu">
							<li class="">
								<a href="${request.contextPath}/product/index">
									<i class="menu-icon fa fa-caret-right"></i>
									产品列表
								</a>

								<b class="arrow"></b>
							</li>

							<li class="">
								<a href="${request.contextPath}/product/new">
									<i class="menu-icon fa fa-caret-right"></i>
									新增产品
								</a>

								<b class="arrow"></b>
							</li>
						</ul>
					</li>
					
					<li class="">
						<a href="${request.contextPath}/rulepay/index" nav="rulepay" class="dropdown-toggle">
							<i class="menu-icon fa fa-gavel"></i>
							<span class="menu-text"> 激励佣金规则 </span>
							
							<b class="arrow fa fa-angle-down"></b>
						</a>

						<b class="arrow"></b>
						<ul class="submenu">
							<li class="">
								<a href="${request.contextPath}/rulepay/index">
									<i class="menu-icon fa fa-caret-right"></i>
									规则列表
								</a>

								<b class="arrow"></b>
							</li>

							<li class="">
								<a href="${request.contextPath}/rulepay/new">
									<i class="menu-icon fa fa-caret-right"></i>
									新增规则
								</a>

								<b class="arrow"></b>
							</li>
						</ul>
					</li>
					
					<#--
					<li class="">
						<a href="${request.contextPath}/company/get/${Session.admin.companyId}" nav="company">
							<i class="menu-icon fa fa-building-o"></i>
							<span class="menu-text"> 公司信息 </span>
							
							<b class="arrow"></b>
						</a>
					</li>
					
					<li class="">
						<a href="${request.contextPath}/company/index" nav="company" class="dropdown-toggle">
							<i class="menu-icon fa fa-building-o"></i>
							<span class="menu-text"> 分公司 </span>
							
							<b class="arrow fa fa-angle-down"></b>
						</a>

						<b class="arrow"></b>
						<ul class="submenu">
							<li class="">
								<a href="${request.contextPath}/company/index">
									<i class="menu-icon fa fa-caret-right"></i>
									分公司列表
								</a>

								<b class="arrow"></b>
							</li>

							<li class="">
								<a href="${request.contextPath}/company/new">
									<i class="menu-icon fa fa-caret-right"></i>
									新增分公司
								</a>

								<b class="arrow"></b>
							</li>
						</ul>
					</li>
					-->
					<li class="">
						<a href="${request.contextPath}/admin/index" nav="admin" class="dropdown-toggle">
							<i class="menu-icon fa fa-user-secret"></i>
							<span class="menu-text"> 管理员 </span>
							<b class="arrow fa fa-angle-down"></b>
						</a>

						<b class="arrow"></b>
						<ul class="submenu">
							<li class="">
								<a href="${request.contextPath}/admin/index">
									<i class="menu-icon fa fa-caret-right"></i>
									管理员列表
								</a>

								<b class="arrow"></b>
							</li>

							<li class="">
								<a href="${request.contextPath}/admin/new">
									<i class="menu-icon fa fa-caret-right"></i>
									添加管理员
								</a>

								<b class="arrow"></b>
							</li>
						</ul>
					</li>
					
					<li class="">
						<a href="${request.contextPath}/client/index" nav="client" class="dropdown-toggle">
							<i class="menu-icon fa fa-user"></i>
							<span class="menu-text"> 代理商/分销商 </span>
							<b class="arrow fa fa-angle-down"></b>
						</a>

						<b class="arrow"></b>
						
						<ul class="submenu">
							<li class="">
								<a href="${request.contextPath}/client/index">
									<i class="menu-icon fa fa-caret-right"></i>
									代理商列表
								</a>

								<b class="arrow"></b>
							</li>

							<li class="">
								<a href="${request.contextPath}/client/new">
									<i class="menu-icon fa fa-caret-right"></i>
									新增代理商
								</a>

								<b class="arrow"></b>
							</li>
						</ul>
					</li>
					
					<!--<li class="">
						<a href="${request.contextPath}/contract/index">
							<i class="menu-icon fa fa-file-text-o"></i>
							<span class="menu-text"> 合同管理 </span>
						</a>

						<b class="arrow"></b>
					</li>-->
					<li class="">
						<a href="${request.contextPath}/pay/index">
							<i class="menu-icon fa fa-balance-scale"></i>
							<span class="menu-text"> 佣金记录查看 </span>
						</a>

						<b class="arrow"></b>
					</li>
				</ul>