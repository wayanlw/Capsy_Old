; Functionality:
; - Deactivates capslock for normal (accidental) use.
; - Hold Capslock and drag anywhere in a window to move it (not just the title bar).
; - Access the following functions when pressing Capslock: 
; Cursor keys - J, K, L, I (Normal mode) or HJKL (vim Mode)
; Enter - ;
; Home, PgDn, PgUp, End - Y, O, U, P (Normal mode) or O,U,I,O (VimMode)
; 
; 
;       Select all - A
;       Cut, copy, paste - S, D, F / X, C, V
;       Close tab, window - W, E
;       Esc - Q
;       Ctrl - LAlt
;       Shift - Tab or Space
;       Backspace and Del - N, M
;       F2 (For Excel) - B 
;       Undo, redo - , and .
;       Numpad at the right hand resting position when holding Ctrl+Shift+Alt (using keys m,.jkluio and spacebar)
;       To use capslock as you normally would, you can press WinKey + Capslock
;
; This is created with a combination of keybindings adopted from different users. Credits to 
; Daniel Kvarfordt - https://gist.github.com/Danik/5808330
; ThatOneCoder - https://github.com/ThatOneCoder/ahk/blob/master/Wynshaft.ahk.txt
; Gustavo Duarte: http://duartes.org/gustavo/blog/post/home-row-computing 

/*
;####################### AvailableKeys and keys to reuse ##################
w,e,r

sometimes alt key binds to menu key. Then click escape and type the shortcut again

; Capslock + wer (close tab or window, press esc)

Capslock & w::SendInput {Ctrl down}{F4}{Ctrl up}
Capslock & e::SendInput {Alt down}{F4}{Alt up}
Capslock & r::SendInput {Blind}{Esc Down}

; Make Capslock & Enter equivalent to Control+Enter
;Capslock & Enter::SendInput {Ctrl down}{Enter}{Ctrl up}

; Make Capslock & Alt Equivalent to Control+Alt
;!Capslock ::SendInput {LAlt Up}{LCtrl down} 
;!Capslock up ::SendInput {LCtrl up} 
;Capslock & b::SendInput {Blind}{Insert Down}

;############## Normal mode 
; Capslock + jkli (left, down, up, right)

Capslock & j::Send {Blind}{Left DownTemp}
Capslock & j up::Send {Blind}{Left Up}

Capslock & k::Send {Blind}{Down DownTemp}
Capslock & k up::Send {Blind}{Down Up}

Capslock & i::Send {Blind}{Up DownTemp}
Capslock & i up::Send {Blind}{Up Up}

Capslock & l::Send {Blind}{Right DownTemp}
Capslock & l up::Send {Blind}{Right Up}

;############## VIM Mode
; VIM MODE:Capslock + hjkl (left, down, up, right)
Capslock & h::Send {Blind}{Left DownTemp}
Capslock & h up::Send {Blind}{Left Up}

Capslock & j::Send {Blind}{Down DownTemp}
Capslock & j up::Send {Blind}{Down Up}

Capslock & k::Send {Blind}{Up DownTemp}
Capslock & k up::Send {Blind}{Up Up}

Capslock & l::Send {Blind}{Right DownTemp}
Capslock & l up::Send {Blind}{Right Up}

*/

MsgBox press RCtrl+Q to Exit

#Persistent
SetCapsLockState, AlwaysOff
SetScrollLockState, AlwaysOff

;#################### NORMAL MODE ###############################
; Capslock + ijkl (up, left, down, pgdn)
CapsLock & i::
    if getkeystate("alt") = 0
        Send,{Up}
    else
        Send,^{Up}
return
CapsLock & j::
    if getkeystate("alt") = 0
        Send,{Left}
    else
        Send,^{Left}
    
return

CapsLock & k::
    if getkeystate("alt") = 0
        Send,{Down}
    else
        Send,^{Down}
return
CapsLock & l::
    if getkeystate("alt") = 0
        Send,{Right}
    else
        Send,^{Right}
return

;#################### END NORMAL MODE ###############################

