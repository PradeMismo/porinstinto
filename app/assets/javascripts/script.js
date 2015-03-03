/* Menu */
function mainmenu(){
    $(" #nav ul ").css({display: "none"}); // Opera Fix
    $(" #nav li").hover(function(){
            $(this).find('ul:first').css({visibility: "visible",display: "none"}).show(400);
            },function(){
            $(this).find('ul:first').css({visibility: "hidden"});
            });
}

$(document).ready(function(){                  
    mainmenu();
});


$(function() {
  $( "#tabs" ).tabs({ fx: { opacity: 'toggle' }});
  $( "#accordion" ).accordion({ animated: 'bounceslide' });
});

$(function (){
    $('iframe').each(function(){
      var url = $(this).attr("src")
      $(this).attr("src",url)
      });
});

$(function(){
    $('.scroll').bind('click',function(event){
        var $anchor = $(this);                   
        $('html, body').stop().animate({
        scrollTop: $($anchor.attr('href')).offset().top
    }, 1000,'swing'); 
        event.preventDefault();
    });
});

$(function(){
  $('.hover').hover(function() { 
      $(this).stop().animate({'opacity': 0.6});
      },function() { 
      $(this).stop().animate({'opacity': 1});
  });

links = 'a:not(.button, .no-effect, #logo, .jp-audio a, #nav a, .notif a, .post h2 a, .zoom)';
  $(links).hover(function() { 
      $(this).stop().animate({'opacity': 0.7}, 'fast');
      },function() { 
      $(this).stop().animate({'opacity': 1}, 'fast');
  });

$('.notif .close').click(function() {
    $(this).parent().slideUp();
    return false;
    });
});

$(function(){
  $('.hastip').tooltipsy();
});

$(function(){
  
  $('.search input').focus(function(){
        $(this).animate({'color':'#000000'});
        $('.search').animate({'background-color': '#ccc'});        
    });
    $('.search input').blur(function(){
        $(this).animate({'color':'#434448'});
        $('.search').animate({'background-color': '#b5b5b5'});        
    });

    $("#searchfield").each(function(){
        var defaultText = $(this).val();
        $(this).focus(function(){        
            if($(this).val()==defaultText){
                $(this).val("");
            }
        });
       
    $(this).blur(function(){
            if($(this).val()==""){
               $(this).val(defaultText);
            }
        });
    });

});


/* Portfolio */
$(function(){
  $(".box p").css({opacity:0});
  $(".cover").css({ opacity:0.7});

          //Partial Sliding (Only show some of background)
          $('.box').hover(function(){
            $(".cover", this).stop().animate({top:'90px', opacity:1},{queue:false,duration:400, easing:'easeOutQuart'});
            $(this).find("p").stop().animate({opacity:1},{queue:false,duration:400, easing:'easeOutQuart'});
          }, function() {
            $(".cover", this).stop().animate({top:'0px', opacity:0.7},{queue:false,duration:400, easing:'easeOutQuart'});
            $(this).find("p").stop().animate({opacity:0},{queue:false,duration:400, easing:'easeOutQuart'});
          });

          $('.box a').css({'opacity': 0.7});
          $('.box a').hover(function() { 
              $(this).stop().animate({'opacity': 1}, 'fast');
              },function() { 
              $(this).stop().animate({'opacity': 0.7}, 'fast');
          });

});



$(function(){
          $('.zoom img').hover(function() { 
              $(this).stop().animate({'opacity': 0.4}, 'fast');
              },function() { 
              $(this).stop().animate({'opacity': 1}, 'fast');
         });
});

