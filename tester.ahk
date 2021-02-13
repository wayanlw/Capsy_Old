#SingleInstance, Force
; SendMode Input
SetWorkingDir, %A_ScriptDir%

/* -------------------------------------------------------------------------- */
/*                                  Version 0                                 */
/* -------------------------------------------------------------------------- */
*/



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
    WheelLeft::sendinput, !{PgUp}
    WheelRight::sendinput, !{PgDn}

    ;---------------- dependants -------------
    capslock & 1::sendinput ^[
    capslock & 2::sendinput {F5}{Enter}
    capslock & 3::sendinput {=}
    capslock & 4::sendinput {+}
    capslock & 5::sendinput {F9}

    ;-----------------pasting ----------------
    ^!v::sendinput ^!v{v}{enter}
    ^!f::sendinput ^!v{f}{enter}
    ^!t::sendinput ^!v{t}{enter}
    ^!z::sendinput ^!v{l}

    ;--------Conditional formating ------------
    ^!s::sendinput !H{L}{d}{enter}
    ^!d::sendinput !H{L}{s}{enter}
    ^!x::sendinput !H{L}{c}{s}{enter}

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
    Capslock & g::Sendinput {F2}

    ;-----------------------------------------
    capslock & F1::sendinput {-}
    capslock & F2::sendinput {+}
    capslock & F3::sendinput {*}
    capslock & F4::sendinput {/}

    ; ---------------------------- alt enter in excel ------------------------------
    capslock & enter::
    If GetKeyState("Tab","p") = 1
        {
            Send,{Home}!{enter}{up}
        }
    Else
        {
            Send,{End}!{enter}
        }
    Return


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
Capslock & w::Sendinput {Esc}
Capslock & e::Sendinput ^z ; This has repetitive press. Sould be a comfortable place.
Capslock & r::SendInput ^y ; redo
;capslock & t:: copy / delete(2) word
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
;Capslock & ':: Sorround with ''

;Capslock & z::alt tab
;-----Capslock & x:: ------------Available
Capslock & c:: sendinput {Enter}
Capslock & v:: Sendinput {Delete}
Capslock & b:: SendInput {Blind}{BS}
Capslock & n::SendInput {Blind}{BS}
Capslock & m::SendInput {Blind}^{BS}
Capslock & ,:: Sendinput {Delete}
Capslock & .:: Sendinput ^{Delete}
Capslock & /::SendInput {enter}

/* ------------------------------ Special Keys ------------------------------
*/

capslock & alt::SendInput {Blind}{Alt}


#space::Send,{space}{left}
; CapsLock & space::
;     KeyWait, space, T0.2
;     If (ErrorLevel = 1)
;     {
;         Send {Control Down}
;         KeyWait, space
;         Send {Control Up}
;     }
;     Else
;         Send {Enter}
; Return

Capslock & Tab:: Return


Capslock & space::SendInput {Blind}{shift Down}
Capslock & space up::SendInput {Blind}{shift up}

Capslock & BS::SendInput {Blind}{BS}

!+q::SendInput !{F4}
!q::Sendinput ^w

capslock & enter::
    If GetKeyState("Tab","p") = 1
        {
            Send,{Home}{enter}{up}
        }
    Else
        {
            Send,{End}{enter}
        }
Return


capslock & Down::SendInput,{Home}{Home}+{End}+{End}^c{End}{Enter}+{Home}^v

; ----------------------------- Sorrounding Text -------------------------------

#+[::
    OldClipboard := Clipboard
    Clipboard := ""
    Send ^c
    ClipWait, 1
    Clipboard = {%Clipboard%}
    Send ^v
    Sleep 200
    Clipboard := OldClipboard
    OldClipboard := ""
    ; Send, ^c
return

capslock & 9::
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


capslock & "::
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
            Send, ^c
            return
        }
        else
        {
            OldClipboard := Clipboard
            Clipboard := ""
            Send ^c
            ClipWait, 1
            Clipboard = '%Clipboard%'
            Send ^v
            Sleep 200
            Clipboard := OldClipboard
            OldClipboard := ""
            ; Send, ^c
            return
        }
return


/* --------------------------------- F keys ---------------------------------*/

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
; capslock & 9:: Sorround with paranthesis
capslock & 0:: )
capslock & -:: _
capslock & =:: +




/* ---------------------------- Special Functions ---------------------------
*/

Capslock & z::AltTab


/* ----------------------------- word select(copy) , delete ----------------------------
*/

Capslock & t::
    keywait,t
    keywait, t, d ,t 0.2
    if errorlevel
        sendinput, ^{Left}+^{Right}^c
    else
        Send, ^{Left}+^{Right}{del}
return

/* --------------------------- Line select(copy) , delete ---------------------------
*/

Capslock & g::
    keywait,g
    keywait, g, d ,t 0.2
    if errorlevel
        Sendinput, {Home}+{End}^c
    else
        Sendinput, {Home}+{End}{del}
return

/* ----------------------------- All copy delete (Too dagerous) ----------------------------
*/

; Capslock & c::
;     keywait,c
;     keywait, c, d ,t 0.1
;     if errorlevel
;         Sendinput, ^a^c
;     else
;         Sendinput, ^a{del}
; return

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



Capslock & q::
    ; mdsgbox "test"
    Input Key, L2 T2 ; L3 to limit the input to 3 eys. T5 , wait for 5 seconds
    ;----------------------Delete all
    if Key=fa
    {
        SendEvent, ^a{delete}
        return
    }
     else if key=da
    {
        sendinput, ^a^c
        return
    }


    ;-------------------------  (L)aunching apps
    ; else if key=lx
    ; {
    ;     run excel
    ; }

return
