#include <Common>

;-------------------------------------------------------------------------------
; global variables
;-------------------------------------------------------------------------------

;-------------------------------------------------------------------------------
; hotkeys
;-------------------------------------------------------------------------------

^+p:: ;ctrl+shift+p
{
  initHotkey("Pause")
  Pause
  return
}

^+r:: ;ctrl+shift+r
{
  Reload
  return
}

^+x:: ;ctrl+shift+x
{
  ExitApp
}

^+`:: ;ctrl+shift+`
{
  initHotkey("getPixelColor")
  getPixelColor("", "")
  return
}

^+a:: ;ctrl+shift+a
{
  ;if !WinActive("ahk_exe  ja2.exe")
  ;  return
  ;initHotkey("test")
  test()
  return
}

^+z:: ;ctrl+shift+z
{
  if !WinActive("ahk_exe  ja2.exe")
    return
  initHotkey("doTacDrinkWaterAuto")
  doTacDrinkWaterAuto()
  return
}

^+1:: ;ctrl+shift+1
{
  if !WinActive("ahk_exe  ja2.exe")
    return
  initHotkey("doMapStatExp")
  ;doMapStatExp(1)
  doMapStatExp(99)
  ;doMapStatExp(9999) ;aggressive
  return
}

^+2:: ;ctrl+shift+2
{
  if !WinActive("ahk_exe  ja2.exe")
    return
  initHotkey("doTacStatWisExp")
  doTacStatWisExp(0)
  return
}

^+3:: ;ctrl+shift+3
{
  if !WinActive("ahk_exe  ja2.exe")
    return
  initHotkey("doTacStatDexMrk")
  ;doTacStatDexMrk("", DUR_46_COORD_Y, true)
  ;doTacStatDexMrk(NW, DUR_46_COORD_Y, true)
  ;doTacStatDexMrk(NE, DUR_46_COORD_Y, true)
  ;doTacStatDexMrk(SW, DUR_46_COORD_Y, false) ;estoni i6
  doTacStatDexMrk(SE, DUR_46_COORD_Y, false) ;drassen d13, cambria g9, meduna o4, meduna n3
  ;doTacStatDexMrk("", DUR_46_COORD_Y, false)
  return
}

^+4:: ;ctrl+shift+4
{
  if !WinActive("ahk_exe  ja2.exe")
    return
  initHotkey("doTacStatDexMec")
  ;doTacStatDexMec(NE, DUR_51_COORD_Y, 0, false, false) ;single mode
  doTacStatDexMec(NE, DUR_51_COORD_Y, 0, false, true) ;auto momde
  ;doTacStatDexMec(NE, DUR_46_COORD_Y, 5, false, true) ;auto momde
  return
}

^+5:: ;ctrl+shift+5
{
  if !WinActive("ahk_exe  ja2.exe")
    return
  initHotkey("doTacStatStrHlt")
  ;doTacStatStrHlt(40, false) ;heavy weight waterdrum
  ;doTacStatStrHlt(33, false) ;heavy weight waterdrum
  doTacStatStrHlt(10, false) ;low weight sandbag
  return
}

^+6:: ;ctrl+shift+6
{
  if !WinActive("ahk_exe  ja2.exe")
    return
  initHotkey("doTacStatAgi")
  doTacBatStatAgi(NE, 4) ;NE: Cambria, Alma, Chitzena
  ;doTacBatStatAgi(NW, 4) ;NW: Drassen
  return
}

^+7:: ;ctrl+shift+7
{
  if !WinActive("ahk_exe  ja2.exe")
    return
  initHotkey("doTacBatStatStrHlt")
  doTacBatStatStrHlt(1, 50) ;heavy weight waterdrum
  ;doTacBatStatStrHlt(2, 50) ;heavy weight waterdrum
  ;doTacBatStatStrHlt(3, 50) ;low weight sandbag
  return
}

^+8:: ;ctrl+shift+8
{
  if !WinActive("ahk_exe  ja2.exe")
    return
  initHotkey("doTacRemoveExtender")
  doTacRemoveExtender(NE, DUR_46_COORD_Y, false, false)
  return
}

^+9:: ;ctrl+shift+9
{
  if !WinActive("ahk_exe  ja2.exe")
    return
  initHotkey("doTacStatLdr")
  doTacStatLdr(NW, MAN_WOMAN, false)
  ;doTacStatLdr(NW, BIG_MAN, false)
  return
}

^+0:: ;ctrl+shift+0
{
  if !WinActive("ahk_exe  ja2.exe")
    return
  initHotkey("doTacStatPreDexMec")
  doTacStatPreDexMec(NE)
  return
}

^+-:: ;ctrl+shift+-
{
  if !WinActive("ahk_exe  ja2.exe")
    return
  initHotkey("doTacStatDexMec")
  doTacStatDexMec(NE, DUR_46_COORD_Y, 400, false, false) ;single momde
  return
}

^+\:: ;ctrl+shift+\
{
  if !WinActive("ahk_exe  ja2.exe")
    return
  initHotkey("doMapDropBackpack")
  ;doMapDropBackpack(COMBAT_PACK, 1)
  doMapDropBackpack(BACKPACK, 20)
  return
}

^+':: ;ctrl+shift+'
{
  if !WinActive("ahk_exe  ja2.exe")
    return
  initHotkey("doMapDropBackpack2")
  doMapDropBackpack2(1)
  return
}

^+[:: ;ctrl+shift+[
{
  if !WinActive("ahk_exe  ja2.exe")
    return
  initHotkey("doTacBatStatWisExp")
  doTacBatStatWisExp(0)
  ;doTacBatStatWisExp(9999)
  return
}

^+]:: ;ctrl+shift+]
{
  if !WinActive("ahk_exe  ja2.exe")
    return
  initHotkey("doTacBatStatWisExp2")
  doTacBatStatWisExp2(0)
  ;doTacBatStatWisExp2(9999)
  return
}

^+.:: ;ctrl+shift+.
{
  if !WinActive("ahk_exe  ja2.exe")
    return
  initHotkey("doTacBatPostProc")
  doTacBatPostProc()
  return
}

;-------------------------------------------------------------------------------
; init
;-------------------------------------------------------------------------------

init() ;init

init() {
  runAsAdmin()
  removeLogFile(8192)
}

;-------------------------------------------------------------------------------
; test
;-------------------------------------------------------------------------------

