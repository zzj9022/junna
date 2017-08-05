<#-- url 列表查询路径 searchParam 查询参数组装函数 callback 数据处理函数 -->
<#macro page url searchParam callback charset="utf-8" lang="zh-CN">
<form class='form-horizontal'>
<div class="table-pagination pull-right" id="fenye_divId" style="display:none;">
	<input type="hidden" value="1" id="curPageSize" />
	<a id="prePageId" onclick="gotoPrePage();">首页</a>
	<span id="fenye_spanId"> 
		
	</span>
	<a id="nextPageId" onclick="gotoNextPage();">尾页</a>
	&nbsp;总共<b id="totalCount"></b>条&nbsp;共<b id="totalPages"></b>页&nbsp; 
	<input class="form-control" id="pageJumpId" value="" /> &nbsp;
	<div class="form-actions">
		<input type="button" id="pageJumpBtn" class="btn btn-primary" onclick="gotoJumpPage();" value="跳转">
	</div>
</div>
<script type="text/javascript">
	function gotoPrePage(){
		searchPage('${url}','1','${searchParam}','${callback}');
	}
	function gotoNextPage(){
    	searchPage('${url}',$('#totalPages').html(),'${searchParam}','${callback}');
	}
	function gotoJumpPage(){
		var curPageSize = parseInt($('#pageJumpId').val());
		var totalPages = parseInt($("#totalPages").html());
		if (isNaN(curPageSize)) return;
		if(curPageSize <= totalPages){
			if(curPageSize != null && curPageSize != ''){
	    		searchPage('${url}',curPageSize,'${searchParam}','${callback}');
			}			
		} else {
			alert("跳转页数不能超过总页数!");
		}
	}
 	function gotoPage(obj){
 		var curPageSize = $(obj).html();
    	searchPage('${url}',curPageSize,'${searchParam}','${callback}');
 	}
    /**
    * @param curPageSize
    * @param totalPages
    * @param totalCount
    * 初始化分页模板
    */
    function setPage(curPageSize, totalPages, totalCount) {
        if (totalPages > 0) {
            if (curPageSize == 1 && totalPages == 1) {
                $('#prePageId').attr('class', 'disabled');
                $('#nextPageId').attr('class', 'disabled');
            } else {
                if (curPageSize == 1) {
                    //上一页不可用
                    $('#prePageId').attr('class', 'disabled');
                    //				$('#prePageId').get(0).onclick = "";
                    $('#nextPageId').attr('class', '');
                    //				$('#nextPageId').get(0).onclick = "gotoNextPage();";
                } else if (curPageSize == totalPages) {
                    //下一页不可用
                    $('#nextPageId').attr('class', 'disabled');
                    //				$('#nextPageId').get(0).onclick = "";
                    $('#prePageId').attr('class', '');
                    //				$('#prePageId').onclick = "gotoPrePage();";
                } else {
                    $('#prePageId').attr('class', '');
                    //				$('#prePageId').get(0).onclick = "gotoPrePage();";
                    $('#nextPageId').attr('class', '');
                    //				$('#nextPageId').get(0).onclick = "gotoNextPage();";
                }
            }
            var html = "";
            if (totalPages == 1) {
                html += "<a onclick=\"gotoPage(this)\" class=\"active\">" + curPageSize + "</a> ";
            } else if (totalPages == 2) {
                if (curPageSize == 1) {
                    html += "<a onclick=\"gotoPage(this)\" class=\"active\" >" + curPageSize + "</a> ";
                    html += "<a onclick=\"gotoPage(this)\" >" + (curPageSize + 1) + "</a> ";
                } else if (curPageSize == 2) {

                    html += "<a onclick=\"gotoPage(this)\" >" + (curPageSize - 1) + "</a> ";
                    html += "<a onclick=\"gotoPage(this)\" class=\"active\" >" + curPageSize + "</a> ";
                }
            } else {
                if (curPageSize == 1 && totalPages >= 3) {
                    html += "<a onclick=\"gotoPage(this)\" class=\"active\">" + curPageSize + "</a> ";
                    html += "<a onclick=\"gotoPage(this)\" >" + (curPageSize + 1) + "</a> ";
                    html += "<a onclick=\"gotoPage(this)\" >" + (curPageSize + 2) + "</a> ";
                } else if (curPageSize == totalPages && totalPages >= 3) {
                    html += "<a onclick=\"gotoPage(this)\">" + (curPageSize - 2) + "</a> ";
                    html += "<a onclick=\"gotoPage(this)\">" + (curPageSize - 1) + "</a> ";
                    html += "<a onclick=\"gotoPage(this)\"  class=\"active\" >" + curPageSize + "</a> ";
                } else {
                    html += "<a onclick=\"gotoPage(this)\">" + (curPageSize - 1) + "</a> ";
                    html += "<a onclick=\"gotoPage(this)\"  class=\"active\" >" + curPageSize + "</a> ";
                    html += "<a onclick=\"gotoPage(this)\">" + (curPageSize + 1) + "</a> ";
                }
            }
            $('#fenye_spanId').empty().append($(html));
            $('#totalCount').html(totalCount);
            $('#totalPages').html(totalPages);
            $('#curPageSize').val(curPageSize);
            $('#fenye_divId').attr('style', 'display:block');
        } else {
            $('#prePageId').attr('class', 'disabled');
            $('#nextPageId').attr('class', 'disabled');
            var html = "<a class=\"disabled\">" + curPageSize + "</a> ";
            $('#fenye_spanId').empty().append($(html));
            $('#totalCount').html(totalCount);
            $('#totalPages').html(totalPages);
            $('#curPageSize').val(curPageSize);
            $('#fenye_divId').attr('style', 'display:block');
        }
    }
    function searchPage(url, curPage, searchParam, callback) {
        if (curPage == null || curPage == '') {
            curPage = 1;
        }
        var paramobj = {};
        paramobj.page = curPage;
        if (searchParam != null) {
            eval(searchParam).apply(this, [paramobj]);
        }
	<#--f_otherParam(paramobj);-->
        $.ajax({
            url: url,
            data: paramobj,
            type: 'post',
            dataType: 'json',
            success: function (result) {
                eval(callback).apply(this, [result]);
            },
            error: function () {
                bootbox.alert('异常，请联系管理员.');
            }
        });
    }
</script>
</form>

</#macro> 