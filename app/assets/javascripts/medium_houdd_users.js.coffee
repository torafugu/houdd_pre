jQuery ->
  jQuery('#mypage_map_id').change ->
    jQuery.get("select_map_id.js?map_id=" + jQuery("#mypage_map_id").val())

jQuery ->
  jQuery('#build_construction').click ->
    jQuery.get("update_construction.js?mapcell_id=" + jQuery("#mapcell_id").val() + "&mapcell_construction_id=" + jQuery("#mapcell_construction_id").val())