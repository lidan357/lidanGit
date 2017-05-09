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
    <script type="text/javascript">
	function replaceNumKeyUp(obj){
	obj.value = obj.value.replace(/[^0-9]/g,'');  
	}
	</script>
</head>
<body>
<jsp:include page="check.jsp"></jsp:include>

<form class="form-inline definewidth m20" action="" onsubmit="false" method="get">    
    用户ID：
    <input type="text" name="username" id="username"class="abc input-default" placeholder="" value="" onkeyup="replaceNumKeyUp(this)">&nbsp;&nbsp;  
    <button type="button" class="btn btn-primary" name="UserInfoselect_btn" id="UserInfoselect_btn">查询</button>&nbsp;&nbsp; <button type="button" class="btn btn-success" id="addnew">新增用户</button>
</form>
<table class="table table-bordered table-hover definewidth m10" id="loan_table">
    <thead>
    <tr>
        <th>用户id</th>
        <th>用户名称</th>
        <th>真实姓名</th>
        <th>余额</th>
        <th>操作</th>
    </tr>
    </thead>
	     <c:forEach items="${userInfos }" var="info">
	     <tr class="loan_tr">
            <td>${info.userID }</td>
            <td>${info.userName }</td>
            <td>${info.realName }</td>
            <td>${info.balance }</td>
            <td>
                <a href="../admin.action?op=editUser&userId=${info.userID}">编辑</a>                
            </td>
        </tr>	
	     
	     </c:forEach>
	        <tr style="text-align: center">
				<td colspan="9" style="text-align: center">
						<font>当前页${page.curPage }</font>
						<c:if test="${page.curPage==1 }">
								首页&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						</c:if><c:if test="${page.curPage>1}">
							<a href="${pageContext.request.contextPath }/admin.action?op=userInfo&pageNum=1">首页</a>
								<a href="${pageContext.request.contextPath}/admin.action?op=userInfo&pageNum=${page.curPage-1 }">上一页</a>
						</c:if>
						<c:forEach var="i" begin="1"  end="${page.maxPage }" varStatus="status">
								<c:if test="${i!=page.curPage }">
								<a href="${pageContext.request.contextPath }/admin.action?op=userInfo&pageNum=${i}">${ i }</a>
								</c:if>
						</c:forEach>
						<c:if test="${ page.curPage<page.maxPage}">
								<a href="${pageContext.request.contextPath }/admin.action?op=userInfo&pageNum=${page.curPage+1 }">下一页</a>
							<a href="${pageContext.request.contextPath }/admin.action?op=userInfo&pageNum=${page.maxPage }">末页</a>
						</c:if>
			</td>
				</tr>
</table>
<script type="text/javascript">
$(function () {
	
	$("#UserInfoselect_btn").click(function(){
		$.ajax({
			type:"POST",
			url:"../AllSelectServlet.action",
			data:{op:"UserInfoselect_btn",userID:$("#username").val()},
			dataType:"text",
			async:false,
			success:getSelectResult,
		});
	 });
	function getSelectResult(data){
		data = eval("("+data+")");	
		$(".loan_tr").empty();
		//alert("清空成功。。。。正在压入数据");
		for (var i=0;i<data.length;i++){
				$("#loan_table").append("<tr id='loan_tr_id"+i+"' class='loan_tr'></tr>")
				$("#"+"loan_tr_id"+i+"").append("<td>"+data[i].userID+"</td>")
				$("#"+"loan_tr_id"+i+"").append("<td>"+data[i].userName+"</td>")
				$("#"+"loan_tr_id"+i+"").append("<td>"+data[i].realName+"</td>")
				$("#"+"loan_tr_id"+i+"").append("<td>"+data[i].balance+"</td>")
				$("#"+"loan_tr_id"+i+"").append("<td> <a href='../admin.action?op=editUser&userId="+data[i].userID+"'>编辑</a></td>")	
		} 
	}
})
</script>

</body>
</html>
<script type="text/javascript">
    $(function () { 	
		$('#addnew').click(function(){
				window.location.href="add.html";
		 });
		$("#idCard").click(function(){	
		});
		
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