test() {
  writeLogFile(WARN, A_ThisFunc, A_LineNumber, "start_of_test")
  ;getPixelColor(446, 161)

  ;testGaugeBarCoord(67 + (0 * 6), 19, 43) ;map health coord: 67, 19 ~ 73, 61, color: 0xCE0000, bg: 0x080000
  ;testGaugeBarCoord(67 + (1 * 6), 19, 43) ;map energy coord: 73, 19 ~ 73, 61, color: 0x2930F7, bg: 0x000000
  ;testGaugeBarCoord(67 + (2 * 6), 19, 43) ;map morale coord: 79, 19 ~ 79, 61 color: 0x08B608, bg: 0x080000
  ;writeLogFile(INFO, A_ThisFunc, A_LineNumber, isDamagedHLTCoord(67, 19, 43, "0xF7F310")) ;map damaged color: 0xF7F310
  ;writeLogFile(INFO, A_ThisFunc, A_LineNumber, isStatMaxCoord(159, 24 + (3 * 10), "0xD6CB9C")) ;map exp stat color: 0xD6CB9C, now up: 0x00CF00
  ;writeLogFile(INFO, A_ThisFunc, A_LineNumber, isStatMaxCoord(159, 24 + (3 * 10), "0x00CF00")) ;map exp stat color: 0xD6CB9C, now up: 0x00CF00
  ;doMapLoadGame()
  ;doMapSaveGame()
  ;doMapPreStatExp()
  ;getPixelColor(453, 400)
  ;getPixelColor(463, 367)
  ;getPixelColor(6, 691)
  ;getPixelColor(6, 6)

  ;isColorFromPixel(252, 338, "0x523808", 0)
  ;writeLogFile(INFO, A_ThisFunc, A_LineNumber, isDamagedHLTCoord(67, 19, 43, "0xF7F310"))
  ;clickMouse(43, 206, "Right", 1)
  ;doMapStatExp(20)

  ;testGaugeBarCoord(70 + (0 * 6), 653, 43) ;tac health coord: 70, 653 ~ 70, 695, squad1 color: 0xCE0000, bg: 0x000000
  ;testGaugeBarCoord(70 + (1 * 6), 653, 43) ;tac energy coord: 76, 653 ~ 70, 695, squad1 color: 0x2930F7, bg: 0x000000
  ;testGaugeBarCoord(70 + (2 * 6), 653, 43) ;tac morale coord: 82, 653 ~ 70, 695, squad1 color: 0x08B608, bg: 0x080000
  ;testGaugeBarCoord(71 + (0 * 6), 573, 43) ;tac health coord: 71, 573 ~ 70, 615, inv color: 0xCE0000, bg: 0x000000 573 always starts with black, and 98 and 100 are indistinguishable.
  ;testGaugeBarCoord(71 + (1 * 6), 573, 43) ;tac energy coord: 77, 573 ~ 70, 615, inv color: 0x2930F7, bg: 0x000000
  ;testGaugeBarCoord(71 + (2 * 6), 573, 43) ;tac morale coord: 83, 573 ~ 70, 615, inv color: 0x08B608, bg: 0x080000
  ;writeLogFile(INFO, A_ThisFunc, A_LineNumber, isDamagedHLTCoord(70, 653, 43, "0xF7F310")) ;tac squad1 damaged color: 0xF7F310
  ;writeLogFile(INFO, A_ThisFunc, A_LineNum ber, isDamagedHLTCoord(71, 573, 43, "0xF7F310")) ;tac inv damaged color: 0xF7F310
  ;writeLogFile(INFO, A_ThisFunc, A_LineNumber, isColorFromPixel(71, 615, "0x000000", 0)) ;tac inv dead color: 0x000000
  ;writeLogFile(INFO, A_ThisFunc, A_LineNumber, isColorFromPixel(77, 593, "0x000000", 0)) ;tac inv energy 50 color: 0x000000
  ;doTacLoadGame()
  ;doTacSaveGame()
  ;doTacDrinkWater(50, 362, 720)
  ;writeLogFile(INFO, A_ThisFunc, A_LineNumber, isStatMaxCoord(116, 577 + (4 * 10), "0xD6CB9C")) ;tac wis stat color: 0xD6CB9C, now up: 0x00CF00
  ;writeLogFile(INFO, A_ThisFunc, A_LineNumber, isStatMaxCoord(163, 577 + (3 * 10), "0xD6CB9C")) ;tac exp stat color: 0xD6CB9C, now up: 0x00CF00
  ;testUseItemCursor()
  ;doTacStatWisExp(20)

  ;testGaugeBarCoord(119, 716, 20) ;tac inv primary item durability coord: 67, 19 ~ 73, 61, color: 0xCEAE84, bg: 0x000000
  ;testGrabCursor()
  ;writeLogFile(INFO, A_ThisFunc, A_LineNumber, isColorFromPixel(119, 725, "0x393829", 0))
  ;writeLogFile(INFO, A_ThisFunc, A_LineNumber, isColorFromPixel(119, 735, "0xCEAE84", 0))
  ;doMapDropItem(false)
  ;doMapDropItem(true)
  ;doTacStatDexMrk("", false)

  ;writeLogFile(INFO, A_ThisFunc, A_LineNumber, isColorFromPixel(119, 735, "0xCEAE84", 0))
  ;writeLogFile(INFO, A_ThisFunc, A_LineNumber, isColorFromPixel(119, 725, "0x393829", 0))
  ;writeLogFile(INFO, A_ThisFunc, A_LineNumber, isColorFromPixel(119, 724, "0x000000", 0))
  ;writeLogFile(INFO, A_ThisFunc, A_LineNumber, isColorFromPixel(119, 725, "0x000000", 0))
  ;writeLogFile(INFO, A_ThisFunc, A_LineNumber, isColorFromPixel(197, 581, "0x312018", 0)) ;tac inv is gun attachemnt color: 0x312018
  ;writeLogFile(INFO, A_ThisFunc, A_LineNumber, isColorFromPixel(159, 734, "0xFF0000", 0)) ;tac inv is gun burst or auto mode color: 0xFF0000
  ;writeLogFile(INFO, A_ThisFunc, A_LineNumber, isColorFromPixel(172, 724, "0xFF0000", 0)) ;tac inv is gun jammed color: 0xFF0000
  ;testIsMessage(120, 30, 16, 16, "0xFFFFFF") ;merc speech
  ;doTacStatDexMec(NE)

  ;testGaugeBarCoord(71 + (0 * 6), 573, 43) ;tac health coord: 70, 653 ~ 70, 695, inv color: 0xCE0000, bg: 0x000000
  ;writeLogFile(INFO, A_ThisFunc, A_LineNumber, isColorFromPixel(71 + (0 * 6), 573, "0x000000", 0))
  ;regenPer := 99 ;100 is over pixel so 99 max
  ;writeLogFile(INFO, A_ThisFunc, A_LineNumber, 573 + Floor(43 * regenPer / 100))
  ;writeLogFile(INFO, A_ThisFunc, A_LineNumber, testIsMessage(5, 555, 32, 12, "0xFFD739"))
  ;writeLogFile(INFO, A_ThisFunc, A_LineNumber, isColorFromPixel(4, 556, "0x00CF00", 0)) ;tac is message color: 0x00CF00
  ;writeLogFile(INFO, A_ThisFunc, A_LineNumber, isColorFromPixel(6, 691, "0x735118", 0)) ;is tac not inv color: 0x735118
  ;writeLogFile(INFO, A_ThisFunc, A_LineNumber, isColorFromPixel(6, 691, "0x291010", 0)) ;is tac not inv no selected color: 0x291010
  ;writeLogFile(INFO, A_ThisFunc, A_LineNumber, isColorFromPixel(6, 691, "0x000000", 0)) ;is tac inv color: 0x000000
  ;writeLogFile(INFO, A_ThisFunc, A_LineNumber, isColorFromPixel(6, 691, "0x000800", 0)) ;is map color: 0x000800
  ;doTacStatStrHlt(true)

  ;writeLogFile(INFO, A_ThisFunc, A_LineNumber, isColorFromPixel(6, 6, "0x73A600", 0)) ;tac is battle player's turn color: 0x73A600
  ;writeLogFile(INFO, A_ThisFunc, A_LineNumber, isStatMaxCoord(112, 24 + (0 * 10), "0xD6CB9C")) ;map agi stat color: 0xD6CB9C, now up: 0x00CF00
  ;writeLogFile(INFO, A_ThisFunc, A_LineNumber, isColorFromPixel(3, 557, "0xFFD739", 0)) ;not enough ap color: 0xFFD739
  ;testGaugeBarCoord(70 + (1 * 6), 653, 43) ;tac energy coord: 76, 653 ~ 70, 695, squad1 color: 0x2930F7, bg: 0x000000
  ;MouseGetPos, coordX, coordY
  ;isPlayerCenter(coordX - 36, coordY - 90, 60, 60, "0xCE0000")
  ;doTacBatStatAgi(NE, 4)

  ;writeLogFile(INFO, A_ThisFunc, A_LineNumber, isStatMaxCoord(112, 24 + (2 * 10), "0x00CF00")) ;map str stat color: 0xD6CB9C, now up: 0x00CF00
  ;writeLogFile(INFO, A_ThisFunc, A_LineNumber, isStatMaxCoord(112, 24 + (2 * 10), "0xD6CB9C")) ;map str stat color: 0xD6CB9C, now up: 0x00CF00
  ;testGaugeBarCoord(67 + (0 * 6), 19, 43) ;map health coord: 67, 19 ~ 73, 61, color: 0xCE0000, bg: 0x080000
  ;writeLogFile(INFO, A_ThisFunc, A_LineNumber, isColorFromPixel(67 + (0 * 6), 19, "0xCE0000", 0)) ;map health max stat color: 0xCE0000
  ;testGaugeBarCoord(70 + (1 * 6), 653, 43) ;tac energy coord: 76, 653 ~ 70, 695, squad1 color: 0x2930F7, bg: 0x000000
  ;writeLogFile(INFO, A_ThisFunc, A_LineNumber, getTacMaxEnergyCoordY()) ;map energy max stat color: 0xCE0000

  ;writeLogFile(INFO, A_ThisFunc, A_LineNumber, isColorFromPixel(159, 81, "0x00CF00", 0))
  ;writeLogFile(INFO, A_ThisFunc, A_LineNumber, isColorFromPixel(159, 81, "0xD6CB9C", 0))

  ;writeLogFile(INFO, A_ThisFunc, A_LineNumber, isColorFromPixel(510 - 6, 310 - 50, "0xCE0000", 0)) ;tac character stance s health coord x - 6, y - 50 color: 0xCE0000
  ;writeLogFile(INFO, A_ThisFunc, A_LineNumber, isColorFromPixel(510 - 6, 310 - 40, "0xCE0000", 0)) ;tac character stance c health coord x - 6, y - 50 color: 0xCE0000
  ;writeLogFile(INFO, A_ThisFunc, A_LineNumber, isColorFromPixel(510 - 6, 310 - 25, "0xCE0000", 0)) ;tac character stance x health coord x - 6, y - 50 color: 0xCE0000
  ;doTacBatStatStrHlt(4, 50)

  ;writeLogFile(INFO, A_ThisFunc, A_LineNumber, isColorFromPixel(177, 719, "0x007900", 0)) ;tac inv is gun attachemnt color: 0x007900
  ;getPixelColor(119, 725)
  ;getPixelColor(177, 719)
  ;doTacRemoveExtender(NE)

  ;writeLogFile(INFO, A_ThisFunc, A_LineNumber, isStatMaxCoord(116, 577 + (3 * 10), "0xD6CB9C")) ;tac ldr stat color: 0xD6CB9C, now up: 0x00CF00
  ;testIsMessage(0, 0, 1024, 768m, "0xFFD739") ;yellow message
  ;testIsMessage(3, 556, 16, 11, "0x00CF00") ;squad last line
  ;testIsMessage(3, 541, 16, 16, "0xFFD739") ;yellow message last two lines
  ;testIsMessage(3, 541, 16, 16, "0x00CF00") ;squad last two lines
  ;testIsMessage(3, 541, 16, 16, "0xBDBEBD") ;helicopter last two lines
  ;doTacStatLdr(NE, "MAN", false)

  ;writeLogFile(INFO, A_ThisFunc, A_LineNumber, isColorFromPixel(11, 14, "0x731008", 0)) ;map entering enemy sector

  ;testBattleMoveCursor()
  ;writeLogFile(INFO, A_ThisFunc, A_LineNumber, isDamagedHLTCoord(70, 653, 43, "0xF7F310"))
  ;writeLogFile(INFO, A_ThisFunc, A_LineNumber, isColorFromPixel(70, 695, "0x000000", 0))
  ;doTacBatStatWisExp(0)

  ;regenPer := 1
  ;maxY := getTacMaxEnergyCoordY()
  ;regenY := maxY
  ;parsedEnergySize := maxY - 653
  ;totalEnergySize := 43 - parsedEnergySize
  ;if (regenPer < 99) {
  ;  regenY := 653 + parsedEnergySize + (totalEnergySize - 1) - Floor(totalEnergySize * regenPer / 100)
  ;}
  ;writeLogFile(INFO, A_ThisFunc, A_LineNumber, "maxY: " maxY)
  ;writeLogFile(INFO, A_ThisFunc, A_LineNumber, "parsedEnergySize: " parsedEnergySize)
  ;writeLogFile(INFO, A_ThisFunc, A_LineNumber, "totalEnergySize: " totalEnergySize)
  ;writeLogFile(INFO, A_ThisFunc, A_LineNumber, "regenY: " regenY)
  ;writeLogFile(INFO, A_ThisFunc, A_LineNumber, isColorFromPixel(70 + (1 * 6), 653, "0x2930F7", 0))
  ;writeLogFile(INFO, A_ThisFunc, A_LineNumber, isColorFromPixel(70 + (1 * 6), 657, "0x2930F7", 0))
  ;testGaugeHBarCoord(504, 260, 12) ;tac character health coord: 504 ~ 515, 260
  ;writeLogFile(INFO, A_ThisFunc, A_LineNumber, isColorFromPixel(510 - 6, 310 - 50, "0xCE0000", 0)) ;tac character health coord x - 6, y - 50 color: 0xCE0000
  ;writeLogFile(INFO, A_ThisFunc, A_LineNumber, isColorFromPixel(550 - 6, 290 - 50, "0xCE0000", 0)) ;tac character health coord x - 6, y - 50 color: 0xCE0000
  ;getPixelColor(36, 724) ;tac squad no right hand color: 0x524131
  ;doTacBatStatWisExp2(0)

  ;writeLogFile(INFO, A_ThisFunc, A_LineNumber, isColorFromPixel(672, 698, "0x212C10", 0)) ;is canteen in tims backpack
  ;writeLogFile(INFO, A_ThisFunc, A_LineNumber, isColorFromPixel(708, 698, "0x212C10", 0)) ;is canteen in 3day pack
  ;writeLogFile(INFO, A_ThisFunc, A_LineNumber, isColorFromPixel(362, 720, "0x212C10", 0)) ;is canteen in left holster
  ;writeLogFile(INFO, A_ThisFunc, A_LineNumber, isColorFromPixel(520, 720, "0x212C10", 0)) ;is canteen in right holster
  ;writeLogFile(INFO, A_ThisFunc, A_LineNumber, getTacCanteenCoord(340, 575, 385, 155, "0x212008")) ;canteen color: 0x212008
  ;doTacDrinkWaterAuto()

  ;doTacBatPostProc()

  ;doTacStatPreDexMec(NE)

  ;doMapDropBackpack(BACKPACK, 1)

  ;getPixelColor(9, 214) ;right hhand is item
  ;getPixelColor(9, 237) ;left hand is item
  ;getPixelColor(181, 284) ;vest is item
  ;getPixelColor(189, 381) ;combat pack is item
  ;getPixelColor(168, 567) ;backpack is  item
  ;doMapDropBackpack2(1)

  writeLogFile(WARN, A_ThisFunc, A_LineNumber, "end_of_test")
}

testGaugeHBarCoord(startX, startY, length) {
  Loop, % length
  {
    getPixelColor((startX +  A_Index - 1), startY)
  }
}

testGaugeBarCoord(startX, startY, length) {
  Loop, % length
  {
    getPixelColor(startX, (startY + A_Index - 1)) ;health coord: 73, 19 ~ 73, 61, color: 0xCE0000, bg: 0x080000
  }
}

;green text color: 0xFFD739, yellow text color: 0xFFD739
;only check last line for search spped
testIsMessage(startX, startY, lengthX, lengthY, color) {
  PixelSearch, foundX, foundY, startX, startY, startX + lengthX, startY + lengthY, color, 0, Fast RGB
  result := ErrorLevel = 0 ? true : false
  message := "testIsMessage() " (result ? "SUCCEED " foundX ", " foundY : "FAILED ") " " color
  writeLogFile(INFO, A_ThisFunc, A_LineNumber, message)
  showToolTip(INFO, message)
  return result
}

testGrabCursor() {
  MouseMove, 510, 310
  Sleep, 50
  Send, {Ctrl Down}
  Sleep, 50
  getPixelColor(510, 310)
  Sleep, 50
  Send, {Ctrl Up}
  Sleep, 50
}

testUseItemCursor() {
  MouseMove, 530, 300 - 15
  Sleep, 50
  Send, {u}
  Sleep, 100
  getPixelColor(530, 300 - 15)
  Sleep, 50
}

testBattleMoveCursor() {
  MouseMove, 510, 310
  Sleep, 3000
  Send, {Shift Down}
  Sleep, 50
  ;Send, {Click, 510, 310 "Left" Down}
  ;Sleep, 3000
  loop, 24 {
    writeLogFile(INFO, A_ThisFunc, A_LineNumber, getPixelColor(499 + A_Index, 310))
  }
  ;Send, {Click, 510, 310, "Left" Up}
  ;Sleep, 50
  Send, {Shift Up}
  Sleep, 50
  ;move red cursor x - 9, y - 0 color: 0xE70000
  ;move grey cursor x - 9, y - 0 color: 0xBDAAAD
}

