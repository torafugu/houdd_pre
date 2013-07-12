p = Processing.getInstanceById("mypage_log_dungeon_canvas")
p.clearDungeonCells()
<% unless @medium_mision.trial.medium_trial_dungeon_cells.blank? %>
<% @medium_mision.trial.medium_trial_dungeon_cells.each do |cell| %>
p.setDungeonCell(<%= cell.x %>, <%= cell.y %>, '<%= cell.symbol %>', '', '')
<% end %>
<% end %>
