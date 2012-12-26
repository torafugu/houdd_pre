# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
  jQuery(document).ready ->
    if jQuery('[id*=edit_smallmobunit]')[0]?
      user_id = jQuery("#smallmobunit_smalluser_id").val()
      jQuery.get("select_squad.js?user_id=" + user_id)
      is_guard = jQuery("#smallmobunit_is_guard").is(":checked")
      jQuery.get("select_map.js?user_id=" + user_id + "&is_guard=" + is_guard)

jQuery ->
  jQuery('#smallmobunit_smalluser_id').change ->
    user_id = jQuery("#smallmobunit_smalluser_id").val()
    jQuery.get("select_squad.js?user_id=" + user_id)

jQuery ->
  jQuery('#smallmobunit_is_guard').change ->
    user_id = jQuery("#smallmobunit_smalluser_id").val()
    is_guard = jQuery("#smallmobunit_is_guard").is(":checked")
    jQuery.get("select_map.js?user_id=" + user_id + "&is_guard=" + is_guard)
