jQuery("#mypage_dungeon_id").empty()
jQuery("#mypage_dungeon_id").html("<%= escape_javascript(options_for_select(@dungeons)) %>")