;-------------------------------------------------------------------------------
; biz functions
;-------------------------------------------------------------------------------

;canteen color: 0x212C10
isPlayerCenter(startX, startY, lengthX, lengthY, color) {
  PixelSearch, foundX, foundY, startX, startY, startX + lengthX, startY + lengthY, color, 0, Fast RGB
  result := ErrorLevel = 0 ? true : false
  message := "isPlayerCenter() " (result ? "SUCCEED " foundX ", " foundY : "FAILED ") " " color
  writeLogFile(INFO, A_ThisFunc, A_LineNumber, message)
  showToolTip(INFO, message)
  return result
}

;canteen color: 0x212C10
getTacCanteenCoord(startX, startY, lengthX, lengthY, color) {
  PixelSearch, foundX, foundY, startX, startY, startX + lengthX, startY + lengthY, color, 0, Fast RGB
  result := ErrorLevel = 0 ? true : false
  message := "getTacCanteenCoord() " (result ? "SUCCEED " foundX ", " foundY : "FAILED ") " " color
  writeLogFile(INFO, A_ThisFunc, A_LineNumber, message)
  showToolTip(INFO, message)
  return foundX "," (foundY + 10)
}

doTacBatPostProc() {
  Send, {Shift Down}
  Sleep, 10
  Send, {r} ;all sqaud reload
  Sleep, 10
  Send, {Shift Up}
  Sleep, 10
  loop {
    Send, {Ctrl Down}
    Sleep, 10
    Send, {.}
    Sleep, 10
    Send, {Ctrl Up}
    Sleep, 10
    if (isColorFromPixel(455, 343, "0xFFFFFF", 0)) { ;sector menu exist
      clickMouse(455, 343, "Left", 50) ;fill canteen
      break
    }
    Sleep, 10
  }
  loop {
    Send, {Ctrl Down}
    Sleep, 10
    Send, {.}
    Sleep, 10
    Send, {Ctrl Up}
    Sleep, 10
    if (isColorFromPixel(455, 343, "0xFFFFFF", 0)) { ;sector menu exist
      clickMouse(455, 378, "Left", 50) ;clean guns merc
      break
    }
    Sleep, 10
  }
  loop {
    Send, {Ctrl Down}
    Sleep, 10
    Send, {.}
    Sleep, 10
    Send, {Ctrl Up}
    Sleep, 10
    if (isColorFromPixel(455, 343, "0xFFFFFF", 0)) { ;sector menu exist
      clickMouse(569, 378, "Left", 50) ;clean guns team
      break
    }
    Sleep, 10
  }
  callMapScreen()
}

doTacDrinkWaterAuto() {
  doTacToTacInv()
  canteenCoord := StrSplit(getTacCanteenCoord(340, 575, 385, 155, "0x212008"), ",") ;canteen color: 0x212008
  ;canteenCoordX := 0, canteenCoordY := 0
  ;if (isColorFromPixel(672, 698, "0x212C10", 0)) { ;is canteen in tims backpack
  ;  canteenCoordX := 672
  ;  canteenCoordY := 698
  ;} else if (isColorFromPixel(708, 698, "0x212C10", 0)) { ;is canteen in 3day pack
  ;  canteenCoordX := 708
  ;  canteenCoordY := 698
  ;} else if (isColorFromPixel(362, 720, "0x212C10", 0)) { ;is canteen in left holster
  ;  canteenCoordX := 362
  ;  canteenCoordY := 720
  ;} else if (isColorFromPixel(520, 720, "0x212C10", 0)) { ;is canteen in right holster
  ;  canteenCoordX := 520
  ;  canteenCoordY := 720
  ;}
  doTacDrinkWater(99, canteenCoord[1], canteenCoord[2])
  doTacInvToTac()
  Send, {Pause}
  Sleep, 50
}

;location
;            client(center)
;           /
;       bomb
;      /
;server
doTacBatStatWisExp2(skipCheckAmount) {
  coordX1 := 510, coordY1 := 310                   ;client
  coordX2 := coordX1 + 20, coordY2 := coordY1 - 10 ;bomb
  coordX3 := coordX1 + 40, coordY3 := coordY1 - 20 ;server
  successCnt := 0
  callTacScreen()
  Send, {F1}
  Sleep, 50
  Send, {/}
  Sleep, 50
  MouseMove, 510, 310
  Sleep, 50
  clickMouse(510, 310, "Left", 50)
  doTacInvToTac()
  Send, {s}
  Sleep, 50
  doEndPlayersTurnAndRegenEnergy(99, coordX1, coordY1, false)
  loop {
    outerIndex := A_index
    if (Mod(A_index, 50) == 0) {
      callMapScreen()
      if (isStatMaxCoord(112, 24 + (4 * 10), "0x00CF00") || isStatMaxCoord(112, 24 + (4 * 10), "0xD6CB9C")) { ;map wis stat color: 0xD6CB9C, now up: 0x00CF00
        if (isStatMaxCoord(159, 24 + (3 * 10), "0x00CF00") || isStatMaxCoord(159, 24 + (3 * 10), "0xD6CB9C")) { ;map exp stat color: 0xD6CB9C, now up: 0x00CF00
          playBeep(3, 7902, 80) ;SUCCEED
          if (successCnt > 0) {
            doMapSaveGame()
          }
          return
        }
      } else {
        callTacScreen()
        continue
      }
      Sleep, 50
    }
    ;server start
    Send, {r}
    Sleep, 10
    doTacBatCenter(coordX1, coordY1)
    MouseMove, coordX2, coordY2
    Sleep, 10
    loop {
      if (isColorFromPixel(coordX2 - 9, coordY2, "0xBDAAAD", 0)) { ;move grey cursor x - 9, y - 0 color: 0xBDAAAD
        break
      }
      Sleep, 10
    }
    Send, {u}
    Sleep, 10
    Send, {Shift Down}
    Sleep, 10
    loop {
      if (isColorFromPixel(coordX2, coordY2, "0x101010", 0)
      || isColorFromPixel(coordX2, coordY2, "0x000008", 0)) { ;bomb cursor, hurl: 0x000008
        clickMouse(coordX2, coordY2, "Left", 10) ;plant bomb
        break
      }
      Sleep, 10
    }
    Send, {Shift Up}
    Sleep, 10
    loop {
      if (isColorFromPixel(451, 399, "0x000008", 0)) { ;remote detonator or detonator dialog exist
        Send, {4}
        Sleep, 10
        break
      }
      Sleep, 10
    }
    MouseMove, coordX1, coordY1
    Sleep, 10
    loop {
      if (isColorFromPixel(coordX1 - 9, coordY1, "0xBDAAAD", 0)) { ;move grey cursor x - 9, y - 0 color: 0xBDAAAD
        break
      }
      Sleep, 10
    }
    Send, {r}
    Sleep, 10
    Send, {Shift Down}
    Sleep, 10
    loop, 2 {
      clickMouse(coordX1, coordY1, "Left", 10) ;move before pos
    }
    Send, {Shift Up}
    Sleep, 10
    ;server end

    ;change squad
    loop {
      Send, {Shift Down}
      Sleep, 10
      Send, {Space}
      Sleep, 10
      Send, {Shift Up}
      Sleep, 10
      if (isColorFromPixel(coordX3 - 6, coordY3 - 50, "0xCE0000", 0)) { ;tac character health coord x - 6, y - 50 color: 0xCE0000
        break
      }
      Sleep, 10
    }
    Sleep, 100

    ;client start
    MouseMove, coordX2, coordY2
    Sleep, 10
    Send, {Ctrl Down}
    Send, {Shift Down}
    Sleep, 10
    loop {
      if (isColorFromPixel(coordX2, coordY2, "0x420000", 0)) { ;red grab cursor
        clickMouse(coordX2, coordY2, "Left", 10) ;disarm bomb
        break
      }
      Sleep, 10
    }
    Send, {Shift Up}
    Send, {Ctrl Up}
    Sleep, 10
    loop {
      isDisarmed := true
      if (isColorFromPixel(464, 400, "0x000008", 0)) { ;disarm dialog exist
        Send, {y}
        Sleep, 10
        break
      }
      if (isDamagedHLTCoord(70, 653, 43, "0xF7F310") || isColorFromPixel(70, 695, "0x000000", 0)) { ;tac squad1 damaged color: 0xF7F310, died color: 0x000000
        successCnt := 0
        isDisarmed := false
        break
      }
      Sleep, 10
    }
    Sleep, 50 ;delay
    if (!isDisarmed) {
      successCnt := 0
      doTacLoadGame()
      continue
    }
    loop {
      Send, {Shift Down}
      Sleep, 10
      Send, {q}
      Sleep, 10
      Send, {Shift Up}
      Sleep, 10
      if (isColorFromPixel(36, 724, "0x524131", 0)) { ;tac squad no right hand color: 0x524131
        break
      }
      Sleep, 10
    }
    Sleep, 100 ;XXX: drop bomb if set lower than 10 sleep bomb going to missing
    MouseMove, coordX3, coordY3
    Sleep, 10
    loop {
      if (isColorFromPixel(coordX3 - 9, coordY3, "0xBDAAAD", 0)) { ;move grey cursor x - 9, y - 0 color: 0xBDAAAD
        break
      }
      Sleep, 10
    }
    Send, {r}
    Sleep, 10
    Send, {Shift Down}
    Sleep, 10
    loop, 2 {
      clickMouse(coordX3, coordY3, "Left", 10) ;move before pos
    }
    ;client end

    ;change squad
    loop {
      Send, {Shift Down}
      Sleep, 10
      Send, {Space}
      Sleep, 10
      Send, {Shift Up}
      Sleep, 10
      if (isColorFromPixel(coordX1 - 6, coordY1 - 50, "0xCE0000", 0)) { ;tac character health coord x - 6, y - 50 color: 0xCE0000
        break
      }
      Sleep, 10
    }
    Sleep, 100

    ;server start
    MouseMove, coordX2, coordY2
    Sleep, 10
    Send, {Ctrl Down}
    Send, {Shift Down}
    Sleep, 10
    loop {
      if (isColorFromPixel(coordX2, coordY2, "0x420000", 0)) { ;red grab cursor
        clickMouse(coordX2, coordY2, "Left", 10) ;get bomb
        break
      }
      Sleep, 10
    }
    Send, {Shift Up}
    Send, {Ctrl Up}
    Sleep, 10
    MouseMove, coordX1, coordY1
    Sleep, 10
    loop {
      if (isColorFromPixel(coordX1 - 9, coordY1, "0xBDAAAD", 0)) { ;move grey cursor x - 9, y - 0 color: 0xBDAAAD
        break
      }
      Sleep, 10
    }
    Send, {r}
    Sleep, 10
    Send, {Shift Down}
    Sleep, 10
    loop, 2 {
      clickMouse(coordX1, coordY1, "Left", 10) ;move before pos
    }
    Send, {Shift Up}
    Sleep, 10
    ;server end

    doEndPlayersTurnAndRegenEnergy(99, coordX1, coordY1, false)
    successCnt += 1
    if (successCnt < skipCheckAmount) {
      doTacSaveGame()
    }
    Sleep, 10
  }
}

