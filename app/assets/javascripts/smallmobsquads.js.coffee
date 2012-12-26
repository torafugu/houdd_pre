# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
  jQuery(document).ready ->
    if jQuery('[id*=edit_smallmobsquad]')[0]?
      user_id = jQuery("#smallmobsquad_smalluser_id").val()
      jQuery.get("select_mob_and_unit.js?user_id=" + user_id)

jQuery ->
  jQuery('#smallmobsquad_smalluser_id').change ->
    user_id = jQuery("#smallmobsquad_smalluser_id").val()
    jQuery.get("select_mob_and_unit.js?user_id=" + user_id)

