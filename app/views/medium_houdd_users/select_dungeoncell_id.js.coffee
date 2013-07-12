<% unless @medium_dungeon_cell.blank? %>
jQuery('#dungeoncell_id').val("<%= @medium_dungeon_cell.id %>")
jQuery('#dungeoncell_x').text("<%= @medium_dungeon_cell.x %>")
jQuery('#dungeoncell_y').text("<%= @medium_dungeon_cell.y %>")
jQuery("#dungeoncell_squad_id").val("<%= @medium_dungeon_cell.medium_squad_id %>")
jQuery("#dungeoncell_trap_id").val("<%= @medium_dungeon_cell.trap_id %>")
<% end %>
