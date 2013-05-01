p = Processing.getInstanceById("mypage_map_canvas")
p.clearMapCells()
<% unless @medium_map.blank? %>
<% @medium_map.medium_map_cells.each do |cell| %>
p.setMapCell(<%= cell.x %>, <%= cell.y %>, '<%= cell.medium_terrain.symbol %>', '<%= cell.medium_resource.symbol unless cell.medium_resource.nil? %>', '<%= cell.medium_construction.symbol unless cell.medium_construction.nil? %>')
<% end %>
<% end %>