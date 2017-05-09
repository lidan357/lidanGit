<%@ page language="java" import="java.util.*,com.p2p.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%><%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>invest</title>

<!-- <link rel="stylesheet/less" type="text/css" href="css/style.less" /> -->
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="js/all.js"></script>
<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
	<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link rel="stylesheet" type="text/css" href="css/style.css">
<!--[if IE 6]> 
<script src="./js/iepng.js" type="text/javascript"></script> 
<script type="text/javascript">
   EvPNG.fix('div, ul, img, li, input,span, p');
</script>
<![endif]-->
</head>
<body>
	<!-- header start -->
	<%@include file="head.jsp"%>
	<!-- end  -->
	<div class="zscf_banner_wper">
	<div class="zscf_banner px1000" style="top:17%;right:5%;position:absolute;z-index:1">
		  <div class="zscf_box">  
		  	<p>累计成交：<strong><fmt:formatNumber value="${SUMloanMoney}" pattern="#.00"/>元</strong></p>
		  	<p>运营时间：<strong>${days }天</strong></p>
		  	<p><strong></strong>融资成功率<strong><fmt:formatNumber value="${(SUMcurMoney/SUMloanMoney)*100}" maxFractionDigits="0"/>%</strong></p>
		  	<c:if test="${empty user}">
   				<a href='login.jsp' class='btn btn1'>立即登录</a><br>
		  		<a href='register.jsp' class='btn btn2'>立即注册</a>
			</c:if>
			<c:if test="${!empty user}">
				<br>
   				<strong>中兴理财为您服务</strong>
			</c:if>
		  </div>
	</div>
	<div id="myCarousel" class="carousel slide">
	<!-- 轮播（Carousel）指标 -->
	<ol class="carousel-indicators">
		<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
		<li data-target="#myCarousel" data-slide-to="1"></li>
		<li data-target="#myCarousel" data-slide-to="2"></li>
	</ol>   
	<!-- 轮播（Carousel）项目 -->
	<div class="carousel-inner">
		<div class="item active">
			<img src="/p2p/Carousel/first.jpg" alt="淘金活动" style="cursor: pointer;" onclick="washgold()">
			<script type="text/javascript">
				function washgold(){
					window.location.href="/p2p/washgold.action";					
				}
			</script>
		</div>
		<div class="item">
			<img src="/p2p/Carousel/second.jpg" alt="Second slide">
		</div>
		<div class="item">
			<img src="/p2p/Carousel/third.jpg" alt="Third slide">
		</div>
	</div>
	<!-- 轮播（Carousel）导航 -->
	<a class="carousel-control left" href="#myCarousel" 
	   data-slide="prev">&lsaquo;</a>
	<a class="carousel-control right" href="#myCarousel" 
	   data-slide="next">&rsaquo;</a>
