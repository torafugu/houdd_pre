dungeonTxt = "<%= @dungeon_txt %>"
dungeonArray = dungeonTxt.split('|')
for Y in [0...dungeonArray.length]
  dungeonArray[Y] = dungeonArray[Y].split('')
p = Processing.getInstanceById("mostsmall_dungeon_canvas")
p.setMap(dungeonArray)
