jQuery ->
  jQuery(window).load ->
    if jQuery('[id=mypage_log_dungeon_canvas]')[0]?
      jQuery.get("draw_dungeon_cell.js")
      jQuery.get("1/view_trial_log.js")

jQuery ->
  jQuery('#mypage_map_id').change ->
    jQuery.get("select_map_id.js?map_id=" + jQuery("#mypage_map_id").val())

jQuery ->
  jQuery('#mypage_map_id2').change ->
    jQuery.get("select_map_id2.js?map_id2=" + jQuery("#mypage_map_id2").val())

jQuery ->
  jQuery('#mypage_dungeon_id').change ->
    jQuery.get("select_dungeon_id.js?dungeon_id=" + jQuery("#mypage_dungeon_id").val())

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
    jQuery.get("add_random_mob.js?mobspecie_id=" + jQuery("#admin_mobspecie_id").val() + "&mob_num=" + jQuery("#admin_mob_num").val() + "&mobuser_id=" + jQuery("#admin_mobuser_id").val())

jQuery ->
  jQuery('#mypage_iteminfosym_id').change ->
    jQuery.get("select_items.js?iteminfosym_id=" + jQuery("#mypage_iteminfosym_id").val())

jQuery ->
  jQuery('#mypage_mobjob_id').change ->
    jQuery.get("select_mobs.js?job_id=" + jQuery("#mypage_mobjob_id").val())

jQuery ->
  jQuery('#mypage_specie_id').change ->
    jQuery.get("select_mob_mates.js?specie_id=" + jQuery("#mypage_specie_id").val())

jQuery ->
  jQuery('[id*=link_to_iteminfo]').live 'click', ->
    iteminfo_id = jQuery(this).attr("id").replace("link_to_iteminfo_", "")
    jQuery.get("select_iteminfo_id.js?iteminfo_id=" + iteminfo_id)
    jQuery('#iteminfo_popup').css({top: 100, left: 50}).fadeIn(100)
    jQuery('[id*=iteminfo_popup_close]').live 'click', ->
      jQuery('#iteminfo_popup').fadeOut(100)

jQuery ->
  jQuery('[id*=link_to_mob_status]').live 'click', ->
    mob_id = jQuery(this).attr("id").replace("link_to_mob_status_", "")
    jQuery.get("select_mob_status.js?mob_id=" + mob_id)
    jQuery('#mob_status_popup').css({top: 100, left: 50}).fadeIn(100)
    jQuery('[id*=mob_status_popup_close]').live 'click', ->
      jQuery('#mob_status_popup').fadeOut(100)

jQuery ->
  jQuery('[id*=link_to_mob_skills]').live 'click', ->
    mob_id = jQuery(this).attr("id").replace("link_to_mob_skills_", "")
    jQuery.get("select_mob_skills.js?mob_id=" + mob_id)
    jQuery('#mob_skills_popup').css({top: 100, left: 50}).fadeIn(100)
    jQuery('[id*=mob_skills_popup_close]').live 'click', ->
      jQuery('#mob_skills_popup').fadeOut(100)

jQuery ->
  jQuery('[id*=link_to_mob_equips]').live 'click', ->
    mob_id = jQuery(this).attr("id").replace("link_to_mob_equips_", "")
    jQuery.when(jQuery.get("select_mob_equips.js?mob_id=" + mob_id)).done ->
      jQuery('#mob_equips_popup').css('height', '200px')
      jQuery('#mob_equips_popup').css({top: 100, left: 50}).fadeIn(300)
      jQuery('[id*=mob_equips_popup_close]').live 'click', ->
        jQuery('#mob_equips_popup').fadeOut(100)

jQuery ->
  jQuery('#mob_equips_popup_submit').live 'click', ->
    jQuery.ajax
      url: jQuery('form#update_mob_equips').attr('action'),
      type: 'POST',
      dataType: 'json',
      timeout: 1000,
      data : jQuery('form#update_mob_equips').serialize(),
      error: ->
        jQuery('#mob_equips_popup_submit').css('display', 'none')
        jQuery('#mob_equips_popup_close2').css('margin-left', '50px')
        jQuery('#mob_equips_popup_close2').css('width', '25px')
        jQuery('#mob_equips_popup_close2').text('OK')
        jQuery('#mob_equips_popup').css('height', '100px')
        jQuery('#mob_equips_popup_list').text("エラーが発生しました。")
      success: ->
        jQuery('#mob_equips_popup_submit').css('display', 'none')
        jQuery('#mob_equips_popup_close2').css('margin-left', '50px')
        jQuery('#mob_equips_popup_close2').css('width', '25px')
        jQuery('#mob_equips_popup_close2').text('OK')
        jQuery('#mob_equips_popup').css('height', '100px')
        jQuery('#mob_equips_popup_list').text("更新が完了しました。")
    return false

