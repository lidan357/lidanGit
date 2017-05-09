<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'lengxinTest.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script
	src="http://api.map.baidu.com/api?v=2.0&ak=YW7Q06HuyxoEG8UYbofyViuG62IneI21"
	type="text/javascript"></script>
<script type="text/javascript">
	function initialize() {
		var map = new BMap.Map('map');
		map.centerAndZoom(new BMap.Point(113.095417,28.190512), 15);
		
		map.addControl(new BMap.NavigationControl());
		
		var opts = {
			offset : new BMap.Size(150, 5)
		}
		map.addControl(new BMap.ScaleControl(opts));
		map.addControl(new BMap.OverviewMapControl());
		map.addControl(new BMap.MapTypeControl());
		map.setCurrentCity("长沙");
		var stCtrl = new BMap.PanoramaControl();  
		stCtrl.setOffset(new BMap.Size(20, 20));  
		map.addControl(stCtrl);
		map.enableScrollWheelZoom();
		
	}

	function loadScript() {
		var script = document.createElement("script");
		script.src = "http://api.map.baidu.com/api?v=2.0&ak=YW7Q06HuyxoEG8UYbofyViuG62IneI21&callback=initialize";//此为v2.0版本的引用方式  
		// http://api.map.baidu.com/api?v=1.4&ak=您的密钥&callback=initialize"; //此为v1.4版本及以前版本的引用方式  
		document.body.appendChild(script);
	}

	window.onload = loadScript;
</script>
</head>

<body>
	This is my JSP page.
	<br>
	<div id="map" style="width:500px;height:320px">
		
	</div>

	<br>


</body>
</html>