doTacBatStatWisExp(skipCheckAmount) {
  coordX1 := 510, coordY1 := 310
  coordX2 := coordX1 + 20, coordY2 := coordY1 - 10
  successCnt := 0
  callTacScreen()
  Send, {F1}
  Sleep, 50
  Send, {/}
  Sleep, 50
  MouseMove, 510, 310
  Sleep, 50
  clickMouse(510, 310, "Left", 50)
  doTacInvToTac()
  Send, {s}
  Sleep, 50
  doEndPlayersTurnAndRegenEnergy(99, coordX1, coordY1, false)
  loop {
    outerIndex := A_index
    if (Mod(A_index, 50) == 0) {
      callMapScreen()
      if (isStatMaxCoord(112, 24 + (4 * 10), "0x00CF00") || isStatMaxCoord(112, 24 + (4 * 10), "0xD6CB9C")) { ;map wis stat color: 0xD6CB9C, now up: 0x00CF00
        if (isStatMaxCoord(159, 24 + (3 * 10), "0x00CF00") || isStatMaxCoord(159, 24 + (3 * 10), "0xD6CB9C")) { ;map exp stat color: 0xD6CB9C, now up: 0x00CF00
          playBeep(3, 7902, 80) ;SUCCEED
          if (successCnt > 0) {
            doMapSaveGame()
          }
          return
        }
      } else {
        callTacScreen()
        continue
      }
      Sleep, 50
    }
    Send, {r}
    Sleep, 10
    doTacBatCenter(coordX1, coordY1)
    MouseMove, coordX2, coordY2
    Sleep, 10
    loop {
      if (isColorFromPixel(coordX2 - 9, coordY2, "0xBDAAAD", 0)) { ;move grey cursor x - 9, y - 0 color: 0xBDAAAD
        break
      }
      Sleep, 10
    }
    Send, {u}
    Sleep, 10
    Send, {Shift Down}
    Sleep, 10
    loop {
      if (isColorFromPixel(coordX2, coordY2, "0x101010", 0)
      || isColorFromPixel(coordX2, coordY2, "0x000008", 0)) { ;bomb cursor, hurl: 0x000008
        clickMouse(coordX2, coordY2, "Left", 10) ;plant bomb
        break
      }
      Sleep, 10
    }
    Send, {Shift Up}
    Sleep, 10
    loop {
      if (isColorFromPixel(451, 399, "0x000008", 0)) { ;remote detonator or detonator dialog exist
        Send, {4}
        Sleep, 10
        break
      }
      Sleep, 10
    }
    MouseMove, coordX2, coordY2
    Sleep, 10
    Send, {Ctrl Down}
    Send, {Shift Down}
    Sleep, 10
    loop {
      if (isColorFromPixel(coordX2, coordY2, "0x420000", 0)) { ;red grab cursor
        clickMouse(coordX2, coordY2, "Left", 10) ;disarm bomb
        break
      }
      Sleep, 10
    }
    Send, {Shift Up}
    Send, {Ctrl Up}
    Sleep, 10
    loop {
      isDisarmed := true
      if (isColorFromPixel(464, 400, "0x000008", 0)) { ;disarm dialog exist
        Send, {y}
        Sleep, 10
        break
      }
      if (isDamagedHLTCoord(70, 653, 43, "0xF7F310") || isColorFromPixel(70, 695, "0x000000", 0)) { ;tac squad1 damaged color: 0xF7F310, died color: 0x000000
        successCnt := 0
        isDisarmed := false
        break
      }
      Sleep, 10
    }
    Sleep, 50 ;delay
    if (!isDisarmed) {
      successCnt := 0
      doTacLoadGame()
      continue
    }
    MouseMove, coordX1, coordY1
    Sleep, 10
    loop {
      if (isColorFromPixel(coordX1 - 9, coordY1, "0xBDAAAD", 0)) { ;move grey cursor x - 9, y - 0 color: 0xBDAAAD
        break
      }
      Sleep, 10
    }
    Send, {r}
    Sleep, 10
    Send, {Shift Down}
    Sleep, 10
    loop, 2 {
      clickMouse(coordX1, coordY1, "Left", 10) ;move before pos
    }
    Send, {Shift Up}
    Sleep, 10
    doEndPlayersTurnAndRegenEnergy(99, coordX1, coordY1, false)
    successCnt += 1
    if (successCnt < skipCheckAmount) {
      doTacSaveGame()
    }
    Sleep, 10
  }
}

doTacStatLdr(directionType, manType, isPixelCheck) {
  ;After calling militia come to me, lay it down with get down, and then execute the get down macro. For dialogue windows, use unmovable stones or houses.
  coordX1 := 0, coordY1 := 0
  coordX2 := 0, coordY2 := 0
  manTypeCoordY := 0
  switch (manType) {
    case MAN_WOMAN:
      manTypeCoordY := 0
    case BIG_MAN:
      manTypeCoordY := -3
    default:
  }
  switch (directionType) {
    case NW: ;recommended between 1 tiles
      coordX1 := 510 - (20 * 1), coordY1 := 310 - (10 * 1) + 11
      coordX2 := coordX1 + 22, coordY2 := coordY1 + (-6) + manTypeCoordY ;militia come to me coordination
    case NE:
      coordX1 := 510 + (20 * 1), coordY1 := 310 - (10 * 1) + 2
      coordX2 := coordX1 + 56, coordY2 := coordY1 + 35 + manTypeCoordY ;35 get down, 115 all:get down
    case SW: ;recommended between 1 tiles
      coordX1 := 510 - (20 * 1), coordY1 := 310 + (10 * 1) + 2
      coordX2 := coordX1 + 20, coordY2 := coordY1 - 15 + manTypeCoordY ;-15 hold position
    default:
  }
  callTacScreen()
  Send, {F1}
  Sleep, 50
  Send, {/}
  Sleep, 50
  MouseMove, 510, 310
  Sleep, 50
  clickMouse(510, 310, "Left", 50)
  doTacToTacInv()
  Send, {s}
  Sleep, 50
  loop {
    outerIndex := A_index
    if (Mod(A_index, 1000) == 0) {
      callMapScreen()
      callTacScreen()
      continue
    }
    if (isPixelCheck) {
      if (isStatMaxCoord(116, 577 + (3 * 10), "0x00CF00") || isStatMaxCoord(116, 577 + (3 * 10), "0xD6CB9C")) { ;tac ldr stat color: 0xD6CB9C, now up: 0x00CF00
        playBeep(3, 7902, 80) ;SUCCEED
        if (outerIndex > 1) {
          doTacSaveGame()
        }
        callMapScreen()
        return
      }
      ;tac is message color: 0x00CF00
      if (testIsMessage(3, 541, 16, 1, "0x00CF00")
      || testIsMessage(3, 556, 16, 1, "0x00CF00")) {
        playBeep(1, 2489, 80) ;INTERRUPTED
        callMapScreen()
        return
      }
      ;is battle interrupted
      if (isColorFromPixel(6, 6, "0x7B615A", 0)) { ;map screen
        playBeep(1, 2489, 80) ;INTERRUPTED
        return
      }
    }
    MouseMove, coordX1, coordY1
    Sleep, 1
    if (A_index == 1) {
      loop {
        if (isColorFromPixel(coordX1, coordY1, "0x180000", 0)) { ;red talk cursor
          clickMouse(coordX1, coordY1, "Left", 50) ;talk
          break
        }
        Sleep, 50
      }
    } else {
      clickMouseFast(coordX1, coordY1, "Left") ;talk
    }
    MouseMove, coordX2, coordY2
    Sleep, 1
    if (A_index == 1) {
      loop {
        if (isColorFromPixel(coordX2, coordY2, "0x101010", 0)) { ;command cursor
          clickMouse(coordX2, coordY2, "Left", 50) ;command
          break
        }
        Sleep, 50
      }
    } else {
      clickMouseFast(coordX2, coordY2, "Left") ;command
    }
    Sleep, 1
  }
}

;XXX: having to check at every point has performance issues
skipMeanwhile() {
  if (isColorFromPixel(480, 367, "0xFFFFFF", 0)) { ;tac meanwhile color: 0xFFFFFF
    clickMouse(551, 394, "Left", 10) ;skip
  }
  Sleep, 50
}

doGetTacItems(itemCoordX, itemCoordY) {
  Send, {Ctrl Down}
  Sleep, 10
  if (isColorFromPixel(itemCoordX, itemCoordY, "0x940000", 0)) { ;item exist red hand
    clickMouse(itemCoordX, itemCoordY, "Left", 10) ;get item
    Send, {Ctrl Up}
    Sleep, 10
  } else {
    Send, {Ctrl Up}
    Sleep, 10
  }
}

getTacMaxEnergyCoordY() {
  PixelSearch, bgFoundX, bgFoundY, 70 + (1 * 6), 653, 70 + (1 * 6) + 1, 653 + 43, "0x000000", 0, Fast RGB
  PixelSearch, energyFoundX, energyFoundY, 70 + (1 * 6), 653, 70 + (1 * 6) + 1, 653 + 43, "0x2930F7", 0, Fast RGB
  result := ErrorLevel = 0 ? true : false
  message := "getTacMaxEnergyCoordY() " (result ? "SUCCEED bgFoundY: " bgFoundY ", energyFoundY: " energyFoundY : "FAILED") " " color
  writeLogFile(INFO, A_ThisFunc, A_LineNumber, message)
  showToolTip(INFO, message)
  if (bgFoundY != "")  {
    return bgFoundY
  } else {
    return energyFoundY
  }
}

getTacInvMaxEnergyCoordY() {
  PixelSearch, bgFoundX, bgFoundY, 71 + (1 * 6), 573, 71 + (1 * 6) + 1, 573 + 43, "0x000000", 0, Fast RGB
  PixelSearch, energyFoundX, energyFoundY, 71 + (1 * 6), 573, 71 + (1 * 6) + 1, 573 + 43, "0x2930F7", 0, Fast RGB
  result := ErrorLevel = 0 ? true : false
  message := "getTacMaxEnergyCoordY() " (result ? "SUCCEED bgFoundY: " bgFoundY ", energyFoundY: " energyFoundY : "FAILED") " " color
  writeLogFile(INFO, A_ThisFunc, A_LineNumber, message)
  showToolTip(INFO, message)
  if (bgFoundY != "")  {
    return bgFoundY
  } else {
    return energyFoundY
  }
}

doTacBatStatStrHlt(loopCnt, regenPer) {
  coordX1 := 510, coordY1 := 310
  coordX2 := coordX1 + 20, coordY2 := coordY1 - 10
  coordX3 := coordX1 - 20, coordY3 := coordY1 + 10
  isMinerInterrupted := false
  callTacScreen()
  Send, {F1}
  Sleep, 50
  MouseMove, 510, 310
  Sleep, 50
  clickMouse(510, 310, "Left", 50)
  doTacInvToTac()
  Send, {s}
  Sleep, 50
  Send, {Shift Down}
  Sleep, 50
  Send, {b}
  Sleep, 50
  Send, {Shift Up}
  Sleep, 50
  doEndPlayersTurnAndRegenEnergy(99, coordX1, coordY1, false)
  loop {
    outerIndex := A_index
    if (Mod(A_index, 100) == 0) {
      callMapScreen()
      if (isStatMaxCoord(112, 24 + (2 * 10), "0x00CF00") || isStatMaxCoord(112, 24 + (2 * 10), "0xD6CB9C")) { ;map str stat color: 0xD6CB9C, now up: 0x00CF00
        if (isColorFromPixel(159, 81, "0x00CF00", 0) || isColorFromPixel(159, 81, "0xD6CB9C", 0)) { ;map health stat color: 0xD6CB9C, now up: 0x00CF00
          playBeep(3, 7902, 80) ;SUCCEED
          doMapSaveGame()
          return
        } else {
          callTacScreen()
          Sleep, 1000 ;delay
          continue
        }
      } else {
        callTacScreen()
        Sleep, 1000 ;delay
        continue
      }
      Sleep, 50
    }
    Send, {Ctrl Down}
    Send, {Shift Down}
    Sleep, 10
    Send, {f}
    Sleep, 10
    Send, {Shift Up}
    Send, {Ctrl Up}
    Sleep, 50 ;delay
    loop, % loopCnt {
      Send, {r}
      Sleep, 10
      doTacBatCenter(coordX1, coordY1)
      loop {
        MouseMove, coordX2 + (Mod(A_index, 2) == 0 ? 5 : -5), coordY2 + (Mod(A_index, 2) == 0 ? -5 : 5) ;refresh mousemove
        Sleep, 10
        if (isColorFromPixel(coordX2 - 9, coordY2, "0xBDAAAD", 0)) { ;move grey cursor x - 9, y - 0 color: 0xBDAAAD
          isMinerInterrupted := false
          break
        } else {
          if (isMinerInterrupted || A_index > 30) { ;miner interrupt
            isMinerInterrupted := true
            loop, 10 {
              doEndPlayersTurnAndRegenEnergy(regenPer, coordX1, coordY1, true)
            }
            Sleep, 1000
            break
          }
        }
        Sleep, 10
      }
      Send, {Shift Down}
      Sleep, 10
      loop, 2 {
        clickMouse(coordX2, coordY2, "Left", 10) ;move
      }
      Send, {Shift Up}
      Sleep, 10
      Send, {r}
      Sleep, 10
      loop {
        MouseMove, coordX1 + (Mod(A_index, 2) == 0 ? 5 : -5), coordY1 + (Mod(A_index, 2) == 0 ? -5 : 5) ;refresh mousemove
        Sleep, 10
        if (isColorFromPixel(coordX1 - 9, coordY1, "0xBDAAAD", 0)) { ;move grey cursor x - 9, y - 0 color: 0xBDAAAD
          isMinerInterrupted := false
          break
        } else {
          if (isMinerInterrupted || A_index > 30) { ;miner interrupt
            isMinerInterrupted := true
            break
          }
        }
        Sleep, 50 ;delay
      }
      Send, {Shift Down}
      Sleep, 10
      loop, 2 {
        clickMouse(coordX1, coordY1, "Left", 10) ;move
      }
      Send, {Shift Up}
      Sleep, 10
    }
    doEndPlayersTurnAndRegenEnergy(regenPer, coordX1, coordY1, true)
    Sleep, 50 ;delay
  }
}

