<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'skip.jsp' starting page</title>
    
	<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
	<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script type="text/javascript">
		$(function (){
			 $(".progress-bar").animate({width:'100%'},2000,function (){
				 window.open("/p2p/login.jsp");
			 });
			
		});
	</script>
	<style type="text/css">
		body{
			background: black; 
		}
	</style>
  </head>
  
  <body>
  <div style="height:300px">
  </div> 
 <div class="progress progress-striped active">
	<div class="progress-bar progress-bar-success" role="progressbar"
		 aria-valuenow="60" aria-valuemin="0" aria-valuemax="100">
	</div>
</div>
  </body>
</html>
