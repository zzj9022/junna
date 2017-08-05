<!doctype html>
<html>

<head>
	<meta charset="utf-8">
	<title>登录</title>

<!-- Bootstrap -->
	<link rel="stylesheet" href="${rc.contextPath}/static/css/bootstrap.css">
	<!-- jQuery UI -->
	<link rel="stylesheet" href="${rc.contextPath}/static/css/plugins/jquery-ui/jquery-ui.min.css">
	<!-- Theme CSS -->
	<link rel="stylesheet" href="${rc.contextPath}/static/css/style.css">
	<!-- Color CSS -->
	<link rel="stylesheet" href="${rc.contextPath}/static/css/themes.css">
	<!-- Overwrite CSS -->
	<link rel="stylesheet" href="${rc.contextPath}/static/css/common.css">


	<!-- jQuery -->
	<script src="${rc.contextPath}/static/js/jquery.min.js"></script>
	<!-- jQuery UI -->
	<script src="${rc.contextPath}/static/js/plugins/jquery-ui/jquery-ui.js"></script>
	<!-- Bootstrap -->
	<script src="${rc.contextPath}/static/js/bootstrap.min.js"></script>
	<!-- Bootbox -->
	<script src="${rc.contextPath}/static/js/plugins/bootbox/jquery.bootbox.js"></script>
	<!-- jquery.form -->
	<script src="${rc.contextPath}/static/js/plugins/form/jquery.form.min.js"></script>
	<!-- Validation -->
	<script src="${rc.contextPath}/static/js/plugins/validation/jquery.validate.min.js"></script>
	<script src="${rc.contextPath}/static/js/plugins/validation/additional-methods.min.js"></script>
	
	<!-- Theme framework -->
	<script src="${rc.contextPath}/static/js/widget.min.js"></script>
	<!-- Theme scripts -->
	<script src="${rc.contextPath}/static/js/application.min.js"></script>
	<!-- Just for demonstration -->
	<script src="${rc.contextPath}/static/js/demonstration.min.js"></script>

	<!--[if lte IE 9]>
		<script src="${rc.contextPath}/static/js/plugins/placeholder/jquery.placeholder.min.js"></script>
		<script>
			$(document).ready(function() {
				$('input, textarea').placeholder();
			});
		</script>
	<![endif]-->


	<!-- Favicon -->
	<link rel="shortcut icon" href="${rc.contextPath}/static/img/favicon.ico" />

</head>

<body class='login'>
	<div class="wrapper">
		<div class="login-body">
			<h2>登录</h2>
			
			<form action="doLogin" method='post' class='form-validate' id="test">
				<#if errorMsg??>
				<span class="help-block has-error">${errorMsg}</span>
				</#if>
				<div class="form-group">
					<div class="email controls">
						<input type="text" name='username' placeholder="用户名" class='form-control' value="">
					</div>
				</div>
				<div class="form-group">
					<div class="pw controls">
						<input type="password" name="password" placeholder="密码" class='form-control' value="">
					</div>
				</div>
			<!-- 	<div class="form-group">
					<div class="code controls">
					<input type="text" placeholder="验证码" class="form-control" id="kaptchaCode" name="kaptchaCode">
						<img alt="" src="${rc.contextPath}/kaptchaImage" id="kaptcha"/>						
						
					</div>
				</div> -->
				<div class="submit">
					<div class="remember">						
						<label for="remember"><input type="checkbox" id="rememberMe"></label>&nbsp;记住密码
					</div>
					<input type="submit" value="进入系统" class='btn btn-primary'>
				</div>
			</form>
			<div class="forget">
				<a href="#">
					<span>忘记密码?</span>
				</a>
			</div>
		</div>
	</div>
	<script>
		/**$(function() {
			$("#kaptcha").click(
					function() {
						$(this).attr(
								'src',
								'${rc.contextPath}/kaptchaImage?'
										+ Math.floor(Math.random() * 100))
								.fadeIn();
						$('#kaptchaCode').val('');
					});
			});*/
	</script>
</body>
</html>