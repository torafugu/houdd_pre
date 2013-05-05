<% unless @medium_map_cell.blank? %>
jQuery('#mapcell_id').val("<%= @medium_map_cell.id %>")
jQuery('#mapcell_x').text("<%= @medium_map_cell.x %>")
jQuery('#mapcell_y').text("<%= @medium_map_cell.y %>")
jQuery('#mapcell_terrain').text("<%= @medium_map_cell.medium_terrain.name unless @medium_map_cell.medium_terrain.blank? %>")
<% if not @medium_map_cell.medium_resource.blank? %>
jQuery('#mapcell_resource').text("<%= @medium_map_cell.medium_resource.name %>")
<% else %>
jQuery('#mapcell_resource').text("なし")
<% end %>
<% if not @medium_map_cell.medium_construction.blank? %>
jQuery('#mapcell_construction').text("<%= @medium_map_cell.medium_construction.name %>")
<% elsif not @under_construction.blank? %>
jQuery('#mapcell_construction').text("<%= @under_construction.medium_construction.name %>(建築中)")
<% else %>
jQuery('#mapcell_construction').text("なし")
<% end %>
jQuery("#mapcell_construction_id").empty();
jQuery("#mapcell_construction_id").html("<%= escape_javascript(options_for_select(@selectable_construction)) %>");
jQuery('#mapcell_dungeon').text("<%= @medium_map_cell.medium_dungeon.name unless @medium_map_cell.medium_dungeon.blank? %>")
<% end %>