 var color =new Array('#7179cb', '#6ed7ff','#79c850','#ffb65d','#00CED1','#00BFFF','#008B8B');	 
 //画柱状图
function barCharts(info,c_name){
	if(c_name!="not"){
		$("#canvas").empty();
	}
	if(c_name=="array"||c_name=="not"){
		//alert("ss");
		hei=400;
		wid=600;
		 $(".detail-section").css({
			  "position": "relative",
			"margin-top": "50px",
			  
		  });
	}else{
		hei=400;
		wid=700;
		 $(".detail-section").css({
			  "position": "relative",
			"margin-right": "50px",
			"margin-left":"150px",
			"padding-right ": "50px"
			  
		  });
	}
	 
  var chart = new AChart({
      theme : AChart.Theme.SmoothBase,
      id : 'canvas',
      width : wid,
      height : hei,
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
        name:"",
        events : {
          itemclick : function (ev) {
            var point = ev.point,
              //item = ev.item, //点击的项
              obj = point.obj; //point.obj是点击的配置项的信息
           // alert(obj.x); //执行一系列操作
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

		  var url="../invInfoStatistic.action";
		  var result;
		  var opValue="";
		  if(type=="m1"){
				  opValue="weekInv";
				  result=getLineResult;
		  }else if(type=="m2"){
			  opValue="inter";
			  result=getPieResult;
		  }else if(type=="m3"){
			  opValue="moneyInv";
			  result=getResult;
		  }else if(type=="m4"){
			  opValue="userInv";
			  result=getArrayResult;
		  }

		 //如果不是要散列图 是这个ajax 主要里面的处理结果的函数不一样
			$.ajax({
				  type: 'POST',
				  url: url,
				  dataType: "text",  
				  data: {op:opValue},
				  success: result,
				});		
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
		//  barCharts(d2[1],"");  
		 
	  }
  
  //处理二维数组的 柱状图
  function getArrayResult(data){
		//alert(data);
		var obj =eval('('+data+')');
		var d2= new Array();
		for(var j=0;j<obj.length;j++){
			d2[j] =  new Array();
		for(var i=0;i<obj[j].length;i++){
			d2[j][i]={x:obj[j][i].pro,y:obj[j][i].val,attrs:{fill:color[i]}};
				}
		}
		  barCharts(d2[0],"array");  
		  barCharts(d2[1],"not");  
		 
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
  
  
  //处理折线图数据
  function getLineResult(data){
		var obj =eval('('+data+')');
		//alert(obj[0][0].val)
		lineChart(obj[0],"");
	  lineChart(obj[1],"not");
	  
	  
  }
  
  //处理饼图结果
  
  function getPieResult(data){
	  
	  data= eval("("+data+")")
	  pieCharts(data)
	  
	  
  }
  
  
  
  //画饼图
  function pieCharts(info){
	  
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
              name: info[0].pro,
			  legendType : 'circle', //显示在legend上的图形
              legend : {
                position : 'bottom', //位置
                back : null, //背景清空
                spacingX : 15, //增加x方向间距
                itemCfg : { //子项的配置信息
                  label : {
                    fill : '#999',
                    'text-anchor' : 'start',
                    cursor : 'pointer'
                  }
                }
              },
              data: info[0].val
          }]
        });
 
        chart.render();
	  
	  
	  
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
  
  //画折线图
  function lineChart(info,flag){
	 if(flag!="not"){
	  $("#canvas").empty();
	 }
	  var chart = new AChart({
	        theme : AChart.Theme.SmoothBase,
	        id : 'canvas',
	        width : 600,
	        height : 400,
	        plotCfg : {
	          margin : [50,50,80] //画板的边距
	        },
	        xAxis : {
	          categories :lastWeek()
	        },
	        tooltip : {
	          valueSuffix : "",
	          shared : true, //是否多个数据序列共同显示信息
	          crosshairs : true //是否出现基准线
	        },
	        series :[{ 
	        	name:info[0].pro,
	        	data:info[0].val
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