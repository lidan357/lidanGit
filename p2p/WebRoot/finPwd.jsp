<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!-- author chenyong -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0047)https://www.whzxcf.com/common-getpassword.shtml -->
<html xmlns="http://www.w3.org/1999/xhtml"><style type="text/css" id="2224338967"></style><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta name="baidu-site-verification" content="hN9qyeWx20">
<meta name="baidu-site-verification" content="1fc1744a879ca4c2b5d2731db47080a9">
<link href="./finPwd_files/style.css" rel="stylesheet">
<link href="./finPwd_files/newstyle.css" rel="stylesheet">

<script src="./finPwd_files/hm.js"></script><script type="text/javascript">



//全局变量

var GV = {
    DIMAUB: "",
    JS_ROOT: "/statics/home/js/",
    TOKEN: "48243a877b53f466af737cf7e2dc8156_c4fba529f633ab815646e37c593b2e73",
	THIS_URL:"Common-",
	TINVEST_URL:"/invest-showtinvest.shtml",
	MAIN_DOMAIN:"http://www.whzxcf.com"
};

</script>

<script src="./finPwd_files/jquery.js"></script>
<script src="./finPwd_files/common.js"></script>
<script src="./finPwd_files/highcharts.js"></script>
<script src="./finPwd_files/jquery.totemticker.js"></script>


<!--tipBOx-->

