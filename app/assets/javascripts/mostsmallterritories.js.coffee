
jQuery ->
  jQuery(window).load ->
    if jQuery('[id=mostsmall_map_canvas]')[0]?
      renderMap(jQuery("#mostsmallterritory_map_txt").val())
    if jQuery('[id=mostsmall_dungeon_canvas]')[0]?
      renderDungeon(jQuery("#mostsmallterritory_dungeon_txt").val())

jQuery ->
  jQuery('#mostsmall_to_txt').click ->
    p = Processing.getInstanceById("mostsmall_map_canvas");
    mapArray = p.getMap()
    mapText = ""
    for y in [0...mapArray.length]
      for x in [0...mapArray[y].length]
        mapText += mapArray[y][x]
      mapText += "|"
    jQuery("#mostsmallterritory_map_txt").val(mapText.slice(0, -1))

jQuery ->
  jQuery('#mostsmall_to_canvas').click ->
    renderMap(jQuery("#mostsmallterritory_map_txt").val())

jQuery ->
  jQuery('#mostsmall_random_map_txt').click ->
    jQuery.get("random_map_txt.js")
    renderMap(jQuery("#mostsmallterritory_map_txt").val())


jQuery ->
  jQuery('#mostsmall_to_dungeon_txt').click ->
    p = Processing.getInstanceById("mostsmall_dungeon_canvas");
    dungeonArray = p.getMap()
    dungeonText = ""
    for y in [0...dungeonArray.length]
      for x in [0...dungeonArray[y].length]
        dungeonText += dungeonArray[y][x]
      dungeonText += "|"
    jQuery("#mostsmallterritory_dungeon_txt").val(dungeonText.slice(0, -1))

jQuery ->
  jQuery('#mostsmall_to_dungeon_canvas').click ->
    renderMap(jQuery("#mostsmall_dungeon_canvas").val())

renderMap = (mapTxt) ->
  mapArray = mapTxt.split('|')
  for Y in [0...mapArray.length]
    mapArray[Y] = mapArray[Y].split('')
  p = Processing.getInstanceById("mostsmall_map_canvas")
  p.setMap(mapArray)

renderDungeon = (dungeonTxt) ->
  dungeonArray = dungeonTxt.split('|')
  for Y in [0...dungeonArray.length]
    dungeonArray[Y] = dungeonArray[Y].split('')
  p = Processing.getInstanceById("mostsmall_dungeon_canvas")
  p.setMap(dungeonArray)
