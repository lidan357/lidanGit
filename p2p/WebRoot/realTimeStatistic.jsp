<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0043)http://www.whzxcf.com/financial-index.shtml -->
<html xmlns="http://www.w3.org/1999/xhtml">
<style type="text/css" id="54449091812"></style>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta name="baidu-site-verification" content="hN9qyeWx20">
<meta name="baidu-site-verification"
	content="1fc1744a879ca4c2b5d2731db47080a9">
<link href="./realTimeStatistic_files/style.css" rel="stylesheet">
<link href="./realTimeStatistic_files/newstyle.css" rel="stylesheet">
 <script src="http://g.tbcdn.cn/bui/acharts/1.0.32/acharts-min.js"></script>
<script src="./realTimeStatistic_files/hm.js"></script>
<script type="text/javascript">
	//全局变量

	var GV = {
		DIMAUB : "",
		JS_ROOT : "/statics/home/js/",
		TOKEN : "2e8d18965f3906c2dc49429819fc913b_a74eb9748e7e407065be9112ff461d36",
		THIS_URL : "Financial-",
		TINVEST_URL : "/invest-showtinvest.shtml",
		MAIN_DOMAIN : "http://www.whzxcf.com"
	};
</script>

<script src="./realTimeStatistic_files/jquery.js"></script>
<script src="./realTimeStatistic_files/common.js"></script>
<!---->
<script src="./realTimeStatistic_files/highcharts.js"></script>

<script src="./realTimeStatistic_files/jquery.totemticker.js"></script>


<!--tipBOx-->

<link type="text/css" rel="stylesheet"
	href="./realTimeStatistic_files/colorbox.css">
<link rel="shortcut icon"
	href="http://www.whzxcf.com/statics/home/images/favicon.ico"
	type="image/x-icon">
<script src="./realTimeStatistic_files/jquery.colorbox.js"></script>
<script>
	$(function() {
		$('.cboxPhoto').each(function() {
			var maxWidth = 800;
			var maxHeight = 800;
			var ratio = 0;
			var width = $(this).width();
			var height = $(this).height();

			if (width > maxWidth) {
				ratio = maxWidth / width;
				$(this).css("width", maxWidth);
				$(this).css("height", height * ratio);
				height = height * ratio;
			}
			var width = $(this).width();
			var height = $(this).height();
			if (height > maxHeight) {
				ratio = maxHeight / height;
				$(this).css("height", maxHeight);
				$(this).css("width", width * ratio);
				width = width * ratio;
			}
		});
	})
</script>
<!--<script src="/statics/common/tipBox/colorbox-master/jQuery.autoIMG.min.js"></script>
<style type="text/css">
#cboxLoadedContent{ width:800px; }
</style>
<script type="text/javascript">
$(function(){
	$("#cboxLoadedContent").autoIMG();
});
</script>-->
<script src="./realTimeStatistic_files/layer.js"></script>
<link type="text/css" rel="stylesheet"
	href="./realTimeStatistic_files/layer.css" id="skinlayercss">
<script src="./realTimeStatistic_files/common(1).js"></script>

<!--tipBOx-->


<title>实时财务-中兴财富</title>
<meta http-equiv="keywords"
	content="p2p投资理财,小额投资理财,个人投资理财,网上理财,网络理财,网络投资,互联网投资,家庭理财,存钱理财">
<meta http-equiv="description"
	content="中兴财富是武汉知名P2P网络贷款投资理财平台。网上投资理财50元起投,年化收益平均可达17%,29道极致风控工序,100%本息担保,提供安全、高收益、灵活的投资项目。">
<link rel="stylesheet" type="text/css"
	href="./realTimeStatistic_files/tool.css">
		<link rel="stylesheet" type="text/css" href="css/style.css">
<script src="./realTimeStatistic_files/odometer.min.js"></script>
<style>
.df_list_banner_wper {
	height: 45px;
	background: none;
}

.cwdb {
	background: #eeeeee;
	padding: 40px;
}

.finsec_title {
	text-align: left;
	height: 42px;
	line-height: 42px;
	line-height: 42px;
	border-bottom: 2px solid #d7d7d7;
}

.finsec_title span {
	display: inline-block;
	width: 220px;
	text-align: center;
	color: #666;
	font-size: 16px;
	cursor: pointer;
}

.finsec_title .ftcur {
	height: 44px;
}

.tab1_title {
	border-bottom: 1px dashed #ccc;
}

.clearfix1 {
	clear: both;
	font-size: 0;
	height: 0;
	line-height: 0;
}

.cw {
	width: 280px;
	text-align: left;
}

.cw h4 {
	font-size: 14px;
	vertical-align: middle;
	color: #4b4b4b;
	margin-bottom: 5px;
	font-weight: normal;
	font-style: normal;
}

.cw p {
	font-size: 30px;
	height: 35px;
	line-height: 35px;
	vertical-align: middle;
	color: #ff7512;
}

i {
	font-style: normal;
}

.tab_cont {
	background: #f0f0f0;
}

.tab_cont .tab_cont_son {
	display: none;
	overflow: hidden;
}

.tab_cont1 .tab_cont1_left {
	float: left;
	width: 150px;
	overflow: hidden;
	padding-top: 30px;
	height: 140px;
}

.tab_cont1 {
	padding: 0px 0 0 40px;
	width: 950px;
	height: 160px;
}

.tab_cont1 .name {
	display: block;
	font-size: 14px;
	color: #666;
}

.tab_cont1 .num {
	font-family: Tahoma, Geneva, sans-serif;
	font-size: 32px;
	color: #f7ab00;
	line-height: 46px;
}

