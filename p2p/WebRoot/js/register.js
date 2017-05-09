//注册页面的js验证
// author chenyong -->

	var captchaIsRight = false;
	var nameIsRight = false;
	var phoneIsRight = false;
	var pwdIsRight = false;
	var pwdConIsRight  = false;
	//使用jquery的ajax
  //  jQuery.post(url,{proId:id},JqueryGetResult);
	//和下面写法一样
    //$.post(url,{proId:id},JqueryGetResult);
	//另外一种写法
	        
//获取验证码是否正确的结果
function JqueryGetResult(data){
	if(data=="0"){
		 $("#captchaInfo").text("验证码不正确");
		 
	}else{
		 $("#captchaInfo").text("");
		 captchaIsRight=true;
	}
}
 //获取电话号码是否存在的结果
function phoneResult(data){

	if(data=="1"){
		 $("#phoneInfo").text("手机号码已存在");
	}else{
		 $("#phoneInfo").text("");
		phoneIsRight=true;
	}
}
 
 //获取用户名是否已经存在的结果
function nameResult(data){
	if(data=="1"){
		 $("#nameInfo").text("用户名已存在");
	}else{
		 $("#nameInfo").text("");
		 nameIsRight=true;
	}
}



 $(function(){
	 //点击发送验证码
	 $("#sendCap").click(function(){
					var url = "messageCaptcha.action";
					$.ajax({
						  type: 'POST',
						  url: url,
						  data: {phone:$("#phone").val(),op:"register"},
						  success: null,
						});			
					
					 $("#captchaInfo").text("验证码已经发送，请注意查收");
	 	})
	 	
	 	//验证用户名是否已经存在
	 	$("#userName").blur(function(){
	
	 		 if($("#userName").val()==""){
				 $("#nameInfo").text("用户名不能为空");
				 
			 }else{
				 $("#nameInfo").text("");
				 var url = "register.action";
				 $.post(url,{op:"checkName",userName:$("#userName").val()},nameResult);
				
			 }
	 		
	 	})
	 		//检查电话号码是否已经存在
			$("#phone").blur(function(){
			
	 		 if($("#phone").val()==""){
				 $("#phoneInfo").text("手机号码不能为空");
				 $("#phoneInfo").focus();
			 }else  if (!$("#phone").val().match(/^[1][358][0-9]{9}$/)) { 
				 $("#phoneInfo").text("手机号码格式不正确！"); 
				 //$("#phone").focus(); 
				 }else{
				 $("#phoneInfo").text("");
				 var url = "register.action";
				 $.post(url,{op:"checkPhone",phone:$("#phone").val()},phoneResult);
			 }
			});
	 		
	 		//验证验证码是否输入正确
	 	$("#captcha").mouseout(function(){
	 	var url = "messageCaptcha.action";
	 		var $captcha = $("#captcha");
	 		if($captcha.val()==""||$captcha.val().length!=6){
	 			 $("#captchaInfo").text("验证码不能为空,或者长度不对");
	 		}else{
	 		$("#captchaInfo").text("");
	 		$.ajax({
				  type: 'POST',
				  url: url,
				  data: {captcha:$("#captcha").val(),op:"register"},
				  success:JqueryGetResult ,
				});			
	 		}
	 	})
	 	
	 	//验证密码是否输入或者格式是否正确()
	 	$("#password").blur(function(){
	 		
	 		 if($("#password").val()==""){
				 $("#pwdInfo").text("密码不能为空");
				// $("#pwdInfo").focus();
				 return false;
			 }else if(!$("#password").val().match(/^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{8,16}$/)){
				 $("#pwdInfo").text("密码只能是8-16位数字和字母的组合");
			 }else{
				 $("#pwdInfo").text("");
				 pwdIsRight=true;
			 }
	 		
	 		
	 	})
	 	
	 	
	 	//检查确认密码与密码是否一致
	 	$("#passwordConfirm").blur(function(){
	 		 if($("#passwordConfirm").val()==""){
				 $("#confrimInfo").text("确认密码不能为空");
			 } else if($("#password").val()!=$("#passwordConfirm").val()){
				 $("#confrimInfo").text("确认密码与密码不一致");
				// $("#passwordConfirm").focus();
			 }else{
				 $("#confrimInfo").text("");
				 pwdConfirmIsRight=true;
			 }
	 		
	 	})
	 	
	 	
	 	//点击提交时 最后再验证各个输入数据是否正确
	 $("#reg").click(function(){
			
		 if(!nameIsRight){
			 $("#nameInfo").text("用户名为空，或者已存在");
			 $("#nameInfo").focus();
			 return false;
		 }else{
			 $("#nameInfo").text("");
		 }
		 if(!pwdIsRight){
			 $("#pwdInfo").text("密码输入不正确");
			 return false;
		 }else{
			 $("#pwdInfo").text("");
		 }
		
		 if(!pwdConfirmIsRight){
			 $("#confrimInfo").text("确认密码不能为空,或者确认密码与密码不一致");
			 return false;
		 }else{
			 $("#confrimInfo").text("");
		 }
		 if(!phoneIsRight){
			 $("#phoneInfo").text("手机号码不正确，或者已存在");
			// $("#phone").focus(); 
			 return false;
		 }else{
			 $("#phoneInfo").text("");
		 }
		if(!captchaIsRight){
			return false;
		}
		//最后小心翼翼，过关斩将来到了表单提交更前，却发现断网了！
		 $("form").submit();
				 
	 });
	 
 });