mapTxt = "<%= @map_txt %>"
mapArray = mapTxt.split('|')
for Y in [0...mapArray.length]
  mapArray[Y] = mapArray[Y].split('')
p = Processing.getInstanceById("mostsmall_construction_canvas")
p.setMap(mapArray)
