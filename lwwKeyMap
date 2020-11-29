
/*

documentation to be completed.

capslock is inactive when launched. To use capslock as you normally would, you can press WinKey + Capslock
Mouse movement:
-----------------------------------:
    Move the mouse with the designated keys below when holding the RightShift 

    Movement
    e - up
    s - left
    d - down
    f - right
    quick jump
    g - quick jumpt right
    a - quick jumpt left
    r - quick jump up
    v - quick jump down
    clicks
    space - left click
    w - right click
    insert - middle click 
    scroll
    x - scroll up 
    z - scroll down
    
Keyboard section:
------------------------------------:
    - Deactivates capslock for normal (accidental) use.
        - Access the following functions when pressing Capslock: 
    
    (modifiers) Shift, Control, enter, esc - tab, space, ;, '
    Cursor keys - J, K, L, I (Normal mode)
    pageup, pagedn - u,o
    home, end - y, p
    backspace, del - n,m
    undo, redo - ,,.
    search (Ctrl+f) - / 
    cut, copy, pate - xcv
    close tab, close window - w, e
    F2 (for excel) - 2
        Numberpad - Ctrol+alt+shift+{space}m,.jkluio	
    
Hotkey area:
-------------------------------------:
    Google search the selection - win+s
    Google image search the selection - win+i
    Open excel - win+x
    
Other Functinality:
---------------------------------------:
    ctrl+f12 - toggle window always on top
    insert - Always on screenshot
    {Right Ctrl} + q - exit app
    
text expansion:
---------------------------------------:
    ds - date
    dt - date_time
    re - signature
    
    Functionality
    - Deactivates capslock for normal (accidental) use.
        - Hold Capslock and drag anywhere in a window to move it (not just the title bar).
    - Access the following functions when pressing Capslock: 
    Cursor keys - J, K, L, I (Normal mode) or HJKL (vim Mode)
    Enter - ;
    Home, PgDn, PgUp, End - Y, O, U, P (Normal mode) or O,U,I,O (VimMode)
    
    Select all - A
    Cut, copy, paste - S, D, F / X, C, V
    Close tab, window - W, E
    Esc - Q
    Ctrl - LAlt
    Shift - Tab or Space
    Backspace and Del - N, M
    F2 (For Excel) - B 
        Undo, redo - , and .
    Numpad at the right hand resting position when holding Ctrl+Shift+Alt (using keys m,.jkluio and spacebar)
    To use capslock as you normally would, you can press WinKey + Capslock
    
    Ctrl+F12 toggle windows always on top
*/

#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

#Persistent
SetCapsLockState, AlwaysOff
SetScrollLockState, AlwaysOff

;---------------------------------------------------------------------------------------------------------
;###################################### Start Mouse         ######################################
;---------------------------------------------------------------------------------------------------------

SetBatchLines -1 
#UseHook 

MouseDelay = 0 
Increment = 1 
Inc = 1

e:: 
d:: 
s::
f:: 
    ; ralt::
