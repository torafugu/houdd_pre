jQuery ->
  jQuery('#mypage_map_id').change ->
    jQuery.get("select_map_id.js?map_id=" + jQuery("#mypage_map_id").val())

jQuery ->
  jQuery('#build_construction').click ->
    jQuery.get("update_construction.js?mapcell_id=" + jQuery("#mapcell_id").val() + "&mapcell_construction_id=" + jQuery("#mapcell_construction_id").val())

jQuery ->
  jQuery('#change_research_allotment').click ->
    jQuery.get("update_research.js?wepon_percent=" + jQuery("#wepon_percent").val() + "&armor_percent=" + jQuery("#armor_percent").val() + "&potion_percent=" + jQuery("#potion_percent").val() + "&trap_percent=" + jQuery("#trap_percent").val())

jQuery ->
  jQuery('#add_item_que').click ->
    jQuery.get("add_item_que.js?iteminfo_id=" + jQuery("#mypage_iteminfo_id").val() + "&item_num=" + jQuery("#mypage_item_num").val())

jQuery ->
  jQuery('[id*=delete_item_que]').live 'click', ->
    delete_id = jQuery(this).attr("id").replace("delete_item_que_", "")
    jQuery.get("delete_item_que.js?delete_id=" + delete_id)

jQuery ->
  jQuery('#proceed_construction').click ->
    jQuery.get("proceed_construction.js")

jQuery ->
  jQuery('#proceed_item_manufacture').click ->
    jQuery.get("proceed_item_manufacture.js")

jQuery ->
  jQuery('#proceed_research').click ->
    jQuery.get("proceed_research.js")

jQuery ->
  jQuery('#add_random_gene').click ->
    jQuery.get("add_random_gene.js?specie_id=" + jQuery("#admin_specie_id").val() + "&gene_num=" + jQuery("#admin_gene_num").val())

jQuery ->
  jQuery('#add_random_mob').click ->
    jQuery.get("add_random_mob.js?mobspecie_id=" + jQuery("#admin_mobspecie_id").val() + "&mob_num=" + jQuery("#admin_mob_num").val())
