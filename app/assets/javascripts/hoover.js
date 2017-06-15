function redim() {
  var record_height = $('.record_box').width(); 
  $('.record_box').css({
      'height': record_height + 'px'
  });

  var record_height = $('.video_box').width() / 1.778 ; 
  $('.video_box').css({
      'height': record_height + 'px'
  });
}

$(document).ready(function(){
  redim();
});

$(window).resize(function(){
  redim();
});