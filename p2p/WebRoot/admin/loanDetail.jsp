
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html>
<head>
<meta charset="utf-8">
<title>简单表单页</title>

<!-- 此文件为了显示Demo样式，项目中不需要引入 -->

  <link href="http://g.alicdn.com/bui/bui/1.1.21/css/bs3/dpl.css" rel="stylesheet">
  <link href="http://g.alicdn.com/bui/bui/1.1.21/css/bs3/bui.css" rel="stylesheet">
 	<script src=" js/jquery.js"></script>
</head>
<body>
	<jsp:include page="check.jsp"></jsp:include>
  <div class="demo-content">
 
<!-- 简单详情页 ================================================== -->
 
      <h3>贷款详情</h3>
      <hr/>
      <!--表单form开始-->
      <form action="" class="form-horizontal form-horizontal-simple">
      	<!--顶部top开始-->
      	<div class="top">
	      	<!--贷款loan开始-->
	     		<div class="loan">
		        <div class="control-group">
		          <label class="control-label">贷款ID：</label>
		          <div class="controls">
		          	<span class="control-text">${loanInfo.loanID }</span>
		          </div>
		        </div>
		        <div class="control-group">
		          <label class="control-label">贷款日期：</label>
		          <div class="controls">
		          	<span class="control-text">${loanInfo.loanDate }</span>
		          </div>
		        </div>
		        <div class="control-group">
		          <label class="control-label">贷款金额：</label>
		          <div class="controls">
		          	<span class="control-text">${loanInfo.loanMoney }</span>
		          </div>
		        </div>
		        <div class="control-group">
		          <label class="control-label">贷款利率：</label>
		          <div class="controls">
		          	<span class="control-text">${loanInfo.inter }</span>
		          </div>
		        </div>
		        <div class="control-group">
		          <label class="control-label">贷款期限：</label>
		          <div class="controls">
		         	 <span class="control-text">${loanInfo.deadLine }</span>
		          </div>
		        </div>
		        <div class="control-group">
		          <label class="control-label">贷款类型：</label>
		          <div class="controls">
		          	<span class="control-text">${loanInfo.loanType }</span>
		          </div>
		        </div>
		        <div class="control-group">
		          <label class="control-label">目前资金：</label>
		          <div class="controls">
		          	<span class="control-text">${loanInfo.curMoney }</span>
		          </div>
		        </div>
		        <div class="control-group">
		          <label class="control-label">贷款类型：</label>
		          <div class="controls">
		          	<span class="control-text">${loanInfo.loanType }</span>
		          </div>
		        </div>
	        </div>
	        <!--贷款loan结束-->
	        
	        <!--用户user开始-->
	        <div class="user">
		        <div class="control-group">
		          <label class="control-label">用户id：</label>
		          <div class="controls">
		          	<span class="control-text">${userInfo.userID }</span>
		          </div>
		        </div>
		        <div class="control-group">
		          <label class="control-label">用户名：</label>
		          <div class="controls">
		          	<span class="control-text">${userInfo.userName }</span>
		          </div>
		        </div>
		        <div class="control-group">
		          <label class="control-label">用户真名：</label>
		          <div class="controls">
		          	<span class="control-text">${userInfo.realName }</span>
		          </div>
		        </div>
		        <div class="control-group">
		          <label class="control-label">用户电话：</label>
		          <div class="controls">
		          	<span class="control-text">${userInfo.phone }</span>
		          </div>
		        </div>
		        <div class="control-group">
		          <label class="control-label">用户职业：</label>
		          <div class="controls">
		          	<span class="control-text">${userInfo.job }</span>
		        	</div>
		        </div>
		        <div class="control-group">
		          <label class="control-label">用户住址：</label>
		          <div class="controls">
		          	<span class="control-text">${userInfo.residence }</span>
		          </div>
		        </div>
		        <div class="control-group">
		          <label class="control-label">用户身份证审核状态：</label>
		          <div class="controls">
		          	<span class="control-text">${cardInfo.status}</span>
		          </div>
		        </div>
	        </div>
	        <!--用户user结束-->
	        
	        <!--抵押pledge开始-->
	        <div class="pledge">
	          <div class="control-group">
	          	<label class="control-label">抵押类型：</label>
	          	<div class="controls">
	         		  <span class="control-text">${mg.morType}</span>
	         	 </div>
	        </div>
	          <div class="control-group">
	         	 <label class="control-label">抵押物品描述：</label>
	          	<div class="controls">
	         		  <span class="control-text">${mg.descr}</span>
	          	</div>
	        	</div> 
	       		<div class="control-group">
	          	<label class="control-label">抵押物购买时间：</label>
	         		<div class="controls">
	         		  <span class="control-text">${mg.buyTime}</span>
	          	</div>
	        </div>
	        </div> 
	        <!--抵押pledge结束-->
       </div>
        <!--顶部top结束-->
        
	      <!--用户照片userPhoto开始-->
	      <div class="userPhoto" >
	         	<div class="control-group">
		          <label class="control-label">用户身份证照片：</label>
		          <div class="controls">
		         		<img width="285" src="${cardInfo.cardPic}">
	         		</div>
	        	</div>
	         	<div class="control-group">
		          <label class="control-label">用户手持身份证照片：</label>
		          <div class="controls">
		          	<img width="285" src="${cardInfo.cardPicWithH}">
		          </div>
	        	</div> 
	      		<div class="control-group" style="float:right; margin-right:0;">
		          <label class="control-label">抵押物照片：</label>
		          <div class="controls">
		          	<img width="285" src="${mg.realPic}">
		          </div>
	        </div> 
	      	</div>    
	      <!--用户照片userPhoto结束-->
        
        <!--按钮butto开始-->
        <div class="button">
          <a  href="${pageContext.request. contextPath}/loanInfo.action?op=check&value=pass&loanId=${loanInfo.loanID}" class="sub"  > 审核通过</a>
          <a href="${pageContext.request. contextPath}/loanInfo.action?op=check&value=notPass&loanId=${loanInfo.loanID}" class="sub" style="margin-top:20px">审核不通过</a>
        </div>
        <!--按钮butto结束-->
    </form>
    <!--表单form结束-->
	</div>

