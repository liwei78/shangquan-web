$(document).ready(function() { 
    $('ul.sf-menu').superfish(); 

    var $container = $('#sharelist');
    $container.imagesLoaded( function(){
      $container.masonry({
        itemSelector : '.shareitem'
      });
    });
});

$(window).scroll(function(){
  if($('#pagewrap').length==1) {
    if($(this).scrollTop()>61){
      $('#site_nav').addClass('topfixed');
    } else {
      $('#site_nav').removeClass('topfixed');}
  }
  $('div.shareitem').mouseover(function(){
    $(this).addClass('hover');
  }).mouseout(function(){
    $(this).removeClass('hover');
  });
});