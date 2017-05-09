<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>


<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
<head>
    <title>我的贷款 用户中心 </title>
    <script src="/p2p/userzone/js/ops.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="/p2p/css/style.css">
	<script type="text/javascript" src="/p2p/js/all.js"></script>
    
    
   <link rel="stylesheet" href="http://apps.bdimg.com/libs/bootstrap/3.3.0/css/bootstrap.min.css">  
	<script src="http://apps.bdimg.com/libs/jquery/2.1.1/jquery.min.js"></script>
	<script src="http://apps.bdimg.com/libs/bootstrap/3.3.0/js/bootstrap.min.js"></script> 
    <link href="/p2p/userzone/css/UserCSS.css" rel="stylesheet" type="text/css" />
    
    <!-- 引入模态窗口 -->
    <link rel="stylesheet" href="/p2p/css/remodal.css">
	<link rel="stylesheet" href="/p2p/css/remodal-default-theme.css">
	<script src="/p2p/js/remodal.min.js"></script>
	
	<script type="text/javascript" src="/p2p/userzone/js/loanSta.js"></script>
</head>
<body>
	<%@include file="/head.jsp" %>
	
	<!-- 付息窗口start -->
	<div class="remodal" data-remodal-id="modal">
	  <button data-remodal-action="close" class="remodal-close"></button>
	   
	  <div>
	  	<table  class="table table-bordered">
	  	<thead >
			<tr>
			<th>还息时间</th>
			<th>还息金额</th>
			<th>是否已还</th>
			<th>还息</th>
			</tr>
		</thead>
		<tbody id="tabinterest">
		</tbody>
	  	</table>
	  </div>
	  
	  <button data-remodal-action="cancel" class="remodal-cancel">Cancel</button>
	  <button data-remodal-action="confirm" class="remodal-confirm">OK</button>
	</div>
	
	<!-- 付息窗口end -->
	
	
    <div class="row" style="margin-top: 10px;">
    </div>
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
						<li><a href="/p2p/myInvest.action">我的投资</a></li>
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
						<li><a href="/p2p/loanSta.action">我的贷款</a></li>
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
        <!-- /.u-menu -->
        <div class="u-main">
            
            <div class="u-tab-wrap">
                <ul class="u-tab clearfix">
                    <li class="current"><a>我的贷款</a></li><!--
                <li class="current"><a href="#">全部贷款</a></li><li><a href="#">招标中的贷款</a></li><li><a href="#">还款中的贷款</a></li><li><a href="#">已完成的贷款</a></li>
                --></ul>
            </div>
            <div class="u-form-wrap" style="padding: 20px;">
                <div class="page-wrap">
                   		 这里是贷款列表	
                   <table class="table table-bordered">
	
	<thead>
		<tr>
			<th>编号</th>
			<th>借贷编号</th>
			<th>金额</th>
			<th>类型</th>
			<th>利率</th>
			<th>时间</th>
			<th>期限</th>
			<th>描述</th>
			<th>还款时间</th>
			<th>融资金额</th>
			<th>状态</th>
			<th>偿还利息</th>
			<th>还款</th>
		</tr>
	</thead>
	<tbody>
		
		<c:forEach var="loanInfo" items="${loanInfos}" begin="">
		<c:set var="a" value="${a+1}"></c:set>
		<tr id="trloan">
			<td> ${a}</td>
			<td>${loanInfo.loanID}</td>
			<td>${loanInfo.loanMoney}</td>
			<td>${loanInfo.loanType}</td>
			<td>${loanInfo.inter}</td>
			<td>${loanInfo.loanDate}</td>
			<td>${loanInfo.deadLine}</td>
			<td>${loanInfo.descr}</td>
			<td>${loanInfo.getLoanTime}</td>
			<td>${loanInfo.curMoney}</td>
			<td>${loanInfo.status}</td>
			
			<%-- <c:if test="${loanInfo.status=='还款'}">
				<td> <div class="i-item-btn" style="height: 28px;">
                    <a href="#modal"  class="i-btn-txt1 repay-back" id='${loanInfo.loanID}'>还息</a></div></td>
				<td> <div class="i-item-btn" style="height: 28px;">
                    <a href="#modal"  class="i-btn-txt1 repay-back" id='${loanInfo.loanID}'>还款</a></div></td>
			</c:if> --%>
			<c:choose>
				<c:when test="${loanInfo.status=='还款'}">
					<td> <div class="i-item-btn" style="height: 28px;">
                    <a href="#modal"  class="i-btn-txt1 repay-back" id='${loanInfo.loanID}'>还息</a></div></td>
				<td> <div class="i-item-btn" style="height: 28px;">
                    <a class="i-btn-txt1 repay-back" id='${loanInfo.loanID}'>还款</a></div></td>
				</c:when>
				<c:otherwise>
					<td></td>
					<td></td>
				</c:otherwise>
			</c:choose>
							
			
		</tr>
		</c:forEach>
	</tbody>
</table>
                </div>
               
           		 </div>
            <!-- /.u-form-wrap -->
        </div>
        <!-- /.u-main -->
    </div>
</body>
</html>