#num {
	font-size: 26px;
	line-height: 60px;
	vertical-align: middle;
}

.tab_cont2_left {
	width: 350px;
	float: left;
	padding-top: 56px;
}

.tab_cont2_left_name {
	font-size: 14px;
	color: #3f5367;
	padding-bottom: 12px;
}

.tab_cont2_left_num {
	color: #f7ab00;
	font-size: 36px;
	font-family: Tahoma, Geneva, sans-serif;
}

.tab_cont2_right {
	width: 575px;
	float: right;
	padding-top: 25px;
	position: relative;
}

.tab_cont2_r1 {
	display: inline-block;
	width: 250px;
	height: 190px;
}

.tab_cont2_r2 {
	display: inline-block;
	width: 250px;
	height: 190px;
	margin-left: 30px;
}

.tab_cont1 .tab_cont1_right {
	float: left;
	width: 650px;
	height: 175px;
	font-size: 14px;
	color: #666;
	padding-left: 40px;
	margin-top: 10px;
}

.tab_cont1 .tab_cont1_right li {
	width: 155px;
	height: 175px;
	float: left;
	display: inline-block;
	margin: 0 30px;
	text-align: center;
	position: relative;
}

.tab_cont1 .tab_cont1_right .tab_cont1_right_name {
	text-align: center;
	padding-top: 10px;
	color: #000;
}

.tab_cont1_right_img {
	text-align: center;
	padding-top: 35px;
	height: 86px;
}

.tab_cont1_right_img1 {
	background: url(statics/home/images/circle1.png) center top no-repeat;
}

.tab_cont1_right_img2 {
	background: url(statics/home/images/circle2.png) center top no-repeat;
}

.tab_cont1_right_img3 {
	background: url(statics/home/images/circle3.png) center top no-repeat;
}

.one2_table {
	width: 280px;
	height: 150px;
	overflow: hidden;
	border: 1px solid #fff;
	margin-left: 140px;
}

.tab_cont1_right_tip {
	position: absolute;
	width: 150px;
	height: 42px;
	border: 1px solid #f7ab00;
	top: 110px;
	left: -10px;
	color: #333;
	line-height: 22px;
	padding: 10px;
	z-index: 10;
	background: #fff0cd;
	display: none;
}

.tab_cont1_right_tip .tip-icon {
	display: inline-block;
	width: 12px;
	height: 11px;
	overflow: hidden;
	position: absolute;
	background: url(../images/caiwu/tip-icon.gif) 0 0 no-repeat;
	top: -11px;
	left: 71px;
}

.tab_cont1_right_tip b {
	color: #ff6e00;
}

.odometer.odometer-auto-theme .odometer-digit,.odometer.odometer-theme-car .odometer-digit
	{
	width: 20px;
}

.Platform {
	padding: 40px;
}

.loanRemain {
	height: 400px;
	width: 1120px;
}

.w100 {
	width: 100%;
}

.whiteBG {
	background: #FFF;
}

.grayBG {
	background: #f5f5f5;
}

.Platform H3 {
	font-size: 24px;
	height: 24px;
	line-height: 24px;
	vertical-align: middle;
	margin-bottom: 20px;
	color: #333;
	text-align: left;
}

#loanRemain,#fullscale,#investmentNum,#singleNum,#balanceNum,#termNum {
	width: 530px;
	height: 400px;
}

#daySum,#monthSum {
	width: 1120px;
	height: 400px;
}

.pd40 {
	padding: 40px;
}

.MdSum {
	position: relative;
}

.MdSum h3 {
	position: absolute;
	right: 50px;
	top: 45px;
	z-index: 999;
}

.MdSum h3 a {
	display: block;
	width: 100px;
	height: 35px;
	border-radius: 5px;
	border: 1px solid #999;
	vertical-align: middle;
	line-height: 35px;
	font-size: 14px;
	float: left;
	margin-right: 10px;
}

.MdSum h3 a:hover {
	background: #ff7512;
	color: #FFFFFF;
	border: 1px solid #ff7512;
}

#MdSum .Md_on {
	background: #ff7512;
	color: #FFFFFF;
	border: 1px solid #ff7512;
}

.ftal {
	padding-top: 30px;
	padding-bottom: 20px;
	font-size: 12px;
}

.borderBrt {
	border-right: 1px solid #ecfaff;
}

.borderLft {
	border-left: 1px solid #ecfaff;
}

.ftal table {
	background: #fff;
	width: 100%;
}

.ftal td,.ftal th {
	padding: 15px 20px; /*border:1px solid #999;*/
	text-align: center;
	font-size: 14px;
}

.ftal th {
	background: #14b2e2;
	color: #fff;
}

.detail-section{
	margin-left: 120px;

}
</style>
</head>
<body>
	<%@include file="head.jsp"%>

 
	<!-- end top -->

	<!--<script>

$(function(){	

	var page = 0;

	picTimer = setInterval(function(){

		showPic(page);

		page++;

		if(page==2){

			page=0;

		};

	},3000);

	

	function showPic(page){

		$('.zxcf_nav_c1 a').eq(page).fadeIn("slow").siblings().fadeOut("slow");

	}	

})

</script>

