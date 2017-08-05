<#assign user = Session["user"]>
<#assign m= Session["m"]>
<div id="navigation">
		<div class="container-fluid">
			<a href="#" id="brand">后台管理系统</a>
			<a href="#" class="toggle-nav" rel="tooltip" data-placement="bottom" title="左侧边栏">
				<i class="fa fa-bars"></i>
			</a>
			<ul class='main-nav'>
				<li class= "${(m != 0)?string('','active')}">
					<a href="${rc.contextPath}/index?m=0">
						<span>运营提醒</span>
					</a>
				</li>
				<li class="active">
					<a href="#">
						<span>系统管理</span>
					</a>
				</li>
				<#list menus as menu>
					<li class="${(menu.id == m)?string('active','')}">				
					<#if menu.url??>
						<a href="#">
							<span>${menu.name}</span>
						</a>
					<#else>
						<a href="${rc.contextPath}/index?m=${menu.id}">
							<span>${menu.name}</span>
						</a>
					</#if>
				</li>
				</#list>
			</ul>
			<div class="user">
				<ul class="icon-nav">
					<li><span><i class="glyphicon glyphicon-user"></i></span>
						<a href="#">
							<span><#if user != null>${user.adminName}</#if></span>
						</a>
					</li>
					<!-- <li><span><i class="glyphicon glyphicon-edit"></i></span>
						<a href="${rc.contextPath}/admin/updatePassView">
							<span>修改密码</span>
						</a>
					</li> -->
					<li><span><i class="glyphicon glyphicon-power"></i></span>
						<a href="${rc.contextPath}/logout">
							<span>安全退出</span>
						</a>
					</li>
				</ul>
			</div>
		</div>
	</div>