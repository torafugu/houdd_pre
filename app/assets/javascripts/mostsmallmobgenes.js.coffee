jQuery ->
  jQuery('#mostsmall_default_mobgene_value').click ->
    mobspecie_id = jQuery("#mostsmallmobgene_mostsmallmobspecie_id").val()
    mothergene_id = jQuery("#mostsmallmobgene_mothermobgene_id").val()
    fathergene_id = jQuery("#mostsmallmobgene_fathermobgene_id").val()
    jQuery.get("set_default_value.js?mobspecie_id=" + mobspecie_id + "&mothergene_id=" + mothergene_id + "&fathergene_id=" + fathergene_id)
