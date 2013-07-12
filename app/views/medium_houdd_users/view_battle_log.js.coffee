p2 = Processing.getInstanceById("mypage_log_tactical_canvas");
jQuery("#medium_battle_log").text("");
<% unless @current_battle_turn.nil? %>
jQuery("#medium_battle_atk_squad_name").text("<%= @current_battle_turn.atk_trial_squad.squad_name %>")
jQuery("#medium_battle_def_squad_name").text("<%= @current_battle_turn.def_trial_squad.squad_name %>")

<% if @is_start_battle_turn_index %>
p2.resetMobs()
<% end %>

<% @current_battle_turn.battle_logs_for_tactical_map.each do |battle| %>
<% if @is_start_battle_turn_index %>
  <% if battle.from_vpos == battle.to_vpos and not battle.tgt_dead_flg %>
p2.addMob(<%= battle.trial_mob_id %>, <%= battle.to_vpos %>, <%= battle.atk? %>)
  <% end %>
<% else %>
  <% if battle.from_vpos != battle.to_vpos %>
p2.updateMobY(<%= battle.trial_mob_id %>, <%= battle.to_vpos %>)
  <% end %>
  <% if battle.tgt_dead_flg %>
p2.updateMobDead(<%= battle.tgt_id %>, true)
  <% end %>
<% end %>
<% end %>

<% @current_battle_turn.medium_battle_logs.each do |battle| %>
jQuery("#medium_battle_log").append("<%= escape_javascript(battle.jpn_log) %>")
<% end %>
<% end %>