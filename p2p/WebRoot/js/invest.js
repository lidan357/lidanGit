/**
 * 
 */
$(function () {
    $(".pageNum").click(function () {
        var curPage=$(this).text();
        var url="invest.action?op=all&curPage="+curPage;
        $(this).attr('href',url);
    });


    $("#prePage").click(function () {
        var curPage=parseInt($(this).attr("href"))-1;
        var url="invest.action?op=all&curPage="+curPage;
        $(this).attr('href',url);
    });

    $("#nextPage").click(function () {
        var curPage=parseInt($(this).attr("href"))+1;
        var url="invest.action?op=all&curPage="+curPage;
        $(this).attr('href',url);
    });

    $(".invest_prochoose a").click(function () {
        if($(this).text()!="不限"){
            $("#listLoan").empty();
            var value=$(this).attr("href");
            var url="invest.action?op=sel&where="+value;

            $.getJSON(url, function (data) {
                $.each(data, function (i,item) {
                    var num=item.inter*100;
                    num=num.toFixed(0);

                    var progress=(item.curMoney/item.loanMoney)*100;
                    progress=progress.toFixed(0);

                    $("#listLoan").append("<div class='prolist_one prolist_one_bl01 mt20'>"
                        +  "<h2 class='prolist_one_tit'><span>"+item.loanType+"</span>"+item.morType+"周转"+item.loanMoney+"元</h2>"
                        + " <ul class='prolist_one_ul clearfix'>"
                        +  " <li>  年华收益：<strong>"+num+"%</strong><br> 还款方式：按月付息，到期还本 </li>"
                        +  " <li> 剩余期限：<i>"+item.surLine+"</i>天<br> 保障机构：中融兴业融资担保有限公司</li>"
                        +   "<li class='prolist_press'> 募集金额：<strong>"+item.loanMoney+"</strong> 元 <br> 认购进度："
                        +    "<span class='ui-progressbar-mid ui-progressbar-mid-100'>"+progress+"%</span></li>"
                        +    "<li class='prolist_btn'> <a href='detail.jsp' class='pro_btn'>立即投资</a></li>"
                        +    " </ul> </div>");

                });
            });
            return false;
        }

    });
});