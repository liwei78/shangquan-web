$('#brand_search_results').empty();
<% if @brands.blank? %>

<% else %>
$('#brand_search_results').prepend('<%=j render :partial => 'brand_names', :locals => {:brands => @brands} %>');
$('#brand_search_results').show();
<% end %>
