
#SingleInstance, Force
SetWorkingDir, %A_ScriptDir%

#Persistent
SetCapsLockState, AlwaysOff
SetScrollLockState, AlwaysOff

;---------------------------------------------------------------------------------------------------------
;###################################### Start Mouse movement        ######################################
;---------------------------------------------------------------------------------------------------------

SetBatchLines -1
#UseHook

MouseDelay = 0
Increment = 1

e::
d::
s::
f::
Rshift::

    xVal=
    yVal=
    If GetKeyState("capslock","p") = 1
    {
        IncrementValue := Increment
        Loop,
        {
            ; lower increment value higher startup speed. Lower increment slower acceleration
            If (A_Index > IncrementValue * 3) and (IncrementValue < Increment * 10 )
                IncrementValue := IncrementValue * 2
            If GetKeyState("d", "P")
                yVal := IncrementValue
            Else If GetKeyState("e", "P")
                yVal := -IncrementValue
            If !yVal
                yVal := 0

            If GetKeyState("s", "P")
                xVal := -IncrementValue
            Else If GetKeyState("f", "P")
                xVal := IncrementValue
            If !xVal
                xVal := 0
            If GetKeyState(A_ThisHotKey, "P")
                MouseMove, %xVal%, %yVal%,%MouseDelay%,R
            Else
                Break
        }
        send {capslock up}
    }
    Else
    Send % "{" . A_ThisHotKey . "}"
 Send {capslock up}
return

#If GetKeyState("capslock","P") = 1
;#############   Mouse buttons
t:: Send {RButton}

space::
    SENDINPUT {LBUTTON DOWN}
    keywait, space, u
    SENDINPUT {LButton UP}
Return
Insert:: Send {MButton}
#if



; ############ Mouse Scrolling
;
; #IfWinActive
; Capslock & q::
;     While GetKeyState("q", "P")
;     {
;         Send {Wheelup}
;         sleep 100
;     }
; return
;
; #IfWinActive
; capslock & a::
;     While GetKeyState("a", "P")
;     {
;         Send {WheelDown}
;         sleep 100
;     }
; ; return
; #if


#If GetKeyState("Rshift","P") = 1
    CoordMode, Screen
e::MouseMove, 0, -A_ScreenHeight*1/150 ,0, R
d::MouseMove, 0, A_ScreenHeight*1/150 ,0, R
f::MouseMove, A_ScreenWidth*1/150, 0 ,0, R
s::MouseMove, -A_ScreenWidth*1/150, 0 ,0, R
#if


; Mouse buttons and wheels
;capslock & LButton::SendInput, {blind}{lbutton}    ;conflicts with screen drag
XButton2::send {Enter}
XButton1::send {DELETE}
WheelLeft::send ^c
WheelRight::send ^v

;---------------------------------------------------------------------------------------------------------
;###################################### End Mouse movement        ######################################
;---------------------------------------------------------------------------------------------------------

;---------------------------------------------------------------------------------------------------------
;###################################### Other generic mouse       ######################################
;---------------------------------------------------------------------------------------------------------

;--------------------------------------------  additional mouse buttons

; ---------------------------------------------- Excel area -------------------------------------------------------------

