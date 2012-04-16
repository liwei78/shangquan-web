<% if @ok %>
  $('#hoy_count_<%= @data_id %>').html('<%= @data.followers.count %>');
<% else %>
  alert('亲，你已经关注过它了。');
<% end %>