</body>
<style>
	 /*全局样式*/
*{margin:0; padding:0;}

label{font-size:20px;}
span{font-size: 16px;}
a:link {font-size: 18px; color: white;text-decoration: none;} 
a:visited { font-size: 18px;color: white; text-decoration: none;} 
a:hover { font-size: 18px; color: white; text-decoration: none; }
 
/*大盒子*/ 
.demo-content{width:1200px; margin:0 auto; }

/*顶部样式*/
.top{width:1200px; height:380px; margin:0 auto;}

/*贷款样式*/ 
.top .loan{width:320px; height:380px; float:left;}

/*用户样式*/
.top .user{width:390px; height:380px; float:left; margin-left:110px;}
.top .user .control-label{width:200px;}

/*抵押样式*/
.top .pledge{width:300px; height:200px; float:right;}
.top .pledge .control-label{width:160px;}

/*用户照片*/
.userPhoto{width:1200px; height:340px;  margin-top:17px;float:left;}
.userPhoto .control-group{float:left;width:300px; height:500px; margin-right:135px;}
.userPhoto .control-label{width:210px !important; height:30px; line-height:30px; text-align:left!important; margin-left:12px; }
.userPhoto .control-group .controls img{max-width:285px; max-height:285px;}
/*底部按钮样式*/
.button{width:1176px;  margin:0 auto; }
.button .sub { width:295px; height:45px; background-color: #ffb422; position:relative; text-align: center;line-height: 45px;
    color: #fff; font-size: 16px; display: inline-block; margin-top: 60px; margin-left:50px; border-radius: 5px;
	border:none;font-family:"微软雅黑";} 
/*.button:hover{background:none; border:none;}*/
    
</style>



<script type="text/javascript"></script>

</html>         