<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML>
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'MyInvest.jsp' starting page</title>

<link rel="stylesheet"
	href="http://apps.bdimg.com/libs/bootstrap/3.3.0/css/bootstrap.min.css">
<script src="http://apps.bdimg.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script
	src="http://apps.bdimg.com/libs/bootstrap/3.3.0/js/bootstrap.min.js"></script>

<link href="/p2p/userzone/css/UserCSS.css" rel="stylesheet"
	type="text/css" />
<script src="/p2p/userzone/js/jquery.min.js" type="text/javascript"></script>
<script src="/p2p/userzone/js/ops.js" type="text/javascript"></script>
<script src="/p2p/userzone/js/UserJS.js" type="text/javascript"></script>
<script src="/p2p/userzone/js/jquery.datepicker.min.js"
	type="text/javascript"></script>
<script src="/p2p/userzone/js/jquery.template.min.js"
	type="text/javascript"></script>
<script src="/p2p/userzone/js/funds.js" type="text/javascript"></script>

<link rel="stylesheet" type="text/css" href="/p2p/css/style.css">
<script type="text/javascript" src="/p2p/js/all.js"></script>

</head>
<body>
	<%@include file="/head.jsp"%>

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
		<div class="u-main">
			<div class="u-tab-wrap">
				<ul class="u-tab clearfix">
					<li val="invest_loan_box" class="current"><a>我投标的贷款</a></li>
					<li val="invest_loan_tendering_box"><a>投标中的贷款</a></li>
					<li val="invest_loan_waiting_box"><a>等待放款的投资</a></li>
					<li val="invest_repay_box"><a>回收中的贷款</a></li>
					<li val="invest_return_box"><a>已回收的贷款</a></li>
				</ul>
				<!-- /.u-tab -->
			</div>
			<div id="tab_box">
				<div id="invest_loan_box" class="u-form-wrap" style="padding: 0;">
					<table class="table table-bordered">
						<caption>边框表格布局</caption>
						<thead>
							<tr>
								<th>编号</th>
								<th>贷款编号</th>
								<th>投资金额</th>
								<th>总利息</th>
								<th>已获利息</th>
							</tr>
						<c:forEach var="invest" items="${invests}"><!-- 若begin=1则会少一条记录,也可以不写begin,begin表示下标 -->
						<c:set var="a" value="${a+1}"></c:set>
						<tr>
							<th>${a}</th>
							<th>${invest.loanID }</th>
							<th>${invest.invMoney }</th>
							<th>${invest.totInter }</th>
							<th>${invest.gotInter }</th>
						</tr>
						</c:forEach>
						</thead>
						<tbody>

						</tbody>
					</table>
					<!-- /.main-list -->
					<div class="page-wrap"></div>
				</div>
				<!-- /.u-form-wrap -->
				<div id="invest_repay_box" class="u-form-wrap"
					style="padding: 20px; display: none;">
					<div class="search-box" style="margin-bottom: 15px;">
						<table class="u-table">
							<tr>
								<td colspan="3">
									<div class="tab-search" style="padding-top: 5px;">
										<div class="i-item" style="padding-left: 50px;">
											<label class="i-til" style="width: 50px;"> 从：</label><input
												type="text" class="i-inp i-date" id="search_sdate"
												style="width: 80px;
                                                        height: 17px;" />
										</div>
										<!-- /.i-item -->
										<div class="i-item" style="padding-left: 50px;">
											<label class="i-til" style="width: 50px;"> 到：</label><input
												type="text" class="i-inp i-date" id="search_edate"
												style="width: 80px;
                                                        height: 17px;" />
										</div>
										<!-- /.i-item -->
										<div class="i-item" style="padding-left: 90px;">
											<label class="i-til" style="width: 90px;"> 贷款编号：</label><input
												type="text" class="i-inp" id="search_lid"
												style="width: 80px;
                                                        height: 17px;" />
										</div>
										<!-- /.i-item -->
										<div class="i-item-btn">
											<button id="do_search" class="i-btn-txt3">查询</button>
										</div>
									</div>
								</td>
							</tr>
						</table>
					</div>
					<table class="u-table th12 td12">
						<tr>
							<th>待收本息总额</th>
							<th>待赚利息总额</th>
							<th>待收本金总额</th>
						</tr>
						<tr>
							<td><i class="red">￥</i></td>
							<td><i class="red">￥</i></td>
							<td><i class="red">￥</i></td>
						</tr>

					</table>
					<table class="u-table th12 td12" style="margin-top: 15px;">
						<tr>
							<th>借款编号</th>
							<th>借款人</th>
							<th>第几期</th>
							<th>还款日</th>
							<th>回收本息</th>
							<th>剩余本息</th>
							<th>逾期天数</th>
							<th>电子合同</th>
							<th>操&nbsp;作</th>
						</tr>
						<tr>
							<td><a href="#" class="imp f14"></a></td>
							<td></td>
							<td><i class="red"></i></td>
							<td><i class="red"></i></td>
							<td><i class="red">￥</i></td>
							<td><i class="red">￥</i></td>
							<td>{repay.out_days}</td>
							<td><a style="color: green;" href="#"><span
									class="ico ico-ht"></span></a></td>
							<td>
								<div class="i-item-btn" style="height: 25px;">
									<a href="#" class="i-btn-txt1 transfer-post">转让</a>
								</div>
							</td>
						</tr>
					</table>
					<div class="page-wrap"></div>
				</div>
				<!-- /.u-form-wrap -->
				<div id="invest_return_box" class="u-form-wrap"
					style="padding: 10px; display: none;">
					<table class="u-table th12 td12">
						<tr>
							<th>借款编号</th>
							<th>借款人</th>
							<th>借出日期</th>
							<th>借出金额</th>
							<th>年利率</th>
							<th>回收金额</th>
							<th>电子合同</th>
						</tr>

						<tr>
							<td><a href="#" class="imp f14"></a></td>
							<td></td>
							<td><i class="red"></i></td>
							<td><i class="red">￥</i></td>
							<td><i class="red"></i></td>
							<td><i class="red">￥</i></td>
							<td><a style="color: green;" href="#"><span
									class="ico ico-ht"></span></a></td>
						</tr>
					</table>
					<div class="page-wrap"></div>
				</div>
			</div>
			<script type="text/javascript">
				var $div_li = $(".u-tab-wrap ul li");

				$div_li.click(
						function() {

							$(this).addClass("current").siblings().removeClass(
									"current");

							var div_index = $div_li.index(this);

							$("#tab_box>div").eq(div_index).show().siblings()
									.hide();

						}).hover(function() {

					$(this).addClass("hover");

				}, function() {

					$(this).removeClass("hover");

				});
			</script>
		</div>
	</div>
</body>
</html>

