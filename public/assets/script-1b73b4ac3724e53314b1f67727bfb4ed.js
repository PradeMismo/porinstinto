function mainmenu(){$(" #nav ul ").css({display:"none"}),$(" #nav li").hover(function(){$(this).find("ul:first").css({visibility:"visible",display:"none"}).show(400)},function(){$(this).find("ul:first").css({visibility:"hidden"})})}$(document).ready(function(){mainmenu()}),$(function(){$("#tabs").tabs({fx:{opacity:"toggle"}}),$("#accordion").accordion({animated:"bounceslide"})}),$(function(){$("iframe").each(function(){var t=$(this).attr("src");$(this).attr("src",t+"?wmode=transparent")})}),$(function(){$(".scroll").bind("click",function(t){var i=$(this);$("html, body").stop().animate({scrollTop:$(i.attr("href")).offset().top},1e3,"swing"),t.preventDefault()})}),$(function(){$(".hover").hover(function(){$(this).stop().animate({opacity:.6})},function(){$(this).stop().animate({opacity:1})}),links="a:not(.button, .no-effect, #logo, .jp-audio a, #nav a, .notif a, .post h2 a, .zoom)",$(links).hover(function(){$(this).stop().animate({opacity:.7},"fast")},function(){$(this).stop().animate({opacity:1},"fast")}),$(".notif .close").click(function(){return $(this).parent().slideUp(),!1})}),$(function(){$(".hastip").tooltipsy()}),$(function(){$(".search input").focus(function(){$(this).animate({color:"#000000"}),$(".search").animate({"background-color":"#ccc"})}),$(".search input").blur(function(){$(this).animate({color:"#434448"}),$(".search").animate({"background-color":"#b5b5b5"})}),$("#searchfield").each(function(){var t=$(this).val();$(this).focus(function(){$(this).val()==t&&$(this).val("")}),$(this).blur(function(){""==$(this).val()&&$(this).val(t)})})}),$(function(){$(".box p").css({opacity:0}),$(".cover").css({opacity:.7}),$(".box").hover(function(){$(".cover",this).stop().animate({top:"90px",opacity:1},{queue:!1,duration:400,easing:"easeOutQuart"}),$(this).find("p").stop().animate({opacity:1},{queue:!1,duration:400,easing:"easeOutQuart"})},function(){$(".cover",this).stop().animate({top:"0px",opacity:.7},{queue:!1,duration:400,easing:"easeOutQuart"}),$(this).find("p").stop().animate({opacity:0},{queue:!1,duration:400,easing:"easeOutQuart"})}),$(".box a").css({opacity:.7}),$(".box a").hover(function(){$(this).stop().animate({opacity:1},"fast")},function(){$(this).stop().animate({opacity:.7},"fast")})}),$(function(){$(".zoom img").hover(function(){$(this).stop().animate({opacity:.4},"fast")},function(){$(this).stop().animate({opacity:1},"fast")})}),$(function(){function t(t,i){var a=$("<ul>",{"class":"hidden"});$.each(i,function(){$(this).clone().appendTo(a)}),a.appendTo("#container");$("<a>",{html:t,href:"#",data:{list:a}}).appendTo("#filter")}var i=$("#stage li"),a={};i.each(function(t){var i=$(this),n=i.data("tags").split(",");i.attr("data-id",t),$.each(n,function(t,n){n=$.trim(n),n in a||(a[n]=[]),a[n].push(i)})}),t("All",i),$.each(a,function(i,a){t(i,a)}),$("#filter a").live("click",function(t){var i=$(this);i.addClass("active").siblings().removeClass("active"),$("#stage").quicksand(i.data("list").find("li"),{duration:1e3},function(){$(".box").hover(function(){$(".cover",this).stop().animate({top:"90px",opacity:1},{queue:!1,duration:400,easing:"easeOutQuart"}),$(this).find("p").stop().animate({opacity:1},{queue:!1,duration:400,easing:"easeOutQuart"})},function(){$(".cover",this).stop().animate({top:"0px",opacity:.7},{queue:!1,duration:400,easing:"easeOutQuart"}),$(this).find("p").stop().animate({opacity:0},{queue:!1,duration:400,easing:"easeOutQuart"})}),$(".box a").css({opacity:.7}),$(".box a").hover(function(){$(this).stop().animate({opacity:1},"fast")},function(){$(this).stop().animate({opacity:.7},"fast")})}),t.preventDefault()}),$("#filter a:first").click()}),$(function(){$("#contactsubmit").click(function(){return valid=!0,""==!$("input[name=antispam]").val()&&(valid=!1),""==$("#inputname").val()&&(valid=!1,$("#inputname").parent().parent().addClass("error"),$("#inputname").next("div").css({visibility:"visible",display:"none"}).show(400),$("#inputname").focus(function(){$("#inputname").next("div").fadeOut(),$("#inputname").parent().parent().removeClass("error")})),""==$("#inputsubject").val()&&(valid=!1,$("#inputsubject").parent().parent().addClass("error"),$("#inputsubject").next("div").css({visibility:"visible",display:"none"}).show(400),$("#inputsubject").focus(function(){$("#inputsubject").next("div").fadeOut(),$("#inputsubject").parent().parent().removeClass("error")})),""==$("#inputemail").val()?(valid=!1,$("#inputemail").parent().parent().addClass("error"),$("#inputemail").next("div").css({visibility:"visible",display:"none"}).show(400),$("#inputemail").focus(function(){$("#inputemail").next("div").fadeOut(),$("#inputemail").parent().parent().removeClass("error")})):$("#inputemail").val().match(/^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/)||(valid=!1,$("#inputemail").parent().parent().addClass("error"),$("#inputemail").next().next("div").css({visibility:"visible",display:"none"}).show(400),$("#inputemail").focus(function(){$("#inputemail").parent().parent().removeClass("error"),$("#inputemail").next().next("div").fadeOut()})),""==$("#inputmessage").val()&&(valid=!1,$("#inputmessage").parent().parent().addClass("error"),$("#inputmessage").next("div").css({visibility:"visible",display:"none"}).show(400),$("#inputmessage").focus(function(){$("#inputmessage").next("div").fadeOut(),$("#inputmessage").parent().parent().removeClass("error")})),valid})});