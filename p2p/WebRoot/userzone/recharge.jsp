<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>充值 用户中心 - 大融小贷</title>
    <meta name="Keywords" content="大融小贷 用户中心" />
    <meta name="Description" content="大融小贷 用户中心" />
   <link href="css/UserCSS.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery.min.js" type="text/javascript"></script>
    
    <link rel="stylesheet" type="text/css" href="/p2p/css/style.css">
	<script type="text/javascript" src="/p2p/js/all.js"></script>
    
    <script src="js/ops.js" type="text/javascript"></script>
    <script src="js/UserJS.js" type="text/javascript"></script>
    <script src="js/jquery.datepicker.min.js" type="text/javascript"></script>

    <script src="js/jquery.template.min.js" type="text/javascript"></script>
    <script src="js/funds.js" type="text/javascript"></script>
</head>
<body>
		
	<%@include file="/head.jsp"%>

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
            <div id="tab_menu">
                <ul class="u-tab clearfix">
                    <li class="current"><a>网银充值</a></li>
                    <li><a>支付宝充值</a></li>
                    <li><a>国付宝充值</a></li>
                    <li><a>充值记录</a></li>
                </ul>
            </div>
            <div id="tab_box">
                <div class="u-form-wrap">
                    <div>
                        <div class="uf-tips">
                            <p>
                                1、所有投标保证金将由第三方平台托管。</p>
                            <p>
                                2、即时充值所产生的费用，由一起好平台承担。</p>
                            <p>
                                3、请注意您的银行卡充值限制，以免造成不便。</p>
                            <p>
                                4、如果充值金额没有及时到账，请和客服联系。</p>
                            <p class="red">
                                5、充值进来的资金，若不投资，24小时后才可提现，收取1%服务费；若三天内网站未发标，而需提现的，免收服务费。</p>
                        </div>
                        <div class="m-form-box mt10">
                            <div>
                                <div class="m-form-til">
                                    <b>在线充值</b></div>
                        			<form action="/p2p/PayRequest.action">
                                <ul id="recharge_banklist" class="bank-lists clearfix" style="display: block;">
                                    <li>
                                        <label for="icbc">
                                            <input name="pd_FrpId" value="ICBC-NET" type="radio" /><span class="ico-b ico-icbc"></span></label></li>
                                    <li>
                                        <label for="ccb">
                                            <input name="pd_FrpId" value="CCB-NET" type="radio" /><span class="ico-b ico-ccb"></span></label></li>
                                    <li>
                                        <label for="cmb">
                                            <input name="bank" value="cmb" type="radio" /><span class="ico-b ico-cmb"></span></label></li>
                                    <li>
                                        <label for="boc">
                                            <input name="bank" value="boc" type="radio" /><span class="ico-b ico-boc"></span></label></li>
                                    <li>
                                        <label for="abc">
                                            <input name="pd_FrpId" value="ABC-NET" type="radio" /><span class="ico-b ico-abc"></span></label></li>
                                    <li>
                                        <label for="bocom">
                                            <input name="bank" value="bocom" type="radio" /><span class="ico-b ico-bocom"></span></label></li>
                                    <li>
                                        <label for="spdb">
                                            <input name="bank" value="spdb" type="radio" /><span class="ico-b ico-spdb"></span></label></li>
                                    <li>
                                        <label for="citic">
                                            <input name="bank" value="citic" type="radio" /><span class="ico-b ico-citic"></span></label></li>
                                    <li>
                                        <label for="cmbc">
                                            <input name="bank" value="cmbc" type="radio" /><span class="ico-b ico-cmbc"></span></label></li>
                                    <li>
                                        <label for="gdb">
                                            <input name="bank" value="gdb" type="radio" /><span class="ico-b ico-gdb"></span></label></li>
                                    <li>
                                        <label for="hxbc">
                                            <input name="bank" value="hxbc" type="radio" /><span class="ico-b ico-hxbc"></span></label></li>
                                    <li>
                                        <label for="cib">
                                            <input name="bank" value="cib" type="radio" /><span class="ico-b ico-cib"></span></label></li>
                                    <li>
                                        <label for="ceb">
                                            <input name="bank" value="ceb" type="radio" /><span class="ico-b ico-ceb"></span></label></li>
                                    <li>
                                        <label for="psbc">
                                            <input name="bank" value="psbc" type="radio" /><span class="ico-b ico-psbc"></span></label></li>
                                    <li>
                                        <label for="sdb">
                                            <input name="bank" value="sdb" type="radio" /><span class="ico-b ico-sdb"></span></label></li>
                                    <li>
                                        <label for="pab">
                                            <input name="bank" value="pab" type="radio" /><span class="ico-b ico-pab"></span></label></li>
                                    <li>
                                        <label for="bob">
                                            <input name="bank" value="bob" type="radio" /><span class="ico-b ico-bob"></span></label></li>
                                    <li>
                                        <label for="shb">
                                            <input name="bank" value="shb" type="radio" /><span class="ico-b ico-shb"></span></label></li>
                                    <li>
                                        <label for="bjrc">
                                            <input name="bank" value="bjrc" type="radio" /><span class="ico-b ico-bjrc"></span></label></li>
                                    <li>
                                        <label for="srcb">
                                            <input name="bank" value="srcb" type="radio" /><span class="ico-b ico-srcb"></span></label></li>
                                    <li>
                                        <label for="hzcb">
                                            <input name="bank" value="hzcb" type="radio" /><span class="ico-b ico-hzcb"></span></label></li>
                                    <li>
                                        <label for="njcb">
                                            <input name="bank" value="njcb" type="radio" /><span class="ico-b ico-njcb"></span></label></li>
                                    <li>
                                        <label for="czsb">
                                            <input name="bank" value="czsb" type="radio" /><span class="ico-b ico-czsb"></span></label></li>
                                    <li>
                                        <label for="bohb">
                                            <input name="bank" value="bohb" type="radio" /><span class="ico-b ico-bohb"></span></label></li>
                                    <li>
                                        <label for="hkbea">
                                            <input name="bank" value="hkbea" type="radio" /><span class="ico-b ico-hkbea"></span></label></li>
                                </ul>
                                <div class="i-item i-long-item">
                                    <label class="i-til" style="text-align: right;">
                                        <span class="red">*</span><b>充值金额：</b></label><div class="i-right">
                                            <input id="recharge_money" name="money" type="text" class="i-inp" style="width: 90px;" /><p
                                                class="tips">
                                                <span class="ico-error" id="recharge_money_error"></span>
                                            </p>
                                            <div class="i-inp-tips">
                                                <p>
                                                    单笔充值金额应大于1元且不能超过100万元</p>
                                            </div>
                                        </div>
                                </div>
                                <!-- /.i-item -->
                                <div class="i-item i-long-item">
                                    <label class="i-til" style="text-align: right;">
                                        充值手续费：</label><div class="i-right">
                                            <div class="i-txt">
                                                <i id="recharge_fee_show">0.00</i>元
                                            </div>
                                        </div>
                                </div>
                                <!-- /.i-item -->
                                <div class="i-item i-long-item">
                                 
                                <!-- /.i-item -->
                                <div class="i-item i-long-item">
                                    <label class="i-til" style="text-align: right;">
                                        目前账户可用余额：</label><div class="i-right">
                                            <div class="i-txt">
                                                <i id="user_money_now">0.00</i>元</div>
                                        </div>
                                </div>
                                <!-- /.i-item -->
                                <div class="i-item i-long-item hasborderbot">
                                    <label class="i-til" style="text-align: right;">
                                        充值后账户可用余额：</label><div class="i-right">
                                            <div class="i-txt">
                                                <i id="user_money_show">0.00</i>元</div>
                                        </div>
                                </div>
                                <!-- /.i-item -->
                                <div id="recharge_online_msg" class="i-item" style="display: none;">
                                </div>
                                <div class="i-item-btn">
                                    <button type="submit" id="recharge_online_submit" class="i-btn-recharge">
                                    </button>                  
                                </div>                                
                            </div>
                            </form>
                        </div>
                    
                    </div>
                </div>
                </div>
                </div>
                </div>
                </div>
   <!--submit  -->
               
</body>
</html>
