<% if @ok %>
  $('#hoy_count_<%= @archetype.id %>').html('<%= @archetype.followers.count %>');
<% else %>
  alert('亲，你已经关注过它了。');
<% end %>