jQuery ->
  jQuery('#add_squad').click ->
    jQuery.get("add_squad.js")

jQuery ->
  jQuery('#btn_move_right').live 'click', ->
    if jQuery('#mypage_free_mobs').val() is null
      alert('移動するMOBを選択してください。')
    else
      jQuery('#mypage_free_mobs').each ->
        jQuery('option:selected', this).each ->
          jQuery('#mypage_assigned_mobs').append(jQuery('<option value="' + jQuery(this).val() + '">' + jQuery(this).text() + '</option>'))
          jQuery(this).remove()

jQuery ->
  jQuery('#btn_move_left').live 'click', ->
    if jQuery('#mypage_assigned_mobs').val() is null
      alert('移動するMOBを選択してください。')
    else
      jQuery('#mypage_assigned_mobs').each ->
        jQuery('option:selected', this).each ->
          jQuery('#mypage_free_mobs').append(jQuery('<option value="' + jQuery(this).val() + '">' + jQuery(this).text() + '</option>'))
          jQuery(this).remove()

jQuery ->
  jQuery('#organize_submit').live 'click', ->
    selected_assigned_mobs_ids = new Array()
    jQuery('#mypage_assigned_mobs option:not(:selected)').each ->
      selected_assigned_mobs_ids.push(this.value)
    jQuery('#mypage_assigned_mobs').val(selected_assigned_mobs_ids)
    selected_free_mobs_ids = new Array()
    jQuery('#mypage_free_mobs option:not(:selected)').each ->
      selected_free_mobs_ids.push(this.value)
    jQuery('#mypage_free_mobs').val(selected_free_mobs_ids)
    jQuery.ajax
      url: jQuery('form').attr('action'),
      type: 'POST',
      dataType: 'json',
      timeout: 1000,
      data : jQuery('form').serialize(),
      error: ->
        alert("エラーが発生しました。")
      success: ->
        alert("更新が完了しました。")
        window.location.reload(true)
    return false

jQuery ->
  jQuery('[id*=link_to_squad_edit]').live 'click', ->
    squad_id = jQuery(this).attr("id").replace("link_to_squad_edit_", "")
    jQuery.get("edit_squad.js?squad_id=" + squad_id)

jQuery ->
  jQuery('[id*=link_to_squad_destroy]').live 'click', ->
    if confirm("解散してもよろしいですか？")
      squad_id = jQuery(this).attr("id").replace("link_to_squad_destroy_", "")
      jQuery.ajax
        url: "/medium_houdd_users/delete_squad/" + squad_id,
        type: 'DELETE',
        dataType: 'json',
        timeout: 1000,
        data : jQuery('form').serialize(),
        error: ->
          alert("エラーが発生しました。")
        success: ->
          alert("解散が完了しました。")
          window.location.reload(true)
    return false

jQuery ->
  jQuery('#add_mission').click ->
    jQuery.get("add_mission.js")

jQuery ->
  jQuery('#btn_squad_move_right').live 'click', ->
    if jQuery('#mypage_all_squads').val() is null
      alert('移動する部隊を選択してください。')
    else
      jQuery('#mypage_all_squads').each ->
        jQuery('option:selected', this).each ->
          jQuery('#mypage_assigned_squads').append(jQuery('<option value="' + jQuery(this).val() + '">' + jQuery(this).text() + '</option>'))
          jQuery(this).remove()

jQuery ->
  jQuery('#btn_squad_move_left').live 'click', ->
    if jQuery('#mypage_assigned_squads').val() is null
      alert('移動する部隊を選択してください。')
    else
      jQuery('#mypage_assigned_squads').each ->
        jQuery('option:selected', this).each ->
          jQuery('#mypage_all_squads').append(jQuery('<option value="' + jQuery(this).val() + '">' + jQuery(this).text() + '</option>'))
          jQuery(this).remove()

