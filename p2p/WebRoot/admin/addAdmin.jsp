<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<c:if test="${admin==null}">
<jsp:forward page="${page.request.contextPath}/admin/login.jsp"/>
</c:if>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>设置表单数据</title>
<!-- 此文件为了显示Demo样式，项目中不需要引入 -->
<link href="../../assets/code/demo.css" rel="stylesheet">
 
  <link href="http://g.alicdn.com/bui/bui/1.1.21/css/bs3/dpl.css" rel="stylesheet">
  <link href="http://g.alicdn.com/bui/bui/1.1.21/css/bs3/bui.css" rel="stylesheet">
 <style type="text/css">
 .demo-content{
 	margin-top: 50px;
 
 }
 </style>
</head>
<body>
  <div class="demo-content">
    <form id="J_Form" onsubmit="return check()" method="post" action="${pageContext.request.contextPath }/admin.action" class="form-horizontal">
     <input type="hidden" name="op" value="addAdmin"/>
     
      <div class="control-group">
        <label class="control-label"><s>*</s>电话：</label>
        <div class="controls">
          <input type="text" name="phone" class="input-large" data-rules="{required : true}">
        </div>
      </div>
    <div class="control-group">
        <label class="control-label"><s>*</s>用户名：</label>
        <div class="controls">
          <input type="text" name="addminName" class="input-large" data-rules="{required : true}">
        </div>
      </div>
	  <div class="control-group">
        <label class="control-label"><s>*</s>密码：</label>
        <div class="controls">
          <input type="password" name="password" id="password" class="input-large" data-rules="{required : true}">
        </div>
        
      </div>
     	  <div class="control-group">
        <label class="control-label"><s>*</s>确认密码：</label>
        <div class="controls">
          <input type="password" name="passwordConfirm" id="passwordConfirm" class="input-large" data-rules="{required : true}">
        </div>
      </div>
     
    
      <div class="row actions-bar">       
          <div class="form-actions span13 offset3">
            <button type="submit" class="button button-primary">保存</button>
            <button type="reset" class="button">重置</button>
          </div>
      </div>       
    </form>
    
 
  <script src="http://g.tbcdn.cn/fi/bui/jquery-1.8.1.min.js"></script>
  <script src="http://g.alicdn.com/bui/seajs/2.3.0/sea.js"></script>
  <script src="http://g.alicdn.com/bui/bui/1.1.21/config.js"></script>
 
<!-- script start --> 
    <script type="text/javascript">
      BUI.use('bui/form',function(Form){
      
      new Form.Form({
        srcNode : '#J_Form'
      }).render();
      
  });  
      
      function check(){
    	 if($("#password").val()!=$("#passwordConfirm").val()){
    		alert("密码和确认密码不一致");	 
			return false;
    	 }
    	  
      }
</script>
<!-- script end -->
  </div>
</body>
</html>