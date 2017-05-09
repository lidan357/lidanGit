<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!-- author chenyong -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0154)file:///E:/java%E5%AD%A6%E4%B9%A0%E8%B5%84%E6%96%99/java%E8%B5%84%E6%96%99/%E5%AF%86%E7%A0%81%E9%87%8D%E7%BD%AE--%E4%B8%AD%E5%85%B4%E8%B4%A2%E5%AF%8C.html -->
<html xmlns="http://www.w3.org/1999/xhtml"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8"><style type="text/css" id="2224338967"></style>

<meta name="baidu-site-verification" content="hN9qyeWx20">
<meta name="baidu-site-verification" content="1fc1744a879ca4c2b5d2731db47080a9">
<link href="./resetPwd_files/style.css" rel="stylesheet">
<link href="./resetPwd_files/newstyle.css" rel="stylesheet">


<script src="./resetPwd_files/jquery.js"></script>
<script src="./resetPwd_files/common.js"></script>
<script src="./resetPwd_files/highcharts.js"></script>
<script src="./resetPwd_files/jquery.totemticker.js"></script>


<link type="text/css" rel="stylesheet" href="./resetPwd_files/colorbox.css">
<link rel="shortcut icon" href="https://www.whzxcf.com/statics/home/images/favicon.ico" type="image/x-icon">
<script src="./resetPwd_files/jquery.colorbox.js"></script>
<script src="./resetPwd_files/layer.js"></script><link type="text/css" rel="stylesheet" href="file:///E:/java%E5%AD%A6%E4%B9%A0%E8%B5%84%E6%96%99/java%E8%B5%84%E6%96%99/%E5%AF%86%E7%A0%81%E9%87%8D%E7%BD%AE--%E4%B8%AD%E5%85%B4%E8%B4%A2%E5%AF%8C_files/skin/layer.css" id="skinlayercss"><link type="text/css" rel="stylesheet" href="./resetPwd_files/layer(1).css" id="skinlayercss">
<script src="./resetPwd_files/common(1).js"></script>

<!--tipBOx-->


<title>密码重置--中兴财富</title>
<style type="text/css">
.zhucezliao dl dt.tip{ display:none; width:400px; text-indent:20px; height:25px; line-height:25px; padding:5px 0px; float:left; background: url(/statics/member/images/zhuce1.gif) no-repeat 00px center;}
.zhucezliao dl dt.tip.error{ background: url(/statics/member/images/error.gif) no-repeat 00px center;}
.zhucezliao dl dt.tip.success{ height:20px; width:20px; right:10px; top:10px; background: url(/statics/member/images/zhuce3.gif) no-repeat center center;}
.zhucezliao dl dt.sendmsg{height:25px; line-height:25px; padding:5px 0px;}
.zhucezliao dl dt.tip.errorTip{ position:absolute; height:20px; width:20px; right:10px; top:10px; background: url(/statics/member/images/error.gif) no-repeat center center;}
#code_img{position:relative; top:-2px; margin-left:5px}
.df_list_banner_wper{ height:45px;background: none;}
#updatePwd{
	height:45px;
	width:200px;
}
</style>
<script src="./resetPwd_files/validator.js"></script>
<script type="text/javascript">var _memberUrl="/member",_verifyUrl="/member-verify.shtml#divtab-1";</script>
</head><style type="text/css" id="2764715840"></style>
<body>
<script>
    </script>
<div class="block borderbox" style="">

<!--end nav  -->
            <div class="df_login_con ofh">
            	   
            	   <h2 class="cmm_getpassword">找回密码</h2>
                   <div class="axdzhucenav">
                        <ul>
                           <li><a class="hover" href="javascript:;">重置密码</a></li>
                        </ul>
                    </div>
                   <div class="axdzhucexx nologin clearfix">
                      <div class="zhucezliao">
                      	<form action="${pageContext.request.contextPath }/password.action"  method="post" >
                          <input type="hidden" name="op" value="updatePwd" id="pkey"/>
                          <dl><dd><span>*</span>
                          新密码:</dd><dt><input id="password" class="txt_zc" type="password" name="password"/></dt><dt class="tip">
                          </dt></dl>
                          <dl><dd><span>*</span>
                          重复新密码:</dd><dt><input id="passwordConfirm" class="txt_zc" type="password" name="passwordConfirm"/></dt><dt class="tip">
                          </dt></dl>
                          <br> 
                      &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;	
                      <input type="submit" name="updatePwd" id="updatePwd" value="找回密码"/>
                      </form>
                      </div>
                  </div>
            </div>
            <!-- end reg con -->
</div>

<!-- end listbanner -->


<script type="text/javascript">
var pwdIsRight = false;
var pwdConIsRight  = false;
 $(function(){

	 	//验证密码是否输入或者格式是否正确()
	 	$("#password").blur(function(){
	 	
	 		 if($("#password").val()==""){
	 			showMsg(this,"密码没有输入或者格式不正确","warn");
				 pwdIsRight=false;
				// $("#pwdInfo").focus();
			 }else if(!$("#password").val().match(/^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{8,16}$/)){
				 pwdIsRight=false;
				 showMsg(this,"密码只能是8-16位数字和字母的组合","warn");
			 }else{
				 showMsg(this,"","warn");
				 pwdIsRight=true;
			 }
	 		
	 	})
	 	
	 	//检查确认密码与密码是否一致
	 	$("#passwordConfirm").mouseout(function(){
	 		 if($("#passwordConfirm").val()==""){
	 			showMsg(this,"确认密码不能为空","warn");
	 			pwdConIsRight=false;
				
			 } else if($("#password").val()!=$("#passwordConfirm").val()){
				 showMsg(this,"确认密码与密码不一致","warn");
				// $("#passwordConfirm").focus();
				 pwdConIsRight=false;
			 }else{
				 showMsg(this,"","warn");
				 pwdConIsRight=true;
			 }
	 		
	 	})
	 	
	 	$("form").submit(function(){

	 		if(!pwdIsRight){
	 			///showMsg(this,"密码没有输入或者格式不正确","warn");
	 			return false;
	 		}
	 		
	 		if(!pwdConIsRight){
	 			//showMsg(this,"确认密码没有输入或者与密码不一致","warn");
	 			return false;
			 		}
	 			
	 		})
	 
	 	
 })
 
 
 
 function showMsg(id,msg,type){
	var cssName = "error success";
	var removeCss = cssName.replace(type,"");
 	$(id).parent("dt").siblings("dt.tip").removeClass(removeCss).addClass(type).html(msg).show();
 }
</script>
<!--footer --><!--footer-->
<div class="zxcf_yc">
  <ul>
    <!--<li><a href="http://www.zhongxincaifu.com/" class="zx_a1"></a></li>-->
    <li class=""></li>
    <li></li>
    <!--<li><a href="/football" class="zx_a6" title="我要踢球"></a></li>-->
    <!--<li><a href="/football" class="zx_a5" title="我要抽奖"></a></li>-->
  </ul>
</div>

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

</script><div id="cboxOverlay" style="display: none;"></div><div id="colorbox" class="" role="dialog" tabindex="-1" style="display: none;"><div id="cboxWrapper"><div><div id="cboxTopLeft" style="float: left;"></div><div id="cboxTopCenter" style="float: left;"></div><div id="cboxTopRight" style="float: left;"></div></div><div style="clear: left;"><div id="cboxMiddleLeft" style="float: left;"></div><div id="cboxContent" style="float: left;"><div id="cboxTitle" style="float: left;"></div><div id="cboxCurrent" style="float: left;"></div><button type="button" id="cboxPrevious"></button><button type="button" id="cboxNext"></button><button id="cboxSlideshow"></button><div id="cboxLoadingOverlay" style="float: left;"></div><div id="cboxLoadingGraphic" style="float: left;"></div><button type="button" id="cboxClose"></button></div><div id="cboxMiddleRight" style="float: left;"></div></div><div style="clear: left;"><div id="cboxBottomLeft" style="float: left;"></div><div id="cboxBottomCenter" style="float: left;"></div><div id="cboxBottomRight" style="float: left;"></div></div></div><div style="position: absolute; width: 9999px; visibility: hidden; display: none;"></div></div><div id="cboxOverlay" style="display: none;"></div><div id="colorbox" class="" role="dialog" tabindex="-1" style="display: none;"><div id="cboxWrapper"><div><div id="cboxTopLeft" style="float: left;"></div><div id="cboxTopCenter" style="float: left;"></div><div id="cboxTopRight" style="float: left;"></div></div><div style="clear: left;"><div id="cboxMiddleLeft" style="float: left;"></div><div id="cboxContent" style="float: left;"><div id="cboxTitle" style="float: left;"></div><div id="cboxCurrent" style="float: left;"></div><button type="button" id="cboxPrevious"></button><button type="button" id="cboxNext"></button><button id="cboxSlideshow"></button><div id="cboxLoadingOverlay" style="float: left;"></div><div id="cboxLoadingGraphic" style="float: left;"></div><button type="button" id="cboxClose"></button></div><div id="cboxMiddleRight" style="float: left;"></div></div><div style="clear: left;"><div id="cboxBottomLeft" style="float: left;"></div><div id="cboxBottomCenter" style="float: left;"></div><div id="cboxBottomRight" style="float: left;"></div></div></div><div style="position: absolute; width: 9999px; visibility: hidden; display: none;"></div></div></body></html>