#IfWinActive ahk_class XLMAIN
    WheelLeft::sendinput, !{PgUp}
    WheelRight::sendinput, !{PgDn}
    capslock & 2::sendinput {F2}
    ;   Capslock & d::sendinput, ^{down}+^{up}^c
    capslock & [::sendinput ^[
    capslock & ]::sendinput {F5}{Enter}

#IfWinActive

#Capslock::
    If GetKeyState("CapsLock", "T") = 1
        SetCapsLockState, AlwaysOff
    Else
        SetCapsLockState, AlwaysOn
Return

!+q::SendInput !{F4}

Capslock & q::sendinput {Esc}
;Capslock & w::sendinput copy cut
;Capslock & e::mouse up
capslock & r:: SendInput ^y
;Capslock & t::right click
Capslock & y::SendInput {Blind}{Home}
; Capslock & u:: Sendinput {blind}{PgUp}
Capslock & i::SendInput {Blind}{Up}
; Capslock & o:: sendinput {blind}{pgdn}
Capslock & p::SendInput {Blind}{End}
Capslock & [::SendInput {
Capslock & ]::SendInput }
Capslock & \::SendInput |

Capslock & a:: sendInput {lbutton}
;Capslock & s:: mouse left
;Capslock & d:: mouse down
;Capslock & f:: Mouse right
;Capslock  g:: select line /cut
Capslock & h::SendInput {Blind}^{Left}
Capslock & j::SendInput {Blind}{Left}
Capslock & k::SendInput {Blind}{Down}
Capslock & l::SendInput {Blind}{Right}
Capslock & SC027::SendInput {Blind}^{right}

Capslock & z::SendInput ^z
; Capslock & x::SendInput Save/ Save As
; Capslock & c:: -------------------------- vacant
Capslock & v::SendInput ^v
Capslock & b::SendInput {Blind}^{BS}
Capslock & n::SendInput {Blind}{BS}
Capslock & m::SendInput {Blind}{BS}
Capslock & ,::SendInput {Blind}{Del}
Capslock & .::SendInput {Blind}^{Del}
Capslock & /::SendInput ^f

; <!capslock::AltTab
; Capslock & Space::SendInput {Blind}{Control Down}
; Capslock & Space Up::SendInput {Blind}{Control Up}

Capslock & alt::SendInput {Blind}{Control Down}
Capslock & alt Up::SendInput {Blind}{Control Up}




Capslock & Tab::SendInput {Blind}{shift Down}
Capslock & Tab up::SendInput {Blind}{shift up}
Capslock & BS::SendInput {Blind}^{BS}

Capslock & F1:: sendinput {AppsKey}
; Capslock & F2::
; capslock & F3:: --------------
; Capslock & F4:: --------------
; Capslock & F5:: --------------
; capslock & F6:: --------------
; Capslock & F7:: --------------
; Capslock & F8:: --------------
; capslock & F9:: --------------
; capslock & F10:: --------------
; capslock & F11:: --------------
; capslock & F12::--------------

Capslock & 1:: !
Capslock & 2:: @
capslock & 3:: #
Capslock & 4:: $
Capslock & 5:: SendRaw, `%
capslock & 6:: ^
Capslock & 7:: &
Capslock & 8:: *
capslock & 9:: (
capslock & 0:: )
capslock & -:: _
capslock & =:: +

;---------------------------- select & copy or select & cut word/line

Capslock & g::
    keywait,g
    keywait, g, d ,t 0.2
    if errorlevel
        Sendinput, {Home}+{End}^c
    else
        Sendinput, {Home}+{End}^x
return

; ---------------------------- Copy cut selection
Capslock & w::
    keywait,w
    keywait, w, d ,t 0.15
    if errorlevel
        Sendinput, ^c
    else
        Sendinput, ^x
return

;----------------------------


#IfWinActive
Capslock & u::
    While GetKeyState("u", "P")
    {
        Send {Wheelup}
        sleep 100
    }
return


#IfWinActive
Capslock & o::
    While GetKeyState("o", "P")
    {
        Send {WheelDown}
        sleep 100
    }
return


;--------------------------------------------------------------------
Capslock & x::
        keywait, x
        keywait, x, d ,t 0.2
        if errorlevel
        {
            SendInput ^s     ; save
        }
        else
        {
            IfWinActive, ahk_class XLMAIN
            {
                SendInput {f12} ; save as in excel
                return
            }
            SendInput ^+s  ; save as
        }
        return

;brakets opening closing --------------------------------------------

; alt key mappings----------------------------------------------------
; !c::sendinput ^c
; !v::sendinput ^v

;-----------------------Num lock keys -----------------------------
; +^!Space:: SendInput {Numpad0}
; +^!m:: SendInput {Numpad1}
; +^!,:: SendInput {Numpad2}
; +^!.:: SendInput {Numpad3}
; +^!j:: SendInput {Numpad4}
; +^!k:: SendInput {Numpad5}
; +^!l:: SendInput {Numpad6}
; +^!u:: SendInput {Numpad7}
; +^!i:: SendInput {Numpad8}
; +^!o:: SendInput {Numpad9}

;----------------------- lock keys -----------------------------

;---------------------------------------------------------------------------------------------------------
;###################################### end hotkey area        ######################################
;---------------------------------------------------------------------------------------------------------

;---------------------------------------------------------------------------------------------------------
;######################################    Start Shortcuts    #####################################
;---------------------------------------------------------------------------------------------------------

#y::
    InputBox, Search, Google Search, , , 400, 100
    if not ErrorLevel ; when cancel is not pressed
    {
        run C:\Program Files (x86)\Google\Chrome\Application\chrome.exe https://www.youtube.com/results?search_query="%Search%"
    }
return

#+y::
    OldClipboard:= Clipboard
    Clipboard:= ""
    Send, ^c ;copies selected text
    ClipWait, 1
    Run C:\Program Files (x86)\Google\Chrome\Application\chrome.exe https://www.youtube.com/results?search_query="%clipboard%"
    Sleep 200
    Clipboard:= OldClipboard
    Send, ^c ;copies selected text
Return

#s::
    InputBox, Search, Google Search, , , 400, 100
    if not ErrorLevel ; when cancel is not pressed
    {
        run C:\Program Files (x86)\Google\Chrome\Application\chrome.exe http://www.google.com/search?q="%Search%"&num=100&source=lnms&filter=0
    }
return

#^s::
    OldClipboard:= Clipboard
    Clipboard:= ""
    Sendinput, ^c ;copies selected text
    ClipWait, 1
    Run C:\Program Files (x86)\Google\Chrome\Application\chrome.exe http://www.google.com/search?q="%Clipboard%"&num=100&source=lnms&filter=0
    Sleep 200
    Clipboard:= OldClipboard
    OldClipboard:=""
    ;    MsgBox %OldClipboard%
    Send, ^c ;copies selected text
Return

#x:: Run Excel
;---------------------------------------------------------------------------------------------------------
;######################################    End Shortcuts    #####################################
;---------------------------------------------------------------------------------------------------------

;---------------------------------------------------------------------------------------------------------
;########################## Start Drag Windows ##################################################################
;---------------------------------------------------------------------------------------------------------
; Drag windows anywhere

Capslock & LButton::
    CoordMode, Mouse ; Switch to screen/absolute coordinates.
    MouseGetPos, EWD_MouseStartX, EWD_MouseStartY, EWD_MouseWin
    WinGetPos, EWD_OriginalPosX, EWD_OriginalPosY,,, ahk_id %EWD_MouseWin%
    WinGet, EWD_WinState, MinMax, ahk_id %EWD_MouseWin%
    if EWD_WinState = 0 ; Only if the window isn't maximized
        SetTimer, EWD_WatchMouse, 10 ; Track the mouse as the user drags it.
return

EWD_WatchMouse:
    GetKeyState, EWD_LButtonState, LButton, P
    if EWD_LButtonState = U ; Button has been released, so drag is complete.
    {
        SetTimer, EWD_WatchMouse, off
        return
    }
    GetKeyState, EWD_EscapeState, Escape, P
    if EWD_EscapeState = D ; Escape has been pressed, so drag is cancelled.
    {
        SetTimer, EWD_WatchMouse, off
        WinMove, ahk_id %EWD_MouseWin%,, %EWD_OriginalPosX%, %EWD_OriginalPosY%
        return
    }
    ; Otherwise, reposition the window to match the change in mouse coordinates
    ; caused by the user having dragged the mouse:
    CoordMode, Mouse
    MouseGetPos, EWD_MouseX, EWD_MouseY
    WinGetPos, EWD_WinX, EWD_WinY,,, ahk_id %EWD_MouseWin%
    SetWinDelay, -1 ; Makes the below move faster/smoother.
    WinMove, ahk_id %EWD_MouseWin%,, EWD_WinX + EWD_MouseX - EWD_MouseStartX, EWD_WinY + EWD_MouseY - EWD_MouseStartY
    WinActivate, ahk_id %EWD_MouseWin%
    EWD_MouseStartX := EWD_MouseX ; Update for the next timer-call to this subroutine.
    EWD_MouseStartY := EWD_MouseY ;bring the window to the front(foreground)
return

;---------------------------------------------------------------------------------------------------------
;########################## End Drag Windows ##################################################################
;---------------------------------------------------------------------------------------------------------

;---------------------------------------------------------------------------------------------------------
;######################### A window always on top with ctrl+F12 #############################################
;---------------------------------------------------------------------------------------------------------
^F12:: Winset, Alwaysontop, , A
;---------------------------------------------------------------------------------------------------------
;######################### End screen clipping always on top #############################################
;---------------------------------------------------------------------------------------------------------

;---------------------------------------------------------------------------------------------------------
;######################### Quickly gather text to a notepad #############################################
;---------------------------------------------------------------------------------------------------------
; Copying text to Notepad for future reference
^!c::
    OldClipboard := ClipboardAll
    Clipboard = ;clears the Clipboard
    Send, ^c
    ClipWait 0 ;pause for Clipboard data
    If ErrorLevel
    {
        MsgBox, No text selected!
    }

    IfWinNotExist, Untitled - Notepad
    {
        Run, Notepad
        WinWaitActive, Untitled - Notepad
    }

    ; Control, EditPaste used rather than ControlSend for much greater speed of execution

    Control, EditPaste, % Clipboard . chr(13) . chr(10) . chr(13) . chr(10) , , Untitled - Notepad
    Clipboard := OldClipboard
Return

;---------------------------------------------------------------------------------------------------------
;######################### End quickly gather text to a notepad #############################################
;---------------------------------------------------------------------------------------------------------

>!q::Suspend

>^q::
    MsgBox Exiting the script Y
ExitApp