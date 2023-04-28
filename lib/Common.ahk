#include <Gdip_All>
#include <UwpOcr>

#SingleInstance force
#NoEnv
#MaxHotkeysPerInterval 99000000
#HotkeyInterval 99000000
#KeyHistory 0
#InstallKeybdHook
#InstallMouseHook
#UseHook

ListLines Off
Process, Priority, , A
SetTitleMatchMode, 2
SetTitleMatchMode, Fast
SetBatchLines, -1
SetKeyDelay, -1, -1, Play
SetMouseDelay, -1
SetDefaultMouseSpeed, 0
SetWinDelay, -1
SetControlDelay, -1
SendMode Input
CoordMode, Mouse, Client
CoordMode, Pixel, Client
CoordMode, ToolTip, Screen

FileEncoding, UTF-8

;-------------------------------------------------------------------------------
; global variables
;-------------------------------------------------------------------------------

global TRACE    := 1 ;log level
global DEBUG    := 2 ;log level
global INFO     := 3 ;log level
global WARN     := 4 ;log level
global ERROR    := 5 ;log level
global SEVERE   := 6 ;log level
global LOG_FILE := A_ScriptDir "\" SubStr(A_ScriptName, 1, -4) ".log" ;log file

global LOG_LEVEL := 5 ;current log level

global NW := 1 ;direction code
global NE := 2 ;direction code
global SW := 3 ;direction code
global SE := 4 ;direction code

global MAN_WOMAN := 1 ;leadership mantype
global BIG_MAN   := 2 ;leadership mantype

global COMBAT_PACK := 1 ;backpack type
global BACKPACK    := 2 ;backpack type

global DUR_56_COORD_Y := 723 ;item 56% durability
global DUR_51_COORD_Y := 724 ;item 51% durability
global DUR_46_COORD_Y := 725 ;item 46% durability

;-------------------------------------------------------------------------------
; screen functions
;-------------------------------------------------------------------------------

getTextUwpOcrFile(imageFile) {
  startTime := A_TickCount
  outText := ocrFile(imageFile, "en")
  endTime := A_TickCount - startTime
  message := "UwpOcr.ocr() " Round(endTime) "ms " outText
  writeLogFile(DEBUG, A_ThisFunc, A_LineNumber, message)
  showToolTip(DEBUG, message)
  return outText
}

getTextUwpOcrScreen(startX, startY, width, height) {
  startTime := A_TickCount
  hBitmap := HBitmapFromScreen(startX, startY, width, height)
  pIRandomAccessStream := HBitmapToRandomAccessStream(hBitmap)
  DllCall("DeleteObject", "Ptr", hBitmap)
  outText := ocrStream(pIRandomAccessStream, "en")
  endTime := A_TickCount - startTime
  message := "UwpOcr.ocr() " Round(endTime) "ms"
  writeLogFile(DEBUG, A_ThisFunc, A_LineNumber, message)
  showToolTip(DEBUG, message)
  return outText
}

setFileTesseract(imageFile, textFile) {
  textFileWithoutExt := SubStr(textFile, 1, -4)
  startTime := A_TickCount
  RunWait, %TESSERACT_FILE% "%imageFile%" "%textFileWithoutExt%" --tessdata-dir "%A_ProgramFiles%\Tesseract-OCR\tessdata" -l eng --psm 4--oem 3 "%TESSERACT_CFG_FILE%", , Hide
  endTime := A_TickCount - startTime
  message := "RunWait() Tesseract " Round(endTime) "ms"
  writeLogFile(DEBUG, A_ThisFunc, A_LineNumber, message)
  showToolTip(DEBUG, message)
}

setFileCapture2Text(imageFile, textFile) {
  startTime := A_TickCount
  RunWait, %CAPTURE2TEXT_FILE% --image "%imageFile%" --output-file "%textFile%" --line-breaks --scale-factor 3.5 --tess-config-file "%CAPTURE2TEXT_CFG_FILE%", , Hide
  endTime := A_TickCount - startTime
  message := "RunWait() Capture2Text " Round(endTime) "ms"
  writeLogFile(DEBUG, A_ThisFunc, A_LineNumber, message)
  showToolTip(DEBUG, message)
}

