#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%
/*
===============================================================================
Function:   wp_WinPreviouslyActive
    Get next window beneath the active one in the z-order.

Returns:
    Windowshandle

Author(s):
    Original - Lexikos - http://www.autohotkey.com/forum/topic21703.html
===============================================================================
*/
CoordMode,Screen
bbx:=30

ww_PlaceWindow(x_pos,y_pos,width,height){
	; global bbx ;to use a global variable inside a function keyword "global" should be used
	; MsgBox %bbx%
    WinGet, window, ID, A
    ; WinHide, ahk_id %window%
    WinRestore, ahk_id %window%
    WinMove, ahk_id %window%, ,x_pos, y_pos , width, height
    ; Winshow, ahk_id %window%
    return
}

; ^!8::wp_WinPreviouslyActive()

; wp_WinPreviouslyActive()
; {
	; place the active window
    ; ww_PlaceWindow(A_ScreenWidth/2+2,2,A_ScreenWidth/2-4, A_ScreenHeight)
    ww_PlaceWindow(A_ScreenWidth+2,2,A_ScreenWidth-4, A_ScreenHeight-bbx)

	; get the hwind (ahk_id) of the Active Window
    active := WinActive("A")

    WinGet, win, List

    ; Find the active window.
    ; (Might not be win1 if there are always-on-top windows?)
    Loop, %win%
        if (win%A_Index% = active)
    {
        if (A_Index < win)
            N := A_Index+1
        ; hack for PSPad: +1 seems to get the document (child!) window, so do +2
        ifWinActive, ahk_class TfPSPad
            N += 1
        break
    }

    ; Use WinExist to set Last Found Window (for consistency with WinActive())
    ; return WinExist("ahk_id " . win%N%)
    WinExist("ahk_id " . win%N%)
    WinActivate
    ; ww_PlaceWindow(2,2,A_ScreenWidth/2-4, A_ScreenHeight)
    ww_PlaceWindow(2,2,A_ScreenWidth/2-4, A_ScreenHeight-bbx)


    ; ----- ww: Uncomment the below section if you want to reactivate the previously active window
    ; WinExist("ahk_id " . win%active%)
    ; WinActivate, ahk_id %active%
; }