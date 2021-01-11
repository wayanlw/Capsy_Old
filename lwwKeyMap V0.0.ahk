/* -------------------------------------------------------------------------- */
/*                                  Version 0                                 */
/* -------------------------------------------------------------------------- */
*/






#SingleInstance, Force

#Persistent
SetCapsLockState, AlwaysOff
SetScrollLockState, AlwaysOff

SetBatchLines -1 
#UseHook 

MouseDelay = 0 
Increment = 1 

e:: 
d:: 
s::
f:: 
rshift:: 
    xVal=
    yVal=
    If GetKeyState("RShift","p") = 1
    { 
        IncrementValue := Increment 
        Loop, 
        { 
            ; lower increment value higher startup speed. Lower increment slower acceleration
            If (A_Index > IncrementValue * 8) and (IncrementValue < Increment * 10 ) 
                IncrementValue := IncrementValue * 3 
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
        send {RShift up}
    }
    else
    { 
        Send % "{" . A_ThisHotKey . "}" 
        Send, {RSHIFT up}
        ; Send, {RALT up}
    }
return 

#If GetKeyState("rShift","P") = 1

/* --------------------------- Mouse Button Clicks -------------------------- 
*/

l:: Send {RButton} 
Insert:: Send {MButton} 
':: senDinput ^{LButton} 

SC027::
    SENDINPUT {LBUTTON DOWN}
    keywait, SC027, u 
    SENDINPUT {LButton UP}
Return

space::
    SENDINPUT {LBUTTON DOWN}
    keywait, space, u 
    SENDINPUT {LButton UP}
Return

/* --------------------------- scroll up and down --------------------------- 
*/

r::
    While GetKeyState("r", "P")
    {
        Send {Wheelup}
        sleep 100
    }
return

w::
    While GetKeyState("w", "P")
    {
        Send {WheelDown}
        sleep 100
    }
return

/* -------------------- move the mouse cursor to corners -------------------- 
*/

CoordMode,Screen
q::MouseMove, (A_ScreenWidth / 6 ), (A_ScreenHeight / 6 )
t::MouseMove, (A_ScreenWidth / 6 * 5), (A_ScreenHeight / 6 * 1)
a::MouseMove, (A_ScreenWidth / 6 * 1), (A_ScreenHeight / 6 * 3)
c::MouseMove, (A_ScreenWidth / 2), (A_ScreenHeight / 2)
g::MouseMove, (A_ScreenWidth / 6 * 5), (A_ScreenHeight / 6 * 3)
z::MouseMove, (A_ScreenWidth / 6 * 1), (A_ScreenHeight / 6 * 5)
b::MouseMove, (A_ScreenWidth / 6 * 5), (A_ScreenHeight / 6 * 5)

#if


/* --------------------- Real Mouse: buttons and wheels --------------------- 
*/

XButton2::send {Enter}
XButton1::send {Delete}
WheelLeft::WheelLeft
WheelRight::WheelRight





/* ------------------------------- Excel area ------------------------------- 
*/

#IfWinActive ahk_class XLMAIN
    WheelLeft::sendinput, !{PgUp}
    WheelRight::sendinput, !{PgDn}

    ;---------------- dependants -------------
    capslock & 1::sendinput ^[ 
    capslock & 2::sendinput {F5}{Enter}
    capslock & 3::sendinput {F2}
    capslock & 4::sendinput {+}
    capslock & 5::sendinput {F9}

    ;-----------------pasting ----------------
    ^!v::sendinput ^!v{v}{enter}
    ^!f::sendinput ^!v{f}{enter}
    ^!t::sendinput ^!v{t}{enter}
    ^!z::sendinput ^!v{l}

    ;-----------------------------------------
    Capslock & u::Sendinput ^{up}
    Capslock & o::Sendinput ^{Down}

    ;-----------------------------------------
    Capslock & [::Sendinput ^{pgup}
    Capslock & ]::Sendinput ^{pgDn}

    ;-----------------------------------------
    Capslock & b::Sendinput ^d
    Capslock & t::Sendinput ^r
    ; Capslock & g::SendInput {Blind}{Control Down}{Shift Down}
    ; Capslock & g up::SendInput {Blind}{Control up}{Shift up}
    Capslock & g::Sendinput {=}

    ;-----------------------------------------
    capslock & F1::sendinput {-}
    capslock & F2::sendinput {+} 
    capslock & F3::sendinput {*}
    capslock & F4::sendinput {/}

#IfWinActive



/* -------------------- Toggle CapsLock with the win key -------------------- 
*/

#Capslock::
    If GetKeyState("CapsLock", "T") = 1
        SetCapsLockState, AlwaysOff
    Else
        SetCapsLockState, AlwaysOn
Return



/* -------------------------------- Main Keys ------------------------------- 
*/

Capslock & q::Sendinput {Esc}
;Capslock & w::Launcher
Capslock & e::Sendinput ^z ; This has repetitive press. Sould be a comfortable place. 
Capslock & r::SendInput ^y ; redo
;capslock & t:: Cut copy word
Capslock & y::SendInput {Blind}{Home}
Capslock & u::SendInput {Blind}{pgUp}
Capslock & i::SendInput {Blind}{Up}
Capslock & o::SendInput {Blind}{pgDn}
Capslock & p::SendInput {Blind}{End}
Capslock & [::SendInput {
Capslock & ]::SendInput }
Capslock & \::SendInput |

;Capslock & a:: save and save as
Capslock & s:: SendInput ^x
Capslock & d:: sendinput ^c ;Copy and double click to cut
Capslock & f:: SendInput ^v
;Capslock & g:: selecet & copy / delete line
Capslock & h::SendInput {Blind}^{Left}
Capslock & j::SendInput {Blind}{Left}
Capslock & k::SendInput {Blind}{Down}
Capslock & l::SendInput {Blind}{Right}
Capslock & SC027::SendInput {Blind}^{right}
Capslock & '::SendInput {Blind}{Enter}

Capslock & x::SendInput {Enter}
;Capslock & c::copy/cut all
Capslock & v:: Sendinput {Delete}
Capslock & b:: SendInput {Blind}{BS}
Capslock & n::SendInput {Blind}{BS}
Capslock & m::SendInput {Blind}^{BS}
Capslock & ,:: Sendinput {Delete}
Capslock & .:: Sendinput ^{Delete}
Capslock & /::SendInput ^f

/* ------------------------------ Special Keys ------------------------------ 
*/

capslock & alt::SendInput {Blind}{Alt}

Capslock & Space::SendInput {Blind}{Control Down}
Capslock & Space Up::SendInput {Blind}{Control Up}

Capslock & Tab::SendInput {Blind}{shift Down}
Capslock & Tab up::SendInput {Blind}{shift up}

Capslock & BS::SendInput {Blind}{BS}

!+q::SendInput !{F4} 
!q::Sendinput ^w


/* --------------------------------- F keys --------------------------------- 
*/

Capslock & F1:: sendinput {AppsKey}
; Capslock & F2:: --------------
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

/* ------------------------------- Number keys ------------------------------ 
*/

Capslock & 1:: !
Capslock & 2:: sendinput {F2}
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




/* ---------------------------- Special Functions --------------------------- 
*/

Capslock & z::AltTab


/* ----------------------------- word copy , cut ---------------------------- 
*/

Capslock & t::
    keywait,t
    keywait, t, d ,t 0.2
    if errorlevel 
        sendinput, ^{Left}+^{Right}^c 
    else
        Send, ^{right}+^{left}^x 
return

/* --------------------------- Line copy , delete --------------------------- 
*/

Capslock & g::
    keywait,g
    keywait, g, d ,t 0.2
    if errorlevel 
        Sendinput, {Home}+{End}^c
    else
        Sendinput, {Home}+{End}{del}
return

/* ----------------------------- All copy delete ---------------------------- 
*/

Capslock & c::
    keywait,c
    keywait, c, d ,t 0.1
    if errorlevel 
        Sendinput, ^a^c
    else
        Sendinput, ^a{del}
return

/* ---------------------------- Save and save as ---------------------------- 
*/

Capslock & a::
    keywait, a
    keywait, a, d ,t 0.2
    if errorlevel
    {
        SendInput ^s ; save
    }
    else
    {
        IfWinActive, ahk_class XLMAIN
        {
            SendInput {f12} ; save as in excel
            return
        }
        SendInput ^+s ; save as
    }
return



/* ------------------------------ Num lock keys ----------------------------- 
*/

+^!Space:: SendInput {Numpad0}
+^!m:: SendInput {Numpad1}
+^!,:: SendInput {Numpad2}
+^!.:: SendInput {Numpad3}
+^!j:: SendInput {Numpad4}
+^!k:: SendInput {Numpad5}
+^!l:: SendInput {Numpad6}
+^!u:: SendInput {Numpad7}
+^!i:: SendInput {Numpad8}
+^!o:: SendInput {Numpad9}



/* -------------------------------------------------------------------------- */
/*                                  Launcher                                  */
/* -------------------------------------------------------------------------- */
*/

Capslock & w::
    
    Input Key, L2 T2 ; L3 to limit the input to 3 eys. T5 , wait for 5 seconds
    ;----------------------Delete Line word all
    if Key=fa
    {
        sendinput ^a{delete}
        return
    }
    else if key=fw
    {
        sendinput, ^{right}+^{left}{delete}
        return
    }
    else if key=fv
    {
        sendinput, {Home}+{End}{delete}
        return
    }
    else if key=fs
    {
        sendinput, +{Home}{delete}
        return
    }
    else if key=fe
    {
        sendinput, +{End}{delete}
        return
    }
    ;-----------------------copy commands
    else if key=da
    {
        sendinput, ^a^c
        return
    }

    else if key=dw
    {
        sendinput, ^{right}+^{left}^c
        return
    }
    else if key=dd
    {
        sendinput, {Home}+{End}^c
        return
    }
    else if key=ds
    {
        sendinput, +{Home}^c
        return
    }else if key=de
    {
        sendinput, +{End}^c
        return
    }
    ;----------------------- cut commands 

    else if key=va
    {
        sendinput, ^a^x
        return
    }
    else if key=vw
    {
        sendinput, ^{right}+^{left}^x
        return
    }
    else if key=vx
    {
        sendinput, {Home}+{End}^x
        return
    }
    else if key=vs
    {
        sendinput, +{Home}^x
        return
    }else if key=ve
    {
        sendinput, +{End}^x
        return
    }
    ;----------------------- Select commands
    else if key=sa
    {
        sendinput, ^a
        return
    }

    else if key=sw
    {
        sendinput, ^{right}+^{left}
        return
    }

    ; --------------------- Excel delete row delete column
    else if key=dr
    {
        sendinput, +{space}^{-}
        return
    }

    else if key=dc
    {
        sendinput, ^{space}^{-}
        return
    }

    ;-------------------------  (L)aunching apps 

    else if key=lc
    {
        run chrome.exe
    }
    else if key=lx
    {
        run excel
    }
return


/* -------------------------------------------------------------------------- */
/*                             Search Functions                               */
/* -------------------------------------------------------------------------- */
*/


/* ------------------------------ Youtube Search ----------------------------- 
*/

#y::
    InputBox, Search, Youtube Search, , , 400, 100
    if not ErrorLevel ; when cancel is not pressed
    {
        ; run C:\Program Files (x86)\Google\Chrome\Application\chrome.exe https://www.youtube.com/results?search_query="%Search%"
        run https://www.youtube.com/results?search_query=%Search%
    }
return

/* ---------------------- Youtube Search Selected Words --------------------- 
*/

#^y::
    OldClipboard:= Clipboard
    Clipboard:= ""
    Send, ^c ;copies selected text
    ClipWait, 1
    
    ; Run C:\Program Files (x86)\Google\Chrome\Application\chrome.exe https://www.youtube.com/results?search_query="%clipboard%"
    Run https://www.youtube.com/results?search_query=%clipboard%
    Sleep 200
    Clipboard:= OldClipboard
    Send, ^c ;copies selected text
Return


/* ------------------------------ Google Search ----------------------------- 
*/

#s::
    InputBox, Search, Google Search, , , 400, 100
    if not ErrorLevel ; when cancel is not pressed
    {
        ; run C:\Program Files (x86)\Google\Chrome\Application\chrome.exe http://www.google.com/search?q=%Search%&num=100&source=lnms&filter=0
        run http://www.google.com/search?q=%Search%&num=100&source=lnms&filter=0
    }
return

/* ----------------------- Google Search Selected Word ---------------------- 
*/

#^s::
    OldClipboard:= Clipboard
    Clipboard:= ""
    Sendinput, ^c ;copies selected text
    ClipWait, 1
    ; Run C:\Program Files (x86)\Google\Chrome\Application\chrome.exe http://www.google.com/search?q=%Clipboard%&num=100&source=lnms&filter=0
    Run http://www.google.com/search?q=%Clipboard%&num=100&source=lnms&filter=0
    Sleep 200
    Clipboard:= OldClipboard
    OldClipboard:=""
    ;    MsgBox %OldClipboard%
    Send, ^c ;copies selected text
Return

/* -------------------------- Window always on top -------------------------- 
*/

^F12:: Winset, Alwaysontop, , A


/* -------------------------------------------------------------------------- */
/*               Drag Windows with CapsLock + Right Mouse Button              */
/* -------------------------------------------------------------------------- */
*/

Capslock & RButton::
    CoordMode, Mouse ; Switch to screen/absolute coordinates.
    MouseGetPos, EWD_MouseStartX, EWD_MouseStartY, EWD_MouseWin
    WinGetPos, EWD_OriginalPosX, EWD_OriginalPosY,,, ahk_id %EWD_MouseWin%
    WinGet, EWD_WinState, MinMax, ahk_id %EWD_MouseWin% 
    if EWD_WinState = 0 ; Only if the window isn't maximized 
        SetTimer, EWD_WatchMouse, 10 ; Track the mouse as the user drags it.
return

EWD_WatchMouse:
    GetKeyState, EWD_LButtonState, RButton, P
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



/* -------------------------------------------------------------------------- */
/*                           Gather text to notepad                           */
/* -------------------------------------------------------------------------- */
*/


^!c::
    OldClipboard := ClipboardAll
    Clipboard = ;clears the Clipboard
    Send, ^c
    ClipWait 0 ;pause for Clipboard data
    If ErrorLevel
    {
        MsgBox, No text selected!
    }

    IfWinNotExist, *Untitled - Notepad
    {
        Run, Notepad
        WinWaitActive, Untitled - Notepad
        Control, EditPaste, % Clipboard . chr(13) . chr(10) . chr(13) . chr(10) , , Untitled - Notepad
        return
    }

    ; Control, EditPaste used rather than ControlSend for much greater speed of execution

    Control, EditPaste, % Clipboard . chr(13) . chr(10) . chr(13) . chr(10) , , *Untitled - Notepad
    Clipboard := OldClipboard
Return

;---------------------------------------------------------------------------------------------------------
;######################### End quickly gather text to a notepad ##########################################
;---------------------------------------------------------------------------------------------------------

; >!q::Suspend

>^q::
    MsgBox Exiting the script Y
ExitApp