$('#item_search_results').empty();
<% if @items.blank? %>

<% else %>
$('#item_search_results').prepend('<%=j render :partial => 'item_names', :locals => {:items => @items} %>');
$('#item_search_results').show();
<% end %>
