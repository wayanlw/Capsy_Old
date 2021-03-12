; #SingleInstance, Force
; SetWorkingDir, %A_ScriptDir%

; #Persistent
; ; SendMode Input ; with this the launcher keys will not work (q)
; SetScrollLockState, AlwaysOff

; #IfWinActive ahk_class Chrome_WidgetWin_1
Capslock:: Return
Capslock & 2::SendInput +{Enter}

; #if






; #UseHook ; without this the mouse movement will not work

; capslock & z::                                              		; Long press (> 0.5 sec) on * substitutes the dot multiply
;     KeyWait, z, T0.2                               	; Wait no more than 0.5 sec for key release (also suppress auto-repeat)
;     If ErrorLevel {                                    	; timeout, so long press
;         MsgBox long
;         KeyWait, z
;     } Else                                                	; otherwise...
;         MsgBox short
; Return

; Capslock & g::

;     keywait, g, t 0.2
;     if errorlevel{
;         keywait, g, t 0.2
;         if ErrorLevel{
;             SendInput, ^{Left}+^{Right}^c
;         }
;         Else
;             SendInput, {Home}{Home}+{End}+{End}^c
;     }
;     else
;         SendInput, {Home}{Home}+{End}+{End}{del}
;     keywait,g
; return

; Capslock & d::
;     keywait, d, t 0.2
;     if errorlevel{
;         SendInput, {Home}{Home}+{End}+{End}^c
;     }
;     else{
;         SendInput, ^c
;         return
;     }
;     keywait,d
; return

; $a::
;     aDown:=A_TickCount
;     Keywait a
;     Duration:=(A_TickCount-aDown)
;     If (Duration<300)
;         Send a
;     Else
;         Send A
; Return

; $z::
;     KeyWait, z, T0.1
;     if (ErrorLevel)
;         Send long

;     else {
;         KeyWait, z, D T0.1

;         if (ErrorLevel)
;             Send single

;         else
;             Send double
;     }

;     KeyWait, z
; return

; q::sendinput {q}
; q & j::Left
; q & l::Right
; q & i::Up
; q & k::Down

; j::
;     If GetKeyState("space","p") = 1
;     {
;         send {down}
;     }
;     Else
;     {
;         send j
;     }
; Return

; $space::

;     keywait, space, t 0.2
;     if errorlevel
;     {
;         #If GetKeyState("Space", "p") ; Autohotkey_L directive for enabling following mappings when key is physically down

;         j::Left
;         l::Right
;         i::Up
;         k::Down
;         ; space::return
;         #If
;     }
;     else
;         SendInput, {space}
;     keywait,space

; return