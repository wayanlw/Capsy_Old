#SingleInstance, Force
#Persistent
SendMode Input
SetWorkingDir, %A_ScriptDir%

SetCapsLockState, AlwaysOff
SetScrollLockState, AlwaysOff


/* --------------------- Real Mouse: buttons and wheels ---------------------
*/

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

Capslock & q::SendInput {Esc}
Capslock & w::SendInput ^a
Capslock & e::SendInput ^z ; This has repetitive press. Sould be a comfortable place.
Capslock & r::SendInput ^y ; redo
;Capslock & t:: copy / delete(2) word
Capslock & y::SendInput {Blind}{Home}
Capslock & u::SendInput {Blind}{pgUp}
Capslock & i::SendInput {Blind}{Up}
Capslock & o::SendInput {Blind}{pgDn}
Capslock & p::SendInput {Blind}{End}
Capslock & [::SendInput {{}{}}{Left}
Capslock & ]::SendInput {[}{]}{Left}
Capslock & \::SendInput |

;Capslock & a:: save and save as
Capslock & s:: SendInput ^x
Capslock & d:: SendInput ^c ;Copy and double click to cut
Capslock & f:: SendInput ^v
;Capslock & g:: selecet & copy / delete line
Capslock & h::SendInput {Blind}^{Left}
Capslock & j::SendInput {Blind}{Left}
Capslock & k::SendInput {Blind}{Down}
Capslock & l::SendInput {Blind}{Right}
Capslock & SC027::SendInput {Blind}^{right}
Capslock & '::SendInput ""{left}

;Capslock & z::alt tab
Capslock & x:: SendInput {AppsKey}
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

Capslock & space::return

Capslock & Tab::SendInput {Blind}{shift Down}
Capslock & Tab up::SendInput {Blind}{shift up}

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
    If GetKeyState("space","p") = 1
    {
        Send,{End}{enter}
    }
    Else
    {
        Send,{Home}{enter}{up}
    }
Return


/* --------------------------------- F keys ---------------------------------*/
*/

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
; Capslock & 9:: Sorround with paranthesis or (
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