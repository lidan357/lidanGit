<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<!DOCTYPE HTML>
<html>
<head>
    <title>后台管理系统</title>
    <meta http-equiv="Pragma" content="no-cache" />   
	<meta http-equiv="Cache-Control" content="no-cache" />
	<meta http-equiv="expires" content="0" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="assets/css/dpl-min.css" rel="stylesheet" type="text/css" />
    <link href="assets/css/bui-min.css" rel="stylesheet" type="text/css" />
    <link href="assets/css/main-min.css" rel="stylesheet" type="text/css" />
</head>
<body>
<jsp:include page="check.jsp"></jsp:include>
<div class="header">

    <div class="dl-title">
        <!--<img src="/chinapost/Public/assets/img/top.png">-->
    </div>

    <div class="dl-log">欢迎您，<span class="dl-log-user">${admin.managerName }</span><a href="../admin.action?op=logout" title="退出系统" class="dl-log-quit">[退出]</a>
    </div>
</div>
<div class="content">
    <div class="dl-main-nav">
        <div class="dl-inform"><div class="dl-inform-title"><s class="dl-inform-icon dl-up"></s></div></div>
        <ul id="J_Nav"  class="nav-list ks-clear">
            <li class="nav-item dl-selected"><div class="nav-item-inner nav-home">系统管理</div></li>		<li class="nav-item dl-selected"><div class="nav-item-inner nav-order">业务管理</div></li>

        </ul>
    </div>
    <ul id="J_NavContent" class="dl-tab-conten">

    </ul>
</div>
<script type="text/javascript" src="assets/js/jquery-1.8.1.min.js"></script>
<script type="text/javascript" src="assets/js/bui-min.js"></script>
<script type="text/javascript" src="assets/js/common/main-min.js"></script>
<script type="text/javascript" src="assets/js/config-min.js"></script>
<script>
 /*    BUI.use('common/main',function(){
        var config = [{id:'1',menu:[{text:'系统管理',items:[{id:'11',text:'首页',href:'backIndex.jsp'},{id:'',text:'用户管理',href:'../admin.action?op=userInfo'},{id:'3',text:'贷款管理',href:'../admin.action?op=loanInfo'},{id:'4',text:'投资管理',href:'../admin.action?op=investInfo'},{id:'6',text:'菜单管理',href:'Menu/index.html'}]}]},{id:'7',homePage : '9',menu:[{text:'业务管理',items:[{id:'9',text:'查询业务',href:'Node/index.html'}]}]}];
        new PageUtil.MainPage({
            modulesConfig : config
        });
    }); */
    
    BUI.use('common/main',function(){
        var config = [
                    {id:'1',
                    homePage:'index',
                   menu: [	
							{text:'首页',
							items:  [
								   			{id:'index',text:'首页',href:'../admin.action?op=adminIndex'},
								   		]
							},
                    	   	{text:'用户管理',items:
									                    		  [
										                    		   {id:'',text:'用户列表',href:'../admin.action?op=userInfo'},
										                    		   {id:'3',text:'身份证审核',href:'../admin.action?op=idCheck'},
										                    		   {id:'4',text:'投资用户管理',href:'../admin.action?op=investUsers'},
										                    		   {id:'6',text:'贷款用户管理',href:'../admin.action?op=loaUserMana'},
										                    		   {id:'6',text:'管理员列表',href:'../admin.action?op=addminInfo'},
									                    		   ]
                    	  },
                    		{text:'贷款管理',items:
							                      		  [
									                      		   {id:'',text:'贷款列表',href:'../admin.action?op=loanInfo'},
									                      		   {id:'4',text:'还款管理',href:'../adminRepayment.action?op=repayInfo'},
									                      		   
							                      		   ]
                      	  },
                      	{text:'投资管理',items:
                    		  [
	                    		   {id:'',text:'投资列表',href:'../admin.action?op=investInfo'},
	                    		   {id:'3',text:'正在投资',href:'../adminInvest.action?op=investing'},
	                    		   {id:'4',text:'投资完成',href:'../adminInvest.action?op=invested'},
                    		   ]
                    	  },
                    	  {text:'统计',items:
                    		  [
	                    		   {id:'',text:'用户统计',href:'userStat.jsp'},
	                    		   {id:'3',text:'贷款统计',href:'loanStat.jsp'},
	                    		   {id:'4',text:'投资统计',href:'invStat.jsp'},
                    		   ]
                    	  }
                    	  ]
                      }
                    		   
                    		  /*  {id:'7',homePage : '9',menu:
                    			   [
                    			    {	text:'业务管理',items:
                    				  		 [
                    				    		{id:'9',text:'查询业务',href:'Node/index.html'}
                    				   		]
                    			   		}
                    			   ]
                    		   } */
                    		   ];
        new PageUtil.MainPage({
        	
            modulesConfig : config
        });
    });
</script>

</body>
</html>