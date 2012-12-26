# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
  jQuery(document).ready ->
    if jQuery('[id*=edit_smalltrial]')[0]?
      map_id = jQuery("#smalltrial_smallmap_id").val()
      jQuery.get("select_mobunits.js?map_id=" + map_id)

jQuery ->
  jQuery(window).load ->
    if jQuery('[id=trial_map_canvas]')[0]?
      updateMap(jQuery("#trial_map_txt").val())
    if jQuery('#Status').text() is '終了'
      jQuery('#small_first_turn').removeAttr("disabled")
      jQuery('#small_previous_turn').removeAttr("disabled")
      jQuery('#small_next_turn').removeAttr("disabled")
      jQuery('#small_last_turn').removeAttr("disabled")
      jQuery('#small_execute').attr("disabled", "disabled")
      if jQuery('#small_current_turn').text() is '0'
        jQuery.get("check_log.js?turn=0")
    else
      jQuery('#small_first_turn').attr("disabled", "disabled")
      jQuery('#small_previous_turn').attr("disabled", "disabled")
      jQuery('#small_next_turn').attr("disabled", "disabled")
      jQuery('#small_last_turn').attr("disabled", "disabled")
      jQuery('#small_execute').removeAttr("disabled")

jQuery ->
  jQuery('#smalltrial_def_mobunit_id').change ->
    jQuery('#smalltrial_def_mobunit_name').val(jQuery('#smalltrial_def_mobunit_id').text())

jQuery ->
  jQuery('#smalltrial_atk_mobunit_id').change ->
    jQuery('#smalltrial_atk_mobunit_name').val(jQuery('#smalltrial_atk_mobunit_id').text())

jQuery ->
  jQuery('#smalltrial_smallmap_id').change ->
    map_id = jQuery("#smalltrial_smallmap_id").val()
    jQuery.get("select_mobunits.js?map_id=" + map_id)

renderMap = (mapTxt) ->
  mapArray = mapTxt.split('|')
  for Y in [0...mapArray.length]
    mapArray[Y] = mapArray[Y].split('')
  p = Processing.getInstanceById("trial_map_canvas");
  p.setMap(mapArray)

jQuery ->
  jQuery('#small_first_turn').click ->
    jQuery('#small_current_turn').text(0)
    jQuery.get("check_log.js?turn=0")

jQuery ->
  jQuery('#small_previous_turn').click ->
    intsmall_current_turn = parseInt(jQuery('#small_current_turn').text())
    if intsmall_current_turn > 0
      intPreviousTurn = intsmall_current_turn - 1
      jQuery('#small_current_turn').text(intPreviousTurn)
      jQuery.get("check_log.js?turn=" + intPreviousTurn)

jQuery ->
  jQuery('#small_next_turn').click ->
    intsmall_current_turn = parseInt(jQuery('#small_current_turn').text())
    if intsmall_current_turn < parseInt(jQuery('#small_max_turn').text())
      intNextTurn = intsmall_current_turn + 1
      jQuery('#small_current_turn').text(intNextTurn)
      jQuery.get("check_log.js?turn=" + intNextTurn)

jQuery ->
  jQuery('#small_last_turn').click ->
    jQuery('#small_current_turn').text(jQuery('#small_max_turn').text())
    jQuery.get("check_log.js?turn=" + jQuery('#small_max_turn').text())

jQuery ->
  jQuery('#small_execute').click ->
    alert("トライアルを開始しました。\n完了までしばらくお待ちください。")
    jQuery.get("execute.js")
