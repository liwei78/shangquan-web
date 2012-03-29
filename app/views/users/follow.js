<% if @ok %>
  window.location.reload();
<% else %>
  alert("<%= @msg %>");
<% end %>