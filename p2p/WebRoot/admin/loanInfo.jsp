<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<!DOCTYPE html>
<html>
<head>
    <title></title>
    <meta http-equiv="Pragma" content="no-cache" />   
	<meta http-equiv="Cache-Control" content="no-cache" />
	<meta http-equiv="Expires" content="0" />
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="Css/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="Css/bootstrap-responsive.css" />
    <link rel="stylesheet" type="text/css" href="Css/style.css" />
    <script type="text/javascript" src="Js/jquery-1.7.2.js"></script>
    <script type="text/javascript" src="Js/loanInfo.js"></script>
    <script type="text/javascript" src="Js/jquery.sorted.js"></script>
    <script type="text/javascript" src="Js/bootstrap.js"></script>
    <script type="text/javascript" src="Js/ckform.js"></script>
    <script type="text/javascript" src="Js/common.js"></script>
    <script src="http://g.tbcdn.cn/fi/bui/jquery-1.8.1.min.js"></script>
  <script src="http://g.alicdn.com/bui/seajs/2.3.0/sea.js"></script>
  <script src="http://g.alicdn.com/bui/bui/1.1.21/config.js"></script>
  <link href="http://g.alicdn.com/bui/bui/1.1.21/css/bs3/dpl.css" rel="stylesheet">
  <link href="http://g.alicdn.com/bui/bui/1.1.21/css/bs3/bui.css" rel="stylesheet">
 
    <style type="text/css">
        body {
            padding-bottom: 40px;
        }
        .sidebar-nav {
            padding: 9px 0;
        }

        @media (max-width: 980px) {
            /* Enable use of floated navbar text */
            .navbar-text.pull-right {
                float: none;
                padding-left: 5px;
                padding-right: 5px;
            }
        }


    </style>
<script type="text/javascript">
function replaceNumKeyUp(obj){
	obj.value = obj.value.replace(/[^0-9]/g,'');  
}
</script>
</head>
<body>
<jsp:include page="check.jsp"></jsp:include>

<form class="form-inline definewidth m20" action="" onsubmit="false" method="get">  
    用户id：
    <input type="text" name="rolename" id="rolename"class="abc input-default" placeholder="" value="" onkeyup="replaceNumKeyUp(this)"/>&nbsp;&nbsp;  
    <button type="button" class="btn btn-primary" id="select_btn">查询</button>&nbsp;&nbsp; <button type="button" class="btn btn-success" id="waitApp">等待批准贷款</button>
    <button type="button" class="btn btn-success" id="failed_btn">融资额不满贷款额列表</button>
    <button type="button" class="btn btn-success" id="exportExcel">导出到Excel</button>
