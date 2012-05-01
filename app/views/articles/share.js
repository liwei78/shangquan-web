<% if @done %>
$('#shares_count_<%= @article.id %>').html('<%= @article.shares_count %>');
<% else %>
alert("亲，你已经操作过了！");
<% end %>

