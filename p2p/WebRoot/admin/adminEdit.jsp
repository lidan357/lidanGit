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
<title>编辑管理员信息</title>
<!-- 此文件为了显示Demo样式，项目中不需要引入 -->
 
  <link href="http://g.alicdn.com/bui/bui/1.1.21/css/bs3/dpl.css" rel="stylesheet">
  <link href="http://g.alicdn.com/bui/bui/1.1.21/css/bs3/bui.css" rel="stylesheet">
 

</head>
<body>
  <div class="demo-content">
    <form id="J_Form" class="form-horizontal" action="${pageContext.request.contextPath }/admin.action" onsubmit="return check()" method="post">
      <h2 style="margin-left:30px;">基本信息</h2>
	<input type="hidden" name="op" value="update"/>
	
      <div class="row">
        <div class="control-group span10">
          <label class="control-label"><s>*</s>管理员名：</label>
          <div class="controls">
            <input name="adminName" type="text" value="" class="control-text" readonly="readonly" data-rules="{required:true}">
          </div>
        </div>
        <div class="control-group span10">
          <label class="control-label"><s>*</s>管理员编号：</label>
          <div class="controls bui-form-field-plain" data-cfg="{renderer:planFormat}">
            <input name="managerID" type="text" readonly="readonly"    class="control-text" value=""/>
          </div>
        </div>
      </div>
      
      <div class="row">
   
        <div class="control-group12 span10">
         <label class="control-label">电话号码：</label>
          <div class="controls">
            <input name="phone" type="text" value=""  class="control-text"  data-rules="{required:true}">
          </div>
        </div>
      </div>
      
	   <div class="row">
        <div class="control-group span10">
          <label class="control-label">密码：</label>
          <div class="controls">
            <input name="password" type="password" value=""  class="control-text"  data-rules="{required:true}">
          </div>
        </div>
        <div class="control-group12 span10">
         <label class="control-label">确认密码：</label>
          <div class="controls">
            <input name="passwordConfirm" type="password" value=""  class="control-text"  data-rules="{required:true}">
          </div>
        </div>
      </div>
  
	
      <hr/>      
      <div class="row">
        <div class="form-actions offset3">
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
 
   
      function GetQueryString(name)
      {
           var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
           var r = window.location.search.substr(1).match(reg);
           if(r!=null)return  unescape(r[2]); return null;
      }
    
      $(function(){
    	 
    	  var opv= GetQueryString("op");
    	  var idv= GetQueryString("id");
 
    	  $.ajax({
    		 type:"POST",
    		 data:{op:opv,id:idv},
    		 url:"../admin.action",
    		  dataType:"text",
    		  async:false,
    		  success:getResult,
    	  });

      })
      
      function getResult(data){
    	  data = eval("("+data+")")
    	  $("input[name='managerID']").val(data[0].managerID);
    	  $("input[name='adminName']").val(data[0].managerName);
    	  $("input[name='phone']").val(data[0].phone);
    	  $("input[name='password']").val(data[0].mPassword);
    	  $("input[name='passwordConfirm']").val(data[0].mPassword);
    	  
      }
      
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

