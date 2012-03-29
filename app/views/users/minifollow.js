<% if @ok %>
  alert("关注成功");
<% else %>
  alert("<%= @msg %>");
<% end %>