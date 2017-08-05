<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<meta name="viewport" content="user-scalable=no, width=device-width, initial-scale=1.0, maximum-scale=1.0" />
	<title>Marvin JS</title>
	<link type="text/css" rel="stylesheet" href="${rc.contextPath}/static/js/plugins/marvinjs/gui/css/editor.min.css" media="screen" />
	<script src="${rc.contextPath}/static/js/plugins/marvinjs/gui/lib/promise-1.0.0.min.js"></script>
	<script src="${rc.contextPath}/static/js/plugins/marvinjs/gui/gui.nocache.js"></script>
	<script src="${rc.contextPath}/static/js/plugins/marvinjs/js/webservices.js"></script>
	
	<script>
	
	window.addEventListener("message", function(event) {
		try {
			var externalCall = JSON.parse(event.data);
			marvin.onReady(function() {
				marvin.sketcherInstance[externalCall.method].apply(marvin.sketcherInstance, externalCall.args);
			});
		} catch (e) {
			console.log(e);
		}
	}, false);

		// called when Marvin JS loaded
		function sketchOnLoad () {
			if(marvin.Sketch.isSupported()) {
				marvin.sketcherInstance = new marvin.Sketch("sketch");
				//var path_x = "<%=path%>";
				var licenseURL = "${rc.contextPath}/static/js/plugins/marvinjs/licenses/license_MJS.cxl?t="+Math.random();
				marvin.Sketch.license(licenseURL);
				marvin.sketcherInstance.setServices(getDefaultServices()); 	
			} else {
				alert("Cannot initiate sketcher. Current browser may not support HTML5 canvas or may run in Compatibility Mode.");
			}
		}

	</script>
</head>
<body class="mjs-body">
	<noscript>
		<div>
			<p>Your web browser must have JavaScript enabled in order for this application to display correctly.</p>
		</div>
	</noscript>
	<div id="sketch"></div>
</body>
</html>