<link type="text/css" rel="stylesheet" href="./finPwd_files/colorbox.css">
<link rel="shortcut icon" href="https://www.whzxcf.com/statics/home/images/favicon.ico" type="image/x-icon">
<script src="./finPwd_files/jquery.colorbox.js"></script>
<script>
$(function(){     
     $('.cboxPhoto').each(function() {
         var maxWidth = 800;
         var maxHeight = 800;
         var ratio = 0;
         var width = $(this).width();
         var height = $(this).height();
      
        if(width > maxWidth){
             ratio = maxWidth / width;
             $(this).css("width", maxWidth);
             $(this).css("height", height * ratio);
             height = height * ratio;
         }
         var width = $(this).width();
         var height = $(this).height();
         if(height > maxHeight){
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
<script src="./finPwd_files/layer.js"></script><link type="text/css" rel="stylesheet" href="./finPwd_files/layer.css" id="skinlayercss">
<script src="./finPwd_files/common(1).js"></script>

<!--tipBOx-->


<title>找回密码--中兴财富</title>
<style type="text/css">
.zhucezliao dl dt.tip {
	display:none;
	width:400px;
	text-indent:20px;
	height:25px;
	line-height:25px;
	padding:5px 0px;
	float:left;
	background: url(/statics/member/images/zhuce1.gif) no-repeat 00px center;
}
.zhucezliao dl dt.tip.error {
	background: url(/statics/member/images/error.gif) no-repeat 00px center;
}
.zhucezliao dl dt.tip.success {
	height:20px;
	width:20px;
	right:10px;
	top:10px;
	background: url(/statics/member/images/zhuce3.gif) no-repeat center center;
}
.zhucezliao dl dt.sendmsg {
	height:25px;
	line-height:25px;
	padding:5px 0px;
}
.zhucezliao dl dt.tip.errorTip {
	position:absolute;
	height:20px;
	width:20px;
	right:10px;
	top:10px;
	background: url(/statics/member/images/error.gif) no-repeat center center;
}
#code_img {
	position:relative;
	top:-2px;
	margin-left:5px
}
.df_list_banner_wper {
	height:45px;
	background: none;
}


#findPwd{

	height:45px;
	width:200px;
	

}
</style>
<script src="./finPwd_files/validator.js"></script>
<script type="text/javascript">var _memberUrl="/member",_verifyUrl="/member-verify.shtml#divtab-1";</script>
</head>
<body>

<script>
	 //$('#nzxcf_no').totemticker({
	//	  row_height	:	'60px',
	//	  interval		:	6000, 
	//	  mousestop	:	true
	 // });
	  
        $(function(){
	    $('.zxcf-wx').mouseenter(function(){
		    $(this).find('i').show();
		});			
	    $('.zxcf-wx').mouseleave(function(){
		    $(this).find('i').hide();
		});			
	    $('.zxcf-app').mouseenter(function(){
		    $(this).find('i').show();
		});			
	    $('.zxcf-app').mouseleave(function(){
		    $(this).find('i').hide();
		});	
	    $('#zxqq').mouseenter(function(){
		    $(this).find('div').stop().slideDown();
		});			
	    $('#zxqq').mouseleave(function(){
		    $(this).find('div').stop().slideUp();
		});	
           
        })
    </script>
<div class="block borderbox" style="">

<!--end nav  -->
<div class="df_login_con ofh">
  <h2 class="cmm_getpassword">找回密码</h2>
  <div class="axdzhucenav">
    <ul>
      <li><a class="hover" href="javascript:;" style="border-right:1px solid #D9D9D9;">手机找回</a></li>
      <li><a href="https://www.whzxcf.com/common-getpasswordemail.shtml">邮箱找回</a></li>
    </ul>
  </div>
  <form name="getpasswordphone" id="getpasswordphone" method="post" action="password.action">
    <div class="axdzhucexx nologin clearfix">
      <div class="zhucezliao">
        <!--
        
        <dl>
          <dd><span>*</span>验证码:</dd>
          <dt>
            <input id="vocdex" class="txt_zc" type="text" name="vocdex" style="width:100px" maxlength="4">
          </dt>
          <dt><img src="./finPwd_files/Common-VerifyCode" align="absmiddle" id="code_img" onclick="document.getElementById(&#39;code_img&#39;).src=&#39;Common-VerifyCode?time=&#39;+Math.random();void(0);"></dt>
          <dt class="tip"></dt>
        </dl>
        -->
        <dl>
          <dd><span>*</span>手机号:</dd>
          <dt>
            <input id="user_phone" class="txt_zc" type="text" name="user_phone"/>
          </dt>
          <dt class="sendmsg"><a href="javascript:;" id="sendCode">获取短信验证码</a></dt>
          <dt class="tip"></dt>
      </dl>
        <dl id="vcodetr" style="display:block">
          <dd class="liht24"><span>*</span>手机验证码:</dd>
          <dt>
            <input style="width:100px" maxlength="6" id="vcode" class="txt_zc" type="text" name="vcode"/>
          </dt>
          <dt class="tip"></dt>
        </dl>
        </form>
      
          <input type="button" name="findPwd" id="findPwd" value="找回密码"></input>
       
      </div>
    </div>
 
<!-- end reg con -->
<!-- end listbanner -->
<script type="text/javascript">

 var second=60;

 var phoneIsRight=false;
 
 var timer=null;

 var mbTest = /^(13|14|15|18)[0-9]{9}$/;

 $(function(){

	$("#sendCode").bind("click",function(){

		 var url = "register.action";
		 
		 $.ajax({
			  type: 'POST',
			  url: url,
			  async:false,
			  data: {op:"checkPhone",phone:$("#user_phone").val()},
			  success: function(data){
					//alert(data);	
					if(data=="0"){
						showMsg($("#user_phone"),"手机号码不存在，请检查",'error')
						return;
					}else{
						phoneIsRight=true;
					}
				}
			});	
		 
		sendPhoneCode();
	});

	$("#user_phone").focus(function(){

		showMsg(this,"请输入您认证时使用的手机号码，如还未认证请使用邮箱找回密码");

	}).blur(function(){
		if(!mbTest.test($(this).val())) showMsg(this,"请输入正确的手机号码",'error');
		else {
		showMsg(this,"",'success');
		
		}
	});

	$("#vcode").focus(function(){
		showMsg(this,"请输入手机接收到的6位验证码，15分钟内有效");
	}).blur(function(){
		if($(this).val().length!=6) showMsg(this,"请输入正确的验证码",'error');
		else  showMsg(this,"",'success');
	});

	
	//提交验证码
	$("#findPwd").click(function(){
		//Mix.msg("请输入验证码","warn",2);
		if($.trim($("#user_phone").val())==""){
			
			Mix.msg("请输入手机号码","warn",1);
			return false;
		}
		
		if($.trim($("#vcode").val())==""){
			
			Mix.msg("请输入验证码","warn",1);
			return false;
		}
		
		
		/* var url = "messageCaptcha.action";
		
		$.post(url,async:false,{op:"findPwd",captcha:$("#vcode").val()},function(data){
			alert(data);	
			 if(data=="0"){
					alert("aasd");
					Mix.msg("验证码不正确，请检查","warn",1);
					result=false;
				}
	});
		 */
		 var result = true;
		 var url = "messageCaptcha.action";
		$.ajax({
			  type: 'POST',
			  url: url,
			  async:false,
			  data: {op:"findPwd",captcha:$("#vcode").val()},
			  success: function(data){
				//alert(data);
					 if(data=="0"){
							Mix.msg("验证码不正确，请检查","warn",1);
							result=false;
						}
				}
			});			
		if(result){
			$("form").submit();
		}
	})
	
	
 })

  //获取电话号码是否存在的结果

 
 
 function sendPhoneCode(){

	 var p={};

	// var vcodex = $("#vocdex").val();

	 var phone = $("#user_phone").val();

	// var user_name = $("#user_name").val();

	/*  if(vcodex==''){

		Mix.msg("请输入四位验证码","warn",2); 

		return false;

	 }
 */
	 if(!mbTest.test(phone)){
		Mix.msg("请输入正确的手机号码","warn",1); 
		return false;

	 }
	 if(!phoneIsRight){
			Mix.msg("手机号码不存在","warn",1); 
			return false;

		 }

	 /*if(!user_name){

		Mix.msg("用户名不能为空","warn",2); 

		 return false;

	 }*/

	 
	 Mix.msg("短信已发送","warn",1); 
			var url = "messageCaptcha.action";
					$.ajax({
						  type: 'POST',
						  url: url,
						  data: {phone:$("#user_phone").val(),op:"findPwd"},
						  success: null,
						});			
 }

 
  
 function setLeftTime(){

	if(second<0){

		clearTimeout(timer);

		second=60;

	/* 	$("#sendCode").html("获取语音验证码").bind("click",function(){

			sendPhoneCodeyy();

		});
 */
	}else{

		$("#sendCode").unbind().html(second + "秒后可重发"); 

		timer = setTimeout(function(){

			 second--;

			 clearTimeout(timer);

			 setLeftTime();

		 },1000);

	}

 }



 function showMsg(id,msg,type){

	var cssName = "error success";

	var removeCss = cssName.replace(type,"");

 	$(id).parent("dt").siblings("dt.tip").removeClass(removeCss).addClass(type).html(msg).show();

 }

 

 function getpassword(){

	 var phone = $("#user_phone").val();

	 var user_name = $("#user_name").val();

	 var code = $("#vcode").val();

	 if(!mbTest.test(phone)){

		Mix.msg("请输入正确的手机号码","warn",2); 

		return false;

	 }

	/* if(!user_name){

		Mix.msg("用户名不能为空","warn",2); 

		 return false;

	 }*/

	 if(code.length!=6){

		Mix.msg("验证码不对","warn",2); 

		 return false;

	 }

	 document.forms['getpasswordphone'].submit();

 }

</script>
<!--footer --><!--footer-->
<div class="zxcf_yc">
  <ul>
    <!--<li><a href="http://www.zhongxincaifu.com/" class="zx_a1"></a></li>-->
    <li class="">
      <div class="nzx_qq">
	    <div class="nzx_qq_con">
		  <div class="nzx_qq_online clearfix">
		    <span class="fl">在线客服QQ：</span>
			<a class="fl" href="http://crm2.qq.com/page/portalpage/wpa.php?uin=4000270101&f=1&ty=1&aty=0&a=&from=6">
			  <img src="./finPwd_files/nzx_qq_online.png" width="74" height="22"></a>

		  </div>
		  <div class="nzx_qq_quan" id="nzx_qq_quan">
		    <p class="clearfix"><span class="fl">投资交流群：</span><a href="http://shang.qq.com/wpa/qunwpa?idkey=6c9bc1d6489dfd787541c466413abe8989c900544a319bd58a64edca88678b14" class="fl">422940552</a></p>
		    <p class="clearfix"><span class="fl">投资VIP群：</span><a href="http://shang.qq.com/wpa/qunwpa?idkey=d194e536c81ae66d7da7d17b7b6a7054972df5ee510a63bf08d99ce3c3871bc2" class="fl">223638794</a></p>		    
		  </div>
		</div>	  
	  </div>
	</li>
    <li></li>
    <!--<li><a href="/football" class="zx_a6" title="我要踢球"></a></li>-->
    <!--<li><a href="/football" class="zx_a5" title="我要抽奖"></a></li>-->
  </ul>
</div>
<script>

var _hmt = _hmt || [];
(function() {
  var hm = document.createElement("script");
  hm.src = "//hm.baidu.com/hm.js?aea1a2616a42294fcf3478354876581a";
  var s = document.getElementsByTagName("script")[0]; 
  s.parentNode.insertBefore(hm, s);
})();
</script>
<script>

$(function(){
	$('.zx_a3').mouseenter(function(){
		$('.zxTel0').stop().animate({left:"-130"});
	});
	$('.zx_a3').mouseleave(function(){
		$('.zxTel0').stop().animate({left:"41"});
	}); 
	$('.zxTel0').mouseenter(function(){
	    $('.zxTel0').stop().animate({left:"-130"});
	}) 
	$('.zxTel0').mouseleave(function(){
	    $('.zxTel0').stop().animate({left:"41"});
	}) 
	$('.zx_a2').mouseenter(function(){
		$('.nzx_qq').stop().animate({left:"-200"});
	});
	$('.zx_a2').mouseleave(function(){
		$('.nzx_qq').stop().animate({left:"41"});
	}); 
	$('.nzx_qq').mouseenter(function(){
	    $('.nzx_qq').stop().animate({left:"-200"});
	}) 
	$('.nzx_qq').mouseleave(function(){
	    $('.nzx_qq').stop().animate({left:"41"});
	}) 

})

</script><div id="cboxOverlay" style="display: none;"></div><div id="colorbox" class="" role="dialog" tabindex="-1" style="display: none;"><div id="cboxWrapper"><div><div id="cboxTopLeft" style="float: left;"></div><div id="cboxTopCenter" style="float: left;"></div><div id="cboxTopRight" style="float: left;"></div></div><div style="clear: left;"><div id="cboxMiddleLeft" style="float: left;"></div><div id="cboxContent" style="float: left;"><div id="cboxTitle" style="float: left;"></div><div id="cboxCurrent" style="float: left;"></div><button type="button" id="cboxPrevious"></button><button type="button" id="cboxNext"></button><button id="cboxSlideshow"></button><div id="cboxLoadingOverlay" style="float: left;"></div><div id="cboxLoadingGraphic" style="float: left;"></div><button type="button" id="cboxClose"></button></div><div id="cboxMiddleRight" style="float: left;"></div></div><div style="clear: left;"><div id="cboxBottomLeft" style="float: left;"></div><div id="cboxBottomCenter" style="float: left;"></div><div id="cboxBottomRight" style="float: left;"></div></div></div><div style="position: absolute; width: 9999px; visibility: hidden; display: none;"></div></div></body></html>