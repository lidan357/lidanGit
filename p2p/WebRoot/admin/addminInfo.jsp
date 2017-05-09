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
    <button type="submit" class="btn btn-primary">查询</button>&nbsp;&nbsp; <button type="button" class="btn btn-success" id="addnew">新增管理员</button>
</form>
<table class="table table-bordered table-hover definewidth m10">
    <thead>
    <tr>
        <th>管理员id</th>
        <th>管理员名称</th>
        <th>电话号码</th>
        <th>操作</th>
    </tr>
    </thead>
	     <c:forEach items="${addminInfos }" var="info">
	     <tr>
            <td>${info.managerID }</td>
            <td>${info.managerName }</td>
            <td>${info.phone }</td>
            <td>
                <a href="adminEdit.jsp?op=getAdmin&id=${info.managerID }">编辑</a>     
                <c:if test="${admin.managerName=='admin'}">           
                <a href="${pageContext.request.contextPath}/admin.action?op=deleteAdmin&id=${info.managerID }">删除</a>                
                </c:if>
            </td>
        </tr>	
	     
	     </c:forEach>
	        <tr style="text-align: center">
				<td colspan="9" style="text-align: center">
						<font>当前页${page.curPage }</font>
						<c:if test="${page.curPage==1 }">
								首页&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						</c:if><c:if test="${page.curPage>1}">
							<a href="${pageContext.request.contextPath }/admin.action?op=adminInfo&pageNum=1">首页</a>
								<a href="${pageContext.request.contextPath}/admin.action?op=addminInfo&pageNum=${page.curPage-1 }">上一页</a>
						</c:if>
						<c:forEach var="i" begin="1"  end="${page.maxPage }" varStatus="status">
								<c:if test="${i!=page.curPage }">
								<a href="${pageContext.request.contextPath }/admin.action?op=adminInfo&pageNum=${i}">${ i }</a>
								</c:if>
						</c:forEach>
						<c:if test="${ page.curPage<page.maxPage}">
								<a href="${pageContext.request.contextPath }/admin.action?op=adminInfo&pageNum=${page.curPage+1 }">下一页</a>
							<a href="${pageContext.request.contextPath }/admin.action?op=adminInfo&pageNum=${page.maxPage }">末页</a>
						</c:if>
			</td>
				</tr>
</table>
</body>
<script type="text/javascript">
    $(function () {
    	$('#addnew').click(function(){
				window.location.href="addAdmin.jsp";
		 });
	
    });

</script>
</html>
