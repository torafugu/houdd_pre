p = Processing.getInstanceById("mypage_dungeon_canvas")
p.clearDungeonCells()
<% unless @medium_dungeon.blank? %>
<% @medium_dungeon.medium_dungeon_cells.each do |cell| %>
p.setDungeonCell(<%= cell.x %>, <%= cell.y %>, '<%= cell.symbol %>', '<%= cell.medium_squad_id %>', '<%= cell.trap_id %>')
<% end %>
jQuery("#dungeoncell_squad_id").empty()
jQuery("#dungeoncell_squad_id").html("<%= escape_javascript(options_for_select(@mission_squads)) %>")
jQuery("#dungeoncell_trap_id").empty()
jQuery("#dungeoncell_trap_id").html("<%= escape_javascript(options_for_select(@trap_stocks)) %>")
<% end %>
