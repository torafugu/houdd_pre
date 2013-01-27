jQuery ->
  jQuery(document).ready ->
    if jQuery('[id*=edit_moresmallmob_]')[0]?
      user_id = jQuery("#moresmallmob_moresmalluser_id").val()
      jQuery.get("select_squad.js?user_id=" + user_id)

jQuery ->
  jQuery('#moresmallmob_moresmalluser_id').change ->
    user_id = jQuery("#moresmallmob_moresmalluser_id").val()
    jQuery.get("select_squad.js?user_id=" + user_id)
