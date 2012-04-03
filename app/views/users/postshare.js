$('#postsharediv').empty();
$('.postdone').show();
<% if @done %>
  $('.donewords').html("发表成功，快去看看吧");
<% else %>
  $('.donewords').html("发表失败，请返回检查");
<% end %>
$('.targetlink').html("<%=j link_to @targeturl, @targeturl %>");