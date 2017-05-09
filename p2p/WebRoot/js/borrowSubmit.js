//这是borrow.jsp页面的数据提交
$(function(){
	$("#checkCode").click(function(){
		$("#checkCode").attr("src","checkCode.action?op=image&"+Math.random());
		//alert($("#checkCode").attr("src"));
	});	
		
	$("#borrowSubmit").click(function(){
		if($("#realName").val()!=null || $("#realName").val()!=""){
			$("#cue1").html("");
		}
		var y = $("#year").find("option:selected").text();
		var m = $("#month").find("option:selected").text();
		var d = $("#day").find("option:selected").text();
		var flag1=$("#realName").val()=="" || $("#loanMoney").val()=="" || $("#inter").val()=="" || $("#deadLine").val()=="" || $("#phone").val()=="" || $("#goods_descr").val()=="" || $("#image_src").val()=="" || $("#loan_descr").val()=="" || y=="年" || m=="月" || d=="日" || $("#yanzheng").val()=="";
		var flag2=($("#cue1").html()=="" && $("#cue2").html()=="" && $("#cue3").html()=="" && $("#cue4").html()=="" && $("#cue5").html()=="" && $("#cue6").html()=="");
		//alert($("#image_src").val());
		//alert(y+""+m+""+d);
		//alert(y=="年");
		if(!flag1){
			if(flag2){
				alert("您的申请已提交成功，请耐心等待审核通知！");
				$("#myform").submit();
		    	//$("#borrowSubmit").attr("href","/borrow.jsp");
		    	return true;
		    	}else{
		    		alert("格式不正确或验证码错误，请确认后再提交！");
		         	return false;
		    		}
		    }else{
		    	alert("必须填写所有项！");
		    	return false; 
	     	}
		   
//		    return confirm("数据不正确");
//			$("#myform").submit();
//			return false;
	});    
});
		
