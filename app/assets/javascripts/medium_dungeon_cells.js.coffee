jQuery ->
  jQuery('#dungeon_id').change ->
    window.location = "?dungeon_id=" + jQuery("#dungeon_id").val()
