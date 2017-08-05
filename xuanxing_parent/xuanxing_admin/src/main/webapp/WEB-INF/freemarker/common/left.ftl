<#assign menus = Session["menus"]>
<#assign m= Session["m"]>
<#assign s= Session["s"]>
<div id="left">
	<#if m != null && m!=0>
		<div class="subnav">
				<div class="subnav-title">
					<a href="#" class='toggle-subnav'>
						<i class="fa fa-angle-down"></i>
						<#list menus as menu>
							<#if m == menu.id>
								<span>${menu.name}</span>
							</#if>
						</#list>
					</a>
				</div>
				<ul class="subnav-menu">
					<#list menus as menu>
						<#if m == menu.id>
							<#assign submenus = menu.children>
							<#list submenus as submenu>
								<li class="${(submenu.id == s)?string('active','')}">
								<#if submenu.url??>
									<a href="${rc.contextPath}${submenu.url}${(0>=submenu.url?index_of("?"))?string('?','&')}m=${m}&s=${submenu.id}">${submenu.name}</a>
								<#else>
									<a href="#">${submenu.name}</a>
								</#if>
								</li>
							</#list>
						</#if>
					</#list>
					
				</ul>
			</div>

	<#else>
		<div class="subnav">
			<div class="subnav-title">
				<a href="#" class='toggle-subnav'>
					<span>运营提醒</span>
				</a>
			</div>				
		</div>
	</#if>
  </div>