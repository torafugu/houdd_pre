
jQuery ->
  jQuery('#mostsmalltrap_mostsmallterritory_id').change ->
    territory_id = jQuery("#mostsmalltrap_mostsmallterritory_id").val()
    jQuery.get("select_dungeontxt.js?territory_id=" + territory_id)

