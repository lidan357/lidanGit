
jQuery(function()
{   
// 首页下拉	 
//function slideNav(slidewper,slidebox)
//	    {
//	    	 $(slidewper).toggle(function()
//			 {
//			 	 $(this).find(slidebox).stop(true).slideDown(300);
//			 },function()
//			 {
//			 	$(this).find(slidebox).stop(true).slideUp(300);
//			 })
//	    };
//	    slideNav(".nav_item2",".nav_item_dl"); 



// 排行榜切换
 function qiehuan(obj,objcur,boxone)
	   {
	   	  $(obj).click(function()
		   {
		   	   $(this).addClass(objcur).siblings().removeClass(objcur);
		   	   var index=$(this).index();
		   	 
		   	   $(boxone).eq(index).show().siblings().hide();
		   });
	   }
	  qiehuan(".block5_r_tit_em a","brt_acur",".rank_list");
//投资页切换 
      qiehuan(".product_tit span","product_curspan",".product_list");
      // borrow 切换
      qiehuan(".bor_detail_tit span","bor_decurspan",".bor_det_one");
     //detail 切换
      qiehuan(".detail_con_tit span","det_tit_curspan",".det_proone_l");
// 项目列表切换
$(function(){
		 $(".nzxcf_block3_tit").click(function()
		 {
		 	  $(this).addClass("block3_curspan").siblings().removeClass("block3_curspan");
		 	  var index=$(this).index();
		 	  $(".block3_prolist").eq(index).show().siblings().hide();
		 })
		 
		 $(".nzx_t").click(function()
		 {
		 	  $(this).addClass("nzx_t1").siblings().removeClass("nzx_t1");
		 	  var index=$(this).index();
		 	  $(".nzx_c").eq(index).show().siblings().hide();
		 })
		 
		 $(".nph_t").click(function()
		 {
		 	  $(this).addClass("nph_t1").siblings().removeClass("nph_t1");
		 	  var index=$(this).index();
		 	  $(".nph_c").eq(index).show().siblings().hide();
		 })
		 
		 $(".zxcf_link h3 span").click(function()
		 {
		 	  $(this).addClass("zx_on").siblings().removeClass("zx_on");
		 	  var index=$(this).index();
		 	  $(".zxcf_lc").eq(index).show().siblings().hide();
		 })
	})
	$(function(){
		 $(".zscf_block5_l h2 span").click(function()
		 {
		 	  $(this).addClass("block3_curspan").siblings().removeClass("block3_curspan");
		 	  var index=$(this).index();
		 	  $(".news_ul").eq(index).show().siblings().hide();
		 })
	})
//友情链接

	$(function(){
	  $('.bcTitleN').click(function(){ 
	  var _num=$(this).index();
		 	  $(this).addClass("block3_curspan").siblings().removeClass("block3_curspan");			  
		 	  $(".corperation").eq(_num).show().siblings().hide();
		 })
	})
	

		 
// invest页 筛选
 $(".invest_prochoose p a").click(function()
		 {   
		 	  $(this).addClass("inpro_cura").siblings().removeClass("inpro_cura");
		 });


// problem页 切换
 $(".hc_zjwt_one h3").click(function()
		    {    

		 	 if($(this).hasClass("show"))
		 	 {
               $(this).parents(".hc_zjwt_one").find(".hc_answer").hide().end().find(this).removeClass("show"); 
		 	 }else
		 	 {
		 	   $(".hc_answer").hide().parents(".hc_zjwt_one").find(".hc_zjwt_one h3").removeClass("show");
		 	   $(this).parents(".hc_zjwt_one").find(".hc_answer").show().end().find(this).addClass("show");
		 	 }
		 	  
		   });


// noticlist页 
$(".notic_secl_ul li").click(function()
{    

	 $(this).addClass("notic_curli").siblings().removeClass("notic_curli");
});


	
});
