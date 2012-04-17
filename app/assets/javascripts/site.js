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
  
  $('div.brands_list > ul > li').mouseover(function(){
    $(this).addClass('hover');
  }).mouseout(function(){
    $(this).removeClass('hover');
  });
  
  // var shareListItem = '216px';
  // var shareListWidth = shareListItem * 5;
  // $('.sharelist .shareitem').each( function(){ sum += $(this).width(); });
  // $('#holder > div').width( sum );
  
  $("#slider").easySlider({
	  auto: true, 
	  continuous: true, 
	  numeric: false, 
	  controlsShow: false,
	  outerControll: true,
	  onChangedCallback: function(n){
	    $("#slidernav li").removeClass("on");
	    $("#slidernav li:eq("+n+")").addClass("on");}
	});
  
  // $('#uploadphototempform').fileupload({
  //     dataType: 'json',
  //     url: '/uploadphototemp',
  //     done: function (e, data) {
  //         $.each(data.result, function (index, file) {
  //             $('<p/>').text(file.name).appendTo($('.preview'));
  //         });
  //     }
  // });

  // $('#fileupload').fileupload({
  //         dataType: 'json',
  //         url: 'server/php/',
  //         done: function (e, data) {
  //             $.each(data.result, function (index, file) {
  //                 $('<p/>').text(file.name).appendTo(document.body);
  //             });
  //         }
  //     });

  $('input.star').rating({'required': true});
  

});

$(window).scroll(function(){
  if($('#pagewrap').length==1) {
    if($(this).scrollTop()>61){
      $('#site_nav').addClass('topfixed');
    } else {
      $('#site_nav').removeClass('topfixed');}
  }
});

function reply_to(name) {
  $('#comment_input').focus().val('回复:'+name+' ');
}

