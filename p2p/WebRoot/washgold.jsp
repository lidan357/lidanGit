<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>


<!DOCTYPE HTML>
<html>
<head>

<title>My JSP 'washgold.jsp' starting page</title>


<link rel="stylesheet" type="text/css" href="/p2p/css/style.css">
<script type="text/javascript" src="/p2p/js/jquery-1.7.2.min.js"></script>

<link rel="stylesheet" type="text/css" href="/p2p/css/washgold.css">
<script type="text/javascript" src="/p2p/js/washgold.js"></script>

<link rel="stylesheet" href="/p2p/css/remodal.css">
<link rel="stylesheet" href="/p2p/css/remodal-default-theme.css">
<script src="/p2p/js/remodal.min.js"></script>


</head>

<body>
	<%@include file="/head.jsp"%>
	<!-- 登录模态窗口 start-->
	<div class="remodal" data-remodal-id="modal" id="goldRegister">
		<div class="register_c">
			<form id="formUser" action="">
				<p class="mb15">
					<input placeholder="用户名/手机" class="goldInput" name="user_name"
						id="user_name" type="text">
				</p>
				<p>
					<input placeholder="密码" class="goldInput" name="pass_word"
						id="pass_word" type="password">
				</p>
				<p class="mt15 mb20 goregister" id="goregister">
					没有帐号，<a href="/member-register-index.shtml" class="colored">立即注册</a>
				</p>
				<p>
					<a class="momentBtn" id="momentBtn" style="cursor:pointer"></a><span
						id="spanError" style="color:red;display:none">账号或密码错误</span>
				</p>
			</form>
		</div>
	</div>
	<!-- 登陆模态窗口end -->
	<!-- 淘金记录窗口 start-->
	<div class="remodal" data-remodal-id="modal1" >
		<table id="tableGold">
			<thead>
				<tr>
					<th>编号</th>
					<th>奖励日期</th>
					<th>奖励金额</th>
				</tr>
			</thead>
			<tbody>
				<c:set var="index" value="0" />
				<c:forEach var="item" items="${washgolds}">
					<c:if test="${item.isGet=='是'}">
						<c:set var="index" value="${index+1}" />
						<tr class="warning">
							<td>${index}</td>
							<td>${item.washDate}</td>
							<td>${item.getMoney}</td>
						</tr>
					</c:if>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<!-- 淘金记录窗口end -->
	<div id="divhead"></div>
	<div class="lefloat">
		<a href="#g1" class="g1" id="a1"></a> <a href="#g2" class="g2" id="a2"></a>
		<a href="#g3" class="g3" id="a3"></a>
	</div>
	<div id="div1">
		<div class="nzx1000 partC1">
			<h3 id="g1">
				活动期间，平台3月及以上标的全场加息，最高<span class="colorff">加息1.2%</span>
				，多投多得！（注：加息标的不含新手标。)
			</h3>
			<div class="partt">
				<ul class="clearfix">
					<li>
						<div class="shine" id="shine">
							<!--<img src="/statics/home/images/16activites/gold/shine.png" />-->
						</div> <img src="/p2p/images/rate_1.png">
					</li>
					<li>
						<div class="shine" id="shine">
							<!--<img src="/statics/home/images/16activites/gold/shine.png" />-->
						</div> <img src="/p2p/images/rate_2.png">
					</li>
					<li>
						<div class="shine" id="shine">
							<!--<img src="/statics/home/images/16activites/gold/shine.png" />-->
						</div> <img src="/p2p/images/rate_3.png">
					</li>
				</ul>
				<a href="/p2p/invest.action?op=all&curPage=1" class="goldenBtn"><img
					src="/p2p/images/rate_invest.png"></a>
			</div>
		</div>
	</div>
	<div id="div2">
		<div id="g2"></div>
	</div>
	<div id="div3">
		<div class="nzx1000 partC2" style="width:820px">
			<div class="part_c clearfix">
				<div class="w375 fl">
					<p>我要和小兴一样</p>
					<p>
						活动期间，注册成功后单笔投资满<span class="colorff">100元</span>
					</p>
					<p>
						即可领取<span class="colorff">1%加息券</span>1张
					</p>
					<a href="javascript:;" class="onceBtn_old"><img
						src="/p2p/images/onceBtn.png"></a>
				</div>
				<div class="w375 fr">
					<p>我也要和小兴一样</p>
					<p>
						活动期间，用户平台待收金额达<span class="colorff">5000元</span>的老用户
					</p>
					<p>
						即可领取<span class="colorff">1%加息券</span>1张
					</p>
					<a href="javascript:;" class="onceBtn_old"><img
						src="/p2p/images/onceBtn.png"></a>

				</div>
			</div>
			<div class="part_t mt80">
				<h4>活动规则</h4>
				<ul class="mt20">
					<li class="gli1">活动期间，满足要求后每个账户限领1张加息券；</li>
					<li class="gli2">单个标的只可使用一张加息券，不可叠加使用；</li>
					<li class="gli3">新手标、承接债权不可使用加息券，加息券必须手动投标使用！</li>
					<li class="gli4">加息券使用有效期为30天，过期无效。</li>
				</ul>
			</div>
		</div>
	</div>
	<div id="div4">
		<div class="nzx1000 partC3">
			<h3 id="g3">活动期间，用户每日累计投资金额达到相应额度，即可获得对应的奖励。</h3>
			<p class="mb20">
				当前为<span class="colorff" style="font-weight:normal;"><span
					id="spanDate"></span> </span>，您今天的累计投资额：
				<c:if test="${user==null}">
					<a class="golook" href="/p2p/washgold.jsp#modal">登录查看</a> 元；离下一级还差： 
						<a class="golook" href="/p2p/washgold.jsp#modal">登录查看</a> 元，继续加油哦！
					</c:if>
				<c:if test="${user!=null}">
					<span class="golook">${money}</span> 元；离下一级还差： 
						<span class="golook">${disMoney}</span> 元；继续加油哦！
					</c:if>
			</p>
			<div class="part_4c">
				<ul>
					<li class="clearfix">
						<div class="w130 gbox fl">
							<div class="crate crate_1"></div>
							<h5>
								<b>掘金达人</b>
							</h5>
						</div>
						<div class="w300 gbox fl">
							<div class="spade"></div>
							<h5>1万≤每日累计投资额≤2万</h5>
						</div>
						<div class="w260 gbox fl">
							<div class="gift gift1"></div>
							<h5>18元红包</h5>
						</div>
						<div class="w130 drawBtn gbox fr">

							<c:choose>
								<c:when
									test="${user!=null&&washgolds[0].isFull=='是'&&washgolds[0].isGet=='否'}">
									<a class="goldenBtnwYes" id="${washgolds[0].washID}"
										style="background: url(/p2p/images/onceBtn.png) no-repeat center;background-size: cover;background-size:117px 54px"></a>
								</c:when>
								<c:otherwise>
									<a class="goldenBtnw">不可领取</a>
								</c:otherwise>
							</c:choose>
							<!-- <a class="goldenBtnw">不可领取</a> -->
						</div>
					</li>
					<li class="clearfix">
						<div class="w130 gbox fl">
							<div class="crate crate_2"></div>
							<h5>
								<b>掘金能手</b>
							</h5>
						</div>
						<div class="w300 gbox fl">
							<div class="spade"></div>
							<h5>2万＜每日累计投资额≤3万</h5>
						</div>
						<div class="w260 gbox fl">
							<div class="gift gift1"></div>
							<h5>38元红包</h5>
						</div>
						<div class="w130 drawBtn gbox fr">
							<c:choose>
								<c:when
									test="${user!=null&&washgolds[1].isFull=='是'&&washgolds[1].isGet=='否'}">
									<a class="goldenBtnwYes" id="${washgolds[1].washID}"
										style="background: url(/p2p/images/onceBtn.png) no-repeat center;background-size: cover;background-size:117px 54px"></a>
								</c:when>
								<c:otherwise>
									<a class="goldenBtnw">不可领取</a>
								</c:otherwise>
							</c:choose>
						</div>
					</li>
					<li class="clearfix">
						<div class="w130 gbox fl">
							<div class="crate crate_3"></div>
							<h5>
								<b>掘金勇士</b>
							</h5>
						</div>
						<div class="w300 gbox fl">
							<div class="spade"></div>
							<h5>3万＜每日累计投资额≤5万</h5>
						</div>
						<div class="w260 gbox fl">
							<div class="gift gift1"></div>
							<h5>58元红包</h5>
						</div>
						<div class="w130 drawBtn gbox fr">
							<c:choose>
								<c:when
									test="${user!=null&&washgolds[2].isFull=='是'&&washgolds[2].isGet=='否'}">
									<a class="goldenBtnwYes" id="${washgolds[2].washID}"
										style="background: url(/p2p/images/onceBtn.png) no-repeat center;background-size: cover;background-size:117px 54px"></a>
								</c:when>
								<c:otherwise>
									<a class="goldenBtnw">不可领取</a>
								</c:otherwise>
							</c:choose>
						</div>
					</li>
					<li class="clearfix">
						<div class="w130 gbox fl">
							<div class="crate crate_4"></div>
							<h5>
								<b>掘金精英</b>
							</h5>
						</div>
						<div class="w300 gbox fl">
							<div class="spade"></div>
							<h5>5万＜每日累计投资额≤10万</h5>
						</div>
						<div class="w260 gbox fl">
							<div class="gift gift2"></div>
							<h5>88元红包+38元现金</h5>
						</div>
						<div class="w130 drawBtn gbox fr">
							<c:choose>
								<c:when
									test="${user!=null&&washgolds[3].isFull=='是'&&washgolds[3].isGet=='否'}">
									<a class="goldenBtnwYes" id="${washgolds[3].washID}"
										style="background: url(/p2p/images/onceBtn.png) no-repeat center;background-size: cover;background-size:117px 54px"></a>
								</c:when>
								<c:otherwise>
									<a class="goldenBtnw">不可领取</a>
								</c:otherwise>
							</c:choose>
						</div>
					</li>
					<li class="clearfix">
						<div class="w130 gbox fl">
							<div class="crate crate_5"></div>
							<h5>
								<b>掘金之王</b>
							</h5>
						</div>
						<div class="w300 gbox fl">
							<div class="spade"></div>
							<h5>每日累计投资额＞10万</h5>
						</div>
						<div class="w260 gbox fl">
							<div class="gift gift2"></div>
							<h5>118元红包+58元现金</h5>
						</div>
						<div class="w130 drawBtn gbox fr">
							<c:choose>
								<c:when
									test="${user!=null&&washgolds[4].isFull=='是'&&washgolds[4].isGet=='否'}">
									<a class="goldenBtnwYes" id="${washgolds[4].washID}"
										style="background: url(/p2p/images/onceBtn.png) no-repeat center;background-size: cover;background-size:117px 54px"></a>
								</c:when>
								<c:otherwise>
									<a class="goldenBtnw">不可领取</a>
								</c:otherwise>
							</c:choose>
						</div>
					</li>
				</ul>

				<div class="clearfix mt60">
					<a href="/p2p/invest.action?op=all&curPage=1" class="fl rate_invest_1"><img
						src="/p2p/images/rate_invest_1.png"></a> <a
						href="/p2p/washgold.action#modal1" class="fl rewardBtn"><img
						src="/p2p/images/rewardBtn.png"></a>
				</div>

				<div class="part_t mt30">
					<h4>活动规则</h4>
					<ul class="mt20" style=" margin-left:60px; ">
						<li class="gli1">累计投资金额统计时间：每日00:00—23:59；</li>
						<li class="gli2">每日累计投资金额不含天标、承接债权;</li>
						<li class="gli3">满足条件后，用户次日可点击“领取”按钮，领取前一日的奖励；若未及时领取，可在“查看我的
							奖励”处领取之前的奖励，奖励限2016年10月1日23:59之前领取，逾期未领取将不予补送；</li>
						<li class="gli4">
							现金奖励可再投资或提现，红包投资满1000元可使用，使用比例为投资金额的5‰，有效期为30天。</li>
					</ul>
				</div>
				<p>*本活动最终解释权归中兴财富所有</p>
			</div>
		</div>
	</div>
</body>
</html>
