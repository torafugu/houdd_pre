var svg
var turn = 1
var intruderHP = 10
var guardHP = 10

function CreateDungeon2(maptext) {

  var dungeonArray = maptext.toString().split('|')
  var dungeonSizeX = dungeonArray[0].length
  var dungeonSizeY = dungeonArray.length
  console.log('dungeonSize=(' + dungeonSizeX + ',' + dungeonSizeY + ')')

  var startX = 10
  var startY = 10
  var currentX = 10
  var currentY = 10
  var rectSize = 20
  var svgWidth = rectSize * dungeonSizeX
  var svgHeight = rectSize * dungeonSizeY
  svg = new SVGKit(startX + svgWidth, startY + svgHeight)
  var currentXY = "X10Y10"

  for ( cntY = 0; cntY < dungeonArray.length; cntY++ ) {
    for ( cntX = 0; cntX < dungeonArray[cntY].length; cntX++ ) {

      if (dungeonArray[cntY].charAt(cntX) == 1) {
        currentX = startX + cntX * rectSize
        currentY = startY + cntY * rectSize
        currentXY = 'X' + currentX + 'Y' + currentY
        var rect = svg.RECT({x:currentX, y:currentY, width:rectSize, height:rectSize})
        svg.append(rect)
        console.log(currentXY)
      }
    }
  }
  appendChildNodes('map', svg.htmlElement)
}

function UpdateDungeon2() {

  if (turn == 1) {
    var intruder = svg.CIRCLE({cx:60, cy:60, r:5, fill:'blue', 'fill-opacity':0.5})
    var guard = svg.CIRCLE({cx:60, cy:30, r:5, fill:'red', 'fill-opacity':0.5})
    var path = svg.PATH({'d':"M60,55 L60,38 L55,43 M60,38 L65,43",'fill':'none', 'stroke':"blue", 'stroke-width':"2"})

    svg.append(intruder)
    svg.append(guard)
    svg.append(path)

    appendChildNodes('map', svg.htmlElement)
  }
  
  if (guardHP > 0 && intruderHP > 0) {

    turn = turn + 1
    jQuery('#turn').text(turn)

    // Attack of intruder
    var intruderAttackDamage = Math.floor( Math.random() * 3 ) + 1
    var intruderAttackLog = "侵入兵の攻撃：" + intruderAttackDamage + "のダメージ。\n"
    guardHP = guardHP - intruderAttackDamage
    if (guardHP < 1) {
      intruderAttackLog += "防衛兵は死んだ。戦闘終了。\n"
      
      var guardDeathPath = svg.PATH({'d':"M67,67 L53,53 M53,67 L67,53" ,'fill':'none', 'stroke':"blue", 'stroke-width':"2"})
      svg.append(guardDeathPath)
      appendChildNodes('map', svg.htmlElement)
    }

    jQuery('#guradHP').text(guardHP)
    jQuery('#battle').append(intruderAttackLog)

    // Attack of guard
    var guardAttackDamage = Math.floor( Math.random() * 4 ) + 1
    var guardAttackLog = "防衛兵の攻撃：" + guardAttackDamage + "のダメージ。\n"
    intruderHP = intruderHP - guardAttackDamage
    if (intruderHP < 1) {
      guardAttackLog += "侵入兵は死んだ。戦闘終了。\n"

      var intruderDeathPath = svg.PATH({'d':"M67,37 L53,23 M53,37 L67,23",'fill':'none', 'stroke':"red", 'stroke-width':"2"})
      svg.append(intruderDeathPath)
      appendChildNodes('map', svg.htmlElement)
    }

    jQuery('#intruderHP').text(intruderHP)
    jQuery('#battle').append(guardAttackLog)
  }
}

function UpdateSVG() {
//  jQuery('#map').text('abcdefg')
  jQuery('#rectsvg').attr('fill','#000000')
  alert(jQuery('#rectsvg').attr('fill'))
}