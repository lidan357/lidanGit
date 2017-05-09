<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html>
<head>
<title>个人资料</title>
<script src="/p2p/userzone/js/ops.js" type="text/javascript"></script>
<script src="/p2p/userzone/js/jquery-3.1.0.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="/p2p/css/style.css">

<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css"
	rel="stylesheet">
<link href="css/fileinput.min.css" media="all" rel="stylesheet"
	type="text/css" />
		<script src="js/fileinput.min.js"></script>
	<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"
	type="text/javascript"></script>
	<link href="/p2p/userzone/css/UserCSS.css" rel="stylesheet" type="text/css" />

	<script type="text/javascript">
	$(function () {
	   
	    $("#sel1").change(function () {
	        $.getJSON("pc.action?pid="+$(this).select().val(),function (data) {
	        	$("#sel2").html("");
	            $.each(data, function (i,item) {         	
	               $("#sel2").append("<option value="+item.cid+">"+item.cName+"</option>");
	            });
	        });
	    });
	    
	    $(".btn-warning").click(function () {
	    	$("#errorspan").css("display","none");
			var fields=$(".form-horizontal").serializeArray();
			$.each(fields, function (i,field) {
				if(field.value==""||field.value==null){
					alert(field.value);
					$("#errorspan").css("display","inline");
					event.preventDefault();
				}
			});

		});
	    
	});
	</script>

</head>
<body>
	<%@include file="/head.jsp" %>
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
			<div id="tab_menu">
				<ul class="u-tab clearfix">
					<li class="current"><a>个人详细信息</a></li>
					<li><a>工作认证信息</a></li>
					<li><a>联系人信息</a></li>
				</ul>
			</div>
			<div id="tab_box">
				<div class="u-form-wrap">
					<div class="uf-tips">
						<span class="red">*</span> 为必填项，所有资料均会严格保密。
					</div>
					<div>
						
						<form action="/p2p/userdata.action" enctype="multipart/form-data"
							  class="form-horizontal"  role="form" method="post">
							<div class="form-group">
								<label  class="col-sm-2 control-label">头像</label>
								<div class="col-sm-5">
									<div style="width:400px">
										<input id="input-id" name="pic1" type="file" class="file"
											   data-preview-file-type="text" >
									</div>
								</div>
							</div>
							<div class="form-group">
								<label  class="col-sm-2 control-label">邮箱</label>
								<div class="col-sm-5">
									<input type="email" class="form-control" id="email" name="email"
										   placeholder="请输入邮箱">
								</div>
							</div>
							<div class="form-group">
								<label  class="col-sm-2 control-label">真实姓名</label>
								<div class="col-sm-5">
									<input type="text" class="form-control" id="realName" name="realName"
										   placeholder="请输入真实姓名">
								</div>
							</div>
							<div class="form-group">
								<label  class="col-sm-2 control-label">年龄</label>
								<div class="col-sm-5">
									<select class="form-control" name="age">
										<option value="18">18</option>
										<option value="19">19</option>
										<option value="20">20</option>
										<option value="21">21</option>
										<option value="22">22</option>
										<option value="23">23</option>
										<option value="24">24</option>
										<option value="25">25</option>
										<option value="26">26</option>
										<option value="27">27</option>
										<option value="28">28</option>
										<option value="29">29</option>
										<option value="30">30</option>
										<option value="31">31</option>
										<option value="32">32</option>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label  class="col-sm-2 control-label">居住地</label>
								<div class="col-sm-2">									
									<select class="form-control" name="province" id="sel1">
										<c:forEach var="p" items="${allPro}">
											<option value='${p.pid}'>${p.pName}</option>
										</c:forEach>										
									</select>
								</div>
								<div class="col-sm-2">									
									<select class="form-control" name="city" id="sel2">										
									</select>
								</div>
							</div>
							<div class="form-group">
								<label  class="col-sm-2 control-label">性别</label>
								<div class="col-sm-2">
									<label>
										<input type="radio" name="sex"  value="man" checked> 男
									</label>
								</div>
								<div class="col-sm-2">
									<label>
										<input type="radio" name="sex"  value="women" checked> 女
									</label>
								</div>
							</div>
							<div class="form-group">
								<label  class="col-sm-2 control-label">教育程度</label>
								<div class="col-sm-5">
									<select class="form-control" name="eduExp">
										<option value="初中">初中</option>
										<option value="高中">高中</option>
										<option value="本科">本科</option>
										<option value="硕士">硕士</option>
										<option value="博士">博士</option>

									</select>
								</div>
							</div>
							<div class="form-group">
								<label  class="col-sm-2 control-label">月收入</label>
								<div class="col-sm-5">
									<input type="number" class="form-control" id="monthInco" name="monthInco">
								</div>
							</div>
							<div class="form-group">
								<label  class="col-sm-2 control-label">工作</label>
								<div class="col-sm-5">
									<input type="text" class="form-control" id="job" name="job">
								</div>
							</div>


							<button style="width: 200px;margin-left: 15%" type="submit" value="submit" class="btn-warning btn-lg">提交</button>
							<span id="errorspan" style="color:red;display:none;font-size: large">请完善个人信息</span>
						</form>
					</div>
				</div>
				<div class="u-form-wrap" style="display: none;">
					<!-- uf-tips -->
					<div class="uf-tips">
						<span class="red">*</span> 为必填项，所有资料均会严格保密。

					</div>
					<div>这是工作认证信息</div>
				</div>
				<div class="u-form-wrap" style="display: none;">
					<div class="uf-tips">
						<span class="red">*</span> 为必填项，所有资料均会严格保密。
					</div>
					<div>这是联系人信息</div>
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
