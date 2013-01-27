jQuery ->
  jQuery(document).ready ->
    if jQuery('[id*=edit_moresmallmobsquad]')[0]?
      user_id = jQuery("#moresmallmobsquad_moresmalluser_id").val()
      jQuery.get("select_mob_and_unit.js?user_id=" + user_id)

jQuery ->
  jQuery('#moresmallmobsquad_moresmalluser_id').change ->
    user_id = jQuery("#moresmallmobsquad_moresmalluser_id").val()
    jQuery.get("select_mob_and_unit.js?user_id=" + user_id)

