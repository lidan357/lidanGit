<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<!DOCTYPE html>
<html>
<head>
    <title></title>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="Css/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="Css/bootstrap-responsive.css" />
    <link rel="stylesheet" type="text/css" href="Css/style.css" />
    <script type="text/javascript" src="Js/jquery.js"></script>
    <script type="text/javascript" src="Js/jquery.sorted.js"></script>
    <script type="text/javascript" src="Js/bootstrap.js"></script>
    <script type="text/javascript" src="Js/ckform.js"></script>
    <script type="text/javascript" src="Js/common.js"></script>

 

    <style type="text/css">
        body {
            padding-bottom: 40px;
        }
        .sidebar-nav {
            padding: 9px 0;
        }

        @media (max-width: 980px) {
            /* Enable use of floated navbar text */
            .navbar-text.pull-right {
                float: none;
                padding-left: 5px;
                padding-right: 5px;
            }
        }


    </style>
</head>
<body>
<jsp:include page="check.jsp"></jsp:include>

<form class="form-inline definewidth m20" action="index.html" method="post">    
    用户名称：
    <input type="text" name="username" id="username"class="abc input-default" placeholder="" value="">&nbsp;&nbsp;  
    <button type="submit" class="btn btn-primary">查询</button>&nbsp;&nbsp; <button type="button" class="btn btn-success" id="addnew">新增用户</button>
</form>
<table class="table table-bordered table-hover definewidth m10">
    <thead>
    <tr>
        <th>还款id</th>
        <th>贷款id</th>
        <th>用户id</th>
        <th>还款金额</th>
        <th>要求还款期限</th>
        <th>实际还款时间</th>
        <th>状态</th>
        <th>操作</th>

    </tr>
    </thead>
	     <c:forEach items="${repayments }" var="repay">
	     <tr>
            <td>${repay.reID }</td>
            <td>${repay.loanID}</td>
            <td>${repay.userID }</td>
            <td>${repay.reqMoney }</td>
            <td>${repay.reDeadTime }天</td>
            <td>${repay.factRetime}</td>
            <td>${repay.status}</td>
            <td>
                <a href="edit.html">编辑</a>                
            </td>
        </tr>	
	     </c:forEach>
	     <tr style="text-align: center" class="loan_tr">
				<td colspan="9" style="text-align: center">
						<font>当前页${page.curPage }</font>
						<c:if test="${page.curPage==1 }">
								首页&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						</c:if><c:if test="${page.curPage>1}">
							<a href="${pageContext.request.contextPath }/admin.action?op=repayInfo&pageNum=1">首页</a>
								<a href="${pageContext.request.contextPath}/admin.action?op=repayInfo&pageNum=${page.curPage-1 }">上一页</a>
						</c:if>
						<c:forEach var="i" begin="1"  end="${page.maxPage }" varStatus="status">
								<c:if test="${i!=page.curPage }">
								<a href="${pageContext.request.contextPath }/admin.action?op=repayInfo&pageNum=${i}">${ i }</a>
								</c:if>
						</c:forEach>
						<c:if test="${ page.curPage<page.maxPage}">
								<a href="${pageContext.request.contextPath }/admin.action?op=repayInfo&pageNum=${page.curPage+1 }">下一页</a>
							<a href="${pageContext.request.contextPath }/admin.action?op=repayInfo&pageNum=${page.maxPage }">末页</a>
						</c:if>
			</td>
				</tr>
</table>
</body>
</html>
<script>
    $(function () {
		$('#addnew').click(function(){

				window.location.href="add.html";
		 });
		
		$("#idCard").click(function(){
			
			window.
		
		})
		
    });

	function del(id)
	{
		if(confirm("确定要删除吗？"))
		{
		
			var url = "index.html";
			
			window.location.href=url;		
		
		}
	}
</script>