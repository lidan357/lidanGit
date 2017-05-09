//这是房产抵押的前台数据输入验证及前台一些元素添加
jQuery(function(){
	//添加年份
	for(var i=1970;i<=2020;i++){
		$("#year").append("<option value="+i+"->"+i+"年</option>");
	}
	//删除option：年
	$("#year").click(function(){
		$("#year option[value='1']").remove();
	});
	
	//添加月份
	for(var i=1;i<=12;i++){
		$("#month").append("<option  value="+i+"->"+i+"月</option>");
	}
	//删除option：月
	$("#month").click(function(){
		$("#month option[value='1']").remove();
	});
	
	//添加日
	$("#month,#year").click(function () {//JQuery中两个元素绑定同一事件
		$("#day").html("<option>日</option>");
		var selectedYear = $("#year").find("option:selected").text();
		var sy = selectedYear.substr(0,selectedYear.length-1);
		//alert(sy);
		var selectedMonth = $("#month").find("option:selected").text();
		var sm = selectedMonth.substr(0,selectedMonth.length-1);
		if(sy!=null && sy!="" && sm!=null && sm!=""){
			if(sm==2){
				if((sy%4==0 && sy%100!=0) || sy%400==0){
					$("#day").html("");
					for(var i=1;i<=29;i++){
						$("#day").append("<option  value="+i+">"+i+"日</option>");
					}
				}else{
					$("#day").html("");
					for(var i=1;i<=28;i++) {
						$("#day").append("<option  value="+i+">" + i + "日</option>");
					}
				}
			}else if(sm==2 || sm==4 ||sm==6 || sm==9 ||sm==11){
				$("#day").html("");
				for(var i=1;i<=30;i++){
					$("#day").append("<option  value="+i+">"+i+"日</option>");
				}
			}else{
				$("#day").html("");
				for(var i=1;i<=31;i++){
					$("#day").append("<option  value="+i+">"+i+"日</option>");
				}
			}
		}
	});

	
	


	//申请人验证
	$("#cue1").html(" 请填写真实姓名！");
	$("#realName").blur(function(){
		var realName = $(this).val();
		if(realName==null || realName==""){
			$("#cue1").html("申请人不能为空");
		}else{
			$("#cue1").html("");
		}
	});

	//借款金额验证
	$("#loanMoney").keyup(function(){
		var loanMoney = $(this).val();
		if(loanMoney!=null && loanMoney!=""){
			if (loanMoney.match("^[0-9]+(\.[0-9]+)?$")) {
				$("#cue2").html("");
			} else {
				$("#cue2").html("只能是数字");
			}
		}else{
			$("#cue2").html("不能为空");
		}
	});
	$("#loanMoney").blur(function(){
		var loanMoney = $(this).val();
		if(loanMoney!=null && loanMoney!=""){
			if (loanMoney.match("^[0-9]+(\.[0-9]+)?$")) {
				$("#cue2").html("");
			} else {
				$("#cue2").html("只能是数字");
			}
		}else{
			$("#cue2").html("不能为空");
		}
	});
	
	//愿出利率验证
	$("#inter").keyup(function(){
		var inter = $(this).val();
		if(inter!=null && inter!=""){
			if (inter.match("^[0-9]+(\.[0-9]+)?$")) {
				$("#cue3").html("");
			} else {
				$("#cue3").html("只能是数字");
			}
		}else{
			$("#cue3").html("不能为空");
		}
	});
	$("#inter").blur(function(){
		var inter = $(this).val();
		if(inter!=null && inter!=""){
			if (inter.match("^[0-9]+(\.[0-9]+)?$")) {
				$("#cue3").html("");
			} else {
				$("#cue3").html("只能是数字");
			}
		}else{
			$("#cue3").html("不能为空");
		}
	});

	//借款期限验证
	$("#deadLine").keyup(function(){
		var deadLine = $(this).val();
		if(deadLine!=null && deadLine!=""){
			if(deadLine.match("^[0-9]*[1-9][0-9]*$")){
				$("#cue4").html("");
			}else{
				$("#cue4").html("只能为整数");
			}
		}else{
			$("#cue4").html("不能为空");
		}
	});
	$("#deadLine").blur(function(){
		var deadLine = $(this).val();
		if(deadLine!=null && deadLine!=""){
			if(deadLine.match("^[0-9]*[1-9][0-9]*$")){
				$("#cue4").html("");
			}else{
				$("#cue4").html("只能为整数");
			}
		}else{
			$("#cue4").html("不能为空");
		}
	});

	//手机号码验证
	$("#phone").keyup(function(){
		var phone = $(this).val();
		if(phone!=null && phone!=""){
			if(phone.match("1[3|4|5|8][0-9]\\d{8}$")){
				$("#cue5").html("");
			}else{
				$("#cue5").html("请输入正确的手机号码");
			}
		}else{
			$("#cue5").html("手机号码不能为空");
		}
	});
	$("#phone").blur(function(){

	});
	
	//验证码验证
	$("#yanzheng").keyup(function(){
		$.get("checkCode.action?op=code",function(data){
			var myString = $("#yanzheng").val();
			if(myString.toLowerCase()==data.toLowerCase()){
				$("#cue6").html("");
			}else{
				$("#cue6").html("验证码错误");
			}
		});
	});
	
	
});



	
