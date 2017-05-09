<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>分组验证规则</title>
<!-- 此文件为了显示Demo样式，项目中不需要引入 -->
<link href="../../assets/code/demo.css" rel="stylesheet">
 
  <link href="http://g.alicdn.com/bui/bui/1.1.21/css/bs3/dpl.css" rel="stylesheet">
  <link href="http://g.alicdn.com/bui/bui/1.1.21/css/bs3/bui.css" rel="stylesheet">
 

</head>
<body>
  <div class="demo-content">
    <form id="J_Form" class="form-horizontal" method="post">
      <h2 style="margin-left:30px;">基本信息</h2>
	  <div class="row">
        <div class="control-group span10">
          <label class="control-label"><s>*</s>用户头像：</label>
          <div class="controls">
				<img src="${userDetail.userIconAddr}"></img>
			</div>
        </div>
       
      </div>
      <div class="row">
        <div class="control-group span10">
          <label class="control-label"><s>*</s>用户名：</label>
          <div class="controls">
            <input name="sname" type="text" value="${userDetail.userName }" class="control-text" disabled="disabled" data-rules="{required:true}">
          </div>
        </div>
        <div class="control-group span10">
          <label class="control-label"><s>*</s>用户编号：</label>
          <div class="controls bui-form-field-plain" data-cfg="{renderer:planFormat}">
            <input name="sid" type="hidden" class="control-text" value="${userDetail.userID}"/>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="control-group span10">
          <label class="control-label">真实姓名：</label>
          <div class="controls">
            <input name="address" type="text" value="${userDetail.realName }"  class="control-text"  data-rules="{required:true}">
          </div>
        </div>
        <div class="control-group12 span10">
         <label class="control-label">邮箱：</label>
          <div class="controls">
            <input name="address" type="text" value="${userDetail.email }"  class="control-text"  data-rules="{required:true}">
          </div>
        </div>
      </div>
	  
      <div class="row">
        <div class="control-group span10">
          <label class="control-label">性别：</label>
          <div class="controls">
            <select name="sex">
            	<c:if test="${userDetail.sex=='男' }">
              <option value="0" selected="selected">男</option>
              <option value="1">女</option>
              </c:if>
              	<c:if test="${userDetail.sex=='女' }">
              <option value="0" >男</option>
              <option value="1"selected="selected">女</option>
              </c:if>
            </select>
          </div>
        </div>
		
        <div class="control-group span10">
           <label class="control-label">状态：</label>
          <div class="controls">
            <input name="address" type="text"  value="${userDetail.status}" class="control-text"  data-rules="{required:true}">
          </div>
        </div>
      </div>
	  
        <div class="row">
        <div class="control-group span10">
          <label class="control-label">年龄：</label>
          <div class="controls">
            <input name="address" type="text"  value="${userDetail.age}" class="control-text"  data-rules="{required:true}">
          </div>
        </div>
	  
	
        <div class="control-group span12">
          <label class="control-label"><s>*</s>家庭住址：</label>
          <div class="controls">
            <input name="address" type="text" value="${userDetail.residence}" class="span8 span-width control-text"  data-rules="{required:true}">
          </div>
        </div>
      </div>

  <div class="row">
        <div class="control-group span10">
          <label class="control-label">手机号：</label>
          <div class="controls">
            <input name="address" type="text" value="${userDetail.phone}"  class="control-text"  data-rules="{required:true}">
          </div>
        </div>
	  
	  
        <div class="control-group span12">
         <label class="control-label">月收入：</label>
          <div class="controls">
            <input name="address" type="text" value="${userDetail.monthInco}"  class="control-text"  data-rules="{required:true}">
          </div>
        </div>
      </div>