-->
	
	<!-- end  -->
	<script>
		//$('#nzxcf_no').totemticker({
		//	  row_height	:	'60px',
		//	  interval		:	6000, 
		//	  mousestop	:	true
		//  });

		$(function() {

			$('.zxcf-wx').mouseenter(function() {

				$(this).find('i').show();

			});

			$('.zxcf-wx').mouseleave(function() {

				$(this).find('i').hide();

			});

			$('.zxcf-app').mouseenter(function() {

				$(this).find('i').show();

			});

			$('.zxcf-app').mouseleave(function() {

				$(this).find('i').hide();

			});

			$('#zxqq').mouseenter(function() {
				$(this).find('div').stop().slideDown();
			});
			$('#zxqq').mouseleave(function() {
				$(this).find('div').stop().slideUp();
			});

		})
	</script>

	<!--数据概览-->
	<div class="w100 whiteBG">
		<div class="px1200">
			<div class="Platform">
				<h3>平台数据总览</h3>
				<div class="cw cwl fl">
					<h4>累计成交总金额（元）</h4>
					<p class="yellow odometer odometer-auto-theme" id="snum1"
						old="00000000" new="${totalDealMoney}">
						<div class="odometer-inside">
							<span class="odometer-digit"><span
								class="odometer-digit-spacer">8</span><span
								class="odometer-digit-inner"><span
									class="odometer-ribbon"><span
										class="odometer-ribbon-inner"><span
											class="odometer-value">2</span></span></span></span></span><span class="odometer-digit"><span
								class="odometer-digit-spacer">8</span><span
								class="odometer-digit-inner"><span
									class="odometer-ribbon"><span
										class="odometer-ribbon-inner"><span
											class="odometer-value">3</span></span></span></span></span><span class="odometer-digit"><span
								class="odometer-digit-spacer">8</span><span
								class="odometer-digit-inner"><span
									class="odometer-ribbon"><span
										class="odometer-ribbon-inner"><span
											class="odometer-value">4</span></span></span></span></span><span
								class="odometer-formatting-mark">,</span><span
								class="odometer-digit"><span
								class="odometer-digit-spacer">8</span><span
								class="odometer-digit-inner"><span
									class="odometer-ribbon"><span
										class="odometer-ribbon-inner"><span
											class="odometer-value">7</span></span></span></span></span><span class="odometer-digit"><span
								class="odometer-digit-spacer">8</span><span
								class="odometer-digit-inner"><span
									class="odometer-ribbon"><span
										class="odometer-ribbon-inner"><span
											class="odometer-value">4</span></span></span></span></span><span class="odometer-digit"><span
								class="odometer-digit-spacer">8</span><span
								class="odometer-digit-inner"><span
									class="odometer-ribbon"><span
										class="odometer-ribbon-inner"><span
											class="odometer-value">9</span></span></span></span></span><span
								class="odometer-formatting-mark">,</span><span
								class="odometer-digit"><span
								class="odometer-digit-spacer">8</span><span
								class="odometer-digit-inner"><span
									class="odometer-ribbon"><span
										class="odometer-ribbon-inner"><span
											class="odometer-value">0</span></span></span></span></span><span class="odometer-digit"><span
								class="odometer-digit-spacer">8</span><span
								class="odometer-digit-inner"><span
									class="odometer-ribbon"><span
										class="odometer-ribbon-inner"><span
											class="odometer-value">0</span></span></span></span></span><span class="odometer-digit"><span
								class="odometer-digit-spacer">8</span><span
								class="odometer-digit-inner"><span
									class="odometer-ribbon"><span
										class="odometer-ribbon-inner"><span
											class="odometer-value">5</span></span></span></span></span>
						</div>
					</p>
				</div>
				<div class="cw cwc fl">
					<h4>累计为投资人挣取收益（元）</h4>
					<p class="yellow odometer odometer-auto-theme" id="snum3"
						old="00000000" new="${totalInvInter }">
						<div class="odometer-inside">
							<span class="odometer-digit"><span
								class="odometer-digit-spacer">8</span><span
								class="odometer-digit-inner"><span
									class="odometer-ribbon"><span
										class="odometer-ribbon-inner"><span
											class="odometer-value">7</span></span></span></span></span><span
								class="odometer-formatting-mark">,</span><span
								class="odometer-digit"><span
								class="odometer-digit-spacer">8</span><span
								class="odometer-digit-inner"><span
									class="odometer-ribbon"><span
										class="odometer-ribbon-inner"><span
											class="odometer-value">2</span></span></span></span></span><span class="odometer-digit"><span
								class="odometer-digit-spacer">8</span><span
								class="odometer-digit-inner"><span
									class="odometer-ribbon"><span
										class="odometer-ribbon-inner"><span
											class="odometer-value">6</span></span></span></span></span><span class="odometer-digit"><span
								class="odometer-digit-spacer">8</span><span
								class="odometer-digit-inner"><span
									class="odometer-ribbon"><span
										class="odometer-ribbon-inner"><span
											class="odometer-value">6</span></span></span></span></span><span
								class="odometer-formatting-mark">,</span><span
								class="odometer-digit"><span
								class="odometer-digit-spacer">8</span><span
								class="odometer-digit-inner"><span
									class="odometer-ribbon"><span
										class="odometer-ribbon-inner"><span
											class="odometer-value">8</span></span></span></span></span><span class="odometer-digit"><span
								class="odometer-digit-spacer">8</span><span
								class="odometer-digit-inner"><span
									class="odometer-ribbon"><span
										class="odometer-ribbon-inner"><span
											class="odometer-value">2</span></span></span></span></span><span class="odometer-digit"><span
								class="odometer-digit-spacer">8</span><span
								class="odometer-digit-inner"><span
									class="odometer-ribbon"><span
										class="odometer-ribbon-inner"><span
											class="odometer-value">5</span></span></span></span></span><span
								class="odometer-formatting-mark odometer-radix-mark">.</span><span
								class="odometer-digit"><span
								class="odometer-digit-spacer">8</span><span
								class="odometer-digit-inner"><span
									class="odometer-ribbon"><span
										class="odometer-ribbon-inner"><span
											class="odometer-value">3</span></span></span></span></span><span class="odometer-digit"><span
								class="odometer-digit-spacer">8</span><span
								class="odometer-digit-inner"><span
									class="odometer-ribbon"><span
										class="odometer-ribbon-inner"><span
											class="odometer-value">3</span></span></span></span></span>
						</div>
					</p>
					<!--<p class="yellow odometer" id="snum3" old="00000000" new="7266825"></p>-->
				</div>
				<div class="cw cwc fl">
					<h4>待回收金额（元）</h4>
					<p class="yellow odometer odometer-auto-theme" id="snum4"
						old="00000000" new="${waitRepay }">
						<div class="odometer-inside">
							<span class="odometer-digit"><span
								class="odometer-digit-spacer">8</span><span
								class="odometer-digit-inner"><span
									class="odometer-ribbon"><span
										class="odometer-ribbon-inner"><span
											class="odometer-value">8</span></span></span></span></span><span class="odometer-digit"><span
								class="odometer-digit-spacer">8</span><span
								class="odometer-digit-inner"><span
									class="odometer-ribbon"><span
										class="odometer-ribbon-inner"><span
											class="odometer-value">0</span></span></span></span></span><span
								class="odometer-formatting-mark">,</span><span
								class="odometer-digit"><span
								class="odometer-digit-spacer">8</span><span
								class="odometer-digit-inner"><span
									class="odometer-ribbon"><span
										class="odometer-ribbon-inner"><span
											class="odometer-value">0</span></span></span></span></span><span class="odometer-digit"><span
								class="odometer-digit-spacer">8</span><span
								class="odometer-digit-inner"><span
									class="odometer-ribbon"><span
										class="odometer-ribbon-inner"><span
											class="odometer-value">7</span></span></span></span></span><span class="odometer-digit"><span
								class="odometer-digit-spacer">8</span><span
								class="odometer-digit-inner"><span
									class="odometer-ribbon"><span
										class="odometer-ribbon-inner"><span
											class="odometer-value">6</span></span></span></span></span><span
								class="odometer-formatting-mark">,</span><span
								class="odometer-digit"><span
								class="odometer-digit-spacer">8</span><span
								class="odometer-digit-inner"><span
									class="odometer-ribbon"><span
										class="odometer-ribbon-inner"><span
											class="odometer-value">6</span></span></span></span></span><span class="odometer-digit"><span
								class="odometer-digit-spacer">8</span><span
								class="odometer-digit-inner"><span
									class="odometer-ribbon"><span
										class="odometer-ribbon-inner"><span
											class="odometer-value">4</span></span></span></span></span><span class="odometer-digit"><span
								class="odometer-digit-spacer">8</span><span
								class="odometer-digit-inner"><span
									class="odometer-ribbon"><span
										class="odometer-ribbon-inner"><span
											class="odometer-value">7</span></span></span></span></span><span
								class="odometer-formatting-mark odometer-radix-mark">.</span><span
								class="odometer-digit"><span
								class="odometer-digit-spacer">8</span><span
								class="odometer-digit-inner"><span
									class="odometer-ribbon"><span
										class="odometer-ribbon-inner"><span
											class="odometer-value">6</span></span></span></span></span><span class="odometer-digit"><span
								class="odometer-digit-spacer">8</span><span
								class="odometer-digit-inner"><span
									class="odometer-ribbon"><span
										class="odometer-ribbon-inner"><span
											class="odometer-value">5</span></span></span></span></span>
						</div>
					</p>
					<!--<p class="yellow odometer" id="snum3" old="00000000" new="7266825"></p>-->
				</div>
				<div class="cw cwr fr">
					<h4>
						风险备用金余额（元）<a href="http://www.whzxcf.com/guide-safe3.shtml"
							class="ml20">查询</a>
					</h4>
					<p class="yellow odometer odometer-auto-theme" id="snum2"
						old="00000000" new="2,000,000">
						<div class="odometer-inside">
							<span class="odometer-digit"><span
								class="odometer-digit-spacer">8</span><span
								class="odometer-digit-inner"><span
									class="odometer-ribbon"><span
										class="odometer-ribbon-inner"><span
											class="odometer-value">2</span></span></span></span></span><span
								class="odometer-formatting-mark">,</span><span
								class="odometer-digit"><span
								class="odometer-digit-spacer">8</span><span
								class="odometer-digit-inner"><span
									class="odometer-ribbon"><span
										class="odometer-ribbon-inner"><span
											class="odometer-value">0</span></span></span></span></span><span class="odometer-digit"><span
								class="odometer-digit-spacer">8</span><span
								class="odometer-digit-inner"><span
									class="odometer-ribbon"><span
										class="odometer-ribbon-inner"><span
											class="odometer-value">0</span></span></span></span></span><span class="odometer-digit"><span
								class="odometer-digit-spacer">8</span><span
								class="odometer-digit-inner"><span
									class="odometer-ribbon"><span
										class="odometer-ribbon-inner"><span
											class="odometer-value">0</span></span></span></span></span><span
								class="odometer-formatting-mark">,</span><span
								class="odometer-digit"><span
								class="odometer-digit-spacer">8</span><span
								class="odometer-digit-inner"><span
									class="odometer-ribbon"><span
										class="odometer-ribbon-inner"><span
											class="odometer-value">0</span></span></span></span></span><span class="odometer-digit"><span
								class="odometer-digit-spacer">8</span><span
								class="odometer-digit-inner"><span
									class="odometer-ribbon"><span
										class="odometer-ribbon-inner"><span
											class="odometer-value">0</span></span></span></span></span><span class="odometer-digit"><span
								class="odometer-digit-spacer">8</span><span
								class="odometer-digit-inner"><span
									class="odometer-ribbon"><span
										class="odometer-ribbon-inner"><span
											class="odometer-value">0</span></span></span></span></span>
						</div>
					</p>
				</div>
				<!--
        <div class="cw cwr fr">
        <h4>本月日期</h4>
        <p class="yellow odometer" id="snum5" old="00000000" new=""></p>
      </div>-->
				<div class="clearfix1"></div>
				<script type="text/javascript">
					$(function() {
						$('#MdSum h3 a').click(
								function() {
									var oNum = $(this).index();
									$(this).addClass('Md_on').siblings()
											.removeClass('Md_on');
									$('.volumeC').eq(oNum).show().siblings()
											.hide();
								})
						setTimeout(function() {
							$('#snum4').html($('#snum4').attr("new"));
							$('#snum1').html($('#snum1').attr("new"));
							$('#snum2').html($('#snum2').attr("new"));
							$('#snum3').html($('#snum3').attr("new"));
							//$('#snum5').html($('#snum5').attr("new"));
						}, 100);
					})
				</script>
			</div>
		</div>
	</div>
	<!--数据概览-->
	<!--月日成交量-->
	<div class="w100 grayBG">
		<div class="px1200">

			<p style="text-align:left; padding-top:20px; padding-left:60px;">*平台于2015年3月18日上线，以下数据统计时间为2015年8月18日（新版上线）起。</p>

		</div>
	</div>
	<!--月日成交量-->
	<!--未来30天待收总额-->
	<!--<div class="w100 whiteBG">
  <div class="px1200">
    <div class="Platform" id="collectSum"></div>
  </div>
