# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
  jQuery(document).ready ->
    if jQuery('[id*=edit_mosttinytrial]')[0]?
      def_user_id = jQuery("#mosttinytrial_def_user_id").val()
      jQuery.get("select_map_and_def_mobs.js?def_user_id=" + def_user_id)
      atk_user_id = jQuery("#mosttinytrial_atk_user_id").val()
      jQuery.get("select_atk_mobs.js?atk_user_id=" + atk_user_id)

jQuery ->
  jQuery(window).load ->
    if jQuery('[id=MapCanvas]')[0]?
      RenderMap(jQuery('#MapText').val())
      RenderSetupMobs()
    if jQuery('#Status').text() is 'not started.'
      jQuery('#GoFirstTurn').attr("disabled", "disabled")
      jQuery('#GoPreviousTurn').attr("disabled", "disabled")
      jQuery('#GoNextTurn').attr("disabled", "disabled")
      jQuery('#GoLastTurn').attr("disabled", "disabled")
      jQuery('#ExecuteTrial').removeAttr("disabled")
    else
      jQuery('#GoFirstTurn').removeAttr("disabled")
      jQuery('#GoPreviousTurn').removeAttr("disabled")
      jQuery('#GoNextTurn').removeAttr("disabled")
      jQuery('#GoLastTurn').removeAttr("disabled")
      jQuery('#ExecuteTrial').attr("disabled", "disabled")

jQuery ->
  jQuery('#mosttinytrial_def_user_id').change ->
    def_user_id = jQuery("#mosttinytrial_def_user_id").val()
    jQuery.get("select_map_and_def_mobs.js?def_user_id=" + def_user_id)

jQuery ->
  jQuery('#mosttinytrial_atk_user_id').change ->
    atk_user_id = jQuery("#mosttinytrial_atk_user_id").val()
    jQuery.get("select_atk_mobs.js?atk_user_id=" + atk_user_id)

jQuery ->
  jQuery('#btnMoveRightDef').click ->
    moveItems("rightDef")

jQuery ->
  jQuery('#btnMoveLeftDef').click ->
    moveItems("leftDef")

jQuery ->
  jQuery('#btnMoveRightAtk').click ->
    moveItems("rightAtk")

jQuery ->
  jQuery('#btnMoveLeftAtk').click ->
    moveItems("leftAtk")

jQuery ->
  jQuery('form').submit ->
    selectedDefIDs = new Array()
    jQuery('#mosttinytrial_def_setup_mob_ids option:not(:selected)').each ->
      selectedDefIDs.push(this.value)
    jQuery('#mosttinytrial_def_setup_mob_ids').val(selectedDefIDs)
    selectedAtkIDs = new Array()
    jQuery('#mosttinytrial_atk_setup_mob_ids option:not(:selected)').each ->
      selectedAtkIDs.push(this.value)
    jQuery('#mosttinytrial_atk_setup_mob_ids').val(selectedAtkIDs)

moveItems = (direction) ->
  
  if direction is "rightDef"
    fromBox = jQuery('#mosttinytrial_def_bench_mob_ids')
    toBox = jQuery('#mosttinytrial_def_setup_mob_ids')
  else if direction is "leftDef"
    fromBox = jQuery('#mosttinytrial_def_setup_mob_ids')
    toBox = jQuery('#mosttinytrial_def_bench_mob_ids')
  else if direction is "rightAtk"
    fromBox = jQuery('#mosttinytrial_atk_bench_mob_ids')
    toBox = jQuery('#mosttinytrial_atk_setup_mob_ids')
  else if direction is "leftAtk"
    fromBox = jQuery('#mosttinytrial_atk_setup_mob_ids')
    toBox = jQuery('#mosttinytrial_atk_bench_mob_ids')

  if fromBox.val() is null
    alert("移動するアイテムを選択してください!")
    return false

  fromBox.children(':selected').each ->
    toBox.append(new Option($(this).text, $(this).value))
  
  fromBox.children(':selected').remove()
  

jQuery ->
  jQuery('#ExecuteTrial').click ->
    jQuery('#Status').text('completed')
    jQuery('#GoFirstTurn').removeAttr("disabled")
    jQuery('#GoPreviousTurn').removeAttr("disabled")
    jQuery('#GoNextTurn').removeAttr("disabled")
    jQuery('#GoLastTurn').removeAttr("disabled")
    jQuery('#ExecuteTrial').attr("disabled", "disabled")
    jQuery.get("execute.js")
    alert("戦闘終了！")

jQuery ->
  jQuery('#GoFirstTurn').click ->
    jQuery('#CurrentTurn').text(1)
    jQuery.get("check_log.js?turn=1")

jQuery ->
  jQuery('#GoPreviousTurn').click ->
    intCurrentTurn = parseInt(jQuery('#CurrentTurn').text())
    if intCurrentTurn > 1
      intPreviousTurn = intCurrentTurn - 1
      jQuery('#CurrentTurn').text(intPreviousTurn)
      jQuery.get("check_log.js?turn=" + intPreviousTurn)

jQuery ->
  jQuery('#GoNextTurn').click ->
    intCurrentTurn = parseInt(jQuery('#CurrentTurn').text())
    if intCurrentTurn < parseInt(jQuery('#LastTurn').text())
      intNextTurn = intCurrentTurn + 1
      jQuery('#CurrentTurn').text(intNextTurn)
      jQuery.get("check_log.js?turn=" + intNextTurn)

jQuery ->
  jQuery('#GoLastTurn').click ->
    jQuery('#CurrentTurn').text(jQuery('#LastTurn').text())
    jQuery.get("check_log.js?turn=" + jQuery('#LastTurn').text())
