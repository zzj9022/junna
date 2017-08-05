<#macro commonLayout title charset="utf-8" lang="zh-CN">
<#setting locale="zh_CN">
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1" />
<meta http-equiv="X-UA-Compatible" content="IE=9" />
	<title>${title}</title>
	<!-- Bootstrap -->
	<link rel="stylesheet" href="${rc.contextPath}/static/css/bootstrap.css">
	<!-- jQuery UI -->
	<link rel="stylesheet" href="${rc.contextPath}/static/css/plugins/jquery-ui/jquery-ui.min.css">
	    <!-- dataTables -->
	    <link rel="stylesheet" href="${rc.contextPath}/static/css/plugins/datatable/TableTools.css">
	<!-- datepicker -->
	<link rel="stylesheet" href="${rc.contextPath}/static/css/plugins/datepicker/datepicker.css">
		<!-- datetimepicker -->
	<link rel="stylesheet" href="${rc.contextPath}/static/css/plugins/datetimepicker/bootstrap-datetimepicker.css">
	<!-- Theme CSS -->
	<link rel="stylesheet" href="${rc.contextPath}/static/css/style.css">
	<!-- Color CSS -->
	<link rel="stylesheet" href="${rc.contextPath}/static/css/themes.css">
	<!-- Overwrite CSS -->
	<link rel="stylesheet" href="${rc.contextPath}/static/css/common.css">	
	<!-- public update CSS -->
	<link rel="stylesheet" href="${rc.contextPath}/static/css/public_update.css">
	<!-- jQuery -->
	<script src="${rc.contextPath}/static/js/jquery.min.js"></script>
	<!-- jQuery UI -->
	<script src="${rc.contextPath}/static/js/plugins/jquery-ui/jquery-ui.js"></script>
	<!-- Bootstrap -->
	<script src="${rc.contextPath}/static/js/bootstrap.js"></script>
	<!-- Bootstrap datepicker-->
	<script src="${rc.contextPath}/static/js/bootstrap-datepicker.js"></script>
	<!-- Bootbox -->
	<script src="${rc.contextPath}/static/js/plugins/bootbox/jquery.bootbox.js"></script>
	<!-- jquery.form -->
	<script src="${rc.contextPath}/static/js/plugins/form/jquery.form.min.js"></script>
	<!-- Validation -->
	<script src="${rc.contextPath}/static/js/plugins/validation/jquery.validate.min.js"></script>
	<script src="${rc.contextPath}/static/js/plugins/validation/additional-methods.min.js"></script>
   <!-- New DataTables -->
    <script src="${rc.contextPath}/static/js/plugins/momentjs/jquery.moment.min.js"></script>
    <script src="${rc.contextPath}/static/js/plugins/momentjs/moment-range.min.js"></script>
    <script src="${rc.contextPath}/static/js/plugins/datatables/jquery.dataTables.min.js"></script>
    <script src="${rc.contextPath}/static/js/plugins/datatables/extensions/dataTables.tableTools.min.js"></script>
    <script src="${rc.contextPath}/static/js/plugins/datatables/extensions/dataTables.fixedColumns.min.js"></script>
    <script src="${rc.contextPath}/static/js/plugins/datatables/extensions/dataTables.fixedHeader.min.js"></script>
    <script src="${rc.contextPath}/static/js/plugins/datatables/extensions/dataTables.scroller.min.js"></script>
	<!-- Theme framework -->
	<script src="${rc.contextPath}/static/js/widget.min.js"></script>
	<!-- Theme scripts -->
	<script src="${rc.contextPath}/static/js/application.min.js"></script>
	<!-- Just for demonstration -->
	<script src="${rc.contextPath}/static/js/demonstration.min.js"></script>
	<!-- date -->
	<script src="${rc.contextPath}/static/js/plugins/my97datepicker/WdatePicker.js"></script>
	<script src="${rc.contextPath}/static/js/plugins/datepicker/bootstrap-datepicker.js" charset="UTF-8"></script>
	<script src="${rc.contextPath}/static/js/plugins/datepicker/locales/bootstrap-datepicker.zh-CN.js"  charset= "UTF-8"></script>
	<script src="${rc.contextPath}/static/js/util/define.js" charset= "UTF-8"></script>
	<link rel="shortcut icon" href="${rc.contextPath}/static/img/favicon.ico" />
	
	<!-- 富文本编辑框插件-->
	<script type="text/javascript" charset="utf-8" src="${rc.contextPath}/static/js/plugins/kindeditor/kindeditor-min.js"></script>
	<link rel="stylesheet" href="${rc.contextPath}/static/js/plugins/kindeditor/themes/default/default.css" />
	<link rel="stylesheet" href="${rc.contextPath}/static/js/plugins/kindeditor/plugins/code/prettify.css" />
	<script charset="utf-8" src="${rc.contextPath}/static/js/plugins/kindeditor/lang/zh_CN.js"></script>
	<script charset="utf-8" src="${rc.contextPath}/static/js/plugins/kindeditor/plugins/code/prettify.js"></script>
	
	<!-- date -->
	<script src="${rc.contextPath}/static/js/plugins/datetimepicker/bootstrap-datetimepicker.js" charset="UTF-8"></script>
	<script src="${rc.contextPath}/static/js/plugins/datetimepicker/bootstrap-datetimepicker.zh-CN.js"  charset= "UTF-8"></script>
</head>
<body>
<#include "/common/header.ftl">
<div class="container-fluid" id="content">
	<#include "/common/left.ftl">
   <#nested>
</div>
<#include "/common/footer.ftl">
</body>
</html>
<script src="${rc.contextPath}/static/js/common/page.js"></script>
<script src="${rc.contextPath}/static/js/plugins/ztree/jquery.ztree.all-3.5.min.js"></script>
<link rel="stylesheet" href="${rc.contextPath}/static/css/plugins/ztree/zTreeStyle.css">
 </#macro>