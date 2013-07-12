jQuery("#mypage_father_id").empty()
jQuery("#mypage_father_id").html("<%= escape_javascript(options_for_select(@fathers)) %>")
jQuery("#mypage_mother_id").empty()
jQuery("#mypage_mother_id").html("<%= escape_javascript(options_for_select(@mothers)) %>")
