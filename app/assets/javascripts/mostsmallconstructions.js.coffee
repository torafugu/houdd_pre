
jQuery ->
  jQuery('#mostsmallconstruction_mostsmallterritory_id').change ->
    territory_id = jQuery("#mostsmallconstruction_mostsmallterritory_id").val()
    jQuery.get("select_maptxt.js?territory_id=" + territory_id)

