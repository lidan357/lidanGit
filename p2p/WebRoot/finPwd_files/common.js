//流转标
function investTransferBorrow(id,borrowName){
		if(!id){
			 Mix.alert("数据有误");
			 return false;
		}
		var count = parseInt($(".transfer_id_"+id).find(".zr_transfer_input input").val());
			count = !isNaN(count)?count:1;
		var p={"id":id,"num":count};
		Mix.get(GV.TINVEST_URL,"我要投标-"+borrowName,p);
}
function NewInvestTransferMoney(id,turl,cgurl){
		var radios = document.getElementById("rcheckbox");
	
	
	if(radios.checked){	
	
	var tForm = $("#investTransferForm");
	var tnum = parseInt(tForm.find("#transfer_invest_num").val());
	var per = parseInt(tForm.find("#per_transfer").val());
	var duration = parseInt(tForm.find("#sort_order_invest").val());
	var usehl = $("#usehl").val();
	var total = tnum*per;
		tendValue = isNaN(total)?0:total;
	var pin = tForm.find("#T_pin").val();
	var borrow_id = tForm.find("#T_borrow_id").val();
	var rnum = parseInt($("#reward_invest").val());
		rnum = isNaN(rnum)?0:rnum;

	if(pin==""){
	  Mix.tip(tForm.find("#T_pin"),"请输入支付密码",1,3);  
	  return false;
	}
	if(tnum>T_transfer_num){
	  Mix.tip(tForm.find("#transfer_invest_num"),"本标还能认购最大份数为"+T_transfer_num+"份，请重新输入认购份数",1,3);
	  return false;
	}
	if(rnum>T_reward_money){
	  Mix.tip(tForm.find("#reward_invest"),"您帐户奖励金额为"+T_reward_money+"元，请重新输入使用奖励金额",1,3);
	  return false;
	}
	var p = {"transfer_invest_num":tnum,'pin':pin,'T_borrow_id':borrow_id,'reward_use':rnum,'duration':duration,'usehl':usehl};
	p['__hash__'] = tForm.find("input[name='__hash__']").val();
	p['is_confirm']=1;
	Mix.load('提交中......');
	postData(turl,p,function(d){
		if(d.status==0){
			Mix.msg(d.message,'fail',1);
		}else if(d.status==2){
			Mix.confirm("余额不足",d.message,function(){
				window.location.href=cgurl;
			},function(index){
				Mix.close(index);
			},2,['去充值','暂不充值']);
		}else if(d.status==3){
			Mix.msg(d.message,'warn',1);
		}else if(d.status==4){
			Mix.confirm("确认投标",d.message,function(){
				Mix.load('提交中......');
				p['is_confirm']=0;
				postData(turl,p,function(d){
					if(d.status==1){
						Mix.close();
						Mix.msg(d.message,'success',2);
						setTimeout(function(){ window.location.reload();},2000);
					}
					else  Mix.msg(d.message,'fail',2);
				});
			},function(index){
				Mix.close(index);
			},2,['确认投标','暂不投标']);
		}
	});
		}else{
        Mix.alert("请先同意服务协议哦！");
	}
	
}

function minusNum(id){
  var count = parseInt($(".transfer_id_"+id).find(".zr_transfer_input input").val());
	  count = !isNaN(count)?count:1;
	  count--;
  if(count<1) count=1;
  $(".transfer_id_"+id).find(".addBox input").val(count+"份");
}

function addNum(id){
  var count = parseInt($(".transfer_id_"+id).find(".addBox input").val());
	  count = !isNaN(count)?count:1;
	  count++;
  $(".transfer_id_"+id).find(".addBox input").val(count+"份");
}

function sumTMoney(obj){
	obj.value=obj.value.replace(/[^0-9]/g,'');
	var tnum = parseInt($("#transfer_invest_num").val());
	var per = parseInt($("#per_transfer").val());
	var total = tnum*per;
		total = isNaN(total)?0:total;
	$("#total_transfer_money").html(total);
}

function showTMoney(rate,reward_rate,increase_rate){
	var tnum = parseInt($("#transfer_invest_num").val());
	var per = parseInt($("#per_transfer").val());
	var month = parseInt($("#transfer_invest_month").val());
		month = isNaN(month)?0:month;
	var total = tnum*per;
		total = isNaN(total)?0:total;
		
	var interest_rate = parseFloat(rate)+(month-1)*parseFloat(increase_rate);
	var interest = parseFloat(interest_rate)*total*month/(12*100);
	var reward = parseFloat(reward_rate)*total*month/100;
	$("#except_income").html("￥"+round2((interest+reward),2));
	$("#interest_income").html("￥"+interest);
	$("#reward_income").html("￥"+reward);
}
//流转标结束

function round2(floatData,i){
	var i=i+1;
	var floatStr = (floatData)+"";
	var index = floatStr.indexOf(".");
	if(index!=-1){
			return floatStr.substring(0,(index+i));	
	}
	else
		return floatStr;
}

