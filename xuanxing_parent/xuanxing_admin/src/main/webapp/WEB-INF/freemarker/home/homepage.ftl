<#include "/layout/commonLayout.ftl">
<@commonLayout title="运营提醒">
<style>
 .box-content ul li{
 	float: left;
  /*   color: #aaaaaa; */
    border-right: 1px solid #d3d3d3;
    padding: 0 10px;
    margin-top: 8px;
    cursor: pointer;
 }
 .box-content ul li:last-child {
    border: none;
}
</style>
<div id="main">
	<div class="container-fluid">
		<div class="page-header">
			<div class="pull-left">
				<h1>运营提醒</h1>
			</div>
			<div class="pull-right">
				
			</div>
		</div>
		<div class="breadcrumbs">
			<ul>
				<li><a href="#" class="breadcrumbs_home">您的位置</a> <i
					class="fa fa-angle-right"></i></li>
				<li><a href="">运营提醒</a></li>
			</ul>
		</div>
		<div class="row">
			<div class="col-sm-12">
				<div class="box">
					<div class="box-title">
						<h3>
							<i class="fa fa-star"></i>认证审核
						</h3>
						<div class="actions">
							<a href="#" class="btn btn-mini content-slideUp"> 
							<i class="fa fa-angle-down"></i>
							</a>
						</div>
					</div>
					<div class="box-content">
						<ul style="list-style: none;">
							<#list authNotices as n1>
							<li><a href="${rc.contextPath}/${n1.url}">${n1.name}(${n1.number})</a></li>
							</#list>
						</ul>
						
					</div>
				</div>
				
				<div class="box">
					<div class="box-title">
						<h3>
							<i class="fa fa-star"></i>结算相关
						</h3>
						<div class="actions">
							<a href="#" class="btn btn-mini content-slideUp"> 
							<i class="fa fa-angle-down"></i>
							</a>
						</div>
					</div>
					<div class="box-content">
						<ul style="list-style: none;">
							<#list settlementNotices as n2>
							<li><a href="${rc.contextPath}/${n2.url}">${n2.name}(${n2.number})</a></li>
							</#list>
						</ul>
						  
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</@commonLayout>