/*
#################### Start VIM MODE ################################
; VIM MODE:Capslock + hjkl (left, down, up, right)

CapsLock & k::
    if getkeystate("alt") = 0
        Send,{Up}
    else
        Send,+{Up}
return
CapsLock & h::
    if getkeystate("alt") = 0
        Send,{Left}
    else
        Send,+{Left}
return
CapsLock & j::
    if getkeystate("alt") = 0
        Send,{Down}
    else
        Send,+{Down}
return
CapsLock & l::
    if getkeystate("alt") = 0
        Send,{Right}
    else
        Send,+{Right}
return
;####################### End Vim Mode #####################################
*/

; Capslock + ypuo (home, end, pgup, pgdn)

Capslock & u::SendInput {Blind}{PgUp Down}
Capslock & u up::SendInput {Blind}{PgUp Down}

Capslock & o::SendInput {Blind}{PgDn Down}
Capslock & o up::SendInput {Blind}{PgDn Up}

Capslock & y::SendInput {Blind}{Home Down}
Capslock & y up::SendInput {Blind}{Home Up}

Capslock & P::SendInput {Blind}{End Down}
Capslock & p up::SendInput {Blind}{End Up}

; Capslock + asdf (select all, cut-copy-paste)

Capslock & a::SendInput {Ctrl Down}{x Down}
Capslock & a up::SendInput {Ctrl Up}{x Up}

Capslock & s::SendInput {Ctrl Down}{c Down}
Capslock & s up::SendInput {Ctrl Up}{c Up}
Capslock & x::SendInput ^x
<!x::^x

Capslock & d::SendInput {Ctrl Down}{v Down}
Capslock & d up::SendInput {Ctrl Up}{v Up}
Capslock & c::SendInput ^c

Capslock & f::SendInput {Ctrl Down}{a Down} 
Capslock & f up::SendInput {Ctrl Up}{a Up}
Capslock & v::SendInput ^v

; Capslock + nm ( backspace, del)
Capslock & m::SendInput {Blind}{Del Down}
Capslock & n::SendInput {Blind}{BS Down}
Capslock & BS::SendInput {Blind}{BS Down}

; Capslock + ,/. (undo/redo)
Capslock & ,::SendInput {Ctrl Down}{z Down}
Capslock & , up::SendInput {Ctrl Up}{z Up}

Capslock & .::SendInput {Ctrl Down}{y Down}
Capslock & . up::SendInput {Ctrl Up}{y Up}

; Capslock + q Esc
Capslock & q::SendInput {Blind}{Esc Down}
Capslock & q up::SendInput {Blind}{Esc Up}

; Make Capslock + Space -> Ctrl
Capslock & Space::SendInput {Ctrl Down}
Capslock & Space Up::SendInput {Ctrl Up}

; Make Capslock + Tab -> Shift
Capslock & Tab::SendInput {Blind}{shift Down}
Capslock & Tab up::SendInput {Blind}{shift up}

; Make b the F2 --> for easier excel editing
Capslock & b::Send {F2}

; Map ; --> Enter key
Capslock & SC027::send {Enter}

; Numpad using Ctrl+Shift+Alt + m,.jkluio or space
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

; Make Win Key + Capslock work like Capslock (in case it's ever needed)
#Capslock::
    If GetKeyState("CapsLock", "T") = 1
        SetCapsLockState, AlwaysOff
    Else 
        SetCapsLockState, AlwaysOn
Return

;########################## Drag Windows ##################################################################

; Drag windows anywhere
;
; This script modified from the original: http://www.autohotkey.com/docs/scripts/EasyWindowDrag.htm
; by The How-To Geek
; http://www.howtogeek.com 

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
    EWD_MouseStartX := EWD_MouseX ; Update for the next timer-call to this subroutine.
    EWD_MouseStartY := EWD_MouseY
return

;Google lookup
#d::
    OldClipboard:= Clipboard
    Clipboard:= ""
    Send, ^c ;copies selected text
    ClipWait
    Run C:\Program Files (x86)\Google\Chrome\Application\chrome.exe http://www.google.com/search?q=%Clipboard%&num=100&source=lnms&filter=0
    Sleep 200
    Clipboard:= OldClipboard
Return

#i::
    OldClipboard:= Clipboard
    Clipboard:= ""
    Send, ^c ;copies selected text
    ClipWait
    Run C:\Program Files (x86)\Google\Chrome\Application\chrome.exe https://www.google.com/search?q=%clipboard%&num=100&source=lnms&tbm=isch&filter=0
    Sleep 200
    Clipboard:= OldClipboard
Return

>^q::ExitApp

