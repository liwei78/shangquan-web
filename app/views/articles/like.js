<% if @done %>
$('#likes_count_<%= @article.id %>').html('<%= @article.likes_count %>');
<% else %>
alert("亲，你已经操作过了！");
<% end %>
