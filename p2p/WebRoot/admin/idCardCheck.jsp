<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

    <!DOCTYPE html>
    <html>
    <head>
    <meta charset="utf-8">
    <title>使用页面上DOM</title>
    <!-- 此文件为了显示Demo样式，项目中不需要引入 -->
    <link href="../../assets/code/demo.css" rel="stylesheet">
      <link href="http://g.alicdn.com/bui/bui/1.1.21/css/bs3/dpl.css" rel="stylesheet">
      <link href="http://g.alicdn.com/bui/bui/1.1.21/css/bs3/bui.css" rel="stylesheet">
     
    </head>
    <body>
    <jsp:include page="check.jsp"></jsp:include>
    
      <div class="demo-content">
        <div>
          <button id="btnShow" class="button button-primary">显示</button>
        </div>
        <!-- 此节点内部的内容会在弹出框内显示,默认隐藏此节点-->
        <div id="content" class="hidden">
          <form id="form" class="form-horizontal">
            <div class="row">
              <div class="control-group span8">
                <label class="control-label">供应商编码：</label>
                <div class="controls">
                  <input type="text" class="input-normal control-text" data-rules="{required : true}">
                </div>
              </div>
              
              
              <div class="control-group span8">
                <label class="control-label">供应商类型：</label>
                <div class="controls">
                  <select class="input-normal"> 
                    <option value="">请选择</option>
                    <option>淘宝卖家</option>
                    <option>大厂直供</option>
                  </select>
                </div>
              </div>
            </div>
            <div class="row">
              <div class="control-group span15">
                <label class="control-label">起始日期：</label>
                <div class="controls">
                  <input class="input-small control-text" type="text"><label>&nbsp;-&nbsp;</label><input class="input-small control-text" type="text">
                </div>
              </div>
            </div>
            <div class="row">
              <div class="control-group span15">
                <label class="control-label">备注：</label>
                <div class="controls control-row4">
                  <textarea class="input-large" type="text"></textarea>
                </div>
              </div>
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
                width:500,
                height:320,
                //配置DOM容器的编号
                contentId:'content',
                success:function () {
                  alert('确认');
                  this.close();
                }
              });
            dialog.show();
            $('#btnShow').on('click',function () {
            
              dialog.show();
            });
          });
        </script>
    <!-- script end -->
      </div>
    </body>
    </html>