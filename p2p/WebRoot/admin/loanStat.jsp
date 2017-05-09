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
  <script src="Js/loanStat.js"></script>
    <link href="http://g.alicdn.com/bui/bui/1.1.21/css/bs3/dpl.css" rel="stylesheet">
  <link href="http://g.alicdn.com/bui/bui/1.1.21/css/bs3/bui.css" rel="stylesheet">
    <style type="text/css">
    .detail-section{
			position: relative;
			margin-left:250px;
			margin-top:50px;
			padding-right: 50px;
		
		}
    
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
       <label style="position:relative;margin-left:  250px">最近七天贷款数量</label>
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
        	  id:"m4",
                  content : "利率统计"
          },{
        	  id:"m5",
                content : "审核统计"
          },{
        	  id:"m6",
              content: "用户ID贷款统计"
          },{
              id:'m1',
              content : "最近七天贷款数量"
            },{
          	 id:"m2" ,
              content : "最近七天贷款金额"
            },{
             	 id:"m7" ,
                 content : "利率贷款散列图"
               },{
             	 id:"m8" ,
                 content : "贷款投资区域图"
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