jQuery ->
  jQuery('#mission_submit').live 'click', ->
    selected_all_squad_ids = new Array()
    jQuery('#mypage_all_squads option:not(:selected)').each ->
      selected_all_squad_ids.push(this.value)
    jQuery('#mypage_all_squads').val(selected_all_squad_ids)
    selected_assigned_squad_ids = new Array()
    jQuery('#mypage_assigned_squads option:not(:selected)').each ->
      selected_assigned_squad_ids.push(this.value)
    jQuery('#mypage_assigned_squads').val(selected_assigned_squad_ids)
    jQuery.ajax
      url: jQuery('form').attr('action'),
      type: 'POST',
      dataType: 'json',
      timeout: 1000,
      data : jQuery('form').serialize(),
      error: ->
        alert("エラーが発生しました。")
      success: ->
        alert("更新が完了しました。")
        window.location.reload(true)
    return false

jQuery ->
  jQuery('[id*=link_to_mission_edit]').live 'click', ->
    mission_id = jQuery(this).attr("id").replace("link_to_mission_edit_", "")
    jQuery.get("edit_mission.js?mission_id=" + mission_id)

jQuery ->
  jQuery('[id*=link_to_mission_destroy]').live 'click', ->
    if confirm("削除してもよろしいですか？")
      mission_id = jQuery(this).attr("id").replace("link_to_mission_destroy_", "")
      jQuery.ajax
        url: "/medium_houdd_users/delete_mission/" + mission_id,
        type: 'DELETE',
        dataType: 'json',
        timeout: 1000,
        data : jQuery('form').serialize(),
        error: ->
          alert("エラーが発生しました。")
        success: ->
          alert("削除が完了しました。")
          window.location.reload(true)
    return false

jQuery ->
  jQuery('#add_strategy').click ->
    jQuery.get("add_strategy.js")

jQuery ->
  jQuery('#strategy_submit').live 'click', ->
    jQuery.ajax
      url: jQuery('form').attr('action'),
      type: 'POST',
      dataType: 'json',
      timeout: 1000,
      data : jQuery('form').serialize(),
      error: ->
        alert("エラーが発生しました。")
      success: ->
        alert("更新が完了しました。")
        window.location.reload(true)
    return false

jQuery ->
  jQuery('[id*=link_to_strategy_edit]').live 'click', ->
    strategy_id = jQuery(this).attr("id").replace("link_to_strategy_edit_", "")
    jQuery.get("edit_strategy.js?strategy_id=" + strategy_id)

jQuery ->
  jQuery('[id*=link_to_strategy_destroy]').live 'click', ->
    if confirm("削除してもよろしいですか？")
      strategy_id = jQuery(this).attr("id").replace("link_to_strategy_destroy_", "")
      jQuery.ajax
        url: "/medium_houdd_users/delete_strategy/" + strategy_id,
        type: 'DELETE',
        dataType: 'json',
        timeout: 1000,
        data : jQuery('form').serialize(),
        error: ->
          alert("エラーが発生しました。")
        success: ->
          alert("削除が完了しました。")
          window.location.reload(true)
    return false

jQuery ->
  jQuery('#random_mob_mating').click ->
    jQuery.ajax
      url: jQuery('form').attr('action'),
      type: 'POST',
      dataType: 'json',
      timeout: 1000,
      data : jQuery('form').serialize(),
      error: ->
        alert("エラーが発生しました。")
      success: ->
        alert("交配が完了しました。")

jQuery ->
  jQuery('#specified_mob_mating').click ->
    jQuery.ajax
      url: jQuery('form').attr('action'),
      type: 'POST',
      dataType: 'json',
      timeout: 1000,
      data : jQuery('form').serialize(),
      error: ->
        alert("エラーが発生しました。")
      success: ->
        alert("交配が完了しました。")

jQuery ->
  jQuery('#auto_equip').click ->
    jQuery.ajax
      url: jQuery('form#all_mobs_auto_equip').attr('action'),
      type: 'PUT',
      dataType: 'json',
      timeout: 10000,
      data : jQuery('form#all_mobs_auto_equip').serialize(),
      error: ->
        alert("エラーが発生しました。")
      success: ->
        alert("自動装備が完了しました。")

jQuery ->
  jQuery('#deploy_squad_dungeon_cell').click ->
    jQuery.ajax
      url: jQuery('form#update_dungeon_squad').attr('action') + '/' + jQuery("#mypage_dungeon_id").val() + '/' + jQuery('#dungeoncell_x').text() + '/' + jQuery('#dungeoncell_y').text(),
      type: 'PUT',
      dataType: 'json',
      timeout: 3000,
      data : jQuery('form#update_dungeon_squad').serialize(),
      error: ->
        alert("エラーが発生しました。")
      success: ->
        alert("部隊の配置が完了しました。")
        jQuery.get("select_dungeon_id.js?dungeon_id=" + jQuery("#mypage_dungeon_id").val())

