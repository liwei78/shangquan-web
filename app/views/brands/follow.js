<% if @ok %>
  $('#hoy_count_<%= @brand_id %>').html('<%= @brand.followers.count %>');
<% else %>
  alert('亲，你已经关注过它了。');
<% end %>