doTacInvToTac() {
  loop {
    if (isColorFromPixel(6, 691, "0x000000", 0)) { ;is tac inv color: 0x000000
      Send, {vkC0sc029} ;tilde key
      Sleep, 50
      break
    }
    break
  }
}

doTacToTacInv() {
  loop {
    ;is tac not inv color: 0x735118, is tac not inv no selected color: 0x291010
    if (isColorFromPixel(6, 691, "0x735118", 0)
    || isColorFromPixel(6, 691, "0x291010", 0)) {
      Send, {vkC0sc029} ;tilde key
      Sleep, 50
      break
    }
    break
  }
}

waitMapScreen() {
  loop {
    if (isColorFromPixel(6, 6, "0x7B615A", 0)) { ;map screen
      break
    }
    Sleep, 50
  }
  Sleep, 100 ;delay
  loop, 2 {
    clickMouse(33, 43, "Left", 50) ;skip speech
  }
}

waitTacScreen() {
  loop {
    if (isColorFromPixel(6, 691, "0x735118", 0)
    || isColorFromPixel(6, 691, "0x291010", 0)
    || isColorFromPixel(6, 691, "0x000000", 0)) { ;is tac not inv color: 0x735118, , is tac not inv no selected color: 0x291010, is tac inv color: 0x000000
      break
    }
    Sleep, 50
  }
  Send, {Pause} ;delay
  Sleep, 100
  Send, {Pause}
  Sleep, 50
}

callMapScreen() {
  if (isColorFromPixel(6, 6, "0x7B615A", 0)) { ;map screen
    return
  }
  Send, {Pause} ;delay
  Sleep, 1000
  loop {
    Send, {m} ;call map screen
    Sleep, 50
    if (isColorFromPixel(6, 6, "0x7B615A", 0)) { ;map screen
      break
    }
    Sleep, 50
  }
  loop, 2 {
    clickMouse(33, 43, "Left", 50) ;skip speech
  }
  Sleep, 100 ;delay
}

callTacScreen() {
  if (isColorFromPixel(6, 691, "0x735118", 0)
  || isColorFromPixel(6, 691, "0x291010", 0)
  || isColorFromPixel(6, 691, "0x000000", 0)) { ;is tac not inv color: 0x735118, , is tac not inv no selected color: 0x291010, is tac inv color: 0x000000
    return
  }
  if (isColorFromPixel(6, 6, "0x7B615A", 0)) { ;map screen
    if (isColorFromPixel(220, 178, "0x393021" , 0)) { ;is inv mode
      Send, {Esc}
      Sleep, 100 ;added delay
    }
    Sleep, 1000
    loop {
      ;clickMouse(895, 711, "Left", 50) ;tactical button
      Send, {Esc}
      Sleep, 10
      if (isColorFromPixel(6, 691, "0x735118", 0)
      || isColorFromPixel(6, 691, "0x291010", 0)
      || isColorFromPixel(6, 691, "0x000000", 0)) { ;is tac not inv color: 0x735118, , is tac not inv no selected color: 0x291010, is tac inv color: 0x000000
        break
      }
      Sleep, 10
    }
  }
  Send, {Pause} ;delay
  Sleep, 100
  Send, {Pause}
  Sleep, 50
}

doTacBatCenter(centerCoordX, centerCoordY) {
  successCnt := 0
  loop {
    if (!isPlayerCenter(centerCoordX - 36, centerCoordY - 90, 60, 60, "0xCE0000")) { ;tac is player center
      successCnt := 0
      Send, {/}
      Sleep, 10
    } else {
      successCnt += 1
      if (successCnt >= 10) {
        Send, {/}
        Sleep, 10
        break
      }
    }
    Sleep, 10
  }
  ;tac character stance s health coord x - 6, y - 50 color: 0xCE0000
  ;tac character stance c health coord x - 6, y - 40 color: 0xCE0000
  ;tac character stance x health coord x - 6, y - 25 color: 0xCE0000
  ;loop {
  ;  if (isColorFromPixel(coordX1 - 6, coordY1 - 50, "0xCE0000", 0)
  ;  || isColorFromPixel(coordX1 - 6, coordY1 - 40, "0xCE0000", 0)
  ;  || isColorFromPixel(coordX1 - 6, coordY1 - 25, "0xCE0000", 0)) {
  ;    break
  ;  } else {
  ;    Send, {/}
  ;    Sleep, 10 ;delay
  ;  }
  ;  Sleep, 10
  ;}
}

doEndPlayersTurn(centerCoordX, centerCoordY, isDropBackpack) {
  if (isDropBackpack) {
    if (isColorFromPixel(3, 557, "0xFFD739", 0)) { ;not enough ap color: 0xFFD739
      doEndPlayersTurn(centerCoordX, centerCoordY, false)
    }
    Send, {Shift Down}
    Sleep, 10
    Send, {b} ;drop backpack
    Sleep, 10
    Send, {Shift Up}
    Sleep, 10
  }
  ;one more time for ap
  loop, 2 {
    Send, {d}
    Sleep, 10
    loop {
      if (isColorFromPixel(6, 6, "0x73A600", 0) ;player's turn color: 0x73A600
      || isColorFromPixel(6, 6, "0xADA610", 0)) { ;interrrupt color: 0xADA610
        break
      }
      Sleep, 10
    }
  }
  Sleep, 10
}

doEndPlayersTurnAndRegenEnergy(regenPer, centerCoordX, centerCoordY, isDropBackpack) {
  maxY := getTacMaxEnergyCoordY()
  regenY := maxY
  parsedEnergySize := maxY - 653
  totalEnergySize := 43 - parsedEnergySize
  if (regenPer < 100) {
    regenY := 653 + parsedEnergySize + (totalEnergySize - 1) - Floor(totalEnergySize * regenPer / 100)
  }
  if (isColorFromPixel(70 + (1 * 6), regenY, "0x000000", 0)) { ;tac energy coord: 76, 653 ~ 70, 695, squad1 color: 0x2930F7, bg: 0x000000
    loop {
      doEndPlayersTurn(centerCoordX, centerCoordY, isDropBackpack)
      if (isColorFromPixel(70 + (1 * 6), maxY, "0x2930F7", 0)) { ;tac energy coord: 76, 653 ~ 70, 695, squad1 color: 0x2930F7, bg: 0x000000
        break
      }
      Sleep, 10
    }
  } else {
    doEndPlayersTurn(centerCoordX, centerCoordY, isDropBackpack)
  }
  Sleep, 10
}

doTacBatStatAgi(directionType, loopCnt) {
  MouseGetPos, coordX1, coordY1
  coordX2 := 0, coordY2 := 0
  switch (directionType) {
    case NW:
      coordX2 := coordX1 - 20, coordY2 := coordY1 - 10
    case NE:
      coordX2 := coordX1 + 20, coordY2 := coordY1 - 10
    default:
  }
  Send, {F1}
  Sleep, 50
  Send, {/}
  Sleep, 50
  MouseMove, coordX1, coordY1
  Sleep, 50
  clickMouse(coordX1, coordY1, "Left", 50)
  doTacInvToTac()
  Send, {s}
  Sleep, 50
  loop {
    outerIndex := A_index
    if (Mod(A_index, 100) == 0) {
      callMapScreen()
      if (isStatMaxCoord(112, 24 + (0 * 10), "0x00CF00") || isStatMaxCoord(112, 24 + (0 * 10), "0xD6CB9C")) { ;map agi stat color: 0xD6CB9C, now up: 0x00CF00
        playBeep(3, 7902, 80) ;SUCCEED
        if (outerIndex > 1) {
          doMapSaveGame()
        }
        return
      } else {
        callTacScreen()
        continue
      }
      Sleep, 50
    }
    doTacBatCenter(coordX1, coordY1)
    loop, % loopCnt {
      Send, {r}
      Sleep, 10
      MouseMove, coordX2, coordY2
      Sleep, 10
      Send, {Shift Down}
      Sleep, 10
      loop, 2 {
        clickMouse(coordX2, coordY2, "Left", 10) ;move between 1 tiles
      }
      Send, {Shift Up}
      Sleep, 10
      MouseMove, coordX1, coordY1
      Sleep, 10
      Send, {Shift Down}
      Sleep, 10
      loop, 2 {
        clickMouse(coordX1, coordY1, "Left", 10) ;move between 1 tiles
      }
      Send, {Shift Up}
      Sleep, 10
      ;if (isColorFromPixel(3, 557, "0xFFD739", 0)) { ;not enough ap color: 0xFFD739
      ;  break
      ;}
      ;Sleep, 10
    }
    doEndPlayersTurnAndRegenEnergy(99, coordX1, coordY1, false)
    Sleep, 10
  }
}

doTacStatStrHlt(regenPer, isOnlyHealth) {
  coordX1 := 510, coordY1 := 310
  coordX2 := coordX1 + 20, coordY2 := coordY1 - 10
  callTacScreen()
  Send, {F1}
  Sleep, 50
  Send, {/}
  Sleep, 50
  MouseMove, 510, 310
  Sleep, 50
  clickMouse(510, 310, "Left", 50)
  doTacToTacInv()
  canteenCoord := StrSplit(getTacCanteenCoord(340, 575, 385, 155, "0x212008"), ",") ;canteen color: 0x212008
  Send, {s}
  Sleep, 50
  loop, 2 {
    doTacDrinkWater(99, canteenCoord[1], canteenCoord[2])
  }
  loop {
    outerIndex := A_index
    if (Mod(A_index, 150) == 0) {
      callMapScreen()
      callTacScreen()
      continue
    }
    if (isOnlyHealth || isStatMaxCoord(116, 577 + (2 * 10), "0x00CF00") || isStatMaxCoord(116, 577 + (2 * 10), "0xD6CB9C")) { ;tac str stat color: 0xD6CB9C, now up: 0x00CF00
      if (isColorFromPixel(71 + (0 * 6), 574, "0xCE0000", 0)) { ;tac health 98 over stat color: 0xCE0000
        if (A_index == 1 || testIsMessage(3, 556, 16, 1, "0xFFD739")) { ;yellow message
          callMapScreen()
          if (isColorFromPixel(159, 81, "0x00CF00", 0) || isColorFromPixel(159, 81, "0xD6CB9C", 0)) { ;map health stat color: 0xD6CB9C, now up: 0x00CF00
            playBeep(3, 7902, 80) ;SUCCEED
            Sleep, 100 ;delay for anti freezing
            if (outerIndex > 1) {
              doMapSaveGame()
            }
            return
          } else {
            callTacScreen()
            continue
          }
        }
      }
    }
    ;tac is message color: 0x00CF00
    if (testIsMessage(3, 541, 16, 1, "0x00CF00")
    || testIsMessage(3, 556, 16, 1, "0x00CF00")) {
      playBeep(1, 2489, 80) ;INTERRUPTED
      callMapScreen()
      return
    }
    ;is battle interrupted
    if (isColorFromPixel(6, 6, "0x7B615A", 0)) { ;map screen
      playBeep(1, 2489, 80) ;INTERRUPTED
      return
    }
    MouseMove, coordX2, coordY2
    Sleep, 10
    Send, {r}
    Sleep, 10
    Send, {Shift Down}
    Sleep, 10
    loop, 2 {
      clickMouse(coordX2, coordY2, "Left", 10) ;move before pos
    }
    Send, {Shift Up}
    Sleep, 10
    doTacDrinkWater(regenPer, canteenCoord[1], canteenCoord[2])
    Sleep, 10
    MouseMove, coordX1, coordY1
    Sleep, 10
    Send, {r}
    Sleep, 10
    Send, {Shift Down}
    Sleep, 10
    loop, 2 {
      clickMouse(coordX1, coordY1, "Left", 10) ;move before pos
    }
    Send, {Shift Up}
    Sleep, 10
    doTacDrinkWater(regenPer, canteenCoord[1], canteenCoord[2])
    Sleep, 10
  }
}

