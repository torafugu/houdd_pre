jQuery("#medium_item_equip_inv_medium_body_part_id").empty()
jQuery("#medium_item_equip_inv_medium_body_part_id").html("<%= escape_javascript(options_for_select(@body_parts)) %>")