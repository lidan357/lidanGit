<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<%@ page language="java" errorPage="error.jsp" %>

<script type="text/javascript">

$(function(){
	
	$("#exit").click(function(){
		//alert("ss8888");
		//用这个不兼容 用下面那个
		/* var url="login.action"
		$.post(url,{op:"exit"}, function(data) {
	    }); */
		//alert("ss");
		//alert("ss");
		//alert("ss");
		jQuery.ajax({
		      url: "login.action",
		       data: {op:"exit"},
		       dataType: "json",
		       async: false,
		       success: function(data) { }
		   });
		
	  window.location.reload();
	})
	
})
</script>
<div class="zxcf_top_wper">
	<div class="zxcf_top px1000 clearfix">
		 <div class="zxcf_top_l fl">
		    <img src="images/zxcf_phone.png" alt="">
		    400-027-0101(工作时间9:00-17:30)
		    <a href="#"><img src="images/zxcf_weixin.png" alt=""></a>
		    <a href="#"><img src="images/zxcf_sina.png" alt=""></a>
		    <a href="#"><img src="images/zxcf_qq.png" alt=""></a>
		 </div>
		 <div class="zxcf_top_r fr">
		 <!-- 判断用户 是否 登录 登录 则显示的是用户名 不登录显示的是登录 -->
		 <c:choose>
				   <c:when test="${user!=null }">  
				   <a href="#">${user.userName }</a>
				    	<span>|</span>
				    	<a href="#" id="exit">退出登录</a>	
				   </c:when>
				   <c:otherwise> 
				   	<a href="/p2p/login.jsp" class="curspan">立即登录</a>
		 			<span>|</span>
		 			<a href="/p2p/register.jsp">免费注册</a>
				   </c:otherwise>
			</c:choose>
		 <c:if test=""></c:if>
		 	<span>|</span>
		 	<a href="problem.html">常见问题</a>
		 </div>
	</div>
</div>
<div class="zxcf_nav_wper">
	<div class="zxcf_nav clearfix px1000">
		 <div class="zxcf_nav_l fl"><img src="images/zxcf_logo.png" alt=""></div>
		 <div class="myaccount">
		 	<img src="images/zxcf_perinfo.png" alt="">
		 	<span><a href="/p2p/homePage.action">我的账户</a></span>
		 	
		 	
		 </div>
	</div>
</div>
<div class="zxcf_menu_wper">
	<div class="zxcf_menu px1000">
		  <a href="/p2p/IndexServlet.action?op=show" class="zm_cura">首页</a>
		  <a href="/p2p/invest.action?op=all&curPage=1">我要投资</a>
		  <a href="/p2p/borrow.jsp">我要借款</a>
		  <a href="/p2p/statistic.action?op=realTime">实时财务</a>
		  <a href="/p2p/noticelist.jsp">新手指引</a>
		  <a href="#" style="margin-right:0;">关于我们</a>
	</div>
</div>
