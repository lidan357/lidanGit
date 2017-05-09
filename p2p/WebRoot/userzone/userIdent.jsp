<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP '身份认证' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">


<script src="/p2p/userzone/js/jquery-3.1.0.js" type="text/javascript"></script>


<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css"
	rel="stylesheet">
<link href="css/fileinput.min.css" media="all" rel="stylesheet"
	type="text/css" />
<script src="js/fileinput.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"
	type="text/javascript"></script>
<link href="/p2p/userzone/css/UserCSS.css" rel="stylesheet"
	type="text/css" />

<link rel="stylesheet" type="text/css" href="/p2p/css/style.css">
<script src="/p2p/userzone/js/ops.js" type="text/javascript"></script>
<link href="/p2p/userzone/css/UserCSS.css" rel="stylesheet"
	type="text/css" />

<link rel="stylesheet" type="text/css" href="/p2p/css/style.css">


<script type="text/javascript">
	$(function(){
		$("#userIdentSubmit").click(function(){
			alert("提交成功");
			$("#userIdentForm").submit();
			
		});
		
	});
</script>

<style>
	.one{font-size:15px;}
	.one input{
		width:200px;
		height:30px;
	}
	
	.file-input.file-input-new{
		width:300px;
	}
</style>

</head>

<body>
	<%@include file="/head.jsp"%>
	<div class="row" style="margin-top: 10px;"></div>
	<div class="row">
		<div class="u-menu">
			<ul class="u-nav" id="user_menu">
				<li class="item" id="user_menu_my" name="user_menu_my">
					<h3 class="t1">
						我的大融小贷<span title="折叠"></span>
					</h3>
					<ul class="sub">
						<li><a class="current" href="/p2p/homePage.action">个人主页</a></li>
						<li><a href="/p2p/pc.action?op=pro">个人资料</a></li>
						<li><a href="/p2p/userzone/userIdent.jsp">认证管理</a></li>
						<li><a href="密码管理.htm">密码设置</a></li>
						<li><a href="推荐有奖.htm">推荐有奖</a></li>
					</ul>
				</li>
				<li class="item" id="user_menu_funds" name="user_menu_funds">
					<h3 class="t2">
						资金管理<span title="折叠"></span>
					</h3>
					<ul class="sub">
						<li><a href="资金记录.htm">资金记录</a></li>
						<li><a href="/p2p/userzone/recharge.jsp">充值中心</a></li>
						<li><a href="提现中心.htm">提现记录</a></li>
						<li><a href="三方托管.htm">三方托管</a></li>
					</ul>
				</li>
				<li class="item" id="user_menu_invest" name="user_menu_invest">
					<h3 class="t4">
						理财管理<span title="折叠"></span>
					</h3>
					<ul class="sub">
						<li><a href="/p2p/userzone/myInvest.action">我的投资</a></li>
						<li><a href="债权转让.htm">债权转让</a></li>
						<li><a href="自动投标.htm">自动投标</a></li>
						<li><a href="理财统计.htm">理财统计</a></li>
					</ul>
				</li>
				<li class="item" id="user_menu_loan" name="user_menu_loan">
					<h3 class="t3">
						贷款管理<a name="user_login"></a><span title="折叠"></span>
					</h3>
					<ul class="sub">
						<li><a href="/p2p/userzone/loanSta.action">我的贷款</a></li>
						<li><a href="偿还贷款.htm">偿还贷款</a></li>
						<li><a href="贷款统计.htm">贷款统计</a></li>
					</ul>
				</li>
			</ul>
			<script type="text/javascript">
				var menuClosed = Ops.getCookie('menuClosed');

				$(".item h3 span")
						.click(
								function() {

									menuClosed = Ops.getCookie('menuClosed');
									if (menuClosed == undefined
											|| menuClosed == null) {
										menuClosed = '';
										Ops.setCookie('menuClosed', menuClosed);
									}
									//console.log(menuClosed+',click;;;');	
									$(this).parent().parent().toggleClass(
											'bg-slide');
									$(this).parent().parent().find(".sub")
											.slideToggle('fast');

									if ($(this).attr('title') == '折叠') {
										$(this).attr('title', '展开');
									} else {
										$(this).attr('title', '折叠');
									}

									var pid = $(this).parent().parent().attr(
											'id');

									if ($(this).parent().parent().hasClass(
											'bg-slide')
											&& menuClosed.indexOf("#" + pid
													+ "#") == -1) {
										var cookies = menuClosed + '#' + pid
												+ '#';
									} else {
										var cookies = menuClosed.replace("#"
												+ pid + "#", '');
									}
									Ops.setCookie('menuClosed', cookies);
								});

				if (menuClosed != null) {
					var closedMatch = menuClosed.match(/([a-z_]+)/g);
					for ( var i in closedMatch) {
						var idObj = $('#' + closedMatch[i]);
						idObj.toggleClass('bg-slide');
						idObj.find(".sub").hide();
						idObj.find('h3 span').attr('title', '展开');
					}
				} else {
					$("#user_menu_loan h3 span").click();
				}
			</script>
		</div>
		<div class="u-main">
			<div id="tab_menu">
				<ul class="u-tab clearfix">
					<li class="current"><a>身份认证</a></li>
					<li><a>手机认证</a></li>
					<li><a>邮箱认证</a></li>
				</ul>
			</div>
			<div id="tab_box">
				<div  class="one"><!-- class="u-form-wrap" -->
				<br>
					<form enctype="multipart/form-data" action="/p2p/userIdent.action" method="post" id="userIdentForm">
					身份证号：<input type="text" name="idNum" id="idNum"><br><br>
					
						证件信息：
						<div style="padding-left:50px;font-size:13px;color:black;width:400px;">
			
							身份证正面 <br> <input id="cardPic" name="cardPic" type="file" class="file"
											   data-preview-file-type="text">
						</div>
						<div style="padding-left:50px;font-size:13px;color:black;width:400px;s">
							手持身份证 <br> <input id="cardPicWithH" name="cardPicWithH" type="file" class="file"
											   data-preview-file-type="text" >
						</div>
						<br>
						<div style="padding-left:100px;">
							<input type="button" id="userIdentSubmit" name="userIdentSubmit" value="提交认证" style="background:orange;border:0;border-radius: 5px;width:160px;height:34px;">						
						</div>
						</form>
				</div>
				
				<div class="u-form-wrap" style="display: none;">
					<div>这是手机认证</div>
				</div>
				<div class="u-form-wrap" style="display: none;">
					<div>这是邮箱认证</div>
				</div>
			</div>
		</div>
		<script type="text/javascript">
			var $div_li = $("#tab_menu ul li");

			$div_li.click(function() {

				$(this).addClass("current").siblings().removeClass("current");

				var div_index = $div_li.index(this);

				$("#tab_box>div").eq(div_index).show().siblings().hide();

			}).hover(function() {

				$(this).addClass("hover");

			}, function() {

				$(this).removeClass("hover");

			});
		</script>
	</div>
</body>
</html>
