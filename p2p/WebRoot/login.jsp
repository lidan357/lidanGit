<%@page import="java.net.URLDecoder"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String name="";//设置从cookie接受登录名的变量
String check ="";//设置是否有勾选记住密码的标识
Cookie[] cookies = request.getCookies();//从request中获取cookie 这里拿到的是一个cookie对象数组
for(int i=0;cookies!=null&&i<cookies.length;i++){
	Cookie cookie = cookies[i];
	if(URLDecoder.decode(cookie.getName(), "UTF-8").equals("name")){
		name=URLDecoder.decode(cookie.getValue(), "UTF-8");
		check="checked";
		//request.getSession().setAttribute("userName", name);
		//request.getSession().setAttribute("check", check);
	}
}


%>

<!-- author chenyong -->
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
	<title>首页</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
<!-- <link rel="stylesheet/less" type="text/css" href="css/style.less" /> -->
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="js/all.js"></script>
<!--[if IE 6]> 
<script src="./js/iepng.js" type="text/javascript"></script> 
<script type="text/javascript">
   EvPNG.fix('div, ul, img, li, input,span, p');
</script>
<![endif]-->

<script type="text/javascript">
 $(function(){
	 $("#log").click(function(){
		
		 if($("#loginName").val()==""){
			 $("#nameInfo").text("用户名不能为空")
			 return false;
		 }else{
			 $("#nameInfo").text("")
		 }
		 if($("#password").val()==""){
			 $("#pwdInfo").text("密码不能为空")
			 return false;
		 }else{
			 $("#pwdInfo").text("")
		 }
		 //登录的时候判断是否有发放奖励一次抽奖次数，并进行相应的数据库操作
		 //var url = "${pageContext.request.contextPath }/setAward.action?userName="+$("#loginName").val();
		 var url = "${pageContext.request.contextPath }/setAward.action";
		//alert(url);
		 $.ajax({
			 type:"POST",
			 url:url,
			 data:{userName:$("#loginName").val()},
			 dataType:"text",
			  async:false,
			 success:null,
		 });
		 

//		 $.post(url,{userName:$("#loginName").val()},null,"json");
	//	 $.post(url);
		 $("form").submit();
	 })
	 
 })

</script>
</head>
<body>
<!-- header start -->
<%@ include file="top.jsp"  %>
<!-- end  -->
<div class="login_con_wper">
	  <div class="login_con px1000 ">
	  	   <div class="lg_section clearfix">
	  	   	     <div class="lg_section_l fl">
	  	   	     	<img src="images/lg_bg02.png"> 
	  	   	     </div>
	  	   	     <!-- end l -->
	  	   	     <div class="lg_section_r fl">
	  	   	     	   <h2 class="lg_sec_tit clearfix">
	  	   	     	      <span class="fl">登录</span>
	  	   	     	      <em class="fr">没有帐号，<a href="register.jsp">立即注册</a></em>
	  	   	     	   </h2>
	  	   	     	   <c:if test="${error!=null }">
	  	   	     	   		<div>${error}</div>
	  	   	     	   </c:if>
	  	   	     	   <form action="${pageContext.request.contextPath }/login.action" method="post">
	  	   	     	   	    <fieldset>
	  	   	     	   	    	  <p class="mt20">
	  	   	     	   	    	  	 <input type="text" name="loginName" id="loginName" placeholder="用户名/手机" class="lg_input01 lg_input" value="<%=name%>">
	  	   	     	   	    	 <div id="nameInfo"></div>
	  	   	     	   	    	  </p>
                                 
                                  <p class="mt20">
	  	   	     	   	    	  	 <input type="password" name="password" id="password" placeholder="密码" class="lg_input02 lg_input">
	  	   	     	   	    	  <div id="pwdInfo"></div>
	  	   	     	   	    	  </p>
                                    
                                 <p class="clearfix lg_check"><span class="fl"><input type="checkbox" name="remember" value="remember" <%=check %>>记住用户名</span><a href="finPwd.jsp" class="fr">忘记密码？找回</a></p>
                                 <p><a href="#" class="lg_btn" id="log">立即登陆</a></p>
	  	   	     	   	    </fieldset>
	  	   	     	   </form>
	  	   	     </div>
	  	   </div>
	  </div>
</div>
<!-- footer start -->
<div class="zscf_aboutus_wper">
	  <div class="zscf_aboutus px1000 clearfix">
	  	    <div class="zscf_aboutus_l fl">
	  	    	   <ul class="zscf_aboutus_lul clearfix">
	  	    	   	  <li class="pt10"><a href="#"><img src="images/app.png" alt=""></a>
	  	    	   	  </li>
	  	    	   	  <li>
	  	    	   	  <p class="pb20">服务热线</p>
	  	    	   	  <strong>400-027-0101</strong>
	  	    	   	  </li>
	  	    	   	  <li>
	  	    	   	  	  <p class="pb10 linkpic">
	  	    	   	  	     <a href="#"><img src="images/ft_sina.png" alt=""></a>
	  	    	   	  	     <a href="#"><img src="images/ft_weixin.png" alt=""></a>
	  	    	   	  	     <a href="#"><img src="images/ft_erji.png" alt=""></a>
	  	    	   	  	  </p>
	  	    	   	  	  <p><a href="#">kefu@zhongxincaifu.com</a></p>
	  	    	   	  </li>
	  	    	   </ul>
	  	    </div>
	  	    <!-- end left -->
	  	    <div class="zscf_aboutus_r fl clearfix">
	  	    	 <a href="#" class="fl ft_ewm"><img src="images/ft_erweima.png" alt=""></a>
	  	    	 <ul class="fl clearfix">
	  	    	 	<li><a href="#">联系我们</a></li>
	  	    	 	<li><a href="#">我要融资</a></li>
	  	    	 	<li><a href="problem.html">帮助中心</a></li>
	  	    	 	<li><a href="#">友情链接</a></li>
	  	    	 	<li><a href="#">招贤纳士</a></li>
	  	    	 	<li><a href="#">收益计算器</a></li>
	  	    	 </ul>
	  	    </div>
	  	    <!-- end right -->

	  </div>
</div>

<div class="zscf_bottom_wper">
	<div class="zscf_bottom px1000 clearfix">
		  <p class="fl">© 2014 zhongxincaifu &nbsp;  &nbsp;&nbsp;   中兴财富金融信息服务股份有限公司 &nbsp;&nbsp;&nbsp;    来源:<a href="http://www.mycodes.net/" target="_blank">源码之家</a></p>
		  <p class="fr">
		    <a href="#"><img src="images/360.png" alt=""></a>
		    <a href="#"><img src="images/kexin.png" alt=""></a>
		    <a href="#"><img src="images/norton.png" alt=""></a>
		  </p>
	</div>
</div>
<!-- footer end -->
</body>
</html>
