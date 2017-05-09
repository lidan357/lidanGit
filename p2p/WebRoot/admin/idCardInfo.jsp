<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<!DOCTYPE html>
<html>
<head>
    <title></title>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="Css/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="Css/bootstrap-responsive.css" />
    <link rel="stylesheet" type="text/css" href="Css/style.css" />
    <script type="text/javascript" src="Js/jquery.js"></script>
    <script type="text/javascript" src="Js/jquery.sorted.js"></script>
    <script type="text/javascript" src="Js/bootstrap.js"></script>
    <script type="text/javascript" src="Js/ckform.js"></script>
    <script type="text/javascript" src="Js/common.js"></script>
	<link href="assets/code/demo.css" rel="stylesheet">
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
</head>
<body>
<jsp:include page="check.jsp"></jsp:include>

<form class="form-inline definewidth m20" action="index.html" method="post">    
    用户名称：
    <input type="text" name="username" id="username"class="abc input-default" placeholder="" value="">&nbsp;&nbsp;  
    <button type="submit"  class="btn btn-primary">查询</button>&nbsp;&nbsp; <button type="button" class="btn btn-success" id="addnew">新增用户</button>
</form>
<table class="table table-bordered table-hover definewidth m10">
    <thead>
    <tr>
        <th>用户id</th>
        <th>身份证号码</th>
        <th>身份证状态</th>
        <th>操作</th>
    </tr>
    </thead>
	     <c:forEach items="${idInfos }" var="idInfo">
	     <tr>
            <td>${idInfo.userID }</td>
            <td>${idInfo.idNum} </td>
            <td>${idInfo.status }
            <div id="${idInfo.idNum }" style="display:none">${idInfo.cardPic}</div>
            	<div id="h${idInfo.idNum }" style="display:none">${idInfo.cardPicWithH}</div></td>
            <td>
               <div class="btnShow">  <button  class="button button-primary">审核</button>             
               </div>
            </td>
        </tr>	
					     
	     </c:forEach>
	      <tr style="text-align: center">
				<td colspan="9" style="text-align: center">
						<font>当前页${page.curPage }</font>
						<c:if test="${page.curPage==1 }">
								首页&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						</c:if><c:if test="${page.curPage>1}">
							<a href="${pageContext.request.contextPath }/admin.action?op=idCheck&pageNum=1">首页</a>
								<a href="${pageContext.request.contextPath}/admin.action?op=idCheck&pageNum=${page.curPage-1 }">上一页</a>
						</c:if>
						<c:forEach var="i" begin="1"  end="${page.maxPage }" varStatus="status">
								<c:if test="${i!=page.curPage }">
								<a href="${pageContext.request.contextPath }/admin.action?op=idCheck&pageNum=${i}">${ i }</a>
								</c:if>
						</c:forEach>
						<c:if test="${ page.curPage<page.maxPage}">
								<a href="${pageContext.request.contextPath }/admin.action?op=idCheck&pageNum=${page.curPage+1 }">下一页</a>
							<a href="${pageContext.request.contextPath }/admin.action?op=idCheck&pageNum=${page.maxPage }">末页</a>
						</c:if>
			</td>
				</tr>
</table>


        <!-- 此节点内部的内容会在弹出框内显示,默认隐藏此节点-->
        <div id="content" class="hidden" >
          <form id="form" class="form-horizontal" action="${pageContext.request.contextPath }/admin.action">
            <div class="row">
                <label class="control-label">身份证号码：</label>
                <div class="controls">
                  <input type="text" id="idNum" name="idNum" class="input-normal control-text" readonly="readonly" data-rules="{required : true}">
                </div>
              </div>
              <div class="row">
                <label class="control-label">身份证照片：</label>
              		<div class="controls">
						<img width="200px" id="idCard" height="100px" src="../pictures/1.jpg"></img>
					</div>
					</div>
					<br><br><br><br>
				 <div class="row">
                 	<label class="control-label">手持身份证照：</label>
                 <div class="controls">
					<img width="200px" id="idCardH" height="100px" src="../pictures/1.jpg"></img>
                </div>
                </div>
                <br><br> <br><br> <br>
                	 <div class="row">
                	 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<select id="status" class="input-normal"name="status"> 
                    <option value="55" >请选择</option>
                    <option value="1">通过 </option>
                    <option value="0">不通过</option>
                  </select>
                </div>
          </form>
        </div>
        
     <script src="http://g.tbcdn.cn/fi/bui/jquery-1.8.1.min.js"></script>
      <script src="http://g.alicdn.com/bui/seajs/2.3.0/sea.js"></script>
      <script src="http://g.alicdn.com/bui/bui/1.1.21/config.js"></script>
    
    <!-- script start --> 
        <script type="text/javascript">
            BUI.use(['bui/overlay','bui/form'],function(Overlay,Form){
        
          var form = new Form.HForm({
            srcNode : '#form'
          }).render();
     
          var dialog = new Overlay.Dialog({
                title:'配置DOM',
                width:400,
                height:450,
                //配置DOM容器的编号
                contentId:'content',
                //关闭页面之后需要做的操作
                success:function () {   
                  this.close();
                  var idNum = $("#idNum").val();
                  var sta = $("#status option:selected").val();
              	jQuery.ajax({
      		      url: "../admin.action",
      		       data: {op:"updateIDCardStatus",id:idNum,status:sta},
      		       dataType: "json",
      		       async: false,
      		       success: function(data) { }
      		   });
              	parent.location.reload();
                }
              });
            //dialog.show();
            $('.btnShow').on('click',function () {
            	//alert("dsdas");
            	var $grand = $(this).parent().parent();
            	var $td = $grand.find("td:eq(1)");
            	$("#idNum").val($td.text())
            	var idCard = $("#"+$td.text()).text();
		        var idCardH=$("#h"+$td.text()).text();
		        idCard = idCard.substring(idCard.indexOf("p2p")-1)
		        idCardH = idCardH.substring(idCardH.indexOf("p2p")-1)
            //	alert(idCard+"----"+idCardH);
            	$("#idCard").attr("src",idCard); 
            	$("#idCardH").attr("src",idCardH); 
		        
             dialog.show();
             // alert($("#status option:selected").val()+"sssss");
              
            });
          });
        </script>
    <!-- script end -->
        <script>
    $(function () {
		$('#addnew').click(function(){
				window.location.href="add.html";
		 });
		
		$("#idCard").click(function(){
			
			window.
		
		})
		
    });

	function del(id)
	{
		if(confirm("确定要删除吗？"))
		{
			var url = "index.html";
			window.location.href=url;		
		}
	}
	
</script>
        
</body>
</html>

 

