/**
 * @param curPageSize
 * @param totalPages
 * @param totalCount
 * 初始化分页模板
 */
function setPage(curPageSize,totalPages,totalCount){
	if(totalPages > 0){
		if(curPageSize == 1 && totalPages == 1){
			$('#prePageId').attr('class','disabled');
			$('#nextPageId').attr('class','disabled');
		}else{
			if(curPageSize == 1 ){
				//上一页不可用
				$('#prePageId').attr('class','disabled');
//				$('#prePageId').get(0).onclick = "";
				$('#nextPageId').attr('class','');
//				$('#nextPageId').get(0).onclick = "gotoNextPage();";
			}else if(curPageSize == totalPages){
				//下一页不可用
				$('#nextPageId').attr('class','disabled');
//				$('#nextPageId').get(0).onclick = "";
				$('#prePageId').attr('class','');
//				$('#prePageId').onclick = "gotoPrePage();";
			}else{
				$('#prePageId').attr('class','');
//				$('#prePageId').get(0).onclick = "gotoPrePage();";
				$('#nextPageId').attr('class','');
//				$('#nextPageId').get(0).onclick = "gotoNextPage();";
			}
		}
		var html = "";
		if(totalPages == 1){
			html += "<a onclick=\"gotoPage(this)\" class=\"active\">"+curPageSize+"</a> ";
		}else if(totalPages == 2){
			if(curPageSize==1){
				html += "<a onclick=\"gotoPage(this)\" class=\"active\" >"+curPageSize+"</a> ";
				html += "<a onclick=\"gotoPage(this)\" >"+(curPageSize+1)+"</a> ";
			}else if(curPageSize==2){
				
				html += "<a onclick=\"gotoPage(this)\" >"+(curPageSize-1)+"</a> ";
				html += "<a onclick=\"gotoPage(this)\" class=\"active\" >"+curPageSize+"</a> ";
			}
		}else{
			if(curPageSize==1 && totalPages >=3){
				html += "<a onclick=\"gotoPage(this)\" class=\"active\">"+curPageSize+"</a> ";
				html += "<a onclick=\"gotoPage(this)\" >"+(curPageSize+1)+"</a> ";
				html += "<a onclick=\"gotoPage(this)\" >"+(curPageSize+2)+ "</a> ";
			}else if(curPageSize==totalPages && totalPages >=3){
				html += "<a onclick=\"gotoPage(this)\">"+(curPageSize-2)+"</a> ";
				html += "<a onclick=\"gotoPage(this)\">"+(curPageSize-1)+"</a> ";
				html += "<a onclick=\"gotoPage(this)\"  class=\"active\" >"+curPageSize+"</a> ";
			}else{
				html += "<a onclick=\"gotoPage(this)\">"+(curPageSize-1)+"</a> ";
				html += "<a onclick=\"gotoPage(this)\"  class=\"active\" >"+curPageSize+"</a> ";
				html += "<a onclick=\"gotoPage(this)\">"+(curPageSize+1)+"</a> ";
			}
		}
		$('#fenye_spanId').empty().append($(html));
		$('#totalCount').html(totalCount);
		$('#totalPages').html(totalPages);
		$('#curPageSize').val(curPageSize);
		$('#fenye_divId').attr('style','display:block');
	}else{
		$('#fenye_divId').attr('style','display:none');
	}
}
