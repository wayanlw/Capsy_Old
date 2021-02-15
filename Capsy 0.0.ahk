/* -------------------------------------------------------------------------- */
/*                                  Version 0                                 */
/* -------------------------------------------------------------------------- */
*/


#SingleInstance, Force

#Persistent
; SendMode Input ; with this the launcher keys will not work (q)
SetCapsLockState, AlwaysOff
SetScrollLockState, AlwaysOff

SetBatchLines -1
#UseHook ; without this the mouse movement will not work

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
            If (A_Index > IncrementValue * 2) and (IncrementValue < Increment * 9 )
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
    WheelLeft::SendInput, !{PgUp}
    WheelRight::SendInput, !{PgDn}

    ;---------------- dependants -------------
    Capslock & 1::SendInput ^[
    Capslock & 2::SendInput {F5}{Enter}
    Capslock & 3::SendInput {=}
    Capslock & 4::SendInput {+}
    Capslock & 5::SendInput {F9}

    ;-----------------pasting ----------------
    ^!v::SendInput ^!v{v}{enter}
    ^!f::SendInput ^!v{f}{enter}
    ^!t::SendInput ^!v{t}{enter}
    ^!z::SendInput ^!v{l}

    ;--------Conditional formating ------------
    ^!s::SendInput !H{L}{d}{enter}
    ^!d::SendInput !H{L}{s}{enter}
    ^!x::SendInput !H{L}{c}{s}{enter}

    ;-----------------------------------------
    Capslock & u::SendInput ^{up}
    Capslock & o::SendInput ^{Down}

    ;-----------------------------------------
    Capslock & [::SendInput ^{pgup}
    Capslock & ]::SendInput ^{pgDn}

    ;-----------------------------------------
    Capslock & b::SendInput ^d
    Capslock & t::SendInput ^r
    ; Capslock & g::SendInput {Blind}{Control Down}{Shift Down}
    ; Capslock & g up::SendInput {Blind}{Control up}{Shift up}
    Capslock & g::SendInput {F2}

    ;-----------------------------------------
    Capslock & F1::SendInput {-}
    Capslock & F2::SendInput {+}
    Capslock & F3::SendInput {*}
    Capslock & F4::SendInput {/}

    ; ---------------------------- alt enter in excel ------------------------------
Capslock & enter::
    If GetKeyState("Tab","p") = 1
    {
        SendInput,{Home}!{enter}{up}
    }
    Else
    {
        SendInput,{End}!{enter}
    }
Return

; --------------------- Enter and delete rows and columns ----------------------

Capslock & up::
    If GetKeyState("SPACE","p") = 1
    {
        SendInput {up}+{space}^{-}{up}{down}
        RETURN
    }
    Else
    {
        SendInput +{space}^+{=}{down}
        RETURN
    }
return

Capslock & left::
    If GetKeyState("SPACE","p") = 1
    {
        SendInput {left}^{space}^{-}{left}{right}
        RETURN
    }
    Else
    {
        SendInput ^{space}^+{=}{right}
        RETURN
    }
return

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

;Capslock & q::Launcher
Capslock & w::SendInput {Esc}
Capslock & e::SendInput ^z ; This has repetitive press. Sould be a comfortable place.
Capslock & r::SendInput ^y ; redo
;Capslock & t:: copy / delete(2) word
Capslock & y::SendInput {Blind}{Home}
Capslock & u::SendInput {Blind}{pgUp}
Capslock & i::SendInput {Blind}{Up}
Capslock & o::SendInput {Blind}{pgDn}
Capslock & p::SendInput {Blind}{End}
Capslock & [::SendInput {{}{}}{Left}
Capslock & ]::SendInput []{Left}
Capslock & \::SendInput |

;Capslock & a:: save and save as
Capslock & s:: SendInput ^x
Capslock & d:: SendInput ^c
Capslock & f:: SendInput ^v
;Capslock & g:: selecet & copy / delete line
Capslock & h::SendInput {Blind}^{Left}
Capslock & j::SendInput {Blind}{Left}
Capslock & k::SendInput {Blind}{Down}
Capslock & l::SendInput {Blind}{Right}
Capslock & SC027::SendInput {Blind}^{right}
;Capslock & ':: Sorround with ""

;Capslock & z::alt tab
;-----Capslock & x:: ------------Available
Capslock & c:: SendInput {Enter}
Capslock & v:: SendInput {Delete}
Capslock & b:: SendInput {Blind}{BS}
Capslock & n::SendInput {Blind}{BS}
Capslock & m::SendInput {Blind}^{BS}
Capslock & ,:: SendInput {Delete}
Capslock & .:: SendInput ^{Delete}
Capslock & /::SendInput {enter}

/* ------------------------------ Special Keys ------------------------------
*/

Capslock & alt::SendInput {Blind}{Alt}

Capslock & Tab:: Return

Capslock & space::SendInput {Blind}{shift Down}
Capslock & space up::SendInput {Blind}{shift up}

Capslock & BS::SendInput {Blind}{BS}

#space::Send,{space}{left}



; -------------------------- copy lines up and down ----------------------------

Capslock & up::SendInput {Home}{Home}+{End}+{End}^c{End}{Enter}+{Home}^v{up}{End}
Capslock & Down:: SendInput {Home}{Home}+{End}+{End}^c{End}{Enter}+{Home}^v

; --------------------------- Close windows and tab ----------------------------

!+q::SendInput !{F4}
!q::SendInput ^w

; ------------------------- enter line below or above --------------------------

Capslock & enter::
    If GetKeyState("Tab","p") = 1
    {
        Send,{Home}{enter}{up}
    }
    Else
    {
        Send,{End}{enter}
    }
Return


; ---------------------------- Sorrounding in ( ) ------------------------------

Capslock & 9::
    If GetKeyState("Tab","p") = 1
    {
        OldClipboard := Clipboard
        Clipboard := ""
        Send ^c
        ClipWait, 1
        Clipboard = (%Clipboard%)
        Send ^v
        Sleep 200
        Clipboard := OldClipboard
        OldClipboard := ""
        ; Send, ^c
    }
    Else
    {
        send (){left}
    }
return

; ---------------------------- Sorrounding in " " ------------------------------

Capslock & '::
    If GetKeyState("Tab","p") = 1
    {
        OldClipboard := Clipboard
        Clipboard := ""
        Send ^c
        ClipWait, 1
        Clipboard = "%Clipboard%"
        Send ^v
        Sleep 200
        Clipboard := OldClipboard
        OldClipboard := ""
        ; Send, ^c
        return
    }
    else
    {
        SendInput ""{left}
        return
    }
return



; --------------------------------- F keys ---------------------------------*/


Capslock & F1:: SendInput {AppsKey}
; Capslock & F2:: --------------
; Capslock & F3:: --------------
; Capslock & F4:: --------------
; Capslock & F5:: --------------
; Capslock & F6:: --------------
; Capslock & F7:: --------------
; Capslock & F8:: --------------
; Capslock & F9:: --------------
; Capslock & F10:: --------------
; Capslock & F11:: --------------
; Capslock & F12::--------------

/* ------------------------------- Number keys ------------------------------
*/

Capslock & 1:: !
Capslock & 2:: SendInput {F2}
Capslock & 3:: #
Capslock & 4:: $
Capslock & 5:: SendRaw, `%
Capslock & 6:: ^
Capslock & 7:: &
Capslock & 8:: *
; Capslock & 9:: Sorround with paranthesis or (A
Capslock & 0:: )
Capslock & -:: _
Capslock & =:: +

; ------------------------------------------------------------------------------
;                               Special Functions
; ------------------------------------------------------------------------------

Capslock & z::AltTab

; ------------------------ word select(copy) , delete --------------------------

Capslock & t::
    keywait,t
    keywait, t, d ,t 0.2
    if errorlevel
        SendInput, ^{Left}+^{Right}^c
    else
        Send, ^{Left}+^{Right}{del}
return

; ------------------------ Line select(copy) , delete --------------------------

Capslock & g::
    keywait,g
    keywait, g, d ,t 0.2
    if errorlevel
        SendInput, {Home}{Home}+{End}+{End}^c
    else
        SendInput, {Home}{Home}+{End}+{End}{del}
return

; ------------ All copy delete (Too dagerous. replaced with enter) -------------


; Capslock & c::
;     keywait,c
;     keywait, c, d ,t 0.1
;     if errorlevel
;         SendInput, ^a^c
;     else
;         SendInput, ^a{del}
; return

; ----------------------------- Save and save as -------------------------------


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

; ------------------------------------------------------------------------------
;                                   Launcher
; ------------------------------------------------------------------------------

Capslock & q::

    Input Key, L2 T2 ; L3 to limit the input to 3 eys. T5 , wait for 5 seconds
    ;----------------------Delete all
    if Key=fa
    {
        SendInput ^a{delete}
        return
    }
    ;----------------------Delete to Start
    else if key=fd
    {
        SendInput, +{Home}{delete}
        return
    }
    ;----------------------Delete to End
    else if key=ff
    {
        SendInput, +{End}{delete}
        return
    }

    ;-----------------------copy all
    else if key=da
    {
        SendInput, ^a^c
        return
    }
    ;-----------------------copy to start
    else if key=ds
    {
        SendInput, +{Home}^c
        return
    }
    ;-----------------------copy to end
    else if key=dd
    {
        SendInput, +{End}^c
        return
    }

    ;----------------------- cut all
    else if key=va
    {
        SendInput, ^a^x
        return
    }
    ;----------------------- cut word
    else if key=vw
    {
        SendInput, ^{right}+^{left}^x
        return
    }
    ;----------------------- cut line
    else if key=vv
    {
        SendInput, {Home}+{End}^x
        return
    }
    ;----------------------- cut to start
    else if key=vs
    {
        SendInput, +{Home}^x
        return
    }
    ;----------------------- cut to end
    else if key=ve
    {
        SendInput, +{End}^x
        return
    }

    ;----------------------- Select all
    else if key=sa
    {
        SendInput, ^a
        return
    }

; -------------------------------- select line ---------------------------------

    else if key=ss
    {
        SendInput, {Home}{home}+{End}+{End}
        return
    }

; -------------------------------- select word ---------------------------------

    else if key=sw
    {
        SendInput, ^{right}+^{left}
        return
    }


return

/* -------------------------------------------------------------------------- */
/* Search Functions */
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
    SendInput, ^c ;copies selected text
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
/* Drag Windows with CapsLock + Right Mouse Button */
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
/* Gather text to notepad */
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