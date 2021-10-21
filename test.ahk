
SetWorkingDir, %A_ScriptDir%
#SingleInstance, Force

#Persistent
; SendMode Input ; with this the launcher keys will not work (q)
SetCapsLockState, AlwaysOff
SetScrollLockState, AlwaysOff

SetBatchLines -1
#UseHook ; without this the mouse movement will not work


; #SingleInstance, Force

; #Persistent
; ; SendMode Input ; with this the launcher keys will not work with the mouse section d: f: etc.  (w)
; SetCapsLockState, AlwaysOff
; SetScrollLockState, AlwaysOff

; SetBatchLines -1
; #UseHook ; without this the mouse movement will not work

; ; MouseDelay = 0
; Increment = 1

; e::
; d::
; s::
; f::
; ralt::
;     xVal=
;     yVal=
;     If GetKeyState("ralt","p") = 1
;     {
;         IncrementValue := Increment
;         Loop,
;         {
;             ; lower increment value higher startup speed. Lower increment slower acceleration
;             If (A_Index > IncrementValue * 2) and (IncrementValue < Increment * 9 )
;                 IncrementValue := IncrementValue * 2
;             If GetKeyState("d", "P")
;                 yVal := IncrementValue
;             Else If GetKeyState("e", "P")
;                 yVal := -IncrementValue
;             If !yVal
;                 yVal := 0

;             If GetKeyState("s", "P")
;                 xVal := -IncrementValue
;             Else If GetKeyState("f", "P")
;                 xVal := IncrementValue
;             If !xVal
;                 xVal := 0
;             If GetKeyState(A_ThisHotKey, "P")
;                 MouseMove, %xVal%, %yVal%,%MouseDelay%,R
;             Else
;                 Break
;         }
;         send {ralt up}
;     }
;     else
;     {
;         Send % "{" . A_ThisHotKey . "}"
;         Send, {ralt up}
;         ; Send, {RALT up}
;     }
; return

; ^!c::

;     OldClipboard := ClipboardAll
;     Clipboard := "" ;clears the Clipboard
;     SendInput, ^c
;     ClipWait 0 ; pause for Clipboard data
;     Control, EditPaste, % Clipboard . chr(13) . chr(10) . chr(13) . chr(10) , , *Untitled - Notepad
;     ; Clipboard := OldClipboardkn
;     MsgBox test
; Return

f::
KeyWait, f, T0.3
If (ErrorLevel = 1)
{
	Send {Control Down}
	KeyWait, f
	Send {Control Up}
}
Else
	Send f
Return


; Rbutton::
;     if GetKeyState("lbutton", "P")
;     {
;         Click Right
;     }
;     Else{
;         Click,2
;     }
; return

; #IfWinActive ahk_class CabinetWClass
; Rbutton::
;     if GetKeyState("lbutton", "P")
;     {
;         Click Right
;     }
;     Else{
;         Click,2
;     }
; return
; #If

; ; --------------------- two keys for Holding vs pressing -----------------------

*;::
    Send {Blind}{Ctrl Down}
    cDown := A_TickCount
Return

*; up::
    If ((A_TickCount-cDown)<200)  ; Modify press time as needed (milliseconds)
        Send {Blind}{Ctrl Up}{SC027}
    Else
        Send {Blind}{Ctrl Up}
Return

; original winref------------------------------------------------------------------------------
/*
Script Function:
The CopyRef.ahk script copies any selected text to an "Untitled - Notepad" window.
The script uses the standard Windows Clipboard manipulation routine discussed in detail at:
https://jacks-autohotkey-blog.com/2016/03/23/autohotkey-windows-clipboard-techniques-for-swapping-letters-beginning-hotkeys-part-9/
Be sure to save the Notepad file after copying references.

April 21, 2020 Copy text to Notepad, WordPad or GUI Edit field
To set up a reference target window tag either a NotePad, WordPad, or GUI Edit field as the
target by activating the window, clicking in the target field and pressing:
Ctrl+Win+Alt+T

Then move to any source window, highlight the targeted text, then press:
Ctrl+Alt+C

Without activating the target window, the script uses the Control, EditPaste command
to insert the text into the window at the cursor location.

Uncomment the ControlSetText command to replace rather than add text.

Use Ctrl+Win+Alt+R to return to the tagged window.

*/


; ^!c::

;     If !WinTag
;     {
;         MsgBox, Tag a target window in NotePad
;         ,`rWordPad or a GUI edit field:`r`r 1
;         . Activate window`n 2
;         . Press Ctrl+Win+Alt+T
;         Return
;     }

;     OldClipboard := ClipboardAll
;     Clipboard := "" ;clears the Clipboard
;     SendInput, ^c
;     ClipWait 0 ; pause for Clipboard data
;     If ErrorLevel
;     {
;         MsgBox, No text selected!
;         Return
;     }
;     ; MsgBox, %WinTitle%
;     ; Control, EditPaste, %Clipboard% `n`n ,%control%,  ahk_id %WinTag%     . chr(13) . chr(10) . chr(13) . chr(10)
;     Control, EditPaste, %Clipboard% ,,'Pandas CookBook 1.x - OneNote'
;     ;To replace text (rather than add), use the following ControlSetText command:
;     ;ControlSetText , %Control%, %Clipboard%, ahk_id %WinTag%
;     ToolTip , Text inserted into %WinTitle% `ralt: %control%!
;     Sleep, 3000
;     ToolTip
;     ; Clipboard := OldClipboard
; Return

; ^!#t::
;     Click, %A_CaretX%, %A_CaretY%
;     MouseGetPos, , , WinTag, Control
;     WinGetTitle, WinTitle, ahk_id %WinTag%
;     MsgBox The "%WinTitle%" window is tagged!`rUnique ID: %WinTag%`ralt: %Control%`rCtrl+Win+Alt+R to activate.
; Return

; ^!#r::
;     WinActivate, ahk_id %WinTag%
; Return

; ------------------------------------------------------------------------------

; !+c::
;     oldTitleMatchMode := A_TitleMatchMode
;     SetTitleMatchMode, 2

;     ; Settings
;     winTitlePart := " - OneNote" ; Partial title of ON windows

;     ; Copy currently selected stuff
;     Send, ^c ; Use sendplay to avoid unexpected interactions with Win key

;     ; If OneNote is not started, give up
;     IfWinExist, %winTitlePart%
;     {
;         ; Save the currently active window title
;         WinGetTitle, actWin, A

;         ; If OneNote is not active, activate it now
;         IfWinNotActive, %winTitlePart%
;             WinActivate, %winTitlePart%

;         ; Check again, if ON active then paste else error
;         IfWinActive, %winTitlePart%
;         {
;             ; Paste to ON &amp; Add some blank lines
;             Send, ^v`r ; Use sendplay to avoid unexpected interactions with Win key
;             ; Switch window back to previously active
;             WinActivate, %actWin%
;         }
;         else
;             MsgBox, Could not activate OneNote window.

;     } else
;     MsgBox, Can't find ON [%winTitlePart%]

;     SetTitleMatchMode, %oldTitleMatchMode%
; return

; ------------------------------------------------------------------------------

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

>+q::Suspend

>^q::
    MsgBox Exiting the script
ExitApp