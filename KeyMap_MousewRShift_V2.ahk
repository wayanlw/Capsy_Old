#SingleInstance, Force

#Persistent
SetCapsLockState, AlwaysOff
SetScrollLockState, AlwaysOff


;---------------------------------------------------------------------------------------------------------
;###################################### Start Mouse movement        ######################################
;---------------------------------------------------------------------------------------------------------

SetBatchLines -1 
#UseHook 
Increment = 1 
MouseDelay = 0 


F1::

e:: 
d:: 
s:: 
f:: 
Rshift::

xVal= 
yVal= 
If GetKeyState("rshift","p") = 1
{ 
    IncrementValue := Increment 
    Loop, 
   { 
       ; lower increment value higher startup speed. Lower increment slower acceleration
      If (A_Index > IncrementValue * 3) and (IncrementValue < Increment * 30)  
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
       send {rshift up}
   } 
Else 
Send % "{" . A_ThisHotKey . "}" 
 Send, {rshift up}
return 

#If GetKeyState("rshift","P") = 1
x:: Send {WheelUp}
z:: Send {WheelDown}
space:: Send {LButton}
q:: Send {RButton}
Insert:: Send {MButton}


CoordMode, Screen

r::MouseMove, 0, -A_ScreenHeight*1/200 ,0, R
v::MouseMove, 0, A_ScreenHeight*1/200 ,0, R
g::MouseMove, A_ScreenWidth*1/200, 0 ,0, R
a::MouseMove, -A_ScreenWidth*1/200, 0 ,0, R
#if
    
#Capslock::
    If GetKeyState("CapsLock", "T") = 1
        SetCapsLockState, AlwaysOff
    Else 
        SetCapsLockState, AlwaysOn
Return

;---------------------------------------------------------------------------------------------------------
;###################################### End Mouse movement        ######################################
;---------------------------------------------------------------------------------------------------------






;---------------------------------------------------------------------------------------------------------
;###################################### Start Hot key area        ######################################
;---------------------------------------------------------------------------------------------------------


Capslock & j::SendInput {Blind}{Left}   
Capslock & k::SendInput {Blind}{Down}
Capslock & i::SendInput {Blind}{Up}
Capslock & l::SendInput {Blind}{Right}

Capslock & h::SendInput {Blind}^{Left}
Capslock & SC027::SendInput {Blind}^{right}


Capslock & o::SendInput {Blind}{PgUp}
Capslock & u::SendInput {Blind}{PgDn}
Capslock & y::SendInput {Blind}{Home}
Capslock & p::SendInput {Blind}{End}


Capslock & x::SendInput ^x
Capslock & c::SendInput ^c
Capslock & v::SendInput ^v 
Capslock & s::SendInput ^s 
Capslock & a::SendInput ^a 
Capslock & 9::Send +9
Capslock & 0::Send +0
Capslock & f::^f
Capslock & w::^w

Capslock & ,::SendInput ^z
Capslock & .::SendInput ^y


Capslock & b::SendInput {Blind}^{BS}
Capslock & n::SendInput {Blind}{BS Down}
Capslock & m::SendInput {Blind}{Del Down}

Capslock & Space::SendInput {Blind}{Ctrl Down}
Capslock & Space Up::SendInput {Blind}{Ctrl Up}

Capslock & Tab::SendInput {Blind}{shift Down}
Capslock & Tab up::SendInput {Blind}{shift up}

!+q::SendInput {Alt down}{F4}{Alt up}

Capslock & '::SendInput {Blind}{Esc}
Capslock & q::Send {Blind}{AppsKey}

Capslock & 2::Send {F2}

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


;---------------------------------------------------------------------------------------------------------
;###################################### end hotkey area        ######################################
;---------------------------------------------------------------------------------------------------------





;---------------------------------------------------------------------------------------------------------
;######################################    Start Shortcuts    #####################################
;---------------------------------------------------------------------------------------------------------

CapsLock & F2::
    OldClipboard:= Clipboard
    Clipboard:= ""
    Send, ^c ;copies selected text
    ClipWait, 1 
    Run C:\Program Files (x86)\Google\Chrome\Application\chrome.exe https://www.google.com/search?q="%clipboard%"&num=100&source=lnms&tbm=isch&filter=0
    Sleep 200
    Clipboard:= OldClipboard
    Send, ^c ;copies selected text
Return

CapsLock & F3::
    OldClipboard:= Clipboard
    Clipboard:= ""
    Send, ^c ;copies selected text
    ClipWait, 1
    Run C:\Program Files (x86)\Google\Chrome\Application\chrome.exe https://www.youtube.com/results?search_query=man"%clipboard%"
    Sleep 200
    Clipboard:= OldClipboard
    Send, ^c ;copies selected text
Return

#i::
InputBox, Search, Google Search, , , 400, 100
if not ErrorLevel ; when cancel is not pressed
{
run C:\Program Files (x86)\Google\Chrome\Application\chrome.exe http://www.google.com/search?q="%Search%"&num=100&source=lnms&filter=0
}
return

#+i::
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

>!q::Suspend



>^q::
    MsgBox Exiting the script
ExitApp