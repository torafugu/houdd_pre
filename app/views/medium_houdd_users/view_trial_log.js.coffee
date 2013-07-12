p = Processing.getInstanceById("mypage_log_dungeon_canvas")
p.resetSquads();
<% @current_trial_turn.medium_squad_trails.each do |squad_trail| %>
trailpoints = new Array(<%= squad_trail.trailpoints.length %>)
<% squad_trail.trailpoints.each_with_index  do |trailpoint, trail_counter| %>
trailpoints[<%= trail_counter %>] = [<%= trailpoint["from_x"] %>, <%= trailpoint["from_y"] %>, <%= trailpoint["to_x"] %>, <%= trailpoint["to_y"] %>, <%= trailpoint["is_end"] %>]
<% end %>

<% if squad_trail.trailpoints.blank? %>
p.addSquad(<%= squad_trail.from_x %>, <%= squad_trail.from_y %>, <%= squad_trail.atk? %>, "<%= squad_trail.direction %>", null, <%= squad_trail.annihilated? %>)
<% else %>
p.addSquad(<%= squad_trail.from_x %>, <%= squad_trail.from_y %>, <%= squad_trail.atk? %>, "<%= squad_trail.direction %>", trailpoints, <%= squad_trail.annihilated? %>)
<% end %>
<% end %>

jQuery('#medium_current_battle_turn').text(<%= @start_battle_turn_index %>)
jQuery('#medium_max_battle_turn').text(<%= @last_battle_turn_index %>)

<% @current_trial_turn.medium_mob_statuses.each do |status| %>
jQuery("#hp_<%= status.trial_mob.mob_id %>").text("<%= status.end_hp %>");
jQuery("#sp_<%= status.trial_mob.mob_id %>").text("<%= status.end_sp %>");
jQuery("#status_<%= status.trial_mob.mob_id %>").text("<%= status.end_status %>");
<% end %>

p2 = Processing.getInstanceById("mypage_log_tactical_canvas");
p2.resetMobs();
jQuery("#medium_battle_log").text("");
<% unless @current_battle_turn.nil? %>
jQuery("#medium_battle_atk_squad_name").text("<%= @current_battle_turn.atk_trial_squad.squad_name %>")
jQuery("#medium_battle_def_squad_name").text("<%= @current_battle_turn.def_trial_squad.squad_name %>")
<% @current_battle_turn.battle_logs_for_tactical_map.each do |battle| %>
  <% if battle.from_vpos == battle.to_vpos and not battle.tgt_dead_flg %>
p2.addMob(<%= battle.trial_mob.mob_id %>, <%= battle.to_vpos %>, <%= battle.atk? %>)
  <% end %>
<% end %>
  <% @current_battle_turn.medium_battle_logs.each do |battle| %>
jQuery("#medium_battle_log").append("<%= escape_javascript(battle.jpn_log) %>")
  <% end %>
<% end %>