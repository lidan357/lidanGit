<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%-- <%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%> --%>
<%@taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
	<title>invest</title>
<link rel="stylesheet" type="text/css" href="/p2p/css/style.css">
<script type="text/javascript" src="/p2p/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="/p2p/js/all.js"></script>
<script type="text/javascript" src="/p2p/js/invest.js"></script>

<link rel="stylesheet" type="text/css" href="/p2p/css/qq.css">
<link rel="stylesheet" href="/p2p/css/remodal.css">
<link rel="stylesheet" href="/p2p/css/remodal-default-theme.css">
<script src="/p2p/js/remodal.min.js"></script>
 <script
	src="http://api.map.baidu.com/api?v=2.0&ak=YW7Q06HuyxoEG8UYbofyViuG62IneI21"
	type="text/javascript"></script>
<script type="text/javascript">
	function initialize() {
		var map = new BMap.Map('map');
		map.centerAndZoom(new BMap.Point(113.0907900000,28.1897000000), 17);
		
		map.addControl(new BMap.NavigationControl());
		
		var opts = {
			offset : new BMap.Size(150, 5)
		}
		map.addControl(new BMap.ScaleControl(opts));
		map.addControl(new BMap.OverviewMapControl());
		map.addControl(new BMap.MapTypeControl());
		map.setCurrentCity("长沙");
		var stCtrl = new BMap.PanoramaControl();  
		stCtrl.setOffset(new BMap.Size(20, 20));  
		map.addControl(stCtrl);
		map.enableScrollWheelZoom();
		
	}

	function loadScript() {
		var script = document.createElement("script");
		script.src = "http://api.map.baidu.com/api?v=2.0&ak=YW7Q06HuyxoEG8UYbofyViuG62IneI21&callback=initialize";//此为v2.0版本的引用方式  
		// http://api.map.baidu.com/api?v=1.4&ak=您的密钥&callback=initialize"; //此为v1.4版本及以前版本的引用方式  
		document.body.appendChild(script);
	}

	window.onload = loadScript;
</script>

</head>
<body>
<!-- header start -->
<%@include file="/head.jsp"%>
<!-- end  -->


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
                <a class="zx_a3" href="#modal" class="zx_a1"></a>
            </li>
            <hr style="margin: 0;padding: 0;color: white"  />
            <li class="">
                <a class="zx_a4" href="#modal1" class="zx_a1"></a>
            </li>
            <hr style="margin: 0;padding: 0;color: white"  />
            <li class="">
                <a class="zx_a5" name="award" id="award" href="/p2p/award.jsp" class="zx_a1"></a>
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
	
	<div class="remodal" data-remodal-id="modal1" style="padding:0">
	 <div id="map" style="width:700px;height:520px">	
	</div>
	</div>
	
<!-- qq咨询end -->


