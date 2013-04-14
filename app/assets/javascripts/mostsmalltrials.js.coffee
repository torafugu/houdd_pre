jQuery ->
  jQuery(document).ready ->
    if jQuery('[id*=edit_mostsmalltrial]')[0]?
      territory_id = jQuery("#mostsmalltrial_mostsmallterritory_id").val()
      jQuery.get("select_missions.js?territory_id=" + territory_id)

jQuery ->
  jQuery('#mostsmalltrial_mostsmallterritory_id').change ->
    territory_id = jQuery("#mostsmalltrial_mostsmallterritory_id").val()
    jQuery.get("select_missions.js?territory_id=" + territory_id)

jQuery ->
  jQuery(window).load ->
    if jQuery('[id=mostsmalltrial_map_canvas]')[0]?
      renderMap(jQuery("#trial_map_txt").val())
      jQuery.get("check_log.js?turn=1")

renderMap = (mapTxt) ->
    mapArray = mapTxt.split('|')
    for Y in [0...mapArray.length]
      mapArray[Y] = mapArray[Y].split('')
    p = Processing.getInstanceById("mostsmalltrial_map_canvas")
    p.setMap(mapArray)

jQuery ->
  jQuery('#mostsmall_first_turn').click ->
    jQuery('#mostsmall_turn').text(1)
    jQuery.get("check_log.js?turn=1")

jQuery ->
  jQuery('#mostsmall_previous_turn').click ->
    int_current_turn = parseInt(jQuery('#mostsmall_turn').text())
    if int_current_turn > 1
      int_previous_turn = int_current_turn - 1
      jQuery('#mostsmall_turn').text(int_previous_turn)
      jQuery.get("check_log.js?turn=" + int_previous_turn)

jQuery ->
  jQuery('#mostsmall_next_turn').click ->
    int_current_turn = parseInt(jQuery('#mostsmall_turn').text())
    if int_current_turn < parseInt(jQuery('#mostsmall_max_turn').text())
      int_next_turn = int_current_turn + 1
      jQuery('#mostsmall_turn').text(int_next_turn)
      jQuery.get("check_log.js?turn=" + int_next_turn)

jQuery ->
  jQuery('#mostsmall_last_turn').click ->
    jQuery('#mostsmall_turn').text(jQuery('#mostsmall_max_turn').text())
    jQuery.get("check_log.js?turn=" + jQuery('#mostsmall_max_turn').text())

jQuery ->
  jQuery('#mostsmall_battleset_previous_turn').click ->
    int_current_battleset_turn = parseInt(jQuery('#mostsmall_battleset_turn').text())
    if int_current_battleset_turn > 1
      int_previous_battleset_turn = int_current_battleset_turn - 1
      jQuery('#mostsmall_battleset_turn').text(int_previous_battleset_turn)
      jQuery.get("check_battlset.js?turn=" + jQuery('#mostsmall_turn').text() + "&battleset=" + int_previous_battleset_turn)

jQuery ->
  jQuery('#mostsmall_battleset_next_turn').click ->
    int_current_battleset_turn = parseInt(jQuery('#mostsmall_battleset_turn').text())
    if int_current_battleset_turn < parseInt(jQuery('#mostsmall_max_battleset_turn').text())
      int_next_battleset_turn = int_current_battleset_turn + 1
      jQuery('#mostsmall_battleset_turn').text(int_next_battleset_turn)
      jQuery.get("check_battlset.js?turn=" + jQuery('#mostsmall_turn').text() + "&battleset=" + + int_next_battleset_turn)

jQuery ->
  jQuery('#mostsmall_battle_first_turn').click ->
    jQuery('#mostsmall_battle_turn').text(1)
    jQuery.get("check_battlelog.js?turn=" + jQuery('#mostsmall_turn').text() + "&battleset=" + jQuery('#mostsmall_battleset_turn').text() + "&battleturn=0")

jQuery ->
  jQuery('#mostsmall_battle_previous_turn').click ->
    int_current_battle_turn = parseInt(jQuery('#mostsmall_battle_turn').text())
    if int_current_battle_turn > 1
      int_previous_battle_turn = int_current_battle_turn - 1
      jQuery('#mostsmall_battle_turn').text(int_previous_battle_turn)
      jQuery.get("check_battlelog.js?turn=" + jQuery('#mostsmall_turn').text() + "&battleset=" + jQuery('#mostsmall_battleset_turn').text() + "&battleturn=" + int_previous_battle_turn)

jQuery ->
  jQuery('#mostsmall_battle_next_turn').click ->
    int_current_battle_turn = parseInt(jQuery('#mostsmall_battle_turn').text())
    if int_current_battle_turn < parseInt(jQuery('#mostsmall_max_battle_turn').text())
      int_next_battle_turn = int_current_battle_turn + 1
      jQuery('#mostsmall_battle_turn').text(int_next_battle_turn)
      jQuery.get("check_battlelog.js?turn=" + jQuery('#mostsmall_turn').text() + "&battleset=" + jQuery('#mostsmall_battleset_turn').text() + "&battleturn=" + int_next_battle_turn)

jQuery ->
  jQuery('#mostsmall_battle_last_turn').click ->
    jQuery('#mostsmall_battle_turn').text(jQuery('#mostsmall_max_battle_turn').text())
    jQuery.get("check_battlelog.js?turn=" + jQuery('#mostsmall_turn').text() + "&battleset=" + jQuery('#mostsmall_battleset_turn').text() + "&battleturn=" + jQuery('#mostsmall_max_battle_turn').text())
