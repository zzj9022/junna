<#macro page url curPageSize curLimit totalPages totalCount charset="utf-8" lang="zh-CN">
<script type="text/javascript">
function gotoPage(page){
	$("input[name='page']").val(page);
	$("#pageSearchForm").submit();
}

function forwardPage(){
	var page = parseInt($("#page").val());
	var totalPages = $("#totalPages").val();
	if(page <= totalPages){
		if(page == 0){
			page = ${curPageSize};
		}
		
		$("input[name='page']").val(page);
		$("#pageSearchForm").submit();
	} else {
		alert("跳转页数不能超过总页数!");
// 		return false;
	}
	
}
</script>
<form id="pageSearchForm" url="${url}"  class='form-horizontal'>
<div class="table-pagination pull-right">
	<a <#if curPageSize==1>href="javascript:void(0);" class="disabled" <#else > href="javascript:gotoPage(${curPageSize-1});"</#if>>上一页</a>
		<span>
		<#if totalPages==0>		
		<#elseif totalPages==1>
			<a href="javascript:gotoPage(1);" class="active">1</a> 
		<#elseif totalPages==2>
			<a href="javascript:gotoPage(1);" <#if curPageSize==1>class="active"</#if>>1</a> 
			<a href="javascript:gotoPage(2);" <#if curPageSize==2>class="active"</#if>>2</a> 
		<#else>
			<#if curPageSize==1>
				<a href="javascript:gotoPage(${curPageSize});" class="active">${curPageSize}</a> 
				<a href="javascript:gotoPage(${curPageSize?number+1});">${curPageSize?number+1}</a> 
				<a href="javascript:gotoPage(${curPageSize?number+2});">${curPageSize?number+2}</a>
			<#elseif curPageSize==totalPages>
				<a href="javascript:gotoPage(${curPageSize?number-2});">${curPageSize?number-2}</a> 
				<a href="javascript:gotoPage(${curPageSize?number-1});">${curPageSize?number-1}</a> 
				<a href="javascript:gotoPage(${curPageSize});" class="active">${curPageSize}</a>
			<#else>
				<a href="javascript:gotoPage(${curPageSize?number-1});">${curPageSize?number-1}</a> 
				<a href="javascript:gotoPage(${curPageSize});" class="active">${curPageSize}</a> 
				<a href="javascript:gotoPage(${curPageSize?number+1});">${curPageSize?number+1}</a>
			</#if>
		</#if>
		</span>
	<a <#if curPageSize==totalPages || totalPages==1||totalPages==0 >href="javascript:void(0);" class="disabled" <#else >href="javascript:gotoPage(${curPageSize+1});"</#if>>下一页</a>
    
    &nbsp;总共${totalCount}条&nbsp;共${totalPages}页&nbsp;
	<input class="form-control" id="page" name="page" value="<#if totalCount==0>0<#else>${curPageSize}</#if>" onkeyup="value=value.replace(/[^\d]/g,'')"/> &nbsp;
	<input type="hidden" id="totalPages" name="totalPages"  value="${totalPages}"/>
	<div class="form-actions">
		<button type="button" id="pageJumpBtn" class="btn btn-primary" onclick="forwardPage()">跳转</button>
	</div>
</div>
<#nested>
</form>
</#macro>