jQuery ->
  jQuery('#deploy_trap_dungeon_cell').click ->
    jQuery.ajax
      url: jQuery('form#update_dungeon_trap').attr('action') + '/' + jQuery("#mypage_dungeon_id").val() + '/' + jQuery('#dungeoncell_x').text() + '/' + jQuery('#dungeoncell_y').text(),
      type: 'PUT',
      dataType: 'json',
      timeout: 3000,
      data : jQuery('form#update_dungeon_trap').serialize(),
      error: ->
        alert("エラーが発生しました。")
      success: ->
        alert("罠の配置が完了しました。")
        jQuery.get("select_dungeon_id.js?dungeon_id=" + jQuery("#mypage_dungeon_id").val())

jQuery ->
  jQuery('[id*=link_to_mission_log]').live 'click', ->
    mission_id = jQuery(this).attr("id").replace("link_to_mission_log_", "")
    jQuery.get("edit_strategy.js?strategy_id=" + strategy_id)

jQuery ->
  jQuery('#medium_battle_detail').click ->
    i = jQuery('#medium_battle_detail').index(this)
    p = jQuery("#medium_battle_turn").eq(i).offset().top;
    jQuery('html,body').animate({ scrollTop: p }, 'fast');
    return false

jQuery ->
  jQuery('#medium_first_trial_turn').click ->
    jQuery('#medium_current_trial_turn').text(1)
    jQuery.get("1/view_trial_log.js")

jQuery ->
  jQuery('#medium_previous_trial_turn').click ->
    int_current_turn = parseInt(jQuery('#medium_current_trial_turn').text())
    if int_current_turn > 1
      int_previous_turn = int_current_turn - 1
      jQuery('#medium_current_trial_turn').text(int_previous_turn)
      jQuery.get(int_previous_turn + "/view_trial_log.js")

jQuery ->
  jQuery('#medium_next_trial_turn').click ->
    int_current_turn = parseInt(jQuery('#medium_current_trial_turn').text())
    if int_current_turn < parseInt(jQuery('#medium_max_trial_turn').text())
      int_next_turn = int_current_turn + 1
      jQuery('#medium_current_trial_turn').text(int_next_turn)
      jQuery.get(int_next_turn + "/view_trial_log.js")

jQuery ->
  jQuery('#medium_last_trial_turn').click ->
    jQuery('#medium_current_trial_turn').text(jQuery('#medium_max_trial_turn').text())
    jQuery.get(jQuery('#medium_max_trial_turn').text() + "/view_trial_log.js")

jQuery ->
  jQuery('#medium_battle_first_turn').click ->
    jQuery('#medium_current_battle_turn').text(1)
    jQuery.get(jQuery('#medium_current_trial_turn').text() + "/1/view_battle_log.js")

jQuery ->
  jQuery('#medium_battle_previous_turn').click ->
    int_current_battle_turn = parseInt(jQuery('#medium_current_battle_turn').text())
    if int_current_battle_turn > 1
      int_previous_battle_turn = int_current_battle_turn - 1
      jQuery('#medium_current_battle_turn').text(int_previous_battle_turn)
      jQuery.get(jQuery('#medium_current_trial_turn').text() + "/" + int_previous_battle_turn + "/view_battle_log.js")

jQuery ->
  jQuery('#medium_battle_next_turn').click ->
    int_current_battle_turn = parseInt(jQuery('#medium_current_battle_turn').text())
    if int_current_battle_turn < parseInt(jQuery('#medium_max_battle_turn').text())
      int_next_battle_turn = int_current_battle_turn + 1
      jQuery('#medium_current_battle_turn').text(int_next_battle_turn)
      jQuery.get(jQuery('#medium_current_trial_turn').text() + "/" + int_next_battle_turn + "/view_battle_log.js")

jQuery ->
  jQuery('#medium_battle_last_turn').click ->
    jQuery('#medium_current_battle_turn').text(jQuery('#medium_max_battle_turn').text())
    jQuery.get(jQuery('#medium_current_trial_turn').text() + "/" + jQuery('#medium_max_battle_turn').text() + "/view_battle_log.js")