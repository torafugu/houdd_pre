
jQuery ->
  jQuery('#mostsmall_default_item_value').click ->
    iteminfo_id = jQuery("#mostsmallitem_mostsmalliteminfo_id").val()
    jQuery.get("set_default_value.js?iteminfo_id=" + iteminfo_id)
