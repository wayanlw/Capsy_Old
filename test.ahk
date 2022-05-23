#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

SysGet, MonCount, MonitorCount
SysGet, MonitorPrimary, MonitorPrimary
!j::MsgBox, Monitor Count:`t%MonCount%`nPrimary Monitor:`t%MonitorPrimary%

taskbar_height:=30
#!Space::CenterActiveWindow()    ; Win+Alt+Space

CenterActiveWindow()
{
    winHandle := WinExist("A")

    VarSetCapacity(monitorInfo, 40)
    NumPut(40, monitorInfo)

    monitorHandle := DllCall("MonitorFromWindow", "uint", winHandle, "uint", 0x2)
    DllCall("GetMonitorInfo", "uint", monitorHandle, "uint", &monitorInfo)

    A_Left   := NumGet(monitorInfo, 20, "Int")
    A_Top    := NumGet(monitorInfo, 24, "Int")
    A_Right  := NumGet(monitorInfo, 28, "Int")
    A_Bottom := NumGet(monitorInfo, 32, "Int")

    WinGetPos,,, Width, Height, ahk_id %winHandle%
    winX := A_Left + (A_Right - A_Left - Width) / 2
    winY := A_Top + (A_Bottom - A_Top - Height) / 2

    WinMove, A,, winX, winY
}

ww_PlaceWindow(x_pos,y_pos,width,height){
	global taskbar_height ; to use a global variable inside a function keyword "global" should be used
    WinGet, window, ID, A
    ; WinHide, ahk_id %window%
    WinRestore, ahk_id %window%
    WinMove, ahk_id %window%, ,x_pos, y_pos , width, height-taskbar_height
    ; Winshow, ahk_id %window%
	return
}


AltTab(){
  	active := WinActive("A")
	WinGetActiveTitle, activetitle
    WinGet, win, List

    ; Find the active window.
    ; (Might not be win1 if there are always-on-top windows?)
    Loop, %win%
        if (win%A_Index% = active)
    {
        if (A_Index < win)
            N := A_Index+1
        ; hack for PSPad: +1 seems to get the document (child!) window, so do +2
		WinGetTitle, x, "ahk_id ".win%N%
		; if (x="")
        ;     N += 1
			; MsgBox, blank
        ifWinActive, ahk_class TfPSPad
            N += 1
        break
    }

    ; Use WinExist to set Last Found Window (for consistency with WinActive())
    ; return WinExist("ahk_id " . win%N%)
    WinExist("ahk_id " . win%N%)
	WinActivate
	WinGetActiveTitle, x

}

; altertab()
; {
; 	send, {AltDown}{Tab}{AltUp}
; 	Sleep, 100
; 	ww_PlaceWindow(width/2+2,2,height/2-4, height)
; 	Sleep, 100
; 	send, {AltDown}{Tab}{AltUp}
; 	Sleep, 100
; 	ww_PlaceWindow(2,2,width/2-4, height)
; }

^8::alttab()