function Loading(showBox,loadingUrl){
	var loadingUrl = loadingUrl||"/statics/common/images/bigloading.gif";
	var _this = $(showBox);
	var _thisO = this;
	this.timer = null;
	this.show = function(){
		$('<div id="showBigLoading"><img src="'+loadingUrl+'"/></div>').appendTo(_this);
		clearTimeout(this.timer);
		timer = setTimeout(function(){ 
			$("#showBigLoading").fadeIn(500);
		},100);
	}
	this.close = function(){
		clearTimeout(_thisO.timer);
		$("#showBigLoading").fadeOut(100,function(){
			$(this).remove();
		})
	}
}

function reLoadPage(){
	var currentUrl=window.location.href;
	try{
	var vid = currentUrl.split("#");
	var _this = $("#rotate").find("a[href='#"+vid[1]+"']");
	var geturl = _this.attr('ajax_href');
	var nowurl = _this.attr('href');
	ajaxGetData(geturl,vid[1]);
	_this.attr('get',1);
	}catch(e){ };
}

function makevar(v){
	var d={};
	for(i in v){
		var id = v[i];
		d[id] = $("#"+id).val();
		if(!d[id]) d[id] = $("input[name='"+id+"']:checked").val();
	}
	return d;
}

function postData(url,dataPost,callBack){
	if(typeof dataPost.__hash__=="undefined" && typeof GV!="undefined") dataPost.__hash__ = GV.TOKEN
	$.ajax({
		url: url,
		data: dataPost,
		timeout: 150000,
		cache: false,
		type: "post",
		dataType: "json",
		success: function (d, s, r) {
			if(d){
				callBack(d);
			}else{
				Mix.alert("获取数据出错","error");	
			}
		}
	});
}

function getData(url,callBack,dataSend){
	var dataSend=dataSend||{};
	$.ajax({
		url: url,
		data: dataSend,
		timeout: 150000,
		cache: false,
		type: "get",
		dataType: "json",
		success: function (d, s, r) {
			if(d){
				callBack(d);
			}else{
				Mix.alert("获取数据出错");	
			}
		}
	});
}


function ajaxGetData(url,targetid,data){
		if(!url) return;
		data = data||{};
		var thtml = '<div class="loding"><img src="'+GV.STATICS_RUL+'/common/images/loading.gif" align="absmiddle" />　信息正在加载中...,如长时间未加载完成，请刷新页面</div>';
		$("div[tabid='"+targetid+"']").show().html(thtml);
		//获取数据
		$.ajax({
			url: url,
			data: data,
			timeout: 150000,
			cache: true,
			type: "get",
			dataType: "json",
			success: function (d, s, r) {
				if(d) $("div[tabid='"+targetid+"']").show().html(d.html);
			},
			error: function(){ $("div[tabid='"+targetid+"']").show().html("出错了，请刷新重试"); },
			complete: ''
		});
	
}

/**
根据某属性在数组中找元素,attribute为null时直接比较元素
**/
function IndexFromArray(array,attribute,value){
	if(!array)return -1;
	for(var i=0;i<array.length;i++){
		if(attribute!=null){
			if(array[i][attribute]==value)
				return i;
		}else{
			if(array[i]==value)
				return i;
		}
	}
	return -1;
}

/**
替换字符串中所有匹配的元素
**/
String.prototype.replaceAll = function(s1,s2){   
   return this.replace(new RegExp(s1,"gm"),s2);   
}
var _noSerialArray=["extend"];
/**
以json格式序列化js对象,obj为需要序列化的对象，noSerialArray为不需序列的属性
**/
function Serialize(obj){
	try{
	  var otype = typeof obj; 
	  if(otype=="null"||otype=="undefinded")
	  	return "null";
	  var objType = obj.constructor+"";
	  if(objType.indexOf("Object")!=-1){
	  	 var str = "{";
             for(var o in obj){
				if(IndexFromArray(_noSerialArray,null,(o+""))!=-1)
				 	continue;     
                 str += '"'+o+'"' + ":" + Serialize(obj[o]) +",";       
             }
			 
             if(str.substr(str.length-1) == ",")       
                str = str.substr(0,str.length -1);       
              return str + "}";     
	  }else if(objType.indexOf("Array")!=-1){
		   var str = "["; 
			  if(obj.length>0){      
				  for(var oIndex = 0;oIndex<obj.length;oIndex++){   
					  str += Serialize(obj[oIndex]) +",";       
				  }
				  if(str.substr(str.length-1) == ",")       
					  str = str.substr(0,str.length -1);
			  }
              return str + "]";       
	  
	  }else if(objType.indexOf("Boolean")!=-1){
		  return "" + obj + "";   
	  }else if(objType.indexOf("Date")!=-1){
	  	  return "\"" + obj + "\"";   
	  }else if(objType.indexOf("Function")!=-1){
	  	  return "";
	  }else if(objType.indexOf("Number")!=-1){
	  	  return "" + obj + "";   
	  }else if(objType.indexOf("String")!=-1){
	  	  	return "\"" + (obj+"").replaceAll("\\\\","\\").replaceAll("\\\\","\\\\").replaceAll("\"","\\\"").replaceAll("\n","\\\n").replaceAll("\r","\\\r") + "\"";    
	  }
	}
	catch(e){
		alert(e);
	}
}
