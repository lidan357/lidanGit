<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!-- author chenyong -->
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
	<title>注册</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
<!-- <link rel="stylesheet/less" type="text/css" href="css/style.less" /> -->
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="js/all.js"></script>
<script type="text/javascript" src="js/register.js"></script>
<!--[if IE 6]> 
<script src="./js/iepng.js" type="text/javascript"></script> 
<script type="text/javascript">
   EvPNG.fix('div, ul, img, li, input,span, p');
</script>
<![endif]-->



</head>
<body>
<!-- header start -->
<%@ include file="top.jsp" %>
<!-- end  -->
<div class="reg_con_wper">
	<div class="reg_con px1000">
		   <div class="reg_box clearfix">
		   	   <div class="reg_box_l fl">
		   	   	  <img src="
		   	   	  images/reg_pic01.png" alt="">
		   	   </div>
		   	   <div class="reg_box_r fl">
		   	   	    <h2 class="lg_sec_tit clearfix">
	  	   	     	      <span class="fl">注册</span>
	  	   	     	      <em class="fr">有帐号，<a href="login.jsp">立即登录</a></em>
	  	   	     	</h2>
	  	   	     	<form action="${pageContext.request.contextPath }/register.action" method="post">
	  	   	     	   	    <fieldset>
	  	   	     	   	    	  <p class="mt20">
	  	   	     	   	    	  	 <input type="text" name="userName" id="userName" placeholder="用户名/手机" class="lg_input01 lg_input">
	  	   	     	   	    	  	<div id="nameInfo"></div>
	  	   	     	   	    	  </p>
                                  <p class="mt20">
	  	   	     	   	    	  	 <input type="password"  name="password" id="password" placeholder="密码" class="lg_input02 lg_input">
	  	   	     	   	    	<div id="pwdInfo"></div>
	  	   	     	   	    	  </p>
                                  <p class="mt20">
	  	   	     	   	    	  	 <input type="password" name="passwordConfirm" id="passwordConfirm" placeholder="密码确认" class="lg_input02 lg_input">
	  	   	     	   	    	  	<div id="confrimInfo"></div>
	  	   	     	   	    	  </p>
                                  <p class="mt20">
	  	   	     	   	    	  	 <input type="text" name="phone" id="phone"  placeholder="手机号" class="lg_input03 lg_input">
	  	   	     	   	    	  		<div id="phoneInfo"></div>
	  	   	     	   	    	  </p>
                                  <p class="mt20 yanzheng">
	  	   	     	   	    	  	 <input type="text" id="captcha" name="captcha" placeholder="验证码" class="lg_input04 lg_input">
	  	   	     	   	    	  	 <span><a href="javascript:;" id="sendCap">发送验证码</a></span>
	  	   	     	   	    	  	<div id="captchaInfo"></div>
	  	   	     	   	    	  </p>
                                 <!--   <p class="mt20">
	  	   	     	   	    	  	 <input type="text" placeholder="邀请码" class="lg_input03 lg_input">
	  	   	     	   	    	  </p> -->
                                  <p class="pt10"><a href="#">使用条款</a>&nbsp;&nbsp;<a href="#">隐私条款</a></p>
                                 <p class="mt20"><a href="#" class="lg_btn" id="reg">立即注册</a></p>
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