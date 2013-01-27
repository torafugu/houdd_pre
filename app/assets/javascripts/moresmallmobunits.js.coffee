jQuery ->
  jQuery(document).ready ->
    if jQuery('[id*=edit_moresmallmobunit]')[0]?
      user_id = jQuery("#moresmallmobunit_moresmalluser_id").val()
      jQuery.get("select_cur_map.js?user_id=" + user_id)
      jQuery.get("select_squad.js?user_id=" + user_id)

jQuery ->
  jQuery('#moresmallmobunit_moresmalluser_id').change ->
    user_id = jQuery("#moresmallmobunit_moresmalluser_id").val()
    jQuery.get("select_cur_map.js?user_id=" + user_id)
    jQuery.get("select_squad.js?user_id=" + user_id)

