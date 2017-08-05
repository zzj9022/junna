
var osssignature;

var uploaderPdf = new plupload.Uploader({
	runtimes : 'html5,flash,silverlight,html4',
	browse_button : 'selectfiles', 
    //runtimes : 'flash',
	uploadCoa: document.getElementById('uploadCoa'),
	flash_swf_url : 'lib/plupload-2.1.2/js/Moxie.swf',
	silverlight_xap_url : 'lib/plupload-2.1.2/js/Moxie.xap',

    url : 'url',

/*	multipart_params: {
		'Filename': '${filename}', 
        'key' : basePath+'${filename}',  //访问地址
		'policy': policyBase64,
        'OSSAccessKeyId': accessid, 
        'success_action_status' : '200', //让服务端返回200,不然，默认会返回204
		'signature': signature,
	},*/

	init: {
		FilesAdded: function(up, files) {
			plupload.each(files, function(file) {
				var type = get_suffix(file.name);
				if(type.toUpperCase()!="PNG" && type.toUpperCase()!="JPEG" && type.toUpperCase()!="JPG" && type.toUpperCase()!="GIF"){
					bootbox.alert("请上传图片!");
					return;
				}
				console.log(file.name);
				var oldFileName = file.name;
				file.name = calculate_object_name(file.name)
				$("#fileName").html(oldFileName);
				$("#fileId").val(basePath+file.name);
			});
		},
		 //上传之前执行的函数
        BeforeUpload: function (up, file) {
            set_upload_param(up, file.name, true);  //设置上传参数
        },
		FileUploaded: function(up, file, info) {
            if (info.status >= 200 || info.status < 200)
            {
            	//上传成功后续操作
            	uploadSucess(osssignature.host,file.name);
            }
            else
            {
            	bootbox.alert("上传失败");
            } 
		},

		Error: function(up, err) {
			bootbox.alert("上传出错");
//			document.getElementById('console').appendChild(document.createTextNode("\nError xml:" + err.response));
		}
	}
});
uploaderPdf.init();

//得到文件名 type local_name random_name
function calculate_object_name(filename){
    	var chars = 'ABCDEFGHJKMNPQRSTWXYZabcdefhijkmnprstwxyz2345678';  
    	var maxPos = chars.length;
		var random_string = '';
		for (i = 0; i < 10; i++) {
	    	random_string += chars.charAt(Math.floor(Math.random() * maxPos));
	    }
		var pos = filename.lastIndexOf('.')
	    var suffix = ''
	    if (pos != -1) {
	        suffix = filename.substring(pos);
	    }
	    return random_string + new Date().getTime() + suffix;
}

//设置文件上传到OSS需要的参数
function set_upload_param(up, filename, ret) {
    if (filename != '') {
        suffix = get_suffix(filename);
        calculate_object_name(filename)
    }
    getOSSSignature();
    osssignature.key=osssignature.key+"/"+filename
    up.setOption({
        'url': osssignature.host,
        'multipart_params': osssignature
    });

    up.start();
}

//获取后缀
function get_suffix(filename){
	var name = filename;
	var types = name.split(".");
	return types[types.length-1];
}

//删除
function deleteObject(filePath){
	$.ajax({
		type : "POST",
		url : "/pharmacodia_admin/oss/deleteObject",
		timeout : 10000,
		data : {
			"objectKey" : filePath
		},
		success : function(str) {
			console.log(str);
		},
		error : function(XMLHttpRequest, textStatus, errorThrown) {
			//alert("ajax error");
		},
		complete : function(XMLHttpRequest,status){ //请求完成后最终执行参数
			if(status == 'timeout'){
				bootbox.alert('请求超时，请稍后再试！');
			}
		},
		async : false
	});
}

function getOSSSignature(){
	$.ajax({
		type : "post",
		url : "/pharmacodia_admin/oss/getOSSPolicy",
		timeout : 10000,
		data : {
			"filePath" : basePath
		},
		success : function(str) {
			if (str) {
				try {
					/*var re = JSON.parse(str);*/
					basePath=str.dir;
					osssignature = {
						'key' : str.dir,
				        'policy': str.policy,
				        'OSSAccessKeyId': str.accessId, 
				        'success_action_status' : '200', //让服务端返回200,不然，默认会返回204
				        'signature': str.signature,
				        'expire':str.expire,
				        'host':str.host
					};
				
				} catch (e) {
					bootbox.alert("系统错误"+e);
				}
				
			} else {
				bootbox.alert("结果为空");
			}
		},
		error : function(XMLHttpRequest, textStatus, errorThrown) {
			//alert("ajax error");
		},
		complete : function(XMLHttpRequest,status){ //请求完成后最终执行参数
			if(status == 'timeout'){
				bootbox.alert('请求超时，请稍后再试！');
			}
		},
		async : false
	});
}
