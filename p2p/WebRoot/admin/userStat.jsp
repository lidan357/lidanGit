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
<script src="http://g.tbcdn.cn/bui/acharts/1.0.32/acharts-min.js"></script>
    <script type="text/javascript" src="Js/bootstrap.js"></script>
    <script type="text/javascript" src="Js/ckform.js"></script>
    <script type="text/javascript" src="Js/jquery-1.7.2.js"></script>    <script type="text/javascript" src="Js/common.js"></script>
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
		
		.detail-section{
			position: relative;
			margin-right: 50px;
			margin-left:150px;
			padding-right: 50px;
			
		
		}
		.demo-content{
			position: relative;
			margin-top: 50px;
			margin-left:40px;
		
		}

    </style>
</head>
<body>

<jsp:include page="check.jsp"></jsp:include>
  <div class="demo-content">
    <div class="row">
      <div class="span8"><button id="btn" class="button" style="width: 120px">选择其他<span class="x-caret x-caret-down"></span></button></div>
       <label style="position:relative;margin-left:  540px">用户性别比例</label>
    </div>
    </div>
<div class="detail-section" style="display:inline">
    <div id="canvas" style="display:inline">
 
    </div>
   
</div>
 
 <div class="tooltip">
 	
 </div>
 
<script src="http://g.tbcdn.cn/bui/acharts/1.0.32/acharts-min.js"></script>
<!-- https://g.alicdn.com/bui/acharts/1.0.29/acharts-min.js -->
 
 
 
  <script type="text/javascript">
  
  function charts(sta,type){ 
	  $("#canvas").empty();
  var chart = new AChart({
          theme : AChart.Theme.SmoothBase,
          id : 'canvas',
          width : 950,
          height : 500,
          legend : null ,//不显示图例
          seriesOptions : { //设置多个序列共同的属性
            pieCfg : {
              allowPointSelect : true,
              labels : {
                distance : 40,
                label : {
                  //文本信息可以在此配置
                },
                renderer : function(value,item){ //格式化文本
                  return value + ' ' + (item.point.percent * 100).toFixed(2)  + '%';
                }
              }
            }
          },
          tooltip : {
            pointRenderer : function(point){
              return (point.percent * 100).toFixed(2)+ '%';
            }
          },
          series : [{
              type: 'pie',
              name: type,
              legendType : 'circle', //显示在legend上的图形
              legend : {
                position : 'bottom', //位置
                back : null, //背景清空
                spacingX : 20, //增加x方向间距
                itemCfg : { //子项的配置信息
                  label : {
                    fill : '#999',
                    'text-anchor' : 'start',
                    cursor : 'pointer'
                  }
                }
              },
              data: sta
          }]
        });
 
        chart.render();
        
  } 
  
  $(function(){
	  myAjax("m1")
	
  });
  function myAjax(type){

	  var url="../userInfoStatistic.action";
	  var opValue="";
	  if(type=="m1"){
			  opValue="sexSta";
	  }else if(type=="m2"){
		  opValue="ageSta";
		  
	  }else if(type=="m3"){
		  opValue="incomSta";
		  
	  }else if(type=="m4"){
		  
		  opValue="eduSta";
	  }

		$.ajax({
			  type: 'POST',
			  url: url,
			  dataType: "text",  
			  data: {op:opValue},
			  success: getResult,
			});			   
  }
  
  function getResult(data){
	
	var obj =eval('('+data+')');
	var d2= new Array();
	for(var i=0;i<obj.length;i++){
		d2[i]=new Array();
		d2[i][0]=obj[i].pro;
		d2[i][1]=obj[i].val;
			}
	  charts(d2,"占比");
	
	  $("label").text(dropMenu1.getSelectedText());
  }
  
      </script>
 
 <script type="text/javascript">
 	var dropMenu1;    
 	BUI.use('bui/menu',function(Menu){
        dropMenu1 = new Menu.PopMenu({
          trigger : '#btn',
          autoRender : true,
          width : 140,
          children : [{
            id:'m1',
            content : "用户性别比例"
          },{
        	  id:'m2',
            content : "用户年龄比例"
          },{
        	  id:'m3',
            content : "用户收入比例"
          },
          	{
        	  id:'m4',
              content : "用户教育程度比例"
            },
          ]
        });
        
        dropMenu1.on('itemselected', function(){
          //alert(dropMenu1.getSelectedText() + '：' + dropMenu1.getSelectedValue());
          myAjax(dropMenu1.getSelectedValue());
        });
      });
     
    </script>
 
</body>
</html>
