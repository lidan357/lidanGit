/**
 * 
 */
$(function () {

    $(".i-btn-txt1").click(function () {
        var divT=$(this);
        $("#tabinterest").html("");
        if($(this).text()=="还息"){
            var loanID=$(this).attr("id");

            url="/p2p/payInterest.action?op=show&loanID="+loanID;
            $.getJSON(url, function (data) {
            	 $.each(data, function (i,item) {
    
            		 if(item.corMonIsRe=="否"){
            			 $("#tabinterest").append("<tr><td>"+item.reInterDate+"</td><td>"+item.reMonRe+"</td><td>"+item.corMonIsRe+"</td><td><button value="+item.interID+" type='button' class='btn btn-info'>还息</button></td></tr>");
            		 }else{
            			 $("#tabinterest").append("<tr><td>"+item.reInterDate+"</td><td>"+item.reMonRe+"</td><td>"+item.corMonIsRe+"</td><td><button disabled='true' value="+item.interID+" type='button' class='btn btn-info'>还息</button></td></tr>");
            		 }
            		
            	 });

                $("#tabinterest button").click(function () {
                    var btn=$(this);
                    var data=$(this).val();
                    alert(data);
                    url="/p2p/payInterest.action?op=payInterest&interID="+data;
                    $.getJSON(url,function (data) {
                    	if(data==true){
                    	    alert("还息成功");
                            btn.attr("disabled","true");
                    	}else{
                    		alert("很遗憾还息出现错误");
                    	}
                    });
                });

            });
         }else{
            var loanID=$(this).attr("id");
            alert(loanID);
            url="/p2p/payInterest.action?op=pay&loanID="+loanID;
            $.getJSON(url, function (data) {
            	if(data==true){
                	alert("还款成功");
                    divT.remove();
                	}else{
                		alert("很遗憾还款出现错误");
                	}	
            });
         }

    });

})