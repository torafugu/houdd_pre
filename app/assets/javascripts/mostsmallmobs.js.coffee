jQuery ->
  jQuery('#mostsmall_default_mob_value').click ->
    mobgene_id = jQuery("#mostsmallmob_mostsmallmobgene_id").val()
    jQuery.get("set_default_value.js?mobgene_id=" + mobgene_id)
