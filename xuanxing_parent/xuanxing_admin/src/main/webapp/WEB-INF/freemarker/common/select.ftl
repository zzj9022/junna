<#macro select type id name value charset="utf-8" lang="zh-CN">

<div>
	<select name="${name}" id="${id}">
		<option value="">请选择</option>
	</select>
</div>
<script type="text/javascript">
$(function(){
	/**
	*在加载时将下拉框的option追加到select下面
	*/
	var url="${rc.contextPath}/dict/select";
	$.ajax({
		url : url,
		dataType : 'json',
		data:{type:'${type}'},
		type : "post",
		cache : false,
		success : function(result) {
			if (result != null && result.length > 0) {
				var html = '<option value="">请选择</option>';
				$.each(result, function(i, entity) {
					html += "<option value= " + entity.code + ">" + entity.name
							+ "</option>";
				});
				$('#${id}').empty();
				$('#${id}').append($(html));
			}
			if('${value}'){
				 $("#${id}").val(${value});
			}
		},
		error : function(data) {
			bootbox.alert("查询错误，请联系管理员");
		}
	});
})	
</script>
</#macro>