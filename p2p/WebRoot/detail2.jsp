<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%


String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!-- author chenyong -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0050)https://www.whzxcf.com/invest-borrow-id-2827.shtml -->
<html xmlns="http://www.w3.org/1999/xhtml"><style type="text/css" id="3502098850"></style><head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta name="baidu-site-verification" content="hN9qyeWx20"/>
<meta name="baidu-site-verification" content="1fc1744a879ca4c2b5d2731db47080a9"/>
<link href="./detail_files/style.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/style.css"/>
<link href="./detail_files/newstyle.css" rel="stylesheet"/>

<script src="./detail_files/hm.js"></script><script type="text/javascript">



//全局变量


</script>

<script src="./detail_files/jquery.js"></script>
<script src="./detail_files/common.js"></script>
<script src="./detail_files/highcharts.js"></script>
<script src="./detail_files/jquery.totemticker.js"></script>


<!--tipBOx-->

<link type="text/css" rel="stylesheet" href="./detail_files/colorbox.css">
<link rel="shortcut icon" href="https://www.whzxcf.com/statics/home/images/favicon.ico" type="image/x-icon">
<script src="./detail_files/jquery.colorbox.js"></script>
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
     
     var $date = ($("#rel_date").text())
    count_down($date.substring(6,$date.length)+" 00:00:00");
})

function count_down(o){

        var datatime=/^[\d]{4}-[\d]{1,2}-[\d]{1,2}( [\d]{1,2}:[\d]{1,2}(:[\d]{1,2})?)?$/ig,str='',conn,s;
        if(!o.match(datatime)){
                alert('参数格式为2020-01-01[ 01:01[:01]].\r其中[]内的内容可省略');
                return false;
        }
        var sec=(new Date(o.replace(/-/ig,'/')).getTime()+7*24*60*60*1000 - new Date().getTime())/1000;
       // alert("sec: "+sec);
        if(sec > 0){
                conn='还有';
        }else{
                conn='已过去';
                //sec*=-1;
        }
        s={'天':sec/24/3600,'小时':sec/3600%24,'分':sec/60%60,'秒':sec%60};
        for(i in s){
                if(Math.floor(s[i])>0 ) str += Math.floor(s[i]) + i;
        }
        if(Math.floor(sec)==0){ str='0秒'; }
    		if(sec>0){
    			
	       		$(".loan_time").text(str);
	        	setTimeout(function(){count_down(o)},1000);
    		}else{
    			$(".loan_time").text("已过期");
    		}
}
</script>
<script src="./detail_files/layer.js"></script>
<link type="text/css" rel="stylesheet" href="./detail_files/layer.css" id="skinlayercss">
<script src="./detail_files/common(1).js"></script>

<!--tipBOx-->


<title>【武汉】房产周转40万第3标10万-中兴财富</title>
<meta http-equiv="keywords" content="p2p投资理财,小额投资理财,个人投资理财,网上理财,网络理财,网络投资,互联网投资,家庭理财,存钱理财">
<meta http-equiv="description" content="中兴财富是武汉知名P2P网络贷款投资理财平台。网上投资理财50元起投,年化收益平均可达17%,29道极致风控工序,100%本息担保,提供安全、高收益、灵活的投资项目。">
<script type="text/javascript" src="./detail_files/jquery.imageScroller.js"></script>
<script type="text/javascript" src="./detail_files/all.js"></script>
<script src="./detail_files/ScrollPic.js" type="text/javascript"></script>
<script>
function dd(){
  alert('dsdsd');
}
</script>
<style type="text/css">
.iconbox {
	margin-right: 0px;
	position: relative;
	top: -2px;
	margin-left: 10px;
}
</style>
<style>
.pc-aqbz{
    margin-top: 28px;
    margin-bottom: 9px;
    font-size: 15px;
    font-weight: 700;
    line-height: 15px;
    border-left: 2px solid #ff7112;
    text-indent: 8px;
	}
.pc-aqbz1{
    margin-top: 28px;
    margin-bottom: 9px;
    font-size: 15px;
    font-weight: 700;
	line-height: 15px;
    text-indent: 8px;
	}
.pc-rel{
    position: relative;
}
.pc-aqbznr{  
    margin: 0;
    padding: 0;
	}
.pc-aqbznr p {
    text-indent: 2em;
}
.pc-fxdj{padding: 0px 10px;
    height: 30px;
    line-height: 30px;
    border: 3px #fc9542 solid;
    border-radius: 8px;
    margin-right: 20px;
    color: #fc9542;
    cursor: pointer;}