<div class="row">
        <div class="control-group span10">
           <label class="control-label">学历：</label>
          <div class="controls">
            <input name="address" type="text"  value="${userDetail.eduExp}" class="control-text"  data-rules="{required:true}">
          </div>
        </div>
	  
	  
        <div class="control-group span12">
           <label class="control-label">职业：</label>
          <div class="controls">
            <input name="address" type="text" value="${userDetail.job}"  class="control-text"  data-rules="{required:true}">
          </div>
        </div>
        
      </div>
      
	<div class="row">
         <div class="control-group span10">
           <label class="control-label">余额：</label>
          <div class="controls">
            <input name="address" type="text"  value="${userDetail.balance}" class="control-text"  data-rules="{required:true}">
          </div>
        </div>
	  
	  
        <div class="control-group span12">
           <label class="control-label">贷款总额：</label>
          <div class="controls">
            <input name="address" type="text" value="${totalLoan}"  class="control-text"  data-rules="{required:true}">
          </div>
        </div>
      </div>	
<div class="row">
         <div class="control-group span10">
           <label class="control-label">投资总额：</label>
          <div class="controls">
            <input name="address" type="text"  value="${totalInv}" class="control-text"  data-rules="{required:true}">
          </div>
        </div>
	  
	  
      </div>	
	
      <hr/>      
      <!-- <div class="row">
        <div class="form-actions offset3">
          <button type="submit" class="button button-primary">保存</button>
          <button type="reset" class="button">重置</button>
        </div>
      </div> -->
 
    </form>
    
 
  <script src="http://g.tbcdn.cn/fi/bui/jquery-1.8.1.min.js"></script>
  <script src="http://g.alicdn.com/bui/seajs/2.3.0/sea.js"></script>
  <script src="http://g.alicdn.com/bui/bui/1.1.21/config.js"></script>
 
<!-- script start --> 
    <script type="text/javascript">
 
    function planFormat(value){
      return value + '';
    }
      BUI.use(['bui/grid','bui/data','bui/form'],function (Grid,Data,Form) {
      
       var columns = [{title : '学校名称',dataIndex :'school',editor : {xtype : 'text',rules:{required:true}}},
            {title : '入学日期',dataIndex :'enter',editor : {xtype : 'date',rules:{required:true}},renderer : Grid.Format.dateRenderer},//使用现有的渲染函数，日期格式化
            {title : '毕业日期',dataIndex :'outter',editor : {xtype : 'date',rules:{required:true},validator : function(value,obj){
              if(obj.enter && value && obj.enter > value){
                return '毕业日期不能晚于入学日期！'
              }
            }},renderer : Grid.Format.dateRenderer},
            {title : '备注',dataIndex :'memo',width:200,editor : {xtype : 'text'}}
            
          ],
      //默认的数据
      data = [{id:'1',school:'武汉第一初级中学',enter:936144000000,outter:993945600000,memo:'表现优异，多次评为三好学生'},
        {id:'2',school:'武汉第一高级中学',enter:999561600000,outter:1057017600000,memo:'表现优异，多次评为三好学生'}],
      store = new Data.Store({
        data:data
      }),
      editing = new Grid.Plugins.CellEditing(),
      grid = new Grid.Grid({
        render : '#grid',
        columns : columns,
        width : 700,
        forceFit : true,
        store : store,
        plugins : [Grid.Plugins.CheckSelection,editing],
        tbar:{
            items : [{
              btnCls : 'button button-small',
              text : '<i class="icon-plus"></i>添加',
              listeners : {
                'click' : addFunction
              }
            },
            {
              btnCls : 'button button-small',
              text : '<i class="icon-remove"></i>删除',
              listeners : {
                'click' : delFunction
              }
            }]
        }
 
      });
    grid.render();
 
    function addFunction(){
      var newData = {school :'请输入学校名称'};
      store.add(newData);
      editing.edit(newData,'school'); //添加记录后，直接编辑
    }
 
    function delFunction(){
      var selections = grid.getSelection();
      store.remove(selections);
    }
 
    var form = new Form.HForm({
      srcNode : '#J_Form'
    });
    form.render();
 
    form.on('beforesubmit',function(){
      if(!editing.isValid()){
 
        return false;
      }
      var str = BUI.JSON.stringify(store.getResult());// 提交前将grid的数据存储到隐藏域，一起提交
      form.getField('gridValue').set('value',str); 
    });
 
      
  });  
    
      $("input").attr("readonly","true");
      //$("input").css("border-left-width","0px")
      
</script>
<!-- script end -->
  </div>
</body>
</html>