</div> 

	
</div>
<!-- end banner -->
<div class="zscf_con_wper pb30">
	<div class="zscf_con px1000">
	      <div class="zscf_block1 mt30 ">
	      	  <h2 class="zscf_block1_tit clearfix"><span class="fl"><strong>发标预告</strong>换卡后放假啊客户看 将黑金卡号看见啊后防盗卡…… </span><a href="#" class="fr">查看更多>></a></h2>
	      	  <div class="clearfix clear">
		      	  <ul class="zscf_block1_text clearfix fl">
		      	  	   <li>
		      	  	   	   <span class="block1_libg01">已加入中兴财富</span>
		      	  	   	   <br>
		      	  	   	   <em><strong><fmt:formatNumber value="${UserAllnumber}" pattern="#"/></strong>人</em>	    
		      	  	   </li>
		      	  	   <li>
		      	  	   	   <span class="block1_libg02">已加入中兴财富</span>
		      	  	   	   <br>
		      	  	   	   <em><strong><fmt:formatNumber value="${SUMloanMoney}" pattern="#.00"/></strong>元</em>		      	  
		      	  	   </li>
		      	  	   <li>
		      	  	   	   <span class="block1_libg03">已完成交易</span>
		      	  	   	   <br>
		      	  	   	   <em><strong><fmt:formatNumber value="${SUMcurMoney}" pattern="#.00"/></strong>元</em> 	   	   
		      	  	   </li>
		      	  </ul>
		      	 <!-- end l -->
		      	  <div class="block1_r fl">
		      	  	  <h2 class="block1_r_tit clearfix"><span>网站公告</span><a href="noticelist.html">+</a></h2>
		      	  	  <ul>
		      	  	  	  <li><span>关于新手体验</span><em>06-19</em></li>
		      	  	  	  <li><span>关于新手体验</span><em>06-19</em></li>
		      	  	  	  <li><span>关于新手体验</span><em>06-19</em></li>
		      	  	  	  <li><span>关于新手体验</span><em>06-19</em></li>

		      	  	  </ul>
		      	  </div>
	      	  </div>
	      </div>

	      <!-- end block1 -->
	      <div class="zscf_block2 mt30 clearfix ">
	      	    <div class="zscf_block2_l fl">
	      	    <c:forEach var="b" items="${listoffreshman}">
	      	    	<div class="block2_biao clearfix">
	      	    	     <div class="clearfix">
		      	    	 <span class="fl">${b.descr }</span>
		      	    	 <div class="block2_biao_r fr">
		      	    	  	   <div class="tjxm_jindu ">
	  	      	     	    	   	     	 
	  	      	     	    	   	     	  <div class="press_wper fl">
	  	      	     	    	   	     	  	    <div class="press" style="width: ${b.curMoney*100/b.loanMoney}%"> 	      	     	    	   	     	  	    	  
	  	      	     	    	   	     	  	    </div>
	  	      	     	    	   	     	  </div>
	  	      	     	    	   	     	   <span class="fl"><fmt:formatNumber type="number" value="${b.curMoney*100/b.loanMoney}" maxFractionDigits="0"/><i>%</i></span>
	  	      	     	    	  </div>
		      	    	  </div>
		      	    	  </div>
		      	    	 <ul class="clearfix clear block2_biao_ul">
		      	    	 	 <li>起投资金：<em>100元</em></li>
		      	    	 	 <li><img src="images/bao.png" alt="">利率：<strong>${b.inter }<i>%</i></strong>
		      	    	 	 </li>
		      	    	 	 <li>
		      	    	 	 	产品期限：<span>${b.deadLine}天</span>
		      	    	 	 </li>
		      	    	 	  <li>
		      	    	 	 	借款金额：<span><fmt:formatNumber value="${b.loanMoney }" pattern="#.00"/>元</span>
		      	    	 	 </li>
		      	    	 	 <li>
		      	    	 	 	 <a href="/p2p/loan.action?op=detail&loanId="+${b.loanID} class="invest_btn">立即投资</a>
		      	    	 	 </li>
		      	    	 </ul>
	      	    	</div>
	      	    	</c:forEach> 
	      	    	<c:forEach var="b" items="${listofexperience}"> 
	      	    	<div class="block2_biao2 clearfix">
	      	    	     <div class="clearfix">
		      	    	 <span class="fl">${b.descr }</span>
		      	    	 <div class="block2_biao_r fr">
		      	    	  	   <div class="tjxm_jindu ">
	  	      	     	    	   	     	 
	  	      	     	    	   	     	  <div class="press_wper fl">
	  	      	     	    	   	     	  	    <div class="press" style="width: ${b.curMoney*100/b.loanMoney}%">
	  	      	     	    	   	     	  	    	  
	  	      	     	    	   	     	  	    </div>
	  	      	     	    	   	     	  </div>
	  	      	     	    	   	     	   <span class="fl"><fmt:formatNumber type="number" value="${b.curMoney*100/b.loanMoney}" maxFractionDigits="0"/><i>%</i></span>
	  	      	     	    	  </div>
		      	    	  </div>
		      	    	  </div>
		      	    	 <ul class="clearfix clear block2_biao_ul">
		      	    	 	 <li>起投资金：<em>100元</em></li>
		      	    	 	 <li><img src="images/bao.png" alt="">利率：<strong>${b.inter }<i>%</i></strong>
		      	    	 	 </li>
		      	    	 	 <li>
		      	    	 	 	产品期限：<span>${b.deadLine}天</span>
		      	    	 	 </li>
		      	    	 	  <li>
		      	    	 	 	借款金额：<span><fmt:formatNumber value="${b.loanMoney }" pattern="#.00"/>元</span>
		      	    	 	 </li>
		      	    	 	 <li>
		      	    	 	 	 <a href="11112/detail.html" class="invest_btn">立即投资</a>
		      	    	 	 </li>
		      	    	 </ul>
	      	    	</div>
	      	    	</c:forEach> 
	      	    </div>
	      	    <!-- end left -->
	      	    <div class="zscf_block2_r fl">
	      	          <div class="block2_r_video">
	      	          	  <!-- <img src="images/video.png" alt=""> -->
	      	          	  <embed src="" type="" width="250px;" height="180px;">
	      	          </div>
	      	    	  <div class="block2_r_tip">1分钟让你了解中兴财富</div>
	      	    </div>
	      	    <!-- end right -->
	      </div>
         <!--  end block2 -->
         <div class="zscf_block3 mt30 ">
         	   <h2 class="block3_tit clearfix"><span class="block3_curspan">项目列表</span><em><img src="images/shu.png" alt=""></em><span>债权转让</span><a href="#">更多></a></h2>
         	  <div class="block3_pro_box clear">
         	  	    <div class="block3_prolist">
         	  	    	<c:forEach var="b" items="${listofFiveLoanInfo}">
         	  	    	  <div class="block3_proone clearfix clear">
         	  	    	  	   <span class="fl proone_left"><img src="images/xin.png" alt=""></span>
         	  	    	  	   <!--  -->
         	  	    	  	   <div class="fl proone_center">
         	  	    	  	   	    <div class="clearfix">
						      	    	 <span class="fl proone_center_span1">${b.descr }</span>
						      	    	 <div class="block2_biao_r fr">
						      	    	  	   <div class="tjxm_jindu ">
					  	      	     	    	   	     	 
					  	      	     	    	   	     	  <div class="press_wper fl">
					  	      	     	    	   	     	  	    <div class="press" style="width: ${b.curMoney*100/b.loanMoney}%">
					  	      	     	    	   	     	  	    	  
					  	      	     	    	   	     	  	    </div>
					  	      	     	    	   	     	  </div>
					  	      	     	    	   	     	   <span class="fl"><fmt:formatNumber type="number" value="${b.curMoney*100/b.loanMoney}" maxFractionDigits="0"/><i>%</i></span>
					  	      	     	    	  </div>
						      	    	  </div>
					      	    	 </div>
					      	    	  <ul class="clearfix proone_center_ul clear pt10">
					      	    	  	<li>利率:<span>${b.inter }%</span></li>
					      	    	  	<li>投标期限:<span><!--${b.deadLine}-->7天</span></li>
					      	    	  	<li>借款金额：<span><fmt:formatNumber value="${b.loanMoney }" pattern="#.00"/>元</span></li>
					      	    	  </ul>  
         	  	    	  	   </div>
         	  	    	  	   <!--  -->
         	  	    	  	   <a href="/p2p/loan.action?op=detail&loanId=${b.loanID}" class="block3_btn fl">立即投资</a>
         	  	    	  </div>
         	  	    	</c:forEach> 
         	  	    </div>
         	  	    <!-- end 项目列表 -->
         	  	     <div class="block3_prolist" style="display:none;">
         	  	     2
         	  	     </div>
         	  </div>
         </div>
         <!-- end block3 -->
         <div class="zscf_block4 mt30">
         	  <img src="images/block4_adver.png">
         </div>
         <!-- end block4 -->
         <div class="zscf_block5 mt30 clearfix">
         	    <div class="zscf_block5_l fl mr20">
         	    	<h2 class="block3_tit clearfix block5_l_tit"><span class="block3_curspan news_span">行业动态</span><em><img src="images/shu.png" alt=""></em><span class="news_span">媒体报道</span><a href="#">更多></a></h2>
         	    	<div class="block5_box">

	         	    	<ul class="news_ul">
	         	    		<li><a href="#">5月组团推荐排行榜</a></li>
	         	    		<li><a href="#">5月组团推荐排行榜</a></li>
	         	    		<li><a href="#">5月组团推荐排行榜</a></li>
	         	    		<li><a href="#">5月组团推荐排行榜</a></li>
	         	    		<li><a href="#">5月组团推荐排行榜</a></li>
	         	    		<li><a href="#">5月组团推荐排行榜</a></li>
	         	    	</ul>
	         	    	<ul class="news_ul" style="display:none;">
	         	    		<li><a href="#">6月组团推荐排行榜</a></li>
	         	    		<li><a href="#">5月组团推荐排行榜</a></li>
	         	    		<li><a href="#">5月组团推荐排行榜</a></li>
	         	    		<li><a href="#">5月组团推荐排行榜</a></li>
	         	    		<li><a href="#">5月组团推荐排行榜</a></li>
	         	    		<li><a href="#">5月组团推荐排行榜</a></li>
	         	    	</ul>
	         	    </div>
         	    </div>
         	    <div class="zscf_block5_r fl">
         	    	 <h2 class="block5_r_tit clearfix"><span class="fl ">投资排行榜</span><em class="fr block5_r_tit_em"><a href="javascript:;">总排行</a></em></h2>
         	    	 <div class="rank_box">
         	    	 	  <div class="rank_list">
         	    	 	  	    <ul class="rank_list_ul">
         	    	 	  	    	<c:forEach var="b" items="${listofFiveUserAllMoney}">
         	    	 	  	    	 <li>
         	    	 	  	    	 	 <em class="rank_bg01">${b.paiming}</em>
         	    	 	  	    	 	 <span>${b.userName}</span>
         	    	 	  	    	 	 <strong>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</strong>
         	    	 	  	    	 	 <span>￥<fmt:formatNumber value="${b.curMoney}" pattern="#.00"/></span>
         	    	 	  	    	 	 <span><fmt:formatNumber type="number" value="${b.curMoney*100/SUMcurMoney}" maxFractionDigits="0"/>%</span>
         	    	 	  	    	 </li> 
         	    	 	  	    	</c:forEach>
         	    	 	  	    </ul>
         	    	 	  </div>
         	    	 	  <!-- end --> 
         	    	 	  <div class="rank_list" style="display:none;">
         	    	 	  	  2
         	    	 	  </div>
         	    	 	  <!-- end -->
         	    	 	   <div class="rank_list" style="display:none;">
         	    	 	  	  3
         	    	 	  </div>
         	    	 	  <!-- end -->
         	    	 </div>
         	    </div>
         </div>
         <!-- end block5 -->
         <div class="zscf_partner mt30">
         	 <h2 class="block3_tit clearfix "><span class="block3_curspan">合作伙伴</span></h2>
         	 <div class="partner_con">
         	      <div id="demo">
					<div id="indemo">
					<div id="demo1">
					<a href="#"><img src="images/ifri01.png" border="0" /></a>
					<a href="#"><img src="images/ifri01.png" border="0" /></a>
					<a href="#"><img src="images/ifri01.png" border="0" /></a>
					<a href="#"><img src="images/ifri01.png" border="0" /></a>
					<a href="#"><img src="images/ifri01.png" border="0" /></a>
					<a href="#"><img src="images/ifri01.png" border="0" /></a>
					</div>
					<div id="demo2"></div>
					</div>
					</div>
               <script>
				<!--
				var speed=10;
				var tab=document.getElementById("demo");
				var tab1=document.getElementById("demo1");
				var tab2=document.getElementById("demo2");
				tab2.innerHTML=tab1.innerHTML;
				function Marquee(){
				if(tab2.offsetWidth-tab.scrollLeft<=0)
				tab.scrollLeft-=tab1.offsetWidth
				else{
				tab.scrollLeft++;
				}
				}
				var MyMar=setInterval(Marquee,speed);
				tab.onmouseover=function() {clearInterval(MyMar)};
				tab.onmouseout=function()  {MyMar=setInterval(Marquee,speed)};
				-->
				</script>

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