doTacRemoveExtender(directionType, minDurCoordY, isCheckReload, isAutoMMode) {
  coordX := 0, coordY := 0
  switch (directionType) {
    case NW:
      coordX := 510 - (20 * 1), coordY := 310 - (10 * 1)
    case NE:
      coordX := 510 + (20 * 1), coordY := 310 - (10 * 1)
    case SW:
      coordX := 510 - (20 * 1), coordY := 310 + (10 * 1)
    case SE:
      coordX := 510 + (20 * 1), coordY := 310 + (10 * 1)
    default:
  }
  successCnt := 0
  callTacScreen()
  Send, {F1}
  Sleep, 50
  Send, {/}
  Sleep, 50
  MouseMove, 510, 310
  Sleep, 50
  clickMouse(510, 310, "Left", 50)
  Send, {l}
  Sleep, 50
  MouseMove, %coordX%, %coordY%
  Sleep, 50
  clickMouse(coordX, coordY, "Left", 50) ;look target tile
  Sleep, 50
  doTacToTacInv()
  canteenCoord := StrSplit(getTacCanteenCoord(340, 575, 385, 155, "0x212008"), ",") ;canteen color: 0x212008  
  extenderColor := getPixelColor(177, 719) ;tac inv is gun attachemnt color: 0x007900, 0xFFCB00(grenade launcher)
  Send, {x}
  Sleep, 50
  doTacDrinkWater(50, canteenCoord[1], canteenCoord[2])
  loop {
    outerIndex := A_index
    loop {
      if (isColorFromPixel(119, 735, "0xCEAE84", 0)) { ;got gun
        break
      }
      Sleep, 10
    }
    if (!isAutoMMode) {
      ;psycho trait
      loop {
        if (isColorFromPixel(159, 734, "0xFF0000", 0)) { ;tac inv is gun burst or auto mode color: 0xFF0000
          Send, {b}
          Sleep, 10
        }
        if (!isColorFromPixel(159, 734, "0xFF0000", 0)) { ;tac inv is gun single mode
          break
        }
        Sleep, 10
      }
    }    
    if (!isColorFromPixel(177, 719, extenderColor, 0)) {
      playBeep(3, 7902, 80) ;SUCCEED
      callMapScreen()
      if (successCnt > 0) {
        doMapSaveGame()
      }
      doMapDropItem(false)
      return
    }
    ;tac is 6line message color: 0x00CF00
    if (testIsMessage(3, 466, 16, 90, "0x00CF00")) {
      playBeep(1, 2489, 80) ;INTERRUPTED
      callMapScreen()
      return
    }
    ;is call reinforcements
    if (isColorFromPixel(541, 408, "0xFFFFFF", 0)) { ;call reinforcements to xx dialog
      playBeep(1, 2489, 80) ;INTERRUPTED
      return
    }
    ;is battle interrupted
    if (isColorFromPixel(6, 6, "0x7B615A", 0)) { ;map screen
      playBeep(1, 2489, 80) ;INTERRUPTED
      return
    }
    doTacDrinkWater(50, canteenCoord[1], canteenCoord[2])
    if (isColorFromPixel(119, 725, "0x393829", 0)) { ;destructed
      successCnt := 0
      doTacLoadGame()
      continue
    } else if (isColorFromPixel(119, minDurCoordY, "0x000000", 0)) { ;tac inv primary item min durability
      playBeep(1, 2489, 80) ;INTERRUPTED
      if (successCnt > 0) {
        doTacSaveGame()
      }
      callMapScreen()
      doMapDropItem(false)
      return
    }
    if (isColorFromPixel(119, (minDurCoordY - 1), "0x000000", 0)) { ;tac inv primary item min - 1 durability
      if (Mod(successCnt, 5) == 0) {
        if (successCnt > 0) {
          doTacSaveGame()
        }
      }
    }
    successCnt += 1
    Send, {u}
    Sleep, 10
    MouseMove, %coordX%, %coordY%
    Sleep, 10
    clickMouseFast(%coordX%, %coordY%, "Left") ;attack between 1 tiles
    if (Mod(successCnt, 5) == 0) {
      Send, {Shift Down}
      Sleep, 10
      Send, {r}
      Sleep, 10
      Send, {Shift Up}
      Sleep, 10
    }
    if (isCheckReload
    && !isColorFromPixel(172, 724, "0xFF0000", 0)) { ;tac inv is gun jammed color: 0xFF0000
      if (testIsMessage(120, 30, 16, 16, "0xFFFFFF")) { ;merc speech
        playBeep(1, 2489, 80) ;INTERRUPTED
        callMapScreen()
        return
      }
    }
    Sleep, 10
  }
}

doTacStatDexMec(directionType, minDurCoordY, saveTerm, isCheckReload, isAutoMMode) {
  coordX := 0, coordY := 0
  switch (directionType) {
    case NW:
      coordX := 510 - (20 * 1), coordY := 310 - (10 * 1)
    case NE:
      coordX := 510 + (20 * 1), coordY := 310 - (10 * 1)
    case SW:
      coordX := 510 - (20 * 1), coordY := 310 + (10 * 1)
    case SE:
      coordX := 510 + (20 * 1), coordY := 310 + (10 * 1)
    default:
  }
  successCnt := 0
  callTacScreen()
  Send, {F1}
  Sleep, 50
  Send, {/}
  Sleep, 50
  MouseMove, 510, 310
  Sleep, 50
  clickMouse(510, 310, "Left", 50)
  Send, {l}
  Sleep, 50
  MouseMove, %coordX%, %coordY%
  Sleep, 50
  clickMouse(coordX, coordY, "Left", 50) ;look target tile
  Sleep, 50
  doTacToTacInv()
  canteenCoord := StrSplit(getTacCanteenCoord(340, 575, 385, 155, "0x212008"), ",") ;canteen color: 0x212008
  Send, {x}
  Sleep, 50
  doTacDrinkWater(50, canteenCoord[1], canteenCoord[2])
  loop {
    outerIndex := A_index
    loop {
      if (isColorFromPixel(119, 735, "0xCEAE84", 0)) { ;got gun
        break
      }
      Sleep, 10
    }
    if (!isAutoMMode) {
      ;psycho trait
      loop {
        if (isColorFromPixel(159, 734, "0xFF0000", 0)) { ;tac inv is gun burst or auto mode color: 0xFF0000
          Send, {b}
          Sleep, 10
        }
        if (!isColorFromPixel(159, 734, "0xFF0000", 0)) { ;tac inv is gun single mode
          break
        }
        Sleep, 10
      }
    }
    if (isStatMaxCoord(163, 577 + (2 * 10), "0x00CF00") || isStatMaxCoord(163, 577 + (2 * 10), "0xD6CB9C")) { ;tac mec stat color: 0xD6CB9C, now up: 0x00CF00
      if (isStatMaxCoord(116, 577 + (1 * 10), "0x00CF00") || isStatMaxCoord(116, 577 + (1 * 10), "0xD6CB9C")) { ;tac dex stat color: 0xD6CB9C, now up: 0x00CF00
        playBeep(3, 7902, 80) ;SUCCEED
        callMapScreen()
        if (successCnt > 0) {
          doMapSaveGame()
        }
        doMapDropItem(false)
        return
      }
    }
    ;tac is 6line message color: 0x00CF00
    if (testIsMessage(3, 466, 16, 90, "0x00CF00")) {
      playBeep(1, 2489, 80) ;INTERRUPTED
      callMapScreen()
      return
    }
    ;is call reinforcements
    if (isColorFromPixel(541, 408, "0xFFFFFF", 0)) { ;call reinforcements to xx dialog
      playBeep(1, 2489, 80) ;INTERRUPTED
      return
    }
    ;is battle interrupted
    if (isColorFromPixel(6, 6, "0x7B615A", 0)) { ;map screen
      playBeep(1, 2489, 80) ;INTERRUPTED
      return
    }
    doTacDrinkWater(50, canteenCoord[1], canteenCoord[2])
    if (isColorFromPixel(119, 725, "0x393829", 0)) { ;destructed
      successCnt := 0
      doTacLoadGame()
      continue
    } else if (isColorFromPixel(119, minDurCoordY, "0x000000", 0)) { ;tac inv primary item min durability
      playBeep(1, 2489, 80) ;INTERRUPTED
      if (successCnt > 0) {
        doTacSaveGame()
      }
      callMapScreen()
      doMapDropItem(false)
      return
    }
    if (saveTerm > 0) {
      if (isColorFromPixel(119, (minDurCoordY - 1), "0x000000", 0)) { ;tac inv primary item min - 1 durability
        if (Mod(successCnt, saveTerm) == 0) {
          if (successCnt > 0) {
            doTacSaveGame()
          }
        }
      }
    }
    successCnt += 1
    Send, {u}
    Sleep, 10
    MouseMove, %coordX%, %coordY%
    Sleep, 10
    clickMouseFast(%coordX%, %coordY%, "Left") ;attack between 1 tiles
    if (Mod(successCnt, 5) == 0) {
      Send, {Shift Down}
      Sleep, 10
      Send, {r}
      Sleep, 10
      Send, {Shift Up}
      Sleep, 10
    }
    if (isCheckReload
    && !isColorFromPixel(172, 724, "0xFF0000", 0)) { ;tac inv is gun jammed color: 0xFF0000
      if (testIsMessage(120, 30, 16, 16, "0xFFFFFF")) { ;merc speech
        playBeep(1, 2489, 80) ;INTERRUPTED
        callMapScreen()
        return
      }
    }
    Sleep, 10
  }
}

doTacStatPreDexMec(directionType) {
  coordX := 0, coordY := 0
  switch (directionType) {
    case NW:
      coordX := 510 - (20 * 1), coordY := 310 - (10 * 1)
    case NE:
      coordX := 510 + (20 * 1), coordY := 310 - (10 * 1)
    case SW:
      coordX := 510 - (20 * 1), coordY := 310 + (10 * 1)
    case SE:
      coordX := 510 + (20 * 1), coordY := 310 + (10 * 1)
    default:
  }
  callTacScreen()
  Send, {F1}
  Sleep, 50
  Send, {/}
  Sleep, 50
  MouseMove, 510, 310
  Sleep, 50
  clickMouse(510, 310, "Left", 50)
  Send, {l}
  Sleep, 50
  MouseMove, %coordX%, %coordY%
  Sleep, 50
  clickMouse(coordX, coordY, "Left", 50) ;look target tile
  Sleep, 50
  doTacToTacInv()
  Send, {x}
  Sleep, 1000
  Send, {Shift Down}
  Sleep, 50
  Send, {r}
  Sleep, 50
  Send, {Shift Up}
  Sleep, 50
  Send, {u}
  Sleep, 50
  MouseMove, %coordX%, %coordY%
  Sleep, 50
  loop {
    if (Mod(A_Index, 4) == 0) {
      callMapScreen()
      doMapSwapItem()
      playBeep(3, 7902, 80) ;SUCCEED
      break
    }
    clickMouseFast(%coordX%, %coordY%, "Left") ;attack between 1 tiles
    Sleep, 10
  }
}

