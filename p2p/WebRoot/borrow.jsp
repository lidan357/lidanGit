<%@ page language="java" import="java.util.*,java.awt.Image,com.p2p.util.CheckCode" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'borrow.jsp' starting page</title>
    
	
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	
	
	
	
	<script type="text/javascript" src="/p2p/js/jquery-3.1.0.min.js"></script>
	<script type="text/javascript" src="/p2p/js/all.js"></script>
	<script type="text/javascript" src="/p2p/js/borrowCheck.js"></script>
	<script type="text/javascript" src="/p2p/js/borrowSubmit.js"></script>
		
	<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css" rel="stylesheet">
	<link href="/p2p/css/fileinput.min.css" media="all" rel="stylesheet" type="text/css" /> 
	<script src="/p2p/js/fileinput.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js" type="text/javascript"></script>
	
	<link rel="stylesheet" type="text/css" href="css/style.css">
	
	
	<link rel="stylesheet" type="text/css" href="/p2p/css/qq.css">
	<link rel="stylesheet" href="/p2p/css/remodal.css">
	<link rel="stylesheet" href="/p2p/css/remodal-default-theme.css">
	<script src="/p2p/js/remodal.min.js"></script>
	
	<style>
		.cue{
			font-family: "宋体";
			font-size: 12px;
			color: red;
			text-align: left;
			
		}
		
		.bor_det_oner .buyDate{
			width: 70px;
			height: 30px;
		}
		
		.bor_det_oner .goods{
			width: 220px;
		}
		
		.bor_det_oner .image_src{
			width: 220px;
			height: 30px;
			padding-right: 0px;
		}
		
		#loanMoney {
  background: url(/p2p/images/yuan.png) no-repeat scroll 215px center #ffffff;
}
 		#deadLine {
  background: url(/p2p/images/yue.png) no-repeat scroll 215px center #ffffff;
}		
	</style>


	<script>
	
			
	
	</script>

  </head>
  
  <body>
  <%@include file="/head.jsp" %>
 <div class="bor_banner01"></div>
    <div class="bor_con_wper">
	  <div class="bor_con px1000">
	  	    <div class="bor_detail">
	  	    	   <h2 class="bor_detail_tit" style="padding-left: 250px">
	  	    	   	  <span class="bor_decurspan">物品抵押</span>
	  	    	   	  <span>信用贷款</span>
	  	    	   	  <span>零首付车贷</span>
	  	    	   </h2>
	  	    	   <div class="bor_detail_box">
	  	    	   		<!-- 房产抵押 -->
	  	    	   	    <div class="bor_det_one clearfix pt30 pb30">
	  	    	   	    	  <div class="bor_det_onel fl">
	  	    	   	    	  	       <p class="bor_p1" style="color:black;">中兴财富平台的借款功能旨在帮助借款用户以
										低成本获得借款。用户在需要资金时，可以将
										自有房产和车产作为抵押物，小油菜线下审核
										通过后，根据抵押物的价值融资。</p>
										<p class="bor_p2"  style="color:black;">中兴财富平台的借款功能旨在帮助借款用户以
										低成本获得借款。用户在需要资金时，可以将
										自有房产和车产作为抵押物，小油菜线下审核
										通过后，根据抵押物的价值融资。</p>
										<h3 class="bor_onel_tit"><span>申请条件</span></h3>
										<ul class="bor_onel_ul">
											 <li><img src="images/bor_pic01.png" alt="">年满18周岁以上的公民
											 </li>
											 <li><img src="images/bor_pic02.png" alt="">需要北京房产或车产抵押
											 </li>
											 <li><img src="images/bor_pic03.png" alt="">个人或企业银行征信记录良好
											 </li>
											 <li><img src="images/bor_pic04.png" alt="">
											  无现有诉讼记录
											 </li>
											 
										</ul>
										<h3 class="bor_onel_tit"><span>提交资料</span></h3>
										<ul class="bor_onel_ul">
											 <li>&nbsp;<img src="images/bor_pic05.png" alt="">身份证
											 </li>
											 <li><img src="images/bor_pic06.png" alt="">申请资料
											 </li>
											 <li><img src="images/bor_pic07.png" alt="">其他
											 </li>
											
											 
										</ul>
	  	    	   	    	  </div>  
	  	    	   	    	  <!-- end l -->
	  	    	   	    	  <div class="bor_det_oner fl" style="width:630px">
	  	    	   	    	  	     <form enctype="multipart/form-data" action="borrow.action" method="post" id="myform" style="width:600px">
	  	    	   	    	  	     	  <fieldset>
	  	    	   	    	  	     	  	   <div>
	  	    	   	    	  	     	  	   	   <label style="font-family:宋体;color:rgba(23, 13, 13, 0.66);width:100px">申请人</label>
	  	    	   	    	  	     	  	   	   <input type="text" name="realName" id="realName">
	  	    	   	    	  	     	  	   	   <span class="cue" name="cue1" id="cue1" ></span>
	  	    	   	    	  	     	  	   </div>
	  	    	   	    	  	     	  	   <div class="mt15">
	  	    	   	    	  	     	  	   	   <label style="font-family:宋体;color:rgba(23, 13, 13, 0.66);width:100px">*借款金额</label>
	  	    	   	    	  	     	  	   	   <input type="" name="loanMoney" id="loanMoney" class="bor_inputbg01">
	  	    	   	    	  	     	  	   	   <span class="cue" name="cue2" id="cue2" ></span>
	  	    	   	    	  	     	  	   </div>
	  	    	   	    	  	     	  	   <div class="mt15">
	  	    	   	    	  	     	  	   	   <label style="font-family:宋体;color:rgba(23, 13, 13, 0.66);width:100px">*愿出利率</label>
	  	    	   	    	  	     	  	   	   <input type="" name="inter" id="inter" class="bor_inputbg01">
	  	    	   	    	  	     	  	   	   <span class="cue" name="cue3" id="cue3" ></span>
	  	    	   	    	  	     	  	   </div>
                                               <div class="mt15">
	  	    	   	    	  	     	  	   	   <label style="font-family:宋体;color:rgba(23, 13, 13, 0.66);width:100px">*借款期限</label>
	  	    	   	    	  	     	  	   	   <input type="" name="deadLine" id="deadLine" class="bor_inputbg02">
	  	    	   	    	  	     	  	   	   <span class="cue" name="cue4" id="cue4" ></span>
	  	    	   	    	  	     	  	   </div>
	  	    	   	    	  	     	  	   <div class="mt15">
	  	    	   	    	  	     	  	   	   <label style="font-family:宋体;color:rgba(23, 13, 13, 0.66);width:100px">*手机号码</label>
	  	    	   	    	  	     	  	   	   <input type="" name="phone" id="phone">
	  	    	   	    	  	     	  	   	   <span class="cue" name="cue5" id="cue5" ></span>
	  	    	   	    	  	     	  	   </div>
	  	    	   	    	  	     	  	   
	  	    	   	    	  	     	  	   <div class="mt15">
	  	    	   	    	  	     	  	   	   <label style="font-family:宋体;color:rgba(23, 13, 13, 0.66);width:100px">*抵押物</label>
	  	    	   	    	  	     	  	   	   <input type="radio" class="input3" name="morgoods" id="house" value="house" checked="checked">
	  	    	   	    	  	     	  	   	   房产
	  	    	   	    	  	     	  	  	   <input type="radio" class="input3" name="morgoods" id="car" value="car">
	  	    	   	    	  	     	  	   	   车辆 
	  	    	   	    	  	     	  	   </div>
	  	    	   	    	  	     	  	   
	  	    	   	    	  	     	  	   <div class="mt15 guarmethod clearfix">
	  	    	   	    	  	     	  	   	   <label class="guarmethod_l fl" style="font-family:宋体;color:rgba(23, 13, 13, 0.66);width:100px">*物品信息</label>
	  	    	   	    	  	     	  	   	   <div class="fl">     	  	
	  	    	   	    	  	     	  	   	   	  <span>购买时间</span>
	  	    	   	    	  	     	  	   	   	  
	  	    	   	    	  	     	  	   	   	  <select class="buyDate" name="year" id="year">
	  	    	   	    	  	     	  	   	   	  	<option value="1">年</option>
	  	    	   	    	  	     	  	   	   	  </select>
	  	    	   	    	  	     	  	   	   	  
	  	    	   	    	  	     	  	   	   	  <select class="buyDate" name="month" id="month">
	  	    	   	    	  	     	  	   	   	  	<option value="1">月</option>
	  	    	   	    	  	     	  	   	   	  </select>
	  	    	   	    	  	     	  	   	   	  
	  	    	   	    	  	     	  	   	   	  <select class="buyDate" name="day" id="day">
	  	    	   	    	  	     	  	   	   	  	<option value="1">日</option>
	  	    	   	    	  	     	  	   	   	  </select>
	  	    	   	    	  	     	  	   	   	  
	  	    	   	    	  	     	  	   	   	  <br>
	  	    	   	    	  	     	  	   	   	  <span>描述</span>
	  	    	   	    	  	     	  	   	   	  <textarea name="goods_descr" id="goods_descr" class="goods"></textarea><br>
	  	    	   	    	  	     	  	   	   	  <span>实物图</span>
	  	    	   	    	  	     	  	   	   	  
	  	    	   	    	  	     	  	   	   	  	<input type="file" name="image_src" id="image_src" class="file" data-preview-file-type="text" > 
	  	    	   	    	  	     	  	   	   	  	<!-- 原id名：input-id -->
	  	    	   	    	  	     	  	   	   	  
	  	    	   	    	  	     	  	   	   	 <!--  <input type="file" name="image_src" id="image_src" class="image_src" accept="image/gif, image/jpeg,image/x-png,image/x-ms-bmp"> -->
													  
													  <br>
													   
												   </div>
	  	    	   	    	  	     	  	   	   
	  	    	   	    	  	     	  	   </div>
	  	    	   	    	  	     	  	  
	  	    	   	    	  	     	  	    <div class="mt15">
	  	    	   	    	  	     	  	   	   <label style="font-family:宋体;color:rgba(23, 13, 13, 0.66);width:100px">*借款描述</label> 
	  	    	   	    	  	     	  	   	   <textarea name="loan_descr" id="loan_descr"></textarea>
	  	    	   	    	  	     	  	   	 
	  	    	   	    	  	     	  	   </div>
	  	    	   	    	  	     	  	   
	  	    	   	    	  	     	  	   
	  	    	   	    	  	     	  	   <div class="mt15" >
	  	    	   	    	  	     	  	   	   <label style="font-family:宋体;color:rgba(23, 13, 13, 0.66);width:100px">*验证码</label>
	  	    	   	    	  	     	  	   	   <input type="text" class="yanzheng" name="yanzheng" id="yanzheng" style="padding-right:50px">
	  	    	   	    	  	     	  	   	   <label style="width:5px"></label>
	  	    	   	    	  	     	  	   	   <!--   -->
	  	    	   	    	  	     	  	   	   <image alt="验证码看不清，换一张" src="${pageContext.request.contextPath}/checkCode.action?op=image" name="checkCode" id="checkCode" width="130px" height="38px"></image>
	  	    	   	    	  	     	  	   	   <span class="cue" name="cue6" id="cue6" ></span>
	  	    	   	    	  	     	  	   </div>
	  	    	   	    	  	     	  	   <div class="mt15" >
	  	    	   	    	  	     	  	   	   <label></label>
	  	    	   	    	  	     	  	   	   <a href="" name="borrowSubmit" id="borrowSubmit" class="bor_btn">提交材料</a>
	  	    	   	    	  	     	  	   </div>
	  	    	   	    	  	     	  </fieldset>
	  	    	   	    	  	     </form>
	  	    	   	    	  </div>
	  	    	   	    </div>
	  	    	   	    <!-- end 房产抵押 -->
	  	    	   	    
	  	    	   	    
	  	    	   	    
	  	    	   	    
	  	    	   	    <div class="bor_det_one" style="display:none;">
	  	    	   	    	 2
	  	    	   	    </div>
	  	    	   	    <!-- end  -->
	  	    	   	    <div class="bor_det_one" style="display:none;">
	  	    	   	    	 3
	  	    	   	    </div>
	  	    	   	    <!-- end  -->
	  	    	   </div>
	  	    </div>
	  </div>
</div>

<!-- qq咨询 -->
	<div class="zxcf_yc">
        <ul>

            <li class="">
            <a href="tencent://message/?&uin=1187290881&site=qq&menu=no" class="zx_a1"></a>
            </li>
            <hr style="margin: 0;padding: 0;color: white"  />
            <li class="">
                <a  class="zx_a2" target="_blank"  href="http://shang.qq.com/wpa/qunwpa?idkey=f7639e51f404af626cedfe8925279e95696515feb0d7cdff8da91e42fbe5ba74"></a>
            </li>
            <hr style="margin: 0;padding: 0;color: white"  />
            <li class="">
                <a class="zx_a3" href="#modal" ></a>
            </li>
        </ul>
    </div>
	
	<div class="remodal" data-remodal-id="modal">
	  <button data-remodal-action="close" class="remodal-close"></button>
	  <img alt="二维码" src="/p2p/images/QRgroup.png">
	 
	  <br>
	  <button data-remodal-action="cancel" class="remodal-cancel">Cancel</button>
	  <button data-remodal-action="confirm" class="remodal-confirm">OK</button>
	</div>
	
<!-- qq咨询end -->
  </body>
</html>
