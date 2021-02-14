#SingleInstance, Force
#Persistent

run "capsy 0.0.ahk"

SendMode Input
SetWorkingDir, %A_ScriptDir%


SetCapsLockState, AlwaysOff
SetScrollLockState, AlwaysOff


XButton2::send {Enter}
XButton1::send {Delete}
WheelLeft::WheelLeft
WheelRight::WheelRight

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

Capslock & q::Sendinput ^a
Capslock & w::Sendinput {Esc}
Capslock & e::Sendinput ^z ; This has repetitive press. Sould be a comfortable place.
Capslock & r::SendInput ^y ; redo
;capslock & t:: copy / delete(2) word
Capslock & y::SendInput {Blind}{Home}
Capslock & u::SendInput {Blind}{pgUp}
Capslock & i::SendInput {Blind}{Up}
Capslock & o::SendInput {Blind}{pgDn}
Capslock & p::SendInput {Blind}{End}
Capslock & [::SendInput {{}{}}{left}
Capslock & ]::sendinput {[}{]}{left}
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
Capslock & '::SendInput ""{left}

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

Capslock & space::return

Capslock & Tab::SendInput {Blind}{shift Down}
Capslock & Tab up::SendInput {Blind}{shift up}

Capslock & BS::SendInput {Blind}{BS}

; +[::sendinput {{}{}}{left}

; ----------------------------- Copy or move line ------------------------------

capslock & up::SendInput {Home}{Home}+{End}+{End}^c{End}{Enter}+{Home}^v{up}{End}
capslock & Down:: SendInput {Home}{Home}+{End}+{End}^c{End}{Enter}+{Home}^v

!+q::SendInput !{F4}
!q::Sendinput ^w


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
capslock & 9:: sendinput (){left}
capslock & 0:: )
capslock & -:: _
capslock & =:: +

; ------------------------------------------------------------------------------
;                               Special Functions
; ------------------------------------------------------------------------------

Capslock & z::AltTab

; ------------------------ word select(copy) , delete --------------------------

Capslock & t::
    keywait,t
    keywait, t, d ,t 0.2
    if errorlevel
        sendinput, ^{Left}+^{Right}^c
    else
        Send, ^{Left}+^{Right}{del}
return

; ------------------------ Line select(copy) , delete --------------------------

Capslock & g::
    keywait,g
    keywait, g, d ,t 0.2
    if errorlevel
        Sendinput, {Home}{Home}+{End}+{End}^c
    else
        Sendinput, {Home}{Home}+{End}+{End}{del}
return

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

; ------------------------------------------------------------------------------
;                               Search Functions
; ------------------------------------------------------------------------------

/* ------------------------------ Youtube Search -----------------------------*/
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

; ------------------------------------------------------------------------------
;                                   Exit app
; ------------------------------------------------------------------------------

>^q::
    MsgBox Exiting the script Y
ExitApp