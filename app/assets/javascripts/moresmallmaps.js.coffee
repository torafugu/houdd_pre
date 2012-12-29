
jQuery ->
  jQuery(window).load ->
    if jQuery('[id=more_small_map_canvas]')[0]?
      renderMap(jQuery("#moresmallmap_txt").val())

jQuery ->
  jQuery('#moresmall_to_txt').click ->
    p = Processing.getInstanceById("more_small_map_canvas");
    mapArray = p.getMap()
    mapText = ""
    for y in [0...mapArray.length]
      for x in [0...mapArray[y].length]
        mapText += mapArray[y][x]
      mapText += "|"
    jQuery("#moresmallmap_txt").val(mapText.slice(0, -1))

jQuery ->
  jQuery('#moresmall_to_canvas').click ->
    renderMap(jQuery("#moresmallmap_txt").val())

renderMap = (mapTxt) ->
    mapArray = mapTxt.split('|')
    for Y in [0...mapArray.length]
      mapArray[Y] = mapArray[Y].split('')
    p = Processing.getInstanceById("more_small_map_canvas");
    p.setMap(mapArray)
