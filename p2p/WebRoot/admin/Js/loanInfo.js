function getResult(data)
	{
		
			data = eval("("+data+")");
			
			//$("#loan_table").remove(".loan_tr");
			$(".loan_tr").empty();
			for (var i=0;i<data.length;i++){
				$("#loan_table").append("<tr id='loan_tr_id"+i+"' class='loan_tr'></tr>")
				$("#"+"loan_tr_id"+i+"").append("<td>"+data[i].loanID+"</td>")
				$("#"+"loan_tr_id"+i+"").append("<td>"+data[i].userID+"</td>")
				$("#"+"loan_tr_id"+i+"").append("<td>"+data[i].loanMoney+"</td>")
				$("#"+"loan_tr_id"+i+"").append("<td>"+data[i].curMoney+"</td>")
				$("#"+"loan_tr_id"+i+"").append("<td>"+data[i].loanType+"</td>")
				$("#"+"loan_tr_id"+i+"").append("<td>"+data[i].loanDate.year+"-"+(data[i].loanDate.month+1)+"-"+data[i].loanDate.day+"</td>")
				$("#"+"loan_tr_id"+i+"").append("<td>"+(data[i].inter+" ").substring(0,5)+"</td>")
				$("#"+"loan_tr_id"+i+"").append("<td>"+data[i].deadLine+"</td>")
				$("#"+"loan_tr_id"+i+"").append("<td>"+data[i].status+"</td>")
			$("#"+"loan_tr_id"+i+"").append("<td><a class='appro_a' href='javascript:;'>批准贷款</a></td>")
				
			}
		//alert("ss");
		}


