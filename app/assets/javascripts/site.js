$(document).ready(function() { 
  
  $('ul.sf-menu').superfish(); 
  var $container = $('#sharelist');
  $container.imagesLoaded( function(){
    $container.masonry({
      itemSelector : '.shareitem'
    });
  });
  
  $('div.shareitem').mouseover(function(){
    $(this).addClass('hover');
  }).mouseout(function(){
    $(this).removeClass('hover');
  });
  
  // var shareListItem = '216px';
  // var shareListWidth = shareListItem * 5;
  // $('.sharelist .shareitem').each( function(){ sum += $(this).width(); });
  // $('#holder > div').width( sum );
});

$(window).scroll(function(){
  if($('#pagewrap').length==1) {
    if($(this).scrollTop()>61){
      $('#site_nav').addClass('topfixed');
    } else {
      $('#site_nav').removeClass('topfixed');}
  }
});

