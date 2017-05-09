 var color =new Array('#7179cb', '#6ed7ff','#79c850','#ffb65d','#00CED1','#00BFFF','#008B8B');	 
function barCharts(info,c_name){
	  $("#canvas").empty();
  var chart = new AChart({
      theme : AChart.Theme.SmoothBase,
      id : 'canvas',
      width : 700,
      height : 400,
      xAxis : {
        type : 'category'
      },
      seriesOptions : {
          columnCfg : {
            allowPointSelect : true,
            xField : 'x',
            item : {
              cursor : 'pointer',
              stroke : 'none'
            }
          }
      },
      yAxis : {
        min : 0
      },
      series: [ {
        name:c_name,
        events : {
          itemclick : function (ev) {
            var point = ev.point,
              //item = ev.item, //点击的项
              obj = point.obj; //point.obj是点击的配置项的信息
            alert(obj.x); //执行一系列操作
          }/*,
          itemselected : function(ev){ //选中事件
 
          },
          itemunselected : function(ev){ //取消选中事件
 
          }
          */
        },
        data: info
      }]
 
    });
  chart.render();
  }
  
  
  function myAjax(type){
	//alert(type);
		  var url="../loanInfoStatistic.action";
		  var opValue="";
		  if(type=="m1"){
				  opValue="weekLoanCount";
		  }else if(type=="m2"){
			  opValue="weekLoanMoney";
			  
		  }else if(type=="m4"){
			  
			  opValue="inter";
		  }else if(type=="m5"){
			  opValue="check";
		  }else if(type=="m6"){
			  opValue="userCount";
		  }
		  else if(type=="m7"){
			  opValue="interBubble";
		  }
		  else if(type=="m8"){
			  opValue="loanAndInvest";
		  }
		  if(type!="m7"&&type!="m8"){//如果不是要散列图 是这个ajax 主要里面的处理结果的函数不一样
			$.ajax({
				  type: 'POST',
				  url: url,
				  dataType: "text",  
				  data: {op:opValue},
				  success: getResult,
				});		
		  }else if(type=="m7") {//如果是散列图 则是这个ajax
				$.ajax({
					  type: 'POST',
					  url: url,
					  dataType: "text",  
					  data: {op:opValue},
					  success: getBubbleResult,
					});		
			  
		  }else if(type=="m8"){
				$.ajax({
					  type: 'POST',
					  url: url,
					  dataType: "text",  
					  data: {op:opValue},
					  success: getAreaResult,
					});		
			  
		  }
	  }
	  
  //处理一般柱状图的数据
  function getResult(data){
		//alert(data);
		var obj =eval('('+data+')');
		var d2= new Array();
		for(var i=0;i<obj.length;i++){
			d2[i]={x:obj[i].pro,y:obj[i].val,attrs:{fill:color[i]}};
				}
		  barCharts(d2,"");  
		 
	  }
  
  //处理散列图的数据
  function getBubbleResult(data){
		//alert(data);
		var obj =eval('('+data+')');
		var d2= new Array();
		for(var i=0;i<obj.length;i++){
			d2[i] = new Array();
			d2[i][0]=obj[i].val;
			d2[i][1]=obj[i].pro*1000;
			//alert(d2[i][0]+"   "+d2[i][1])
				}
		bubbleCharts(d2,"");  
		 
	  }
  
  
  //处理区域图的数据
  function getAreaResult(data){
		//alert(data);
		var obj =eval('('+data+')');
		var d2= new Array();
		for(var i=0;i<obj.length;i++){
			d2[i] = new Array();
			for(var j=0;j<obj[i].length;j++){
				d2[i][j]=obj[i][j].val;
			
					}
			}
		areaCharts(d2,"");  
	  }
  
  
 //画散列图的 
  function bubbleCharts(info,c_name){
	  $("#canvas").empty();
	  var chart = new AChart({
          theme : AChart.Theme.SmoothBase,
          id : 'canvas',
          width : 800,
          height : 500,
          plotCfg : {
            margin : [50,50,80] //画板的边距
          },
          yAxis : {
            min : 0
          },
          tooltip : {
            valueSuffix : '/1000'
          },
          seriesOptions : {
              scatterCfg : {
                markers : {
                  marker : {
                    radius : 5,
                    'stroke-width' : 1,
                    'fill-opacity' : .5
                  },
                  actived : {
                      radius : 8,
                      stroke: '#fff'
                  }
                }
              }
          },
          series: [  {                                                                                 
                  name: '利率',                                                                    
                  data: info                                             
              }]
        });
 
        chart.render();
	  
  }
  
  
  //画区域图的
  function areaCharts(info,c_name){
	  $("#canvas").empty();

	  var chart = new AChart({
		    theme : AChart.Theme.SmoothBase,
		    id : 'canvas',
		    width : 800,
		    height : 500,
		    plotCfg : {
		      margin : [50,50,80] //画板的边距
		    },
		    xAxis : {
		      categories :lastWeek()
		    },
		    seriesOptions : { //设置多个序列共同的属性
		      areaCfg : { //不同类型的图对应不同的共用属性，lineCfg,areaCfg,columnCfg等，type + Cfg 标示
		        smooth : true,
		        markers : {
		          single : true,
		          marker : {
		            fill : null,
		            stroke : '#eff',
		            radius : 6,
		            'stroke-width':4
		          },
		          actived : {
		            fill : null,
		            stroke : '#eff',
		            radius : 6,
		            'stroke-width':4
		          }
		        }
		      }
		    },
		    tooltip : {
		      valueSuffix : '°C'
		    },
		    series : [{
		          name: '贷款',
		          data: info[0]
		      }, {
		          name: '投资',
		          data: info[1]
		      }]
		  });
		  chart.render();
	  
  }
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  //获得最近七天日期
  function lastWeek(){
	  var d = new Date();
	  var myarray = new Array();
	 for(var i=0;i<=6;i++){
	 myarray[i]=(d.getMonth()+1)+"月"+(d.getDate()-i)+"日";
	 //alert(myarray[i]);
	 
	 }
	 myarray.reverse();
	 return myarray;
  }