getClipboardCapture2Text(startX, startY, width, height) {
  endX := startX + width
  endY := startY + height
  startTime := A_TickCount
  RunWait, %CAPTURE2TEXT_FILE% --clipboard --screen-rect "%startX% %startY% %endX% %endY%" --line-breaks --scale-factor 3.5 --tess-config-file "%CAPTURE2TEXT_CFG_FILE%", , Hide
  endTime := A_TickCount - startTime
  message := "RunWait() Capture2Text " Round(endTime) "ms"
  writeLogFile(DEBUG, A_ThisFunc, A_LineNumber, message)
  message := "getClipboardCapture2Text() " clipboard " (" StrLen(clipboard) ")"
  writeLogFile(DEBUG, A_ThisFunc, A_LineNumber, message)
  showToolTip(DEBUG, message)
  return clipboard
}

getPixelColor(pixelX, pixelY) {
  if (pixelX = "") || (pixelY = "") {
    MouseGetPos, pixelX, pixelY
  }
  PixelGetColor, color, pixelX, pixelY, RGB
  message := "PixelGetColor() " (ErrorLevel = 0 ? "SUCCEED" : "FAILED ") " " pixelX ", " pixelY ", """ color """"
  clipboard := pixelX ", " pixelY ", """ color """"
  writeLogFile(INFO, A_ThisFunc, A_LineNumber, message)
  showToolTip(INFO, message)
  return color
}

isColorFromPixel(startX, startY, color, variation) {
  endX := startX
  endY := startY
  PixelSearch, foundX, foundY, startX, startY, endX, endY, color, variation, Fast RGB
  result := ErrorLevel = 0 ? true : false
  message := "PixelSearch() " (result ? "SUCCEED " foundX ", " foundY : "FAILED ") " " color
  writeLogFile(DEBUG, A_ThisFunc, A_LineNumber, message)
  showToolTip(WARN, message)
  if result
    return true
  else
    return false
}

;-------------------------------------------------------------------------------
; file functions
;-------------------------------------------------------------------------------

getTextFile(textFile) {
  FileRead, outText, %textFile%
  message := "FileRead() " (ErrorLevel = 0 ? "SUCCEED" : "FAILED ") " " textFile
  writeLogFile(INFO, A_ThisFunc, A_LineNumber, message)
  message := "getTextFile() " outText " (" StrLen(outText) ")"
  writeLogFile(DEBUG, A_ThisFunc, A_LineNumber, message)
  showToolTip(DEBUG, message)
  return outText
}

setTextFile(outText, textFile) {
  FileAppend, %outText%, %textFile%
  message := "FileAppend() " (ErrorLevel = 0 ? "SUCCEED" : "FAILED ") " " textFile
  writeLogFile(INFO, A_ThisFunc, A_LineNumber, message)
  message := "setTextFile() " outText " (" StrLen(outText) ")"
  writeLogFile(DEBUG, A_ThisFunc, A_LineNumber, message)
  showToolTip(DEBUG, message)
}

;-------------------------------------------------------------------------------
; common functions
;-------------------------------------------------------------------------------

runAsAdmin() {
  message := "A_IsAdmin " (A_IsAdmin = 1 ? "SUCCEED" : "FAILED ")
  writeLogFile(DEBUG, A_ThisFunc, A_LineNumber, message)
  showToolTip(DEBUG, message)
  if A_IsAdmin
    return
  Run *RunAs "%A_ScriptFullPath%"
  ExitApp
}

writeLogFile(level, functionName, lineNumber, message) {
  if (LOG_LEVEL > level)
    return
  ;write log file
  levelName := ""
  switch (level) {
    case TRACE:
      levelName := "TRACE"
    case DEBUG:
      levelName := "DEBUG"
    case INFO:
      levelName := "INFO "
    case WARN:
      levelName := "WARN "
    case ERROR:
      levelName := "ERROR"
    default:
  }
  FileAppend, % A_YYYY "-" A_MM  "-" A_DD " " A_Hour ":" A_Min ":" A_Sec "." A_MSec " " levelName " " A_ScriptName "." functionName "() Line " lineNumber " " message "`n", %LOG_FILE%
}

removeLogFile(thresholdSize) {
  FileGetSize, fileSize, %LOG_FILE%, K
  message := "FileGetSize() " (ErrorLevel = 0 ? "SUCCEED" : "FAILED ") " " fileSize "KB " LOG_FILE
  writeLogFile(DEBUG, A_ThisFunc, A_LineNumber, message)
  if (fileSize < thresholdSize)
    return
  FileDelete, %LOG_FILE%
  message := "FileDelete() " (ErrorLevel = 0 ? "SUCCEED" : "FAILED ") " " LOG_FILE
  writeLogFile(DEBUG, A_ThisFunc, A_LineNumber, message)
  showToolTip(DEBUG, message)
}

showToolTip(level, message) {
  if (LOG_LEVEL > level)
    return
  ToolTip, %message%, 5, 5
  SetTimer, removeTooltipTimer, -7000
}

removeTooltipTimer:
{
  ToolTip
  return
}

initHotkey(description) {
  if GetKeyState("Ctrl") {
    Send, {Ctrl Up}
    Sleep, 10
  }
  if GetKeyState("Alt") {
    Send, {Alt Up}
    Sleep, 10
  }
  if GetKeyState("Shift") {
    Send, {Shift Up}
    Sleep, 10
  }
  if GetKeyState("LButton") {
    Send, {LButton Up}
    Sleep, 10
  }
  if GetKeyState("RButton") {
    Send, {RButton Up}
    Sleep, 10
  }
  KeyWait, Ctrl
  KeyWait, Alt
  KeyWait, Shift
  Sleep, 10
  showToolTip(INFO, A_ScriptName "." description)
}

;playBeep(1, 7902, 80) ;SUCCEED
;playBeep(1, 2489, 80) ;FAILED
playBeep(times, freq, dur) {
  loop, % times {
    SoundBeep, freq, dur
    Sleep, 100
  }
}

;-------------------------------------------------------------------------------
; library functions
;-------------------------------------------------------------------------------

getMouseCursorRect(ByRef startX, ByRef startY, ByRef width, ByRef height) {
  ;Mask Screen
  Gui, Color, FFFFFF
  Gui +LastFound
  WinSet, Transparent, 50
  Gui, -Caption
  Gui, +AlwaysOnTop
  Gui, Show, x0 y0 h%A_ScreenHeight% w%A_ScreenWidth%, "AutoHotkeySnapshotApp"
  ;Drag Mouse
  CoordMode, Mouse, Screen
  WinGet, hw_frame_m, ID, "AutoHotkeySnapshotApp"
  hdc_frame_m := DllCall( "GetDC", "uint", hw_frame_m)
  KeyWait, LButton, D
  MouseGetPos, scanStartX, scanStartY
  Loop {
    Sleep, 10
    KeyIsDown := GetKeyState("LButton")
    if (KeyIsDown = 1) {
      MouseGetPos, scanX, scanY
      DllCall( "gdi32.dll\Rectangle", "uint", hdc_frame_m, "int", 0, "int", 0, "int", A_ScreenWidth, "int", A_ScreenWidth)
      DllCall( "gdi32.dll\Rectangle", "uint", hdc_frame_m, "int", scanStartX, "int", scanStartY, "int", scanX, "int", scanY)
    } else {
      break
    }
  }
  ;KeyWait, LButton, U
  MouseGetPos, scanEndX, scanEndY
  Gui Destroy
  if (scanStartX < scanEndX) {
    startX := scanStartX
    width := scanEndX - scanStartX
  } else {
    startX := scanEndX
    width := scanStartX - scanEndX
  }
  if (scanStartY < scanEndY) {
    startY := scanStartY
    height := scanEndY - scanStartY
  } else {
    startY := scanEndY
    height := scanStartY - scanEndY
  }
  CoordMode, Mouse, Client
  message := "getMouseCursorRect() " startX ", " startY ", " width ", " height
  writeLogFile(INFO, A_ThisFunc, A_LineNumber, message)
  showToolTip(DEBUG, message)
}

setCaptureImageFile(startX, startY, width, height, fileName) {
  startTime := A_TickCount
  pToken := Gdip_StartUp()
  pArg := startX . "|" . startY . "|" . width . "|" . height
  pBitmap := Gdip_BitmapFromScreen(pArg)
  Gdip_SaveBitmapToFile(pBitmap, fileName)
  Gdip_DisposeImage(pBitmap)
  Gdip_Shutdown(pToken)
  endTime := A_TickCount - startTime
  message := "Gdip_SaveBitmapToFile() " Round(endTime) "ms"
  writeLogFile(DEBUG, A_ThisFunc, A_LineNumber, message)
  message := "setCaptureImageFile() " (ErrorLevel = 0 ? "SUCCEED" : "FAILED ") " " startX ", " startY ", " width ", " height ", " fileName
  writeLogFile(INFO, A_ThisFunc, A_LineNumber, message)
  showToolTip(DEBUG, message)
}