</form>
<table id="loan_table" class="table table-bordered table-hover definewidth m10" >
    <thead>
    <tr>
        <th>贷款id</th>
        <th>贷款用户id</th>
        <th>贷款金额</th>
        <th>当前金额</th>
        <th>贷款类型</th>
        <th>贷款日期</th>
        <th>贷款利率</th>
        <th>贷款期限</th>
        <th>贷款状态</th>
        <th>操作</th>
    </tr>
    </thead>
    	<c:forEach items="${loanInfos}" var="lo" >
    	 <tr class="loan_tr">
	            <td>${lo.loanID }</td>
		          <td>${lo.userID }</td>
	            <td>${lo.loanMoney }</td>
	            <td>${lo.curMoney }</td>
	            <td>${lo.loanType }</td>
	            <td>${lo.loanDate }</td>
	            <td>${lo.inter}</td>
	            <td>${lo.deadLine}</td>
	            <td>${lo.status}</td>
	            <td>
	                  <a href="${pageContext.request.contextPath }/loanInfo.action?op=loanDetail&loanId=${lo.loanID}">审核</a>
	                
	            </td>
	        </tr>
    	</c:forEach>
    	 <tr style="text-align: center" class="loan_tr">
				<td colspan="9" style="text-align: center">
						<font>当前页${page.curPage }</font>
						<c:if test="${page.curPage==1 }">
								首页&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						</c:if><c:if test="${page.curPage>1}">
							<a href="${pageContext.request.contextPath }/admin.action?op=loanInfo&pageNum=1">首页</a>
								<a href="${pageContext.request.contextPath}/admin.action?op=loanInfo&pageNum=${page.curPage-1 }">上一页</a>
						</c:if>
						<c:forEach var="i" begin="1"  end="${page.maxPage }" varStatus="status">
								<c:if test="${i!=page.curPage }">
								<a href="${pageContext.request.contextPath }/admin.action?op=loanInfo&pageNum=${i}">${ i }</a>
								</c:if>
						</c:forEach>
						<c:if test="${ page.curPage<page.maxPage}">
								<a href="${pageContext.request.contextPath }/admin.action?op=loanInfo&pageNum=${page.curPage+1 }">下一页</a>
							<a href="${pageContext.request.contextPath }/admin.action?op=loanInfo&pageNum=${page.maxPage }">末页</a>
						</c:if>
			</td>
				</tr>
        </table>
     <script type="text/javascript">
    $(function () {
    	
    	$("#select_btn").click(function(){
			//alert("sss");
			$.ajax({
				type:"POST",
				url:"../AllSelectServlet.action",
				data:{op:"select_btn",userID:$("#rolename").val()},
				dataType:"text",
				async:false,
				success:getSelectResult,
			});
		 });
		
		$("#waitApp").click(function(){
			//alert("sss");
			$.ajax({
				type:"POST",
				url:"../loanInfo.action",
				data:{op:"waitAppr"},
				dataType:"text",
				async:false,
				success:getResult,
			});
		 });
		
		$("#failed_btn").click(function(){

			$.ajax({
				type:"POST",
				url:"../loanInfo.action",
				data:{op:"getFailed"},
				dataType:"text",
				async:false,
				success:getFailedResult,
			});
		 });
		
	$("#exportExcel").click(function(){
		
		$.ajax({
			type:"POST",
			url:"../loanInfo.action",
			data:{op:"exportExcel"},
			dataType:"text",
			async:false,
			success:null,
		});
		
		window.open ("../loanInfo.action?op=exportExcel" )
		/* alert("ssdd");
		openWindow("../loanInfo.action?op=exportExcel");
		 */
		})
    });
    
    function getSelectResult(data){
    	data = eval("("+data+")");	
		//$("#loan_table").remove(".loan_tr");
		$(".loan_tr").empty();
		for (var i=0;i<data.length;i++){
				$("#loan_table").append("<tr id='loan_tr_id"+i+"' class='loan_tr'></tr>")
				$("#"+"loan_tr_id"+i+"").append("<td>"+data[i].loanID+"</td>")
				$("#"+"loan_tr_id"+i+"").append("<td>"+data[i].userID+"</td>")
				$("#"+"loan_tr_id"+i+"").append("<td>"+data[i].loanMoney+"</td>")
				$("#"+"loan_tr_id"+i+"").append("<td>"+data[i].curMoney+"</td>")
				$("#"+"loan_tr_id"+i+"").append("<td>"+data[i].loanType+"</td>")
				$("#"+"loan_tr_id"+i+"").append("<td>"+data[i].loanDate.year+"-"+(data[i].loanDate.month+1)+"-"+data[i].loanDate.day+"</td>")
				$("#"+"loan_tr_id"+i+"").append("<td>"+(data[i].inter+" ").substring(0,5)+"</td>")
				$("#"+"loan_tr_id"+i+"").append("<td>"+data[i].deadLine+"</td>")
				$("#"+"loan_tr_id"+i+"").append("<td>"+data[i].status+"</td>")
				$("#"+"loan_tr_id"+i+"").append("<td> <a href='../loanInfo.action?op=loanDetail&loanId="+data[i].loanID+"'>审核</a></td>")	
		} 	
    }
    
    function getFailedResult(data){
    	data = eval("("+data+")");
		
		//$("#loan_table").remove(".loan_tr");
		$(".loan_tr").empty();
		for (var i=0;i<data.length;i++){
				$("#loan_table").append("<tr id='loan_tr_id"+i+"' class='loan_tr'></tr>")
				$("#"+"loan_tr_id"+i+"").append("<td>"+data[i].loanID+"</td>")
				$("#"+"loan_tr_id"+i+"").append("<td>"+data[i].userID+"</td>")
				$("#"+"loan_tr_id"+i+"").append("<td>"+data[i].loanMoney+"</td>")
				$("#"+"loan_tr_id"+i+"").append("<td>"+data[i].curMoney+"</td>")
				$("#"+"loan_tr_id"+i+"").append("<td>"+data[i].loanType+"</td>")
				$("#"+"loan_tr_id"+i+"").append("<td>"+data[i].loanDate.year+"-"+(data[i].loanDate.month+1)+"-"+data[i].loanDate.day+"</td>")
				$("#"+"loan_tr_id"+i+"").append("<td>"+(data[i].inter+" ").substring(0,5)+"</td>")
				$("#"+"loan_tr_id"+i+"").append("<td>"+data[i].deadLine+"</td>")
				$("#"+"loan_tr_id"+i+"").append("<td>"+data[i].status+"</td>")
			$("#"+"loan_tr_id"+i+"").append("<td><a id='failed_a' href='javascript:;'>流标</a></td>")
			
		}
    	
    }
    
    
 
    BUI.use('bui/overlay',function(Overlay){
    	var id;
    	var val;
    	  var dialog = new Overlay.Dialog({
          title:'提示',
          width:400,
          height:250,
          bodyContent:'<p style="font-size:18px;">您确认对此项贷款进行此操作么</p>',
          success:function () {
            //alert('确认');
            
            	$.ajax({
    			type:"POST",
    			url:"../loanInfo.action",
    			data:{op:"check",value:val,loanId:id},
    			dataType:"text",
    			async:false,
    			success:null,
    			});
    		window.location.reload();
            this.close();
          }
        });
      //dialog.show();
      
      $(".appro_a").live("click",function(){
			val="giveLoan";
    		id=$(this).parent().parent().children(":first").text();
      	  	dialog.show();
    		});
      
      $("#failed_a").live("click",function(){
    		 val="failed";
  			id=$(this).parent().parent().children(":first").text();
    	  	dialog.show();
  		});
      
    });
	
</script>


		</body>
		</html>