</div>-->
	<!--未来30天待收总额-->
	<!--贷款余额-->
	<!--贷款余额-->
	<!--投资人数量/借款人数量-->

	<!--投资人数量/借款人数量-->
		 <div class="detail-section">
		 <h3 style=" color:#333; font-size:18px; font-size:24px; ">近期一个月成交额</h3>
        <div id="canvas">
     		
        </div>
         <h3 style=" color:#333; font-size:18px; font-size:24px; "><label>平均满标时间</label>
         <label style="margin-left:350px">最近一星期贷款额</label>
         </h3>
          <div id="canvas2">
     		  <div id="canvas3">
     		
        </div>
        </div>
          <div id="canvas4">
     		
        </div>
    </div>
	
	
	<!--投资数据-->
	<div class="w100 grayBG">
		<div class="px1200">
			<div class="pd40">
				<h3 style=" color:#333; font-size:18px; font-size:24px; ">投资数据</h3>
				<div class="ftal">
					<table>
						<tbody>
							<tr>
								<th width="180">数据项</th>
								<th width="320">数据</th>
								<th>说明</th>
							</tr>
							<tr>
								<td class="borderBrt">注册用户数量</td>
								<td class="borderBrt">${userCount}</td>
								<td><p align="left">指自平台上线时间起，平台注册用户的总数。</p></td>
							</tr>
							<tr style="background:#ecfaff; ">
								<td class="borderBrt">人均累计投资额度</td>
								<td class="borderBrt">${avUserInv}元</td>
								<td><p align="left">指自平台上线时间起，平台上各不相同的投资出借个体（人）平均成功出借的资金金额。人均投资额度=交易总额/投资人数量。</p></td>
							</tr>
							<tr>
								<td class="borderBrt">笔均投资额度</td>
								<td class="borderBrt">${avItemInv }元</td>
								<td><p align="left">指自平台上线时间起，平台上单独每笔投资平均成功出借的资金金额。笔均投资额度=交易总额/交易总笔数。</p></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<!--投资数据-->
	<!--投资数据-->
	<div class="w100 whiteBG">
		<div class="px1200">
			<div class="pd40">
				<h3 style=" color:#333; font-size:18px; font-size:24px; ">借款数据</h3>
				<div class="ftal">
					<table>
						<tbody>
							<tr>
								<th width="180">数据项</th>
								<th width="320">数据</th>
								<th>说明</th>
							</tr>
							<tr>
								<td class="borderBrt borderLft">借款人数量</td>
								<td class="borderBrt">${loanUserCount }</td>
								<td class="borderBrt"><p align="left ">指自平台上线时间起，平台实际撮合成功的所有借款项目中参与借款的各不同的独立个体（目前指自然人和组织机构）的总数。</p></td>
							</tr>
							<tr style="background:#ecfaff; ">
								<td class="borderBrt borderLft">人均借款额度</td>
								<td class="borderBrt">${avUserLoan }元</td>
								<td class="borderBrt"><p align="left">指自平台上线时间起，平台上各不相同的借款个体平均成功获得的资金金额。人均借款额度=交易总额/借款人数量。</p></td>
							</tr>
							<tr>
								<td class="borderBrt borderLft">笔均借款额度</td>
								<td class="borderBrt">${avItemLoan }元</td>
								<td class="borderBrt"><p align="left">指自平台上线时间起，平台上单独每笔投资平均成功出借的资金金额。笔均投资额度=交易总额/交易总笔数。</p></td>
							</tr>
							
							<tr style="background:#ecfaff; ">
								<td class="borderBrt borderLft">贷款余额</td>
								<td class="borderBrt">${loanBalanceMoney }元</td>
								<td class="borderBrt"><p align="left">指自平台上线时间起，自平台运营起始所有借款人还未偿还投资人投资本金的总金额（不包括投资回报的利息部分和逾期部分本金）。当期贷款余额=前期贷款余额+本期新增交易额-本金偿还贷款本金总额（还款总金额本金部分）-本期发生逾期总金额。</p></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<!--投资数据-->
	<!--投资数据-->
	<div class="w100 grayBG">
		<div class="px1200">
			<div class="pd40">
				<h3 style=" color:#333; font-size:18px; font-size:24px; ">风控数据</h3>
				<div class="ftal">
					<table>
						<tbody>
							<tr>
								<th width="180">数据项</th>
								<th width="320">数据</th>
								<th>说明</th>
							</tr>
							<tr>
								<td class="borderBrt">平台逾期率</td>
								<td class="borderBrt">${expireRate }%</td>
								<td><p align="left">平台逾期率=平台逾期总金额/平台交易总额</p></td>
							</tr>
							<tr style="background:#ecfaff; ">
								<td class="borderBrt">平台坏账率</td>
								<td class="borderBrt">0%</td>
								<td><p align="left">平台坏账率=坏账总金额/平台交易总额</p></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	

	
	<!--投资数据--