<div class="invest_con_wper">
	  <div class="invest_con px1000">
	  	     <div class="product_choose">
	  	     	    <h2 class="product_tit clearfix">
	  	     	       <em class="proall fl">全部理财产品</em>
	  	     	       <div class="clearfix fl">
	  	     	       <span class="product_curspan"><img src="images/invest_pic01.png"> 新手体验标</span>
	  	     	       <span><img src="images/invest_pic02.png"> 项目列表</span>
	  	     	       <span><img src="images/invest_pic03.png"> 债权转让</span>
	  	     	       </div>
	  	     	      
	  	     	    </h2>
	  	     	    <div class="product_box">
	  	     	    	  <div class="product_list">
	  	     	    	  	     <div class="invest_prochoose">
		  <!-- 不限a标签问题待处理 -->  <p><span>项目期限：</span><a href="/p2p/invest.action?op=all&curPage=1" class="inpro_cura">不限</a><a href="deadLinea">小于1个月</a><a href="deadLineb">1-3个月</a><a href="deadLinec">4-6个月</a><a href="deadLined">7-12个月</a></p>
				  	       	      <p><span>项目状态：</span><a href="#" class="inpro_cura">不限</a><a href="#">所有借款</a><a href="#">正在招标的借款</a><a href="#">已成功借款</a><a href="#">已完成借款</a></p>
				  	       	      <p><span>项目收益：</span><a href="#" class="inpro_cura">不限</a><a href="#">10%以下</a><a href="#">10%-15%</a><a href="#">15%-20%</a><a href="#">20%-30%</a></p>
				  	       	      <p><span>项目类型：</span><a href="#" class="inpro_cura">不限</a><a href="#">信用标</a><a href="#">抵押标</a></p>
	  	                     </div>
	  	     	    	  </div>
	  	     	    	  <!--  -->
	  	     	    	  <div class="product_list" style="display:none;">
	  	     	    	  	  2
	  	     	    	  </div>
	  	     	    	  <!--  -->
	  	     	    	  <div class="product_list" style="display:none;">
	  	     	    	  	  3
	  	     	    	  </div>
	  	     	    	  <!--  -->

	  	     	    </div>
	  	     </div>
	  	     <!-- end block -->
	  	    <h3 class="sort_tit mt30"><em>排序</em>
	  	    <span>综合排序</span>
	  	    <span>收益率<img src="images/invest_jiantou.png" alt=""></span>
	  	    <span>发布时间<img src="images/invest_jiantou.png" alt=""></span>
	  	    <span>项目期限<img src="images/invest_jiantou.png" alt=""></span>
	  	    </h3>
	  	    <div id="listLoan" class="product_list mt20">
	  	    	<c:forEach var="entry" items="${map}">
	  	    		<div class="prolist_one prolist_one_bl01 mt20">
	  	    	           <h2 class="prolist_one_tit"><span id="loanType">${entry.key.loanType}</span>
	  	    	           ${entry.value.morType}周转         	                
                	<fmt:formatNumber type="number" maxFractionDigits="0" 
                	value="${entry.key.loanMoney}"
                	></fmt:formatNumber>元
                           </h2>
                          
                           <ul class="prolist_one_ul clearfix">
                           	   <li>
                           	   	   年华收益：<strong>
                           	   	    <fmt:formatNumber type="percent" maxIntegerDigits="2"
                                  value=" ${entry.key.inter}">
                          		</fmt:formatNumber>
                           	   	  
                           	   	   </strong><br>
                           	   	   还款方式：按月付息，到期还本
                           	   </li>
                           	   <li>
                           	   	   剩余期限：<i>
                           	                
                	<fmt:formatNumber type="number" maxFractionDigits="0" var="mydate"
                	value="${(date.time-entry.key.loanDate.time)/(1000*60*60*24)}"
                	></fmt:formatNumber>
                	${7-mydate}
                           	   	   </i>天<br>
                                    保障机构：中融兴业融资担保有限公司
                           	   </li>
                           	   <li class="prolist_press">
                           	   	   募集金额：<strong>${entry.key.curMoney}</strong> 元 <br>
                                   认购进度：<span class="ui-progressbar-mid ui-progressbar-mid-100">
                                   
                                  <fmt:formatNumber type="percent" maxIntegerDigits="2"
                                  value=" ${entry.key.curMoney/entry.key.loanMoney}">
                          		</fmt:formatNumber>
                          		
                                   </span>
                           	   </li>
                           	   <li class="prolist_btn">
                           	   	    <a href="/p2p/loan.action?op=detail&loanId=${entry.key.loanID}" class="pro_btn">立即投资</a>
                           	   </li>
                           </ul>
	  	             </div>
	  	    		
	  	    	</c:forEach>
	  	    	  
	  	             <!-- pagelink -->
	  	              <p class="pagelink" style="width:270px">
	  	              
	  	              	 <c:if test="${curPage==1}">
	  	              		 	上一页
	  	              	</c:if>
	  	              	 <c:if test="${curPage!=1}">
	  	              		 	<a id="prePage" href="${curPage}">上一页</a>
	  	              	</c:if>
	  	              
	  	              	<c:forEach var="i" begin="1" end="${maxPage}">
	  	              <!-- 给当前页面添加选中的css样式 -->		             		 
	  	              		 <c:if test="${i!=curPage}">
	  	              		 	 <a class="pageNum" href="#">${i}</a>
	  	              		</c:if>
	  	              		 
	  	              		 <c:if test="${i==curPage}">
	  	              		 	 <a class="pageNum pglink_cura" href="#">${i}</a>
	  	              		</c:if>
	  	              	</c:forEach>
	  	              	
	  	              	
	  	               
	  	                 <c:if test="${maxPage==curPage}">
	  	              		 	 下一页
	  	              	</c:if>
	  	              	 <c:if test="${maxPage!=curPage}">
	  	              		 	<a id="nextPage" href="${curPage}">下一页</a>
	  	              	</c:if>
	  	            
	  	              </p>
	  	             <!-- pagelink end -->
	  	            
	  	    </div>
	  </div>
</div>
<!-- footer start -->
<div class="zscf_aboutus_wper">
	  <div class="zscf_aboutus px1000 clearfix">
	  	    <div class="zscf_aboutus_l fl">
	  	    	   <ul class="zscf_aboutus_lul clearfix">
	  	    	   	  <li class="pt10"><a href="#"><img src="images/app.png" alt=""></a>
	  	    	   	  </li>
	  	    	   	  <li>
	  	    	   	  <p class="pb20">服务热线</p>
	  	    	   	  <strong>400-027-0101</strong>
	  	    	   	  </li>
	  	    	   	  <li>
	  	    	   	  	  <p class="pb10 linkpic">
	  	    	   	  	     <a href="#"><img src="images/ft_sina.png" alt=""></a>
	  	    	   	  	     <a href="#"><img src="images/ft_weixin.png" alt=""></a>
	  	    	   	  	     <a href="#"><img src="images/ft_erji.png" alt=""></a>
	  	    	   	  	  </p>
	  	    	   	  	  <p><a href="#">kefu@zhongxincaifu.com</a></p>
	  	    	   	  </li>
	  	    	   </ul>
	  	    </div>
	  	    <!-- end left -->
	  	    <div class="zscf_aboutus_r fl clearfix">
	  	    	 <a href="#" class="fl ft_ewm"><img src="images/ft_erweima.png" alt=""></a>
	  	    	 <ul class="fl clearfix">
	  	    	 	<li><a href="#">联系我们</a></li>
	  	    	 	<li><a href="#">我要融资</a></li>
	  	    	 	<li><a href="problem.html">帮助中心</a></li>
	  	    	 	<li><a href="#">友情链接</a></li>
	  	    	 	<li><a href="#">招贤纳士</a></li>
	  	    	 	<li><a href="#">收益计算器</a></li>
	  	    	 </ul>
	  	    </div>
	  	    <!-- end right -->

	  </div>
</div>

<div class="zscf_bottom_wper">
	<div class="zscf_bottom px1000 clearfix">
		  <p class="fl">© 2014 zhongxincaifu &nbsp;  &nbsp;&nbsp;   中兴财富金融信息服务股份有限公司 &nbsp;&nbsp;&nbsp;    来源:<a href="http://www.mycodes.net/" target="_blank">源码之家</a></p>
		  <p class="fr">
		    <a href="#"><img src="images/360.png" alt=""></a>
		    <a href="#"><img src="images/kexin.png" alt=""></a>
		    <a href="#"><img src="images/norton.png" alt=""></a>
		  </p>
	</div>
</div>
<!-- footer end -->
</body>
</html>