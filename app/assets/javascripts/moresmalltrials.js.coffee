jQuery ->
  jQuery(document).ready ->
    if jQuery('[id*=edit_moresmalltrial]')[0]?
      map_id = jQuery("#moresmalltrial_moresmallmap_id").val()
      jQuery.get("select_mobunits.js?map_id=" + map_id)

jQuery ->
  jQuery(window).load ->
    if jQuery('[id=moresmalltrial_map_canvas]')[0]?
      renderMap(jQuery("#trial_map_txt").val())
    if jQuery('#Status').text() is '終了'
      jQuery('#moresmall_first_turn').removeAttr("disabled")
      jQuery('#moresmall_previous_turn').removeAttr("disabled")
      jQuery('#moresmall_next_turn').removeAttr("disabled")
      jQuery('#moresmall_last_turn').removeAttr("disabled")
      jQuery('#moresmall_execute').attr("disabled", "disabled")
      if jQuery('#moresmall_current_turn').text() is '0'
        jQuery.get("check_log.js?turn=0")
    else
      jQuery('#moresmall_first_turn').attr("disabled", "disabled")
      jQuery('#moresmall_previous_turn').attr("disabled", "disabled")
      jQuery('#moresmall_next_turn').attr("disabled", "disabled")
      jQuery('#moresmall_last_turn').attr("disabled", "disabled")
      jQuery('#moresmall_execute').removeAttr("disabled")

jQuery ->
  jQuery('#moresmalltrial_def_mobunit_id').change ->
    jQuery('#moresmalltrial_def_mobunit_name').val(jQuery('#moresmalltrial_def_mobunit_id').text())

jQuery ->
  jQuery('#moresmalltrial_atk_mobunit_id').change ->
    jQuery('#moresmalltrial_atk_mobunit_name').val(jQuery('#moresmalltrial_atk_mobunit_id').text())

jQuery ->
  jQuery('#moresmalltrial_moresmallmap_id').change ->
    map_id = jQuery("#moresmalltrial_moresmallmap_id").val()
    jQuery.get("select_mobunits.js?map_id=" + map_id)

renderMap = (mapTxt) ->
    mapArray = mapTxt.split('|')
    for Y in [0...mapArray.length]
      mapArray[Y] = mapArray[Y].split('')
    p = Processing.getInstanceById("moresmalltrial_map_canvas")
    p.setMap(mapArray)

jQuery ->
  jQuery('#moresmall_first_turn').click ->
    jQuery('#small_current_turn').text(0)
    jQuery.get("check_log.js?turn=0")

jQuery ->
  jQuery('#moresmall_previous_turn').click ->
    intsmall_current_turn = parseInt(jQuery('#moresmall_current_turn').text())
    if intsmall_current_turn > 0
      intPreviousTurn = intsmall_current_turn - 1
      jQuery('#moresmall_current_turn').text(intPreviousTurn)
      jQuery.get("check_log.js?turn=" + intPreviousTurn)

jQuery ->
  jQuery('#moresmall_next_turn').click ->
    intsmall_current_turn = parseInt(jQuery('#moresmall_current_turn').text())
    if intsmall_current_turn < parseInt(jQuery('#moresmall_max_turn').text())
      intNextTurn = intsmall_current_turn + 1
      jQuery('#moresmall_current_turn').text(intNextTurn)
      jQuery.get("check_log.js?turn=" + intNextTurn)

jQuery ->
  jQuery('#moresmall_last_turn').click ->
    jQuery('#moresmall_current_turn').text(jQuery('#moresmall_max_turn').text())
    jQuery.get("check_log.js?turn=" + jQuery('#moresmall_max_turn').text())

jQuery ->
  jQuery('#moresmall_execute').click ->
    alert("トライアルを開始しました。\n完了までしばらくお待ちください。")
    jQuery.get("execute.js")

jQuery ->
  jQuery('#moresmall_battle_first_turn').click ->
    jQuery('#moresmall_battle_turn').text(0)
    jQuery.get("check_battlelog.js?turn=" + jQuery('#moresmall_current_turn').text() + "&battleturn=0")

jQuery ->
  jQuery('#moresmall_battle_previous_turn').click ->
    int_battle_turn = parseInt(jQuery('#moresmall_battle_turn').text())
    if int_battle_turn > 0
      int_previous_battle_turn = int_battle_turn - 1
      jQuery('#moresmall_battle_turn').text(int_previous_battle_turn)
      jQuery.get("check_battlelog.js?turn=" + jQuery('#moresmall_current_turn').text() + "&battleturn=" + int_previous_battle_turn)

jQuery ->
  jQuery('#moresmall_battle_next_turn').click ->
    int_battle_turn = parseInt(jQuery('#moresmall_battle_turn').text())
    if int_battle_turn < parseInt(jQuery('#moresmall_max_battle_turn').text())
      int_next_battle_turn = int_battle_turn + 1
      jQuery('#moresmall_battle_turn').text(int_next_battle_turn)
      jQuery.get("check_battlelog.js?turn=" + jQuery('#moresmall_current_turn').text() + "&battleturn=" + int_next_battle_turn)

jQuery ->
  jQuery('#moresmall_battle_last_turn').click ->
    jQuery('#moresmall_battle_turn').text(jQuery('#moresmall_max_battle_turn').text())
    jQuery.get("check_battlelog.js?turn=" + jQuery('#moresmall_current_turn').text() + "&battleturn=" + jQuery('#moresmall_max_battle_turn').text())