<!--人均累计投资额度/人均累计借款额度-->
	<!--<div class="w100 grayBG">
  <div class="px1200">
    <div class="pd40 clearfix">
      <div class="fl" id="investmentNum"></div>
      <div class="fr" id="singleNum"></div>
    </div>
  </div>
</div>-->
	<!--人均累计投资额度/人均累计借款额度-->
	<!--近30日借款期限分布/最大10户借款余额占比-->
	<!--<div class="w100 grayBG">
  <div class="px1200">
    <div class="pd40 clearfix">
      <div class="fl" id="termNum"></div>
      <div class="fr" id="balanceNum"></div>
    </div>
  </div>
</div>-->
	<!--近30日借款期限分布/最大10户借款余额占比   -->
	<!--实时财务-->
	<div class="w100 financiald whiteBG">
		<div class="px1200">
			<div class="pd40">
			<div class="clear">
        <div class="finsec_title"> <span class="ftcur" get="1" id="t_30_re">30天内应回收借款</span> 
        <span data="/financial-expiredlt.shtml" get="1" class="" id="expire">逾期未还款列表</span>  
        <span data="/financial-expired.shtml" get="1" class="" id="t_expire_re">逾期已还款列表 </span>
         <span data="/financial-earlyrepay.shtml" get="1" class="">提前还款列表 </span></div>
        <div class="finsec_tab_box pt20">
          <div class="finsec_tab1" id="week" style="display: block;">
     <ul class="tab1_title tab1_titlebg">
  <li>借款编号</li>
  <li>借款金额</li>
  <li>待还金额</li>
  <li>应还日期</li>
  <li>借款利率</li>
</ul>
<div id="re_30">
<c:forEach items="${monthRe }" var="inter">
<ul class="tab1_title clear">
    <li>${inter.loanID }</li>
    <li>${loanInfos[inter.loanID].loanMoney }</li>
    <li>￥${inter.reMonRe }</li>
    <li>${inter.reInterDate}</li>
    <li>${loanInfos[inter.loanID].inter }</li>
  </ul>
</c:forEach>
</div>

<div id="expire_not" style="display:none">
<c:forEach items="${expireNo }" var="inter">
<ul class="tab1_title clear">
    <li>${inter.loanID }</li>
    <li>${expireLoan[inter.loanID].loanMoney }</li>
    <li>￥${inter.reMonRe }</li>
    <li>${inter.reInterDate}</li>
    <li>${expireLoan[inter.loanID].inter }</li>
  </ul>
</c:forEach>
</div>
<div id="expire_re" style="display:none">
<c:forEach items="${expireRe }" var="inter">
<ul class="tab1_title clear">
    <li>${inter.loanID }</li>
    <li>${expireReLoan[inter.loanID].loanMoney }</li>
    <li>￥${inter.reMonRe }</li>
    <li>${inter.reInterDate}</li>
    <li>${expireReLoan[inter.loanID].inter }</li>
  </ul>
</c:forEach>
</div>
<div class="pagelink pagebar" style="text-align:right;" data="week"> ${fn:length(monthRe)} 条记录 1/1页   </div>
 </div>
      </div>
			</div>
		</div>
	</div>
