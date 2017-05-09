<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>图形展示</title>
      <script src="http://g.tbcdn.cn/fi/bui/jquery-1.8.1.min.js"></script>
  <script src="http://g.alicdn.com/bui/seajs/2.3.0/sea.js"></script>
  <script src="http://g.alicdn.com/bui/bui/1.1.21/config.js"></script>
  <script src="Js/invStat.js"></script>
    <link href="http://g.alicdn.com/bui/bui/1.1.21/css/bs3/dpl.css" rel="stylesheet">
  <link href="http://g.alicdn.com/bui/bui/1.1.21/css/bs3/bui.css" rel="stylesheet">
    <style type="text/css">
    /* .detail-section{
		
			margin-top:80px;
		
		} */
    
    	.demo-content{
			position: relative;
			margin-top: 50px;
			margin-left:40px;
		
		}
    </style>
</head>
<body>
<jsp:include page="check.jsp"></jsp:include>

   <div class="demo-content">
    <div class="row">
      <div class="span8"><button id="btn" class="button" style="width: 120px">选择其他<span class="x-caret x-caret-down"></span></button></div>
       <label style="position:relative;margin-left:  200px">最近七天投资统计</label>
    </div>
    </div>
<div class="detail-section">
    <div id="canvas">
 
    </div>
</div>
 
<script src="http://g.tbcdn.cn/bui/acharts/1.0.32/acharts-min.js"></script>
<!-- https://g.alicdn.com/bui/acharts/1.0.29/acharts-min.js -->
  <script type="text/javascript">

      BUI.use('bui/menu',function(Menu){
        var dropMenu1 = new Menu.PopMenu({
          trigger : '#btn',
          autoRender : true,
          width : 140,
          children : [{
        	  id:"m1",
                  content : "一周投资统计"//投资笔数和金额分开统计
          },{
        	  id:"m2",
                content : "利息统计"
          },{
        	  id:"m3",
              content: "单笔投资额排行统计"
          },{
              id:'m4',
              content : "用户投资排行"//投资笔数和金额分开统计
            }]
        })
       
        dropMenu1.on('itemselected', function(){
          //alert(dropMenu1.getSelectedText() + '：' + dropMenu1.getSelectedValue());
          myAjax(dropMenu1.getSelectedValue());
          $("label").text(dropMenu1.getSelectedText());
        });
       
      });
     
    </script>
    
    <script type="text/javascript">
    	$(function(){
    		  myAjax("m1")
    	})

    </script>
    
</body>
</html>
