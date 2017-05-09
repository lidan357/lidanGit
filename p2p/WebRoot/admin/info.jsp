<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<c:if test="${result!=null&&result=='error' }">
	添加管理员失败
</c:if>
<c:if test="${result==null }">
	添加管理员成功
</c:if>