<script>
	$(function(){
	
		$("#expire").click(function(){
				$("#re_30").css("display","none");
				$("#expire_not").css("display","block");
				$("#expire_re").css("display","none");
      		})
      	$("#t_expire_re").click(function(){
					$("#re_30").css("display","none");
					$("#expire_not").css("display","none");
					$("#expire_re").css("display","block");
      		})
      	$("#t_30_re").click(function(){
      
					$("#re_30").css("display","block");
					$("#expire_not").css("display","none");
					$("#expire_re").css("display","none");
      		})
		})
	</script>

	<!--笔均投资额度/笔均借款额度-->
	<div class="px1200"></div>
	<!-- end detail curpage -->
	<script type="text/javascript">
	
	</script>
	<!--footer -->

	<div class="nzxcf-f1"
		style=" background:#35393b; width:100%; min-width:1200px; ">
		<div class="nzxcf-f1-c px1200">
			<div class="nzxcf-f1-c1">
				<div class="fl w500">
					<dl class="nfooter-link-item">
						<dt>帮助中心</dt>
						<dd>
							<a href="http://www.whzxcf.com/page-userguide.shtml">新手指引</a>
						</dd>
						<dd>
							<a href="http://www.whzxcf.com/cjwt-index.shtml">常见问题</a>
						</dd>
						<dd>
							<a href="http://www.whzxcf.com/member-login-index.shtml">注册登录</a>
						</dd>
					</dl>
					<dl class="nfooter-link-item">
						<dt>理财相关</dt>
						<dd>
							<a href="http://www.whzxcf.com/invest-index.shtml">理财列表</a>
						</dd>
						<dd>
							<a href="http://www.whzxcf.com/page-plecharge.shtml">收费标准</a>
						</dd>
						<dd>
							<a href="http://www.whzxcf.com/tool-index.shtml">小工具箱</a>
						</dd>
					</dl>
					<dl class="nfooter-link-item">
						<dt>诚信安全</dt>
						<dd>
							<a href="http://www.whzxcf.com/guide-safe.shtml">安全保障</a>
						</dd>
						<dd>
							<a href="./realTimeStatistic_files/realTimeStatistic.html">实时财务</a>
						</dd>
						<dd>
							<a href="http://www.whzxcf.com/page-about.shtml#hzhb">合作伙伴</a>
						</dd>
					</dl>
					<dl class="nfooter-link-item">
						<dt>关于我们</dt>
						<dd>
							<a href="http://www.whzxcf.com/page-about.shtml#gltd">管理团队</a>
						</dd>
						<dd>
							<a href="http://www.whzxcf.com/page-about.shtml#zxns">招贤纳士</a>
						</dd>
						<dd>
							<a href="http://www.whzxcf.com/page-about.shtml#lxwm">联系我们</a>
						</dd>
					</dl>
				</div>
				<div class="fl w325">
					<div class=" nzxcf-m1 fl">
						<div class="nImg">
							<img src="./realTimeStatistic_files/wei1.png" width="91px;"
								height="91px;">
						</div>
						<p>微信理财:hbzxcf</p>
					</div>
					<div class=" nzxcf-m2 fr">
						<div class="nImg">
							<img src="./realTimeStatistic_files/wei2.png" width="91px;"
								height="91px;">
						</div>
						<p>移动客户端下载</p>
					</div>
					<div class="clear"></div>
				</div>
				<div class="fr w270">
					<dl class="nfooter-link-item1" style="padding-left:55px; ">
						<dt>
							服务热线<span style="color:#7f7f7f; ">( 08:30-17:30 )</span>
						</dt>
						<dd
							style="font-size:30px; color:#ff7512; line-height:40px; vertical-align:middle; ">400-027-0101</dd>
						<dd>客服邮箱:kefu@whzxcf.com</dd>
						<dd>官方QQ交流群：422940552</dd>
					</dl>
				</div>
				<div class="clear"></div>
			</div>
		</div>
	</div>
	
	<!--footer-->
	<div class="zxcf_yc">
		<ul>
			<!--<li><a href="http://www.zhongxincaifu.com/" class="zx_a1"></a></li>-->
			<li class=""><a
				href="http://crm2.qq.com/page/portalpage/wpa.php?uin=4000270101&f=1&ty=1&aty=0&a=&from=6"
				class="zx_a2"></a>
				<div class="nzx_qq">
					<div class="nzx_qq_con">
						<div class="nzx_qq_online clearfix">
							<span class="fl">在线客服QQ：</span> <a class="fl"
								href="http://crm2.qq.com/page/portalpage/wpa.php?uin=4000270101&f=1&ty=1&aty=0&a=&from=6">
								<img src="./realTimeStatistic_files/nzx_qq_online.png"
								width="74" height="22">
							</a>

						</div>
						<div class="nzx_qq_quan" id="nzx_qq_quan">
							<p class="clearfix">
								<span class="fl">投资交流群：</span><a
									href="http://shang.qq.com/wpa/qunwpa?idkey=6c9bc1d6489dfd787541c466413abe8989c900544a319bd58a64edca88678b14"
									class="fl">422940552</a>
							</p>
							<p class="clearfix">
								<span class="fl">投资VIP群：</span><a
									href="http://shang.qq.com/wpa/qunwpa?idkey=d194e536c81ae66d7da7d17b7b6a7054972df5ee510a63bf08d99ce3c3871bc2"
									class="fl">223638794</a>
							</p>
						</div>
					</div>
				</div></li>
			<li id="zx_a3"><a href="" class="zx_a3" style="left:-130px; "></a>
				<div class="zxTel0">
					<img src="./realTimeStatistic_files/zxTel0.png" width="130"
						height="41">
				</div></li>
			<li><a href="http://www.whzxcf.com/tool" class="zx_a4"></a></li>
			<!--<li><a href="/football" class="zx_a6" title="我要踢球"></a></li>-->
			<!--<li><a href="/Prizedraw#April_CC4" class="zx_a5" title="我要抽奖"></a></li>-->
		</ul>
	</div>
	
	
    <!-- https://g.alicdn.com/bui/acharts/1.0.29/acharts-min.js -->
     
     
      <script type="text/javascript">
        var chart = new AChart({
          theme : AChart.Theme.SmoothBase,
          id : 'canvas',
          width : 1100,
          height : 500,
          plotCfg : {
            margin : [100,50,80] //画板的边距
          },
          xAxis : {
            type : 'timeCategory',//不连续的时间选择timeCategory格式的坐标轴
            formatter : function  (value) {
              return AChart.Date.format(new Date(value*1000),'yyyy-mm-dd');
            },
            tickOffset : 30
          },
          tooltip : {
            valueSuffix : '￥'
          },
          series : [ {
            name: '贷款额',
            type : 'column',
            data: eval("("+"${dealMoneyOfMonth}"+")")
     
          }]
     
        });
        chart.render();
 
      </script>
      
      <script type="text/javascript">
      	$(function(){
      		$.ajax({
				type:"POST",
      			url:"statistic.action",
      			data:{op:"aveComplete"},
      			dataType:"text",
      			success:areaChart,
      		})
      		
      	$.ajax({
			type:"POST",
  			url:"statistic.action",
  			data:{op:"getWeek"},
  			dataType:"text",
  			success:getResult,
  		})
  		
  			$.ajax({
			type:"POST",
  			url:"statistic.action",
  			data:{op:"userComp"},
  			dataType:"text",
  			success:barChart3,
  		})

    	});    	
      	function getResult(data){
      		
      		barChart2(data)
      	}
      </script>
   
       <script type="text/javascript">
       function barChart2(data){ 
       var chart = new AChart({
          theme : AChart.Theme.SmoothBase,
          id : 'canvas2',
          width : 500,
          height : 400,
          plotCfg : {
            margin : [50,50,80] //画板的边距
          },
          xAxis : {
            categories: eval("("+data+")")[0],
            labels : {
              label : {
                rotate : -45,
                'text-anchor' : 'end'
              }
            }
          },
          yAxis : {
            min : 0
          },
          seriesOptions : { //设置多个序列共同的属性
            /*columnCfg : { //公共的样式在此配置
 
            }*/
          },
          tooltip : {
            valueSuffix : '￥'
          },
          series : [ {
            name: 'Africa',
            type : 'column',
            data: eval("("+data+")")[1],
            labels : { //显示的文本信息
              label : {
                rotate : -90,
                y : 10,
                'fill' : '#fff',
                'text-anchor' : 'end',
                textShadow: '0 0 3px black',
                'font-size' : '14px'
              }
            }
 
          }]
 
        });
 
        chart.render();
       }
       
       function areaChart(data){
    	  data=eval("("+data+")");
    	   var chart = new AChart({
    		    theme : AChart.Theme.SmoothBase,
    		    id : 'canvas2',
    		    width : 500,
    		    height : 400,
    		    plotCfg : {
    		      margin : [50,50,80] //画板的边距
    		    },
    		    xAxis : {
    		        categories : data[0]
    		      },
    		    seriesOptions : { //设置多个序列共同的属性
    		      areaCfg : { //不同类型的图对应不同的共用属性，lineCfg,areaCfg,columnCfg等，type + Cfg 标示
    		        smooth : true,
    		        markers : {
    		          single : true,
    		          marker : {
    		            fill : null,
    		            stroke : '#eff',
    		            radius : 6,
    		            'stroke-width':4
    		          },
    		          actived : {
    		            fill : null,
    		            stroke : '#eff',
    		            radius : 6,
    		            'stroke-width':4
    		          }
    		        }
    		      }
    		    },
    		    tooltip : {
    		      valueSuffix : '°C'
    		    },
    		    series : [{
    		          name: data[1].pro,
    		          data: data[1].val
    		      }]
    		  });
    		 
    		  chart.render();
    	   
       }
       
       function barChart3(data){

 	data = eval("("+data+")");
 
    	   var chart = new AChart({
               theme : AChart.Theme.SmoothBase,
               id : 'canvas4',
               width : 1100,
               height : 400,
               xAxis : {
                 categories: data[0]
               },
               yAxis : {
                 min : 0
               },
               tooltip : {
                 shared : true
               },
               seriesOptions : {
                   columnCfg : {
                     stackType : 'percent' //层叠
                   }
               },
               series: [ {
                       name: data[1].pro,
                       data: data[1].val
                   }, {
                       name: data[2].pro,
                       data: data[2].val
                   }]
      
             });
      
             chart.render();
    	   
       }
      </script>
	<div id="cboxOverlay" style="display: none;"></div>
	<div id="colorbox" class="" role="dialog" tabindex="-1"
		style="display: none;">
		<div id="cboxWrapper">
			<div>
				<div id="cboxTopLeft" style="float: left;"></div>
				<div id="cboxTopCenter" style="float: left;"></div>
				<div id="cboxTopRight" style="float: left;"></div>
			</div>
			<div style="clear: left;">
				<div id="cboxMiddleLeft" style="float: left;"></div>
				<div id="cboxContent" style="float: left;">
					<div id="cboxTitle" style="float: left;"></div>
					<div id="cboxCurrent" style="float: left;"></div>
					<button type="button" id="cboxPrevious"></button>
					<button type="button" id="cboxNext"></button>
					<button id="cboxSlideshow"></button>
					<div id="cboxLoadingOverlay" style="float: left;"></div>
					<div id="cboxLoadingGraphic" style="float: left;"></div>
					<button type="button" id="cboxClose"></button>
				</div>
				<div id="cboxMiddleRight" style="float: left;"></div>
			</div>
			<div style="clear: left;">
				<div id="cboxBottomLeft" style="float: left;"></div>
				<div id="cboxBottomCenter" style="float: left;"></div>
				<div id="cboxBottomRight" style="float: left;"></div>
			</div>
		</div>
		<div
			style="position: absolute; width: 9999px; visibility: hidden; display: none;"></div>
	</div>
	
	
</body>
</html>