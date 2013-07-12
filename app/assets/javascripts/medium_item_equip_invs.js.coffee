jQuery ->
  jQuery('#item_equip_inv_medium_houdd_id').change ->
    jQuery.get("select_items.js?user_id=" + jQuery('#item_equip_inv_medium_houdd_id').val())

jQuery ->
  jQuery('#medium_item_equip_inv_medium_item_id').change ->
    jQuery.get("select_body_parts.js?item_id=" + jQuery('#medium_item_equip_inv_medium_item_id').val())