.pc_proone_tit{    
    height: 40px;
    background-color: #f9f9fb;
    color: #ff7112;
    font-size: 14px;
    padding-left: 15px;
    border-radius: 5px;
    line-height: 40px;
	margin-top: 10px;}
.detail_intro{ /*padding:30px 40px 0;*/ background:#fff; border:1px solid #e0e0e0; }
#nzx_nbox ul li span{ width:80px; }
.dit{ line-height:25px; }
.fuwuxy h4{ font-size:20px; text-align:center; font-weight:bold; color:#333; margin:30px 0 30px; }
.text_r{ text-align:right; }
.fuwuxy h5{ font-size:15px; margin:15px 0 10px; font-weight:bold; }
#cboxTitle{ padding-left:20px; }


</style>
</head>
<body>
<%@ include file="head.jsp" %>
<script>

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

<div class="in-pos disN" style="top: 100px;"> </div>
<div class="tc disN" style="top: 110px;">
  <!--<a href="#" id="close"></a>-->
  <div class="in-IMG">
    <div class="in-IMG_txt">
      <h3>服务协议<a href="https://www.whzxcf.com/invest-borrow-id-2827.shtml#" id="close"></a></h3>
    
    </div>
  </div>
</div>
<script>
$(function(){
    $('#nzx_open').click(function(){
	   $(".in-pos").show();
	   $(".tc").show();
	})
    $(window).on("scroll", function () {
        $(".tc").stop(true).animate({"top": $(window).scrollTop()+10 });
        $(".in-pos").stop(true).animate({"top": $(window).scrollTop()});
    });	
	
	$("#close").click(function(){
                $(".tc").css('display','none');
                $(".in-pos").css('display','none');
	});
});
</script>
<div class="zxcf_detail_wper">
  <div class="zxcf_detail px1200">
    <div class="detail_intro clearfix">
      <div class="detail_intro_l fl">
        <div class="detail_introl_tit clearfix">
          <div class="det_introl_tit_l clearfix fl">
            <div class="dit"> <a href="https://www.whzxcf.com/invest-borrow-id-2827.shtml#" title="【武汉】房产周转40万第3标10万" class="fl">【武汉】房产周转40万第3标1…</a>&nbsp;&nbsp;
              <!--还款方式-->
                              <img src="./detail_files/xxhb.png" class="fl ml5">              <!--体验标-->
                            &nbsp;&nbsp;
              <!--红包-->
              <img src="./detail_files/cmm_type3.png" class="fl ml5">              &nbsp;&nbsp;
              <!--投标方式-->
              <!--<img src="/statics/home/images/borrowico/cm_auto.png" class="fl ml5" />
            -->
              &nbsp;&nbsp;&nbsp;
              <div class="fl ml10 zxreward" id="zxrd_box" style="font-size:14px;">加息奖励：<span class="zm_m">0.2%~1.5%</span>
                <div class="zxrd_box disN" style="z-index: 99999; display: none;" id="nzx_nbox">
                  <ul>
                    <li><span>VIP3</span><span class="zm_m">+0.2%</span></li>
                    <li><span>VIP4</span><span class="zm_m">+0.35%</span></li>
                    <li><span>VIP5</span><span class="zm_m">+0.5%</span></li>
                    <li><span>金账户</span><span class="zm_m">+1%</span></li>
                    <li><span>白金账户</span><span class="zm_m">+1.2%</span></li>
                    <li><span>钻石账户</span><span class="zm_m">+1.5%</span></li>
                   <!-- <li><span style="color:#ff7512; ">活动全场加息</span><span class="zm_m" style="color:#ff7512; ">+2.00%</span></li>-->
                  </ul>
                </div>
              </div>
            </div>
          </div>
          <!-- end l -->
          <div class="det_introl_tit_r fr">
            <!-- <font color="#33BF35">即投即计息</font>-->
          </div>
        </div>
		<style>
		.nzx_jx{ width:57px; height:21px; background:url(/statics/home/images/borrowico/jx.png) no-repeat left top; }
		.nzx_jx p{ line-height:18px; vertical-align:middle; font-size:13px; color:#fff; width:57px; text-align:center; }
		</style>
        <!-- end tit -->
        <div class="det_intro_text">
          <ul class="det_intro_tul clearfix">
            <li style="position:relative; width:270px; "> 
			 
			 预期年化收益<br>
              <span class="clearfix" style="color:#ff7112;"> 
			  
			    <span class="fl">
				  <strong style="color:#ff7512;">
				<fmt:formatNumber type="number" value="${(loan.inter)*100 }	" pattern="0.0" maxFractionDigits="1"/>  
					  </strong>
				</span>
				<span class="fl" style="margin-left:10px; margin-top:24px; position:relative;">
			
			<div class="nzx_jx">
			    <p>加息2%</p>
			  </div> 
			  			   <span style="color:#ff7512; width:100px; position:absolute; bottom:-22px;   ">  
				  					%年利率				  </span>
				  	
				</span>
				  
              </span> </li>
            <li> 项目期限<br>
              <span> <strong class="borrow_duration">${loan.deadLine }</strong>个月 </span> </li>
            <li> 项目规模<br>
              <span> <strong>${loan.loanMoney/10000 }</strong></span>万</li>
          </ul>
          <!-- end  -->
          <ul class="det_intro_tul2 clearfix">
            <li style="line-height:30px; " id="rel_date"> 发布日期：${loan.loanDate }</li>
            <li style="line-height:30px; ">
                                        </li>
            <li style="line-height:30px; "> 标号：<span class="one" id="lid">${loan.loanID }</span></li>
            <li style="line-height:30px; ">起息日期：投资成功当日起计息</li>
            <%-- <li style="line-height:30px; ">开标时间：${loan.loanDate }</li> --%>
            <li style="line-height:30px; ">计息方式：按日计息</li>
            <li style="line-height:30px; ">
                              剩余投标时间：<font class="loan_time"></font>            </li>
          </ul>
        </div>
        <!-- end text -->
      </div>
      <div class="detail_intro_r fr" style=" padding-bottom:35px; position:relative; ">
                <h2 class="det_intro_h2 clearfix"><span class="fl">投资进度:</span><em class="fr" > <fmt:formatNumber type="number" value="${loan.curMoney/loan.loanMoney*100}" pattern="0.0" maxFractionDigits="1"/>  %</em></h2>
        <div class="jklb_press_wper">
          <div class="jklb_press" style="width:${loan.curMoney/loan.loanMoney*100}%"> </div>
        </div>
        <!--  -->
        <p class="det_rzye clearfix"><span class="fl">可投金额</span><em class="fr"><strong>￥</strong><strong id="able_money"> ${loan.loanMoney-loan.curMoney}</strong></em></p>
        <p class="det_input">
          <input type="text" placeholder="可流转份数56832份" name="num" id="num" value="" onblur="showEarn();" style="background:none;">
        </p>
        <p class="det_shouyi mt30" style="text-align:center; ">赚取的收益：<strong> <span class="t_i_earn">0</span> 元</strong></p>
        <!--         -->
        <p>
                      <a class="pro_btn det_btn" href="javascript:;"  style="display:block;" id="now_invest">立即投资</a>        </p>
      </div>
    </div>
    <!-- end block1 -->
    <div class="detail_con mt10">
      <h2 class="detail_con_tit clearfix"> <span class="det_tit_curspan">项目描述</span>
        <!--<span>风险控制</span>-->
        <span class="">还款计划</span> <span class="">投标记录<i>5</i></span> </h2>
      <div class="det_con_box">
        <div class="det_con_proone clearfix">
          <div class="det_l_box fl">
            <div class="det_proone_l" style="display: block;">
              <h2 class="det_proone_tit">基本信息</h2>
              <div class="det_clsj cmm_per_info">
                <ul>
                  <li> <span class="cmm_per_lf">用户名&nbsp;：&nbsp;</span> <span>${lUserinfo.userName}</span> </li>
                  <li> <span class="cmm_per_lf">性别&nbsp;：&nbsp;</span> <span>${lUserinfo.sex}</span> </li>
                  <li> <span class="cmm_per_lf">年龄&nbsp;：&nbsp;</span> <span>${lUserinfo.age}</span> </li>
                <%--   <li> <span class="cmm_per_lf">婚姻状况&nbsp;：&nbsp;</span> <span>${lUser.userName}</span> </li> --%>
                  <li> <span class="cmm_per_lf">月收入&nbsp;：&nbsp;</span> <span>${lUserinfo.monthInco}</span> </li>
                  
				  <li> <span class="cmm_per_lf">学历&nbsp;：&nbsp;</span> <span>${lUserinfo.eduExp}</span> </li>
                  
				  <li> <span class="cmm_per_lf">职业&nbsp;：&nbsp;</span> <span>${lUserinfo.job}</span> </li>
                  
				 <%--  <li> <span class="cmm_per_lf">公司行业&nbsp;：&nbsp;</span> <span>${lUserinfo.userName}</span> </li> --%>
                 
				  <%-- <li> <span class="cmm_per_lf">住房条件&nbsp;：&nbsp;</span> <span>${lUser.userName}</span> </li>
                  <li> <span class="cmm_per_lf">是否购车&nbsp;：&nbsp;</span> <span>${lUser.userName}</span> </li>
              --%>  
               </ul>
              </div>
              <!--  <h2 class="det_proone_tit mt30">项目描述</h2>-->
              <div class=""> <h2 class="det_proone_tit" style="font-family:微软雅黑, 宋体;">项目描述</h2>
              <div class="det_clsj cmm_per_info" style="font-family:微软雅黑, 宋体;">
              <p style="margin-top:0px;margin-bottom:0px;">${loan.descr }<span style="color:#959595;font-family:微软雅黑, 宋体;font-size:14px;line-height:30px;">
				</p>
              <p style="margin-top:0px;margin-bottom:0px;">现发第4~9个月。</p>
              <p style="margin-top:0px;margin-bottom:0px;">（借款人房产已做相关公证手续。）（此项目由武汉黑羊投资担保有限公司提供担保）</p>
              </div><h2 class="det_proone_tit" style="font-family:微软雅黑, 宋体;">借款用途</h2>
              <div class="det_clsj cmm_per_info" sizcache0826269753770295="9.0.34" sizset="false" style="font-family:微软雅黑, 宋体;"><ul sizcache0826269753770295="9.0.34" sizset="false" style="width:725px;">
              <li><p style="margin-top:0px;margin-bottom:0px;">用于经营资金周转。</p></li></ul>
              </div>
              <h2 class="det_proone_tit" style="font-family:微软雅黑, 宋体;">提供材料</h2>
              <div class="det_clsj cmm_per_info" style="font-family:微软雅黑, 宋体;"><p style="margin-top:0px;margin-bottom:0px;">借款人的身份证，户口本，结婚证，房产两证，公证书，公证发票，委托书。</p></div>
              
              
              <h2 class="det_proone_tit" style="font-family:微软雅黑, 宋体;">还款来源</h2><div class="det_clsj cmm_per_info" style="font-family:微软雅黑, 宋体;"><p style="margin-top:0px;margin-bottom:0px;">借款人的经营收入。</p></div>
              <h2 class="det_proone_tit" style="font-family:微软雅黑, 宋体;">保障方式</h2>
              <div class="det_clsj cmm_per_info" style="font-family:微软雅黑, 宋体;"><p style="margin-top:0px;margin-bottom:0px;">1.平台已对公司及住房，经营项目进行实地考察，通过专业尽调认为可保障本息按时还款。</p>
              <p style="margin-top:0px;margin-bottom:0px;">2.借款人名下房产做公证抵押。</p></div><p></p> </div>
              <!-- <h2 class="det_proone_tit mt30">项目审核记录</h2>-->
              <div class="det_clsj" style="padding:0px 0 0 10px;">
                <table class="det_table">
                  <tbody><tr class="det_table_head" style="height:40px; background:none;"></tr>
                  <!-- <tr><td colspan="3" style=" text-align:center;color:#F00;">暂时还没有通过审核</td></tr>-->
                                    </tbody></table>
              </div>
            </div>
            <!-- end 项目描述 -->
            <!-- end fk -->
            <div class="det_proone_l" style="display: none;">
              <h2 class="det_proone_tit">还款计划</h2>
              <div class="pl20 pr20 pt20">
                <table class="dhgl_table">
                  <tbody><tr style="border-bottom:none;">
                    <th>                        预还款时间</th>
                    <th>还款利息</th>
                    <th>还款本金</th>
                  </tr>
                  	 <c:forEach items="${interest}" var="in" >
	  	     	   	            	 	  <tr>
	  	     	   	            	 	 	  <td>${in.reInterDate }</td>
	  	     	   	            	 	 	  <td>￥ ${in.reMonRe }元</td>
	  	     	   	            	 	 	  <td>￥ 0.00</td>
	  	     	   	            	 	 </tr>
	  	     	   	            	 	 </c:forEach>
                           </tbody></table>
              </div>
            </div>
            <!-- end dhgl -->
            <div class="det_proone_l" style="display: none;">
              <!--首尾投奖-->
                            <!--首尾投奖-->
              <p class="det_tbjl_tit"> <span class="mr30"><img src="./detail_files/det_tbjl_pic01.png" alt=""> 目前总金额：￥  ${loan.curMoney }</span>
               <span><img src="./detail_files/det_tbjl_pic02.png" alt=""> 剩余金额：￥ ${loan.loanMoney-loan.curMoney }</span> </p>
              <table class="det_table">
                <tbody><tr class="det_table_head" style="height:40px;">
                  <td>投资用户</td>
                  <td>投资金额</td>
                  <td class="det_w1160">投资时间</td>
                  <td>投标方式</td>
                </tr>
                	<c:forEach items="${invests}" var="inv">
                			<% request.setAttribute("flag", 0); %>
                					<c:forEach items="${iUsers }" var="iu" >
                						<c:if test="${inv.userID==iu.userID &&flag==0}">
		                			<% request.setAttribute("flag", 1) ;%>
                						<tr>
					                      <td>${iu.userName}</td>
					                      <td>￥ ${inv.invMoney }</td>
					                      <td>${inv.invDate }</td>
					                      <td> PC</td>
				                       </tr>
                						</c:if>
                					
                					</c:forEach>
                					
                	</c:forEach>
                            <tr>
                  <td colspan="3" style=" text-align:center;"></td>
                </tr>
              </tbody></table>
            </div>
            <!-- end tbjl -->
          </div>
          <!-- end l -->
          <div class="det_proone_r fl">
          <!--   <style>
			 .nzx_app{ width:335px; height:198px; position:relative; background:url(/statics/home/images/borrowico/app.png) no-repeat left top;  }
			 .az{ display:block; padding-left:40px; position:absolute; left:162px; line-height:35px; font-size:14px; color:#fff; vertical-align:middle; text-align:center; top:53px; width:88px; height:35px; background:url(/statics/home/images/borrowico/az.png) no-repeat left top; }
			 .az:hover{ color:#fff; }
			 .ios{ display:block; padding-left:40px; position:absolute; left:162px; top:101px; line-height:35px; font-size:14px; color:#fff; text-align:center; vertical-align:middle; width:88px; height:35px; background:url(/statics/home/images/borrowico/ios.png) no-repeat left top; }
			 .ios:hover{ color:#fff; }
			</style> 
            <div class="nzx_app"> <a href="http://www.whzxcf.com/statics/home/images/activity/app/whzxcf2016.apk" class="az">Android</a> <a href="https://itunes.apple.com/us/app/zhong-xing-cai-fu/id1071272290?mt=8" class="ios">iOS</a> </div>
			-->
						  <div class="">
			     <h2>借款人图片资料：</h2>
			      <c:choose>
				   <c:when test="${user!=null }">  
				   			身份证照片：<img src="${idCard.cardPic }" height="100" width="200" alt="" />
				   		<br/>	抵押物照片：<img src="${morGoods.realPic }" height="100" width="200" alt="" />
				   </c:when>
				   <c:otherwise> 
					    <div class="" style=" width:275px; border-radius:5px; padding:20px 30px; border:1px solid #ffb422; margin-top:20px; ">
					   <h3 style="padding:5px 0 10px; ">温馨提示：</h3>
					   <p style=" font-size:14px;">您还没登陆，请先<a href="${pageContext.request.contextPath }/login.jsp" style=" color:#ffb422;">登陆</a>，登陆认证后可以查看打款记录、借款合同、抵押物详情、相关证件资料。</p>
					 </div>
				   </c:otherwise>
			</c:choose>
				
			  </div>			
			
			
			
			
          </div>
          <!-- end r -->
        </div>
        <!-- end 项目描述 -->
      </div>
    </div>
    <!-- end block2 -->
    <!-- 用户评论开始 -->
    
     <div class="det_comment mt30">
	  	     	   <h2 class="det_comment_tit">用户评论</h2>
	  	     	   <div class="det_comment_text clearfix">
	  	     	   	   <div class="comment_l fl pl30">
	  	     	   	   	   <img src="${user.userIconAddr }" width="80px" height="80px" />
	  	     	   	   </div>
	  	     	   	   <!-- end l -->
	  	     	   	   <div class="comment_r fl ml20">
	  	     	   	   	   <textarea name="" placeholder="一个用户只能评论一次" id="comment" cols="30" rows="10"></textarea>
	  	     	   	   </div>
	  	     	   	   <!-- end r -->
	  	     	   </div>
	  	     	   <div class="comment_btn clearfix">
	  	     	   	   <a href=javascript:;" class="det_btn" id="subComm">提交</a>
	  	     	   </div>
	  	     	   <div class="comment_show">
	  	     	   	     <ul class="comment_show_ul">
	  	     	   	     <c:forEach items="${loanComms }" var="comm">
			  	     	   	     	 <li class="clearfix">
			  	     	   	     	 <span class="fl mr30">
	  	     	   	     		<c:forEach items="${commUsers }" var="cuser">
			  	     	   	     	 <c:if test="${comm.userID==cuser.userID }">
				  	     	   	     	   <img src="${cuser.userIconAddr}"  height="50px" width="50px" />	
			  	     	   	     	 </c:if>
			  	     	   	     	 </c:forEach>
				  	     	   	     	 </span>
				  	     	   	     	 <div class="fl ml">
				  	     	   	     	 	  <h3>${comm.comContent}</h3>
				  	     	   	     	 	  <p>${comm.comDate }</p>
				  	     	   	     	 </div>
				  	     	   	     	 </li>
	  	     	   	     	 </c:forEach>
	  	     	   	     </ul>
	  	     	   </div>
	  	     </div>
    <!-- 用户评结束 -->
  </div>
</div>
<script type="text/javascript">
$(function(){
	$("#subComm").click(function(){
		var $com = $("#comment");
		var $lid = $("#lid").text();
		jQuery.ajax({
			type:"POST",
		      url: "loanComment.action",
		       data: {op:"addComm",content:$com.val(),lid:$lid},
		       dataType: "json",
		       async: false,
		       success: function(data) { }
		   });
		
		window.location.reload();
	})
	
	$("#comment").click(function(){
		$("#comment").attr("placeholder","");
		
	})
	
})





</script>
<!-- 投资对话框 -->


<style type="text/css"> 
* {margin:0;padding:0;font-size:12px;} 
html,body {height:100%;width:100%;} 
#content {background:#f8f8f8;padding:30px;height:100%;} 
#content a {font-size:30px;color:#ffb422;font-weight:700;} 
#alert {border:1px solid #ffb422;width:450px;
		height:400px;
		background:white;
		z-index:1000;
		position:absolute;display:none;} 
#alert h4 {height:20px;background:#ffb422;color:#fff;padding:5px 0 0 5px;} 
#alert h4 span {float:left;
				font-family:"微软雅黑";} 
#alert h4 span#close {margin-left:210px;font-weight:500;cursor:pointer;} 
#alert p {padding:12px 0 0 30px;} 
#alert p input {width:120px;margin-left:20px;} 
#alert p label {font-family:"微软雅黑";
				position:relative;
				top:45px;
				color:black;
				}
#alert p.inp {	
	
	left:-10px;	


}
#alert p input.myinp { width: 263px;
    border: 1px solid #cccccc;
    border-radius: 5px;
    outline: none;
    line-height: 10px;
    padding-left:10px;
    height: 40px;
    font-size: 14px;
	margin-top:30px;
	position:relative;
	top:30px;} 
	
#alert p input.sub { width: 295px;
	height: 45px;
    background-color: #ffb422;
	position:relative;
    text-align: center;
    line-height: 45px;
    color: #fff;
    font-size: 16px;
    display: inline-block;
    margin-top: 60px;
    margin-left:50px;
	border-radius: 5px;
	border:none;
	font-family:"微软雅黑";
	
	} 


</style>
 
<div id="alert"> 
<h4><span>投资</span>
<p class="inp"><label>投资金额</label>
<input type="text" id="money" class="myinp" onmouseover="this.style.border='1px solid #f60'" onfocus="this.style.border='1px solid #f60'" onblur="this.style.border='1px solid #ccc'" /></p> 
<p class="inp"><label>支付密码</label>
<input type="password" id="password" class="myinp" onmouseover="this.style.border='1px solid #f60'" onfocus="this.style.border='1px solid #f60'" onblur="this.style.border='1px solid #ccc'" />
</p> 
<p><input type="submit" value="立即投资" class="sub" id="sub" /></p> 
<p><input type="submit" value="取消" class="sub" id="clo_sub" style="margin-top:20px"/></p> 
</div> 
<script type="text/javascript"> 
var myAlert = document.getElementById("alert"); 
var moneyIsRight= false;
var passwordIsRight = false;
$(function(){
	var $dia = $("#alert");
	var $sub = $("#sub");
	$("#now_invest").click(function(){
		myAlert.style.display = "block"; 
		myAlert.style.position = "fixed"; 
	//	myAlert.style.*position = "absolute"; 
		myAlert.style.top = "30%"; 
		myAlert.style.left = "40%"; 
		myAlert.style.marginTop = "-75px"; 
		myAlert.style.marginLeft = "-200px";

		mybg = document.createElement("div"); 
		mybg.setAttribute("id","mybg"); 
		mybg.style.background = "#000"; 
		mybg.style.width = "100%"; 
		mybg.style.height = "100%"; 
		mybg.style.position = "absolute"; 
		mybg.style.top = "0"; 
		mybg.style.left = "0"; 
		mybg.style.zIndex = "500"; 
		mybg.style.opacity = "0.3"; 
		mybg.style.filter = "Alpha(opacity=30)"; 
		document.body.appendChild(mybg);

		document.body.style.overflow = "hidden"; 
	});
	
	
	$sub.click(function(){
		if($(".loan_time").text()=="已过期"){
			alert("已过期")
		}
		checkInput();
		if(!passwordIsRight){
			return;
		}
		jQuery.ajax({
		      url: "password.action",
		       data: {op:"checkPwd",password:$("#password").val()},
		       dataType: "json",
		       async: false,
		       success: function(data) { 
		    	   if(data=="0"){
		    		   alert("密码不正确")
		    		   passwordIsRight=false;
		    	   }else if(data=="1"){
		    		   passwordIsRight=true;
		    	   }
		       }
	})
	if(!passwordIsRight){
		return;
	}
		
		myAlert.style.display = "none"; 
		mybg.style.display = "none"; 

		jQuery.ajax({
		      url: "invest.action",
		       data: {op:"invest",money:$("#money").val(),loanId:$("#lid").text()},
		       dataType: "json",
		       async: false,
		       success: function(data) { 
		    	   if(data=="0"){
		    		   alert("投资失败，请重新尝试")
		    	   }else if(data=="1"){
						alert("投资成功")
		    	   }
		       }
	})
	
	window.location.reload();
	
	});
	
	
	
	$("#clo_sub").click(function(){
		myAlert.style.display = "none"; 
		mybg.style.display = "none"; 
		window.location.reload();
	})
	
});

function checkInput(){
	if($("#money").val()==""){
		alert("请输入投资金额");
		return;
	}else if(isNaN($("#money").val())){
		alert("投资金额是数字")
		return;
	}else if(Number($("#money").val())>Number($("#able_money").text())){
		alert("投资金额大于可投金额")
		return;
	}
		
	else{
		moneyIsRight=true;
	}
	
	if($("#password").val()==""){
		alert("请输入密码")
		return;
	}else if(!$("#password").val().match(/^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{8,16}$/)){
	alert("密码只能是8-16位数字和字母的组合");
	 }else{
		passwordIsRight=true;
	}
}

</script> 


<!--footer -->
<div class="footer" style=" background:#35393b; color:ccc; padding:0; ">
  <div class="footer-link">
    <div class="footer-link-items mb50 clearfix" style="padding-top:50px; width:1000px; ">
      <dl class="footer-link-item">
        <dt><span class="fico fico1"></span>帮助中心</dt>
        <dd><a href="https://www.whzxcf.com/page-userguide.shtml">新手指引</a></dd>
        <dd><a href="https://www.whzxcf.com/cjwt-index.shtml">常见问题</a></dd>
        <dd><a href="https://www.whzxcf.com/member-login-index.shtml">注册登录</a></dd>
      </dl>
      <dl class="footer-link-item">
        <dt><span class="fico fico2"></span>理财相关</dt>
        <dd><a href="https://www.whzxcf.com/invest-index.shtml">理财列表</a></dd>
        <dd><a href="https://www.whzxcf.com/page-plecharge.shtml">收费标准</a></dd>
        <dd><a href="https://www.whzxcf.com/tool-index.shtml">小工具箱</a></dd>
      </dl>
      <dl class="footer-link-item">
        <dt><span class="fico fico3"></span>诚信安全</dt>
        <dd><a href="https://www.whzxcf.com/guide-safe.shtml">安全保障</a></dd>
        <dd><a href="https://www.whzxcf.com/financial-index.shtml">实时财务</a></dd>
        <dd><a href="https://www.whzxcf.com/page-about.shtml#hzhb">合作伙伴</a></dd>
      </dl>
      <dl class="footer-link-item">
        <dt><span class="fico fico4"></span>关于我们</dt>
        <dd><a href="https://www.whzxcf.com/page-about.shtml#gltd">管理团队</a></dd>
        <dd><a href="https://www.whzxcf.com/page-about.shtml#zxns">招贤纳士</a></dd>
        <dd><a href="https://www.whzxcf.com/page-about.shtml#lxwm">联系我们</a></dd>
      </dl>
      <dl class="footer-link-item" id="weixin" style=" width:91px; margin-top:5px; margin-left:40px; ">
        <dd> <img src="./detail_files/wei1.png" width="91px;" height="91px;"> <span><br>
          微信理财:hbzxcf</span> </dd>
      </dl>
      <dl class="footer-link-item" id="weixin" style="width:91px; margin-left:45px; margin-top:5px; margin-right:60px">
        <dd> <img src="./detail_files/wei2.png" width="91px;" height="91px;"> <span style=" display:block; height:8px; vertical-align:middle; line-height:8px; text-align:center "><br>
          移动客户端下载</span> </dd>
      </dl>
      <dl class="footer-link-item" id="weixin" style="width:auto; ">
        <dt style="margin:0;"><span class="fico fico4"></span>服务热线<span style="color:#7f7f7f; ">( 08:30-17:30 )</span></dt>
        <dd style="font-size:30px; color:#ff7512; line-height:40px; vertical-align:middle; ">400-027-0101</dd>
        <dd>客服邮箱:kefu@whzxcf.com</dd>
        <dd>官方QQ交流群：422940552</dd>
      </dl>
    </div>
  </div>
  <div class="footer-copyright" style="background:#5d6163; color:#b8b8b8; padding-top:30px; "></div>
</div>
<!--footer-->
<div class="zxcf_yc">
  <ul>
    <!--<li><a href="http://www.zhongxincaifu.com/" class="zx_a1"></a></li>-->
    <li class="">
	  <a href="http://crm2.qq.com/page/portalpage/wpa.php?uin=4000270101&f=1&ty=1&aty=0&a=&from=6" class="zx_a2"></a>	  
      <div class="nzx_qq">
	    <div class="nzx_qq_con">
		  <div class="nzx_qq_online clearfix">
		    <span class="fl">在线客服QQ：</span>
			<a class="fl" href="http://crm2.qq.com/page/portalpage/wpa.php?uin=4000270101&f=1&ty=1&aty=0&a=&from=6">
			  <img src="./detail_files/nzx_qq_online.png" width="74" height="22"></a>
			
		  </div>
		  <div class="nzx_qq_quan" id="nzx_qq_quan">
		    <p class="clearfix"><span class="fl">投资交流群：</span><a href="http://shang.qq.com/wpa/qunwpa?idkey=6c9bc1d6489dfd787541c466413abe8989c900544a319bd58a64edca88678b14" class="fl">422940552</a></p>
		    <p class="clearfix"><span class="fl">投资VIP群：</span><a href="http://shang.qq.com/wpa/qunwpa?idkey=d194e536c81ae66d7da7d17b7b6a7054972df5ee510a63bf08d99ce3c3871bc2" class="fl">223638794</a></p>		    
		  </div>
		</div>	  
	  </div>
	</li>
    <li id="zx_a3"><a href="" class="zx_a3" style="left:-130px; "></a>
      <div class="zxTel0"><img src="./detail_files/zxTel0.png" width="130" height="41"></div>
    </li>
    <li><a href="http://www.whzxcf.com/tool" class="zx_a4"></a></li>
    <!--<li><a href="/football" class="zx_a6" title="我要踢球"></a></li>-->
    <!--<li><a href="/football" class="zx_a5" title="我要抽奖"></a></li>-->
  </ul>
</div>
<div id="cboxOverlay" style="display: none;"></div><div id="colorbox" class="" role="dialog" tabindex="-1" style="display: none;"><div id="cboxWrapper"><div><div id="cboxTopLeft" style="float: left;"></div><div id="cboxTopCenter" style="float: left;"></div><div id="cboxTopRight" style="float: left;"></div></div><div style="clear: left;"><div id="cboxMiddleLeft" style="float: left;"></div><div id="cboxContent" style="float: left;"><div id="cboxTitle" style="float: left;"></div><div id="cboxCurrent" style="float: left;"></div><button type="button" id="cboxPrevious"></button><button type="button" id="cboxNext"></button><button id="cboxSlideshow"></button><div id="cboxLoadingOverlay" style="float: left;"></div><div id="cboxLoadingGraphic" style="float: left;"></div><button type="button" id="cboxClose"></button></div><div id="cboxMiddleRight" style="float: left;"></div></div><div style="clear: left;"><div id="cboxBottomLeft" style="float: left;"></div><div id="cboxBottomCenter" style="float: left;"></div><div id="cboxBottomRight" style="float: left;"></div></div></div><div style="position: absolute; width: 9999px; visibility: hidden; display: none;"></div></div>

</body>


</html>