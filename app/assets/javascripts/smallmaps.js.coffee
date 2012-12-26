# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
  jQuery(window).load ->
    if jQuery('[id=map_canvas]')[0]?
      renderMap(jQuery("#smallmap_txt").val())

jQuery ->
  jQuery('#to_txt').click ->
    p = Processing.getInstanceById("map_canvas");
    mapArray = p.getMap()
    mapText = ""
    for y in [0...mapArray.length]
      for x in [0...mapArray[y].length]
        mapText += mapArray[y][x]
      mapText += "|"
    jQuery("#smallmap_txt").val(mapText.slice(0, -1))

jQuery ->
  jQuery('#to_canvas').click ->
    renderMap(jQuery("#smallmap_txt").val())

renderMap = (mapTxt) ->
    mapArray = mapTxt.split('|')
    for Y in [0...mapArray.length]
      mapArray[Y] = mapArray[Y].split('')
    p = Processing.getInstanceById("map_canvas");
    p.setMap(mapArray)

