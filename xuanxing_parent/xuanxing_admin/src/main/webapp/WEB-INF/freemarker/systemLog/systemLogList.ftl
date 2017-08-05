<#include "/layout/commonLayout.ftl">
<@commonLayout title="操作日志管理">
<div id="main">
	<div class="container-fluid">
		<div class="page-header">
			<div class="pull-left">
				<h1>操作日志列表</h1>
			</div>
			<div class="pull-right">
				<#include "/common/date.ftl">
			</div>
		</div>
		<div class="breadcrumbs">
			<ul>
				<li><a href="javascript:void(0)" class="breadcrumbs_home">您的位置</a> <i
					class="fa fa-angle-right"></i></li>
				<li> <a href="javascript:void(0)">操作日志管理</a><i class="fa fa-angle-right"></i></li>
				<li><a href="${rc.contextPath}/systemLog/list?m=${m}&s=${s}">操作日志列表</a></li>
			</ul>
		</div>
		<div class="row">
			<div class="col-sm-12">
				<div class="box">
					<div class="box-title">
						<h3><i class="fa fa-search"></i> 查询条件</h3>
						<div class="actions">
							<a href="#" class="btn btn-mini content-slideUp">
								<i class="fa fa-angle-down"></i>
							</a>
						</div>
					</div>
					<div class="box-content">
						<form id="pageSearchForm" method="POST" class="form-horizontal" action="${rc.contextPath}/systemLog/list?m=${m}&s=${s}">
				              <input type="hidden" name="page">
				              <div class='form-horizontal'>
					              <div class="col-sm-1"></div>
					              	<div class="col-sm-5">
					                    <div class="form-group">
					                        <label class="control-label col-sm-4">操作人:</label>
					                        <div class="col-sm-8">
					                            <input type="text" class="form-control" id="createBy" name="createBy" placeholder="请输入操作人" value="${systemLog.createBy}">
					                        </div>
					                    </div>
					                </div>
					                <div class="col-sm-5">
					                	<div class="form-group">
					                        <label class="control-label col-sm-4">操作记录:</label>
					                        <div class="col-sm-8">
					                            <input type="text" class="form-control" id="remark" name="remark" placeholder="请输入操作记录" value="${systemLog.remark}">
					                        </div>
					                    </div>
					                </div>
					                <div class="col-sm-1"></div>
					                <div class="form-actions">
					                	<button type="submit" class="btn btn-primary">搜 索</button>
					                </div>
				              </div>
						</form>
					</div>
			     </div>
			</div>
			<div class="col-sm-12">
				<div class="box">
					<div class="box-title">
						<h3>
							<i class="fa fa-list-alt"></i> 查询列表
						</h3>
						<div class="actions">
							<a href="#" class="btn btn-mini content-slideUp"> 
								<i class="fa fa-angle-down"></i>
							</a>
						</div>
					</div>
					<div class="box-content">
						<div class="btest">
							<table class="table table-hover table-nomargin table-bordered display">
								<thead>
                   				   <tr>
                   				   	 <th width="10%">编号</th>
                       				 <th width="20%">操作人</th>
									 <th width="20%">操作时间</th>
									 <th>操作记录</th>
                  				  </tr>
                				</thead>
								<tbody id="itemBody">
									<#list systemLogList as s>
									<tr>
										<td>${s_index+1}</td>
										<td>${s.createBy}</td>
										<td>${(s.createDate?string("yyyy-MM-dd HH:mm:ss"))!''}</td>
										<td>${s.remark}</td>
									</tr>
									</#list>
								</tbody>
							</table>
						</div>
						<div class="order_query">
                            <#if systemLogListPaginator??>
							<#include "/common/page.ftl">
							<@page url="#" curPageSize=systemLogListPaginator.page curLimit=systemLogListPaginator.limit totalPages=systemLogListPaginator.totalPages totalCount=systemLogListPaginator.totalCount>
							</@page>
							
							</#if>
                        </div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</@commonLayout>