doMapDropBackpack(backpackType, loopCnt) {
  MouseGetPos, coordX1, coordY1
  coordX2 := 0, coordY2 := 0
  switch (backpackType) {
    case COMBAT_PACK:
      coordX2 := 215, coordY2 := 375
    case BACKPACK:
      coordX2 := 195, coordY2 := 555
    default:
  }
  loop, % loopCnt {
    MouseMove, coordX1, coordY1
    Sleep, 50
    Send, {Ctrl Down}
    Send, {Shift Down}
    Sleep, 50
    clickMouse(coordX1, coordY1, "Left", 50)
    Sleep, 50
    Send, {Shift Up}
    Send, {Ctrl Up}
    Sleep, 100 ;delay
    Send, {Shift Down}
    Sleep, 50
    Send, {e}
    Sleep, 50
    Send, {Shift Up}
    Sleep, 100 ;delay
    MouseMove, coordX2, coordY2
    Sleep, 50
    Send, {Ctrl Down}
    Send, {Shift Down}
    Sleep, 50
    clickMouse(coordX2, coordY2, "Left", 50)
    Sleep, 50
    Send, {Shift Up}
    Send, {Ctrl Up}
    Sleep, 50
  }
  MouseMove, coordX1, coordY1
  Sleep, 50
  playBeep(3, 7902, 80) ;SUCCEED
}

doMapDropBackpack2(loopCnt) {
  ;goto last page
  loop, % loopCnt {
    Send, {.}
    Sleep, 50    
  }
  ;drop all
  Send, {Shift Down}
  Sleep, 50
  Send, {e}
  Sleep, 50
  Send, {Shift Up}
  Sleep, 100 ;delay
  isCombatPack := false
  isBackpack := false
  ;move combat pack
  if (isColorFromPixel(189, 381, "0xCEAE84", 0)) { ;map combat pack is item color: 0xCEAE84    
    isCombatPack := true
    coordX1 := 215, coordY1 := 375
    MouseMove, coordX1, coordY1
    Sleep, 50
    clickMouse(coordX1, coordY1, "Left", 50)
    Sleep, 50
    coordX3 := 965, coordY3 := 545
    MouseMove, coordX3, coordY3
    Sleep, 50
    clickMouse(coordX3, coordY3, "Left", 50)
    Sleep, 50
  }
  ;move backpack
  if (isColorFromPixel(168, 567, "0xCEAE84", 0)) { ;map backpack is item color: 0xCEAE84  
    isBackpack := true
    coordX2 := 195, coordY2 := 555
    MouseMove, coordX2, coordY2
    Sleep, 50
    clickMouse(coordX2, coordY2, "Left", 50)
    Sleep, 50
    coordX4 := coordX3, coordY4 := coordY3 + 30
    MouseMove, coordX4, coordY4
    Sleep, 50
    clickMouse(coordX4, coordY4, "Left", 50)
    Sleep, 50
  }  
  ;move vest
  if (isColorFromPixel(181, 284, "0xCEAE84", 0)) { ;map vest is item color: 0xCEAE84
    coordX5 := 205, coordY5 := 275
    MouseMove, coordX5, coordY5
    Sleep, 50
    Send, {Ctrl Down}
    Send, {Shift Down}
    Sleep, 50
    clickMouse(coordX5, coordY5, "Left", 50)
    Sleep, 50
    Send, {Shift Up}
    Send, {Ctrl Up}
    Sleep, 50
  } 
  ;drop righthand backpack
  if (isColorFromPixel(9, 214, "0xCEAE84", 0)) { ;map righthand is item color: 0xCEAE84      
    coordX6 := 45, coordY6 := 205
    MouseMove, coordX6, coordY6
    Sleep, 50
    clickMouse(coordX6, coordY6, "Left", 50)
    Sleep, 50
    MouseMove, coordX2, coordY2
    Sleep, 50
    clickMouse(coordX2, coordY2, "Left", 50)
    Sleep, 50
    Send, {Shift Down}
    Sleep, 50
    Send, {e}
    Sleep, 50
    Send, {Shift Up}
    Sleep, 100 ;delay  
    clickMouse(coordX2, coordY2, "Left", 50)
    Sleep, 50
    MouseMove, coordX6, coordY6
    Sleep, 50
    clickMouse(coordX6, coordY6, "Left", 50)
    Sleep, 50
  }
  ;drop lefthand backpack
  if (isColorFromPixel(9, 237, "0xCEAE84", 0)) { ;map lefthand is item color: 0xCEAE84      
    coordX7 := coordX6, coordY7 := coordY6 + 25
    MouseMove, coordX7, coordY7
    Sleep, 50
    clickMouse(coordX7, coordY7, "Left", 50)
    Sleep, 50
    MouseMove, coordX2, coordY2
    Sleep, 50
    clickMouse(coordX2, coordY2, "Left", 50)
    Sleep, 50
    Send, {Shift Down}
    Sleep, 50
    Send, {e}
    Sleep, 50
    Send, {Shift Up}
    Sleep, 100 ;delay    
    clickMouse(coordX2, coordY2, "Left", 50)
    Sleep, 50
    MouseMove, coordX7, coordY7
    Sleep, 50
    clickMouse(coordX7, coordY7, "Left", 50)
    Sleep, 50
  }
  ;move combat pack
  if (isCombatPack) {
    MouseMove, coordX3, coordY3
    Sleep, 50
    Send, {Ctrl Down}
    Send, {Shift Down}
    Sleep, 50
    clickMouse(coordX3, coordY3, "Left", 50)
    Sleep, 50
    Send, {Shift Up}
    Send, {Ctrl Up}
    Sleep, 50  
  }
  ;move backpack  
  if (isBackpack) {
    MouseMove, coordX4, coordY4
    Sleep, 50
    Send, {Ctrl Down}
    Send, {Shift Down}
    Sleep, 50
    clickMouse(coordX4, coordY4, "Left", 50)
    Sleep, 50
    Send, {Shift Up}
    Send, {Ctrl Up}
    Sleep, 50  
  }
  playBeep(3, 7902, 80) ;SUCCEED
}

doMapSwapItem() {
  Send, {Enter}
  Sleep, 50
  loop {
    if (isColorFromPixel(220, 178, "0x393021" , 0)) { ;is inv mode
      break
    }
    Sleep, 50
  }
  Sleep, 100 ;mode switching delay
  MouseMove, 37, 201
  Sleep, 50
  clickMouse(37, 201, "Left", 50)
  Sleep, 50
  MouseMove, 108, 275
  Sleep, 50
  clickMouse(108, 275, "Left", 50)
  Sleep, 50
  MouseMove, 37, 201
  Sleep, 50
  clickMouse(37, 201, "Left", 50)
  Sleep, 50
}

doMapDropItem(isOtherMerc) {
  Send, {Enter}
  Sleep, 50
  loop {
    if (isColorFromPixel(220, 178, "0x393021" , 0)) { ;is inv mode
      break
    }
    Sleep, 50
  }
  Sleep, 100 ;mode switching delay
  MouseMove, 37, 201
  Sleep, 50
  if (isOtherMerc) {
    clickMouse(37, 201, "Left", 50)
    Send, {Right} ;sort by assign
    Sleep, 50
    clickMouse(37, 229, "Left", 50)
    Send, {Ctrl Down}
    Sleep, 50
    Send, {Shift Down}
    Sleep, 50
    clickMouse(37, 229, "Left", 50)
    Send, {Shift Up}
    Sleep, 50
    Send, {Ctrl Up}
    Sleep, 50
  } else {
    Send, {Ctrl Down}
    Sleep, 50
    Send, {Shift Down}
    Sleep, 50
    clickMouse(37, 201, "Left", 50)
    Send, {Shift Up}
    Sleep, 50
    Send, {Ctrl Up}
  }
}

doTacStatDexMrk(directionType, minDurCoordY, isOnlyMarksmanship) {
  coordX := 0, coordY := 0
  switch (directionType) {
    case NW:
      coordX := 510 - (20 * 1), coordY := 310 - (10 * 1)
    case NE:
      coordX := 510 + (20 * 1), coordY := 310 - (10 * 1)
    case SW:
      coordX := 510 - (20 * 1), coordY := 310 + (10 * 1)
    case SE:
      coordX := 510 + (20 * 1), coordY := 310 + (10 * 1)
    default:
      MouseGetPos, coordX, coordY
  }
  successCnt := 0
  callTacScreen()
  Send, {F1}
  Sleep, 50
  Send, {/}
  Sleep, 50
  MouseMove, 510, 310
  Sleep, 50
  clickMouse(510, 310, "Left", 50)
  doTacToTacInv()
  Send, {s}
  Sleep, 50
  Send, {l}
  Sleep, 50
  MouseMove, %coordX%, %coordY%
  Sleep, 50
  clickMouse(coordX, coordY, "Left", 50) ;look target tile
  Sleep, 50
  loop {
    outerIndex := A_Index
    if (!isColorFromPixel(119, 735, "0xCEAE84", 0)) { ;no knife
      MouseMove, 510, 310
      Sleep, 10
      Send, {Ctrl Down}
      Send, {Shift Down}
      Sleep, 10
      loop {
        if (isColorFromPixel(510, 310, "0x420000", 0)) { ;red grab cursor
          break
        }
        Sleep, 10
      }
      clickMouse(510, 310, "Left", 10) ;get knife
      Sleep, 10
      Send, {Shift Up}
      Send, {Ctrl Up}
      Sleep, 10
    }
    loop {
      if (isColorFromPixel(119, 735, "0xCEAE84", 0)) { ;got knife
        break
      }
      Sleep, 10
    }
    if (isStatMaxCoord(163, 577 + (1 * 10), "0x00CF00") || isStatMaxCoord(163, 577 + (1 * 10), "0xD6CB9C")) { ;tac mrk stat color: 0xD6CB9C, now up: 0x00CF00
      if (isOnlyMarksmanship || isStatMaxCoord(116, 577 + (1 * 10), "0x00CF00") || isStatMaxCoord(116, 577 + (1 * 10), "0xD6CB9C")) { ;tac dex stat color: 0xD6CB9C, now up: 0x00CF00
        playBeep(3, 7902, 80) ;SUCCEED
        callMapScreen()
        if (successCnt > 0) {
          doMapSaveGame()
        }
        doMapDropItem(true)
        return
      }
    }
    ;tac is message color: 0x00CF00
    if (testIsMessage(3, 541, 16, 1, "0x00CF00")
    || testIsMessage(3, 556, 16, 1, "0x00CF00")) {
      playBeep(1, 2489, 80) ;INTERRUPTED
      callMapScreen()
      return
    }
    ;is battle interrupted
    if (isColorFromPixel(6, 6, "0x7B615A", 0)) { ;map screen
      playBeep(1, 2489, 80) ;INTERRUPTED
      return
    }
    if (isColorFromPixel(119, 725, "0x393829", 0)) { ;destructed
      successCnt := 0
      doTacLoadGame()
      continue
    } else if (isColorFromPixel(119, minDurCoordY, "0x000000", 0)) { ;tac inv primary item min durability
      playBeep(1, 2489, 80) ;INTERRUPTED
      if (successCnt > 0) {
        doTacSaveGame()
      }
      callMapScreen()
      doMapDropItem(true)
      return
    }
    if (isColorFromPixel(119, (minDurCoordY - 1), "0x000000", 0)) { ;tac inv primary item min - 1 durability
      if (successCnt > 0) {
        doTacSaveGame()
      }
    }
    successCnt += 1
    Sleep, 10
    MouseMove, %coordX%, %coordY%
    Sleep, 10
    Send, {u}
    Sleep, 10
    clickMouse(%coordX%, %coordY%, "Left", 10) ;attack target between 1 tiles
    Sleep, 10
    if (outerIndex == 1 && isColorFromPixel(465, 401, "0xFFFFFF", 0)) { ;attack dialog exist
      Send, {y}
      Sleep, 10
    }
    Sleep, 200
  }
}

doTacDrinkWater(regenPer, canteenCoordX, canteenCoordY) {
  maxY := getTacInvMaxEnergyCoordY()
  regenY := maxY
  parsedEnergySize := maxY - 573
  totalEnergySize := 43 - parsedEnergySize
  if (regenPer < 99) {
    regenY := 573 + parsedEnergySize + (totalEnergySize - 1) - Floor(totalEnergySize * regenPer / 100)
  }
  if (isColorFromPixel(71 + (1 * 6), regenY, "0x000000", 0)) { ;tac energy coord: 76, 653 ~ 70, 695, inv color: 0x2930F7, bg: 0x000000
    clickMouse(canteenCoordX, canteenCoordY, "Left", 1) ;get water
    loop, 5 {
      clickMouse(187, 658, "Left", 1) ;drink water
    }
    clickMouse(canteenCoordX, canteenCoordY, "Left", 1) ;set water
    loop {
      Send, {Ctrl Down}
      Sleep, 10
      Send, {.}
      Sleep, 10
      Send, {Ctrl Up}
      Sleep, 10
      if (isColorFromPixel(455, 343, "0xFFFFFF", 0)) { ;sector menu exist
        clickMouse(455, 343, "Left", 50) ;fill canteen
        break
      }
      Sleep, 10
    }
    loop {
      if (!isColorFromPixel(455, 343, "0xFFFFFF", 0)) { ;sector menu doesn't exist
        break
      }
      Sleep, 10
    }
  }
}

doTacStatWisExp(skipCheckAmount) {
  coordX1 := 510, coordY1 := 310
  coordX2 := coordX1 + 20, coordY2 := coordY1 - 10
  successCnt := 0
  callTacScreen()
  Send, {F1}
  Sleep, 50
  Send, {/}
  Sleep, 50
  MouseMove, 510, 310
  Sleep, 50
  clickMouse(510, 310, "Left", 50)
  doTacToTacInv()
  canteenCoord := StrSplit(getTacCanteenCoord(340, 575, 385, 155, "0x212008"), ",") ;canteen color: 0x212008
  Send, {s}
  Sleep, 50
  loop {
    outerIndex := A_index
    if (Mod(A_index, 100) == 0) {
      callMapScreen()
      callTacScreen()
      continue
    }
    if (isStatMaxCoord(116, 577 + (4 * 10), "0x00CF00") || isStatMaxCoord(116, 577 + (4 * 10), "0xD6CB9C")) { ;tac wis stat color: 0xD6CB9C, now up: 0x00CF00
      if (isStatMaxCoord(163, 577 + (3 * 10), "0x00CF00") || isStatMaxCoord(163, 577 + (3 * 10), "0xD6CB9C")) { ;tac exp stat color: 0xD6CB9C, now up: 0x00CF00
        playBeep(3, 7902, 80) ;SUCCEED
        callMapScreen()
        if (successCnt > 0 && successCnt < skipCheckAmount) {
          doMapSaveGame()
        }
        return
      }
    }
    ;tac is message color: 0x00CF00
    if (testIsMessage(3, 541, 16, 1, "0x00CF00")
    || testIsMessage(3, 556, 16, 1, "0x00CF00")) {
      playBeep(1, 2489, 80) ;INTERRUPTED
      callMapScreen()
      return
    }
    ;is battle interrupted
    if (isColorFromPixel(6, 6, "0x7B615A", 0)) { ;map screen
      playBeep(1, 2489, 80) ;INTERRUPTED
      return
    }
    doTacDrinkWater(50, canteenCoord[1], canteenCoord[2])
    MouseMove, coordX2, coordY2
    Sleep, 10
    Send, {r}
    Sleep, 10
    Send, {u}
    Sleep, 10
    Send, {Shift Down}
    Sleep, 10
    loop {
      if (isColorFromPixel(coordX2, coordY2, "0x101010", 0)
      || isColorFromPixel(coordX2, coordY2, "0x000008", 0)) { ;bomb cursor, hurl: 0x000008
        clickMouse(coordX2, coordY2, "Left", 10) ;plant bomb
        break
      }
      Sleep, 10
    }
    Send, {Shift Up}
    Sleep, 10
    loop {
      if (isColorFromPixel(451, 399, "0x000008", 0)) { ;remote detonator or detonator dialog exist
        Send, {4}
        Sleep, 10
        break
      }
      Sleep, 10
    }
    MouseMove, coordX2, coordY2
    Sleep, 10
    Send, {Ctrl Down}
    Send, {Shift Down}
    Sleep, 10
    loop {
      if (isColorFromPixel(coordX2, coordY2, "0x420000", 0)) { ;red grab cursor
        clickMouse(coordX2, coordY2, "Left", 10) ;disarm bomb
        break
      }
      Sleep, 10
    }
    Send, {Shift Up}
    Send, {Ctrl Up}
    Sleep, 10
    loop {
      if (isColorFromPixel(464, 400, "0x000008", 0)) { ;disarm dialog exist
        Send, {y}
        Sleep, 10
        break
      }
      Sleep, 10
    }
    MouseMove, coordX1, coordY1
    Sleep, 10
    Send, {r}
    Sleep, 10
    Send, {Shift Down}
    Sleep, 10
    clickMouse(coordX1, coordY1, "Left", 10) ;move before pos
    Send, {Shift Up}
    Sleep, 10
    if (successCnt < skipCheckAmount) {
      Send, {Pause}
      Sleep, 200 ;delay time when bomb explodes
      Send, {Pause}
      Sleep, 10
      if (isDamagedHLTCoord(71, 573, 43, "0xF7F310") || isColorFromPixel(71, 615, "0x000000", 0)) { ;damaged color: 0xF7F310, died color: 0x000000
        successCnt := 0
        doTacLoadGame()
      } else {
        successCnt += 1
        doTacSaveGame()
      }
    }
    Sleep, 10
  }
}

doTacLoadGame() {
  loop {
    Send, {Ctrl Down}
    Sleep, 50
    Send, {l}
    Sleep, 50
    Send, {Ctrl Up}
    Sleep, 50
    if (isColorFromPixel(446, 161, "0x291810", 0)) { ;load game dialog title
      break
    }
    Sleep, 50
  }
  Send, {Enter}
  Sleep, 5000 ;screen change delay
  loop {
    if (isColorFromPixel(6, 654, "0x735118", 0) || isColorFromPixel(9, 577, "0x6B4918", 0)) { ;tactical screen
      break
    }
    Sleep, 100 ;delay for crash
  }
  ;Send, {Pause}
  ;Sleep, 50
  ;Send, {Pause}
  ;Sleep, 50
}

doTacSaveGame() {
  Send, {/}
  Sleep, 50
  loop {
    Send, {Ctrl Down}
    Sleep, 50
    Send, {s}
    Sleep, 50
    Send, {Ctrl Up}
    Sleep, 50
    if (isColorFromPixel(446, 161, "0x9C7952", 0)) { ;save game dialog title
      break
    }
    Sleep, 50
  }
  Send, {Enter}
  Sleep, 50
  loop {
    if (isColorFromPixel(349, 352, "0x211010", 0)) { ;save game overwrite y/n
      break
    }
    Sleep, 50
  }
  Send, {y}
  Sleep, 50
  loop {
    if (!isColorFromPixel(446, 161, "0x9C7952", 0)) { ;no exist save game dialog title
      break
    }
    Sleep, 50
  }
  ;Send, {Pause}
  ;Sleep, 50
  ;Send, {Pause}
  ;Sleep, 50
}

isDamagedHLTCoord(startX, startY, length, color) {
  PixelSearch, foundX, foundY, startX, startY, startX + 1, startY + length, color, 0, Fast RGB
  result := ErrorLevel = 0 ? true : false
  message := "isDamagedHLTCoord() " (result ? "SUCCEED " foundX ", " foundY : "FAILED " startX ", " startY) " " color
  writeLogFile(INFO, A_ThisFunc, A_LineNumber, message)
  showToolTip(INFO, message)
  return result
}

isStatMaxCoord(startX, startY, color) {
  PixelSearch, foundX, foundY, startX, startY, startX + 1, startY + 1, color, 0, Fast RGB
  result := ErrorLevel = 0 ? true : false
  message := "isStatMaxCoord() " (result ? "SUCCEED " foundX ", " foundY : "FAILED " startX ", " startY) " " color
  writeLogFile(INFO, A_ThisFunc, A_LineNumber, message)
  showToolTip(INFO, message)
  return result
}

doMapLoadGame() {
  loop {
    Send, {Ctrl Down}
    Sleep, 50
    Send, {l}
    Sleep, 50
    Send, {Ctrl Up}
    Sleep, 50
    if (isColorFromPixel(444, 162, "0xA5864A", 0)) { ;load game dialog title
      break
    }
    Sleep, 50
  }
  Send, {Enter}
  Sleep, 5000 ;screen change delay
  loop {
    if (isColorFromPixel(252, 338, "0x523808", 0)) { ;map screen
      break
    }
    Sleep, 100 ;delay
  }
}

doMapSaveGame() {
  loop {
    Send, {Ctrl Down}
    Sleep, 50
    Send, {s}
    Sleep, 50
    Send, {Ctrl Up}
    Sleep, 50
    if (isColorFromPixel(444, 162, "0xA58652", 0)) { ;save game dialog title
      break
    }
    Sleep, 50
  }
  Send, {Enter}
  Sleep, 50
  loop {
    if (isColorFromPixel(349, 350, "0x181008", 0)) { ;save game overwrite y/n
      break
    }
    Sleep, 50
  }
  Send, {y}
  Sleep, 50
  loop {
    if (isColorFromPixel(252, 338, "0x523808", 0)) { ;map screen
      break
    }
    Sleep, 50
  }
}

doMapStatExp(skipCheckAmount) {
  MouseMove, 285, 25
  Sleep, 50
  clickMouse(285, 25, "Left", 50)
  successCnt := 0
  isDisarmMode := true
  loop {
    loop {
      if (isColorFromPixel(252, 338, "0x523808", 0)) { ;map screen
        break
      }
      Sleep, 50
    }
    Send, {Enter}
    Sleep, 50
    loop {
      if (isColorFromPixel(220, 178, "0x393021" , 0)) { ;is inv mode
        break
      }
      Sleep, 50
    }
    Sleep, 100 ;mode switching delay
    clickMouse(43, 206, "Right", 100) ;mode switching delay
    loop {
      if (isColorFromPixel(47, 199, "0xCEAE84", 0)) { ;tnt gear detail durability
        break
      }
      Sleep, 50
    }
    clickMouse(161, 208, "Left", 50)
    loop {
      if (isColorFromPixel(166, 207, "0xDED7DE", 0)) { ;bomb arm dialog exist
        break
      }
      Sleep, 50
    }
    loop {
      clickMouse(177, 217, "Left", 50)
      loop {
        if (isColorFromPixel(463, 367, "0x211010", 0)
        || isColorFromPixel(463, 367, "0x211008", 0)) { ;remote detonator or detonator dialog exist
          isDisarmMode := false
          Send, {4}
          Sleep, 50
          break
        }
        if (isColorFromPixel(463, 367, "0xFFFFFF", 0)) { ;detonator dialog exist
          isDisarmMode := true
          Send, {y}
          Sleep, 50
          break
        }
        Sleep, 50
      }
      Sleep, 100 ;delay time when bomb explodes
      if (isDamagedHLTCoord(67, 19, 43, "0xF7F310")) { ;damaged color: 0xF7F310)
        successCnt := 0
        doMapLoadGame()
        break
      } else {
        successCnt += 1
      }
      if (isStatMaxCoord(159, 24 + (3 * 10), "0x00CF00") || isStatMaxCoord(159, 24 + (3 * 10), "0xD6CB9C")) { ;map exp stat color: 0xD6CB9C, now up: 0x00CF00
        if (successCnt > 0 && isDisarmMode) {
          playBeep(3, 7902, 80) ;SUCCEED
          doMapSaveGame()
          return
        }
      }
      if (successCnt < skipCheckAmount) {
        doMapSaveGame()
        break
      }
      Sleep, 50
    }
    Sleep, 50
  }
}

clickMouse(coordX, coordY, mouseButton, delay) {
  Send, {Click, %coordX% %coordY% %mouseButton% Down}
  Sleep, 50
  Send, {Click, %coordX% %coordY% %mouseButton% Up}
  if (delay = "")
    return
  Sleep, %delay%
}

clickMouseFast(coordX, coordY, mouseButton) {
  Send, {Click, %coordX% %coordY% %mouseButton% Down}
  Sleep, 1
  Send, {Click, %coordX% %coordY% %mouseButton% Up}
  Sleep, 1
}