$(function(){
  
        var items = $('#stage li'),
        itemsByTags = {};
  // Looping though all the li items:
  
  items.each(function(i){
    var elem = $(this),
      tags = elem.data('tags').split(',');
    
    // Adding a data-id attribute. Required by the Quicksand plugin:
    elem.attr('data-id',i);
    
    $.each(tags,function(key,value){
      
      // Removing extra whitespace:
      value = $.trim(value);
      
      if(!(value in itemsByTags)){
        // Create an empty array to hold this item:
        itemsByTags[value] = [];
      }
      
      // Each item is added to one array per tag:
      itemsByTags[value].push(elem);
    });
    
  });

  // Creating the "Everything" option in the menu:
  createList('All',items);

  // Looping though the arrays in itemsByTags:
  $.each(itemsByTags,function(k,v){
    createList(k,v);
  });
  
  $('#filter a').live('click',function(e){
    var link = $(this);
    
    link.addClass('active').siblings().removeClass('active');
    
    // Using the Quicksand plugin to animate the li items.
    // It uses data('list') defined by our createList function:
    
    $('#stage').quicksand(link.data('list').find('li'), 
                  {
                    duration: 1000
                  }, function() { 
                     /* Callback function */
                     //To switch directions up/down and left/right just place a "-" in front of the top/left attribute
        //Partial Sliding (Only show some of background)
        $('.box').hover(function(){
          $(".cover", this).stop().animate({top:'90px', opacity:1},{queue:false,duration:400, easing:'easeOutQuart'});
          $(this).find("p").stop().animate({opacity:1},{queue:false,duration:400, easing:'easeOutQuart'});
        }, function() {
          $(".cover", this).stop().animate({top:'0px', opacity:0.7},{queue:false,duration:400, easing:'easeOutQuart'});
          $(this).find("p").stop().animate({opacity:0},{queue:false,duration:400, easing:'easeOutQuart'});
        });

        $('.box a').css({'opacity': 0.7});
        $('.box a').hover(function() { 
            $(this).stop().animate({'opacity': 1}, 'fast');
            },function() { 
            $(this).stop().animate({'opacity': 0.7}, 'fast');
        });
                  });
                        e.preventDefault();
  });
  
  $('#filter a:first').click();
  
  function createList(text,items){
    
    // This is a helper function that takes the
    // text of a menu button and array of li items
    
    // Creating an empty unordered list:
    var ul = $('<ul>',{'class':'hidden'});
    
    $.each(items,function(){
      // Creating a copy of each li item
      // and adding it to the list:
      
      $(this).clone().appendTo(ul);
    });

    ul.appendTo('#container');

    // Creating a menu item. The unordered list is added
    // as a data parameter (available via .data('list'):
    
    var a = $('<a>',{
      html: text,
      href:'#',
      data: {list:ul}
    }).appendTo('#filter');
  }
               
});


$(function(){
     $("#contactsubmit").click(function(){        
        valid = true;
        if(!$('input[name=antispam]').val()==""){
            valid = false;
        }

        if($("#inputname").val()==""){
            valid = false;
           $("#inputname").parent().parent().addClass('error'); 
           $("#inputname").next('div').css({visibility: "visible",display: "none"}).show(400);
               $("#inputname").focus(function(){
               $("#inputname").next('div').fadeOut();
               $("#inputname").parent().parent().removeClass('error');
           });
        }
        
        if($("#inputsubject").val()==""){
            valid = false;
           $("#inputsubject").parent().parent().addClass('error'); 
           $("#inputsubject").next('div').css({visibility: "visible",display: "none"}).show(400);
               $("#inputsubject").focus(function(){
               $("#inputsubject").next('div').fadeOut();
               $("#inputsubject").parent().parent().removeClass('error');
           });
        }

        if($("#inputemail").val()==""){
            valid = false;
           $("#inputemail").parent().parent().addClass('error');
           $("#inputemail").next('div').css({visibility: "visible",display: "none"}).show(400);
           $("#inputemail").focus(function(){
               $("#inputemail").next('div').fadeOut();
               $("#inputemail").parent().parent().removeClass('error');
           });
        }
        else if(!$("#inputemail").val().match(/^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/)){
           valid = false; 
           $("#inputemail").parent().parent().addClass('error');
           $("#inputemail").next().next('div').css({visibility: "visible",display: "none"}).show(400);
           $("#inputemail").focus(function(){
               $("#inputemail").parent().parent().removeClass('error');
               $("#inputemail").next().next('div').fadeOut(); 
           });
        }
        
        if($("#inputmessage").val()==""){
            valid = false;
           $("#inputmessage").parent().parent().addClass('error');
           $("#inputmessage").next('div').css({visibility: "visible",display: "none"}).show(400);
           $("#inputmessage").focus(function(){
               $("#inputmessage").next('div').fadeOut();
               $("#inputmessage").parent().parent().removeClass('error');
           });
        }
        
        return valid;
     });
});