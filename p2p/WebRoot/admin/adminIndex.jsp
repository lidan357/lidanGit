<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>

<style type="text/css">
body {
	background: rgb(62, 72, 132);
}

.main {
	width: 1000px;
	height: 550px;
	position: relative;
	margin-left: auto;
	margin-right: auto;
	margin-top: auto;
	margin-bottom: auto;
}

.child {
	float: left;
	width: 480px;
	height: 240px;
	background: #FFF;
	margin-left: 20px;
	margin-top: 20px;
	border-radius: 5px;
}

hr {
	color: white;
	margin-top: 0px;
	width: 440px;
	line-height: 10px;
	display: block;
}

.title {
	margin-top: 10px;
	margin-left: 20px;
	font-family: "微软雅黑";
	line-height: 10px;
}

.content {
	color: rgb(113, 128, 135);
	margin-left: 20px;
	font-weight: bold;
	font-family: "微软雅黑";
}
</style>
</head>

<body>
<jsp:include page="check.jsp"></jsp:include>


	<div class="main">
		<div class="child">
			<p class="title">用户</p>
			<hr />
			<p class="content">
				在线人数:<label style="margin-left: 50px">${applicationScope.userCount }</label>
			</p>
			<p class="content">
				待审核的身份证:<label style="margin-left: 50px">${datas['checkID'] }</label>
			</p>
			<p class="content">
				贷款用户人数:<label style="margin-left: 50px">${datas['loanUser'] }</label>
			</p>
			<p class="content">
			投资用户人数:<label style="margin-left: 50px">${datas['invUser'] }</label>
			</p>
			<p class="content">
			总用户人数:<label style="margin-left: 50px">${datas['allUser'] }</label>
			</p>
		</div>
		<div class="child">
			<p class="title">投资</p>
			<hr />
			<p class="content">
				总的投资笔数:<label style="margin-left: 50px">${datas['invCount'] }</label>
			</p>
			<p class="content">
				总的投资金额:<label style="margin-left: 50px">${datas['invMoney'] }</label>
			</p>
			<p class="content">
				正在投资的笔数:<label style="margin-left: 50px">${datas['invingCount'] }</label>
			</p>
			<p class="content">
				已经还款完毕的笔数:<label style="margin-left: 50px">${datas['invedCount'] }</label>
			</p>

		</div>
		<div class="child">
			<p class="title">贷款</p>
			<hr />
			<p class="content">
				总的贷款笔数:<label style="margin-left: 40px">${datas['loanCount'] }</label>
				<label style="margin-left: 80px">流标的贷款: <label style="margin-left: 50px">${datas['failed'] }</label></label>
			</p>
			<p class="content">
				总的贷款金额:<label style="margin-left: 40px">${datas['loanMoney'] }</label>
			<label style="margin-left: 20px">正在还款的贷款:<label style="margin-left: 40px">${datas['repaying'] }</label></label>
			</p>
			<p class="content">
			已经贷款完毕的贷款:<label style="margin-left: 40px">${datas['loanedCount'] }</label>
			</p>
			<p class="content">
				正在审核的贷款:<label style="margin-left: 40px">${datas['checkingCount'] }</label>
			</p>
			<p class="content">
				正在融资的贷款:<label style="margin-left: 40px">${datas['financing'] }</label>
			</p>
		
		</div>
		<div class="child">
			<p class="title">还款</p>
			<hr />
			<p class="content">
				需要还款笔数:<label style="margin-left: 50px">${datas['requiredCount'] }</label>
			</p>
			<p class="content">
				需要还款金额:<label style="margin-left: 50px">${datas['reqReMoney'] }</label>
			</p>
			<p class="content">
				逾期还款笔数:<label style="margin-left: 50px">0 ${datas[''] }</label>
			</p>
			<p class="content">
				已经还款完毕的笔数:<label style="margin-left: 50px">${datas['finishedRepay'] }</label>
			</p>
		</div>

	</div>

</body>
</html>

 

