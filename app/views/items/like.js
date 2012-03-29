<% if @plus_one %>
$('#likes_count_<%= @item.id %>').html('<%= @item.likes_count %>');
<% else %>
alert('亲，你已经喜欢过ta了。');
<% end %>
