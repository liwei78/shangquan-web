$('#items_list').empty();
$('#items_list').prepend('<%=j render :partial => 'searchitem', :locals => {:items => @items} %>');