rshift:: 

    xVal=
    yVal= 
    If GetKeyState("RShift","p") = 1
    { 
        IncrementValue := Increment 
        Loop, 
        { 
            ; lower increment value higher startup speed. Lower increment slower acceleration
            If (A_Index > IncrementValue * 3) hnd (IncrementValue < Increment * 10 ) 
                IncrementValue := IncrementValue * 1.5 
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
    ; If GetKeyState("ralt","p") = 1
    ; { 
    ;     IncVal2 := Inc 
    ;     Loop, 
    ;     { 
    ;         ; lower inc value higher startup speed. Lower inc slower acceleration
    ;         If (A_Index > IncVal2 * 10) and (IncVal2 < Inc * 15 ) 
    ;             IncVal2 := IncVal2 * 2 
    ;         If GetKeyState("d", "P") 
    ;             yVal := IncVal2 
    ;         Else If GetKeyState("e", "P")
    ;             yVal := -IncVal2 
    ;         If !yVal 
    ;             yVal := 0 

    ;         If GetKeyState("s", "P") 
    ;             xVal := -IncVal2 
    ;         Else If GetKeyState("f", "P") 
    ;             xVal := IncVal2 
    ;         If !xVal 
    ;             xVal := 0 
    ;         If GetKeyState(A_ThisHotKey, "P") 
    ;             MouseMove, %xVal%, %yVal%,%MouseDelay%,R 
    ;         Else 
    ;             Break 
    ;     }
    ;     SEND  {RALT up}
    ; } 
    else
    { 
        Send % "{" . A_ThisHotKey . "}" 
        Send, {RSHIFT up}
        ; Send, {RALT up}
    }
return 

;#If GetKeyState("RShift","P") = 1 OR GetKeyState("rAlt","P") = 1
#If GetKeyState("rShift","P") = 1
    ; #If GetKeyState("rAlt","P") = 1

;---------- mouse button clicks 
l:: Send {RButton} ; Right Click 
;v:: MouseClick , left, , , 2 ; Double Click 
Insert:: Send {MButton} ; middle click
':: senDinput ^{LButton} ; control click

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

;---------- scroll up and down
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

;---------- move the mouse cursor to corners
CoordMode,Screen
q::MouseMove, (A_ScreenWidth / 6 ), (A_ScreenHeight / 6 )
t::MouseMove, (A_ScreenWidth / 6 * 5), (A_ScreenHeight / 6 * 1)
a::MouseMove, (A_ScreenWidth / 6 * 1), (A_ScreenHeight / 6 * 3)
c::MouseMove, (A_ScreenWidth / 2), (A_ScreenHeight / 2)
g::MouseMove, (A_ScreenWidth / 6 * 5), (A_ScreenHeight / 6 * 3)
z::MouseMove, (A_ScreenWidth / 6 * 1), (A_ScreenHeight / 6 * 5)

b::MouseMove, (A_ScreenWidth / 6 * 5), (A_ScreenHeight / 6 * 5)

;---------- Jump the mouse cursor 
;t::MouseMove, 0, -A_ScreenHeight*1/5 ,0, R ; jump up
;b::MouseMove, 0, A_ScreenHeight*1/5 ,0, R ; jump down
;g::MouseMove, A_ScreenWidth*1/5, 0 ,0, R ; jump right
;a::MouseMove, -A_ScreenWidth*1/5, 0 ,0, R ; jump left
;x::MouseMove, (A_ScreenWidth // 2), (A_ScreenHeight // 2)

#if
    ;---------------------------------------------------------------------------------------------------------
;###################################### End Mouse         ######################################
;---------------------------------------------------------------------------------------------------------

;---------------------------------------------------------------------------------------------------------
;###################################### Other generic mouse       ######################################
;---------------------------------------------------------------------------------------------------------

;---------- Real Mouse: buttons and wheels

XButton2::send {Enter}
XButton1::send {Delete}
WheelLeft::WheelLeft
WheelRight::WheelRight

; ---------------------------------------------- Excel area -------------------------------------------------------------

#IfWinActive ahk_class XLMAIN
    WheelLeft::sendinput, !{PgUp}
    WheelRight::sendinput, !{PgDn}

    ;---------------- dependants ------------
    capslock & 1::sendinput ^[ 
    capslock & 2::sendinput {F5}{Enter}
    capslock & 3::sendinput {F2}
    capslock & 4::sendinput {+}
    capslock & 5::sendinput {F9}
    ;-----------------pasting ----------------
    ^!v::sendinput ^!v{v}{enter}
    ^!f::sendinput ^!v{f}{enter}
    ^!t::sendinput ^!v{t}{enter}
    ^!l::sendinput ^!v{l}
    ;-----------------------------------------
    Capslock & u::Sendinput ^{up}
    Capslock & o::Sendinput ^{Down}
    ;-----------------------------------------A
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

;---------- Toggle CapsLock with the win key
#Capslock::
    If GetKeyState("CapsLock", "T") = 1
        SetCapsLockState, AlwaysOff
    Else
        SetCapsLockState, AlwaysOn
Return

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

;Capslock & x::Enter
;Capslock & c::copy/cut all
Capslock & v:: Sendinput {Delete}
Capslock & b:: SendInput {Blind}{BS}
Capslock & n::SendInput {Blind}{BS}
Capslock & m::SendInput {Blind}^{BS}
Capslock & ,:: Sendinput {Delete}
Capslock & .:: Sendinput ^{Delete}
Capslock & /::SendInput ^f

capslock & alt::SendInput {Blind}{Alt}

Capslock & x::SendInput {Enter}
Capslock & Space::SendInput {Blind}{Control Down}
Capslock & Space Up::SendInput {Blind}{Control Up}

Capslock & Tab::SendInput {Blind}{shift Down}
Capslock & Tab up::SendInput {Blind}{shift up}

Capslock & BS::SendInput {Blind}{BS}

!+q::SendInput !{F4} 
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

Capslock & z::AltTab

; Capslock & z::
;     sendinput {alt down}{tab down}
;     While GetKeyState("z", "P")
;     {
;         sleep 100
;     }
;     sendinput {alt up}{tab up}
; return
;---------------------------- scroll up/down ; replaced with page up and down

; #IfWinActive
;     capslock & u::
;         While GetKeyState("u", "P")
;         {
;             Send {Wheelup}
;             sleep 100
;         }
;         return

;     #IfWinActive
;     capslock & o::
;     While GetKeyState("o", "P")
;     {
;         Send {WheelDown}
;         sleep 100
;     }
; return

; ---------------------------- Copy double click cut selection
; Capslock & d::
;     keywait,d
;     keywait, d, d ,t 0.1
;     if errorlevel 
;         Sendinput, ^c
;     else
;         Sendinput, ^x
; return

;------------------word copy , cut

Capslock & t::
    keywait,t
    keywait, t, d ,t 0.2
    if errorlevel 
        sendinput, ^{right}+^{left}^c 
    else
        Send, ^{right}+^{left}^x 
return

;------------------ line copy , delete
Capslock & g::
    keywait,g
    keywait, g, d ,t 0.2
    if errorlevel 
        Sendinput, {Home}+{End}^c
    else
        Sendinput, {Home}+{End}{del}
return

;-------------------- All copy delete
Capslock & c::
    keywait,c
    keywait, c, d ,t 0.1
    if errorlevel 
        Sendinput, ^a^c
    else
        Sendinput, ^a{del}
return

;----------------------Save and save as 

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

!q::
    keywait,q
    keywait, q, d ,t 0.15
    if errorlevel 
        Sendinput ^w
    else
        sendinput !{F4}
return 

;-----------------------Num lock keys -----------------------------
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

;----------------------- lock kedwys -----------------------------

;##################################################   Launcher   ########################################

Capslock & w::
    ;SetTimer, Alert, -1000 ; --> WIP
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

    ;else if key=ss
    ;{
    ;    sendinput, {Home}+{End}
    ;    return
    ;}
    ;else if key=ss
    ;{
    ;    sendinput, +{Home}
    ;    return
    ;}
    ;else if key=se
    ;{
    ;    sendinput, +{End}
    ;    return
    ;}
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

#^y::
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
;######################### End quickly gather text to a notepad ##########################################
;---------------------------------------------------------------------------------------------------------

; >!q::Suspend

>^q::
    MsgBox Exiting the script Y
ExitApp
