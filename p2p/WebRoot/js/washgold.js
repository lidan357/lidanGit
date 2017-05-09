$(function () {
        setInterval(function(){
            var nowDate=new Date();
            nowDate=nowDate.toLocaleString();
            $("#spanDate").text(nowDate);
        },1000);

        $(".lefloat a").click(function () {
            var href=$(this).attr("href");
            var offset=$(href).offset().top;
            $('html').animate({
                scrollTop:offset
            },500)
            return false;
        });

        $(".goldenBtnwYes").click(function () {
            var goldenBtnwYes=$(this);
            washID=$(this).attr("id");
            url="/p2p/washgold.action?op=get&washID="+washID;
            $.getJSON(url,function (data) {            
                var data=new String(data);               
                if(data=="true"){
                    var parent=goldenBtnwYes.parent();
                    parent.html("<a class='goldenBtnw'>立即领取</a>");
                }
            });
        });
        $("#momentBtn").click(function () {
            var form=$("#formUser").serialize();
            console.log(form);
            url="/p2p/washgold.action?op=login&"+form;
            $.getJSON(url, function (data) {
                data=new String(data);
                if(data=="true"){
                   console.log("ok");
                    window.location.href="/p2p/washgold.action"
                }else{
                    $("#spanError").css("display","inline");
                }
            });
        });
});
