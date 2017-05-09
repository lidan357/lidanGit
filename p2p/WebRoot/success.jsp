<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!-- author chenyong -->

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0154)file:///E:/java%E5%AD%A6%E4%B9%A0%E8%B5%84%E6%96%99/java%E8%B5%84%E6%96%99/%E5%AF%86%E7%A0%81%E9%87%8D%E7%BD%AE--%E4%B8%AD%E5%85%B4%E8%B4%A2%E5%AF%8C.html -->
<html xmlns="http://www.w3.org/1999/xhtml"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8"><style type="text/css" id="2224338967"></style>

<meta name="baidu-site-verification" content="hN9qyeWx20">
<link href="./resetPwd_files/style.css" rel="stylesheet">
<link href="./resetPwd_files/newstyle.css" rel="stylesheet">


<script src="./resetPwd_files/jquery.js"></script>



<title>密码重置</title>
<style type="text/css">
.zhucezliao dl dt.tip{ display:none; width:400px; text-indent:20px; height:25px; line-height:25px; padding:5px 0px; float:left; background: url(/statics/member/images/zhuce1.gif) no-repeat 00px center;}
.zhucezliao dl dt.tip.error{ background: url(/statics/member/images/error.gif) no-repeat 00px center;}
.zhucezliao dl dt.tip.success{ height:20px; width:20px; right:10px; top:10px; background: url(/statics/member/images/zhuce3.gif) no-repeat center center;}
.zhucezliao dl dt.sendmsg{height:25px; line-height:25px; padding:5px 0px;}
.zhucezliao dl dt.tip.errorTip{ position:absolute; height:20px; width:20px; right:10px; top:10px; background: url(/statics/member/images/error.gif) no-repeat center center;}
#code_img{position:relative; top:-2px; margin-left:5px}
.df_list_banner_wper{ height:45px;background: none;}

#suc{
font-size: 25px;
}

#back{

height: 400px;

}
</style>
<script src="./resetPwd_files/validator.js"></script>
<script type="text/javascript">var _memberUrl="/member",_verifyUrl="/member-verify.shtml#divtab-1";</script>
<body>


<div class="block borderbox" style="">


            <div class="df_login_con ofh" id="back">
            	   
            	&nbsp;&nbsp;&nbsp;&nbsp;  
            	<c:if test="${action!=null&&action=='findPwd' }">
            	<font id="suc">修改密码成功,5秒后即将跳转到登录页面</font>
            	</c:if>
               
               <c:if test="${action!=null&&action=='register' }">
            	<font id="suc">恭喜您注册成功,5秒后即将跳转到登录页面</font>
               </c:if>
            </div>

</div>

<c:if test="${action!=null&&action=='register' }">
<script type="text/javascript">

$(function(){
	var i = 4;
    setInterval(function(){               
    if(i == 0) {
            location.href = "${pageContext.request.contextPath }/login.jsp";
        }
        $("#suc").text("恭喜您注册成功,"+i--+"秒后即将跳转到登录页面")
    },1000);
	
})

</script>

</c:if>



<c:if test="${action!=null&&action=='findPwd' }">
<script type="text/javascript">

$(function(){
	var i = 4;
    setInterval(function(){               
    if(i == 0) {
            location.href = "${pageContext.request.contextPath }/login.jsp";
        }
    
        $("#suc").text("修改密码成功,"+i--+"秒后即将跳转到登录页面")
    },1000);
	
})

</script>

</c:if>

</body>