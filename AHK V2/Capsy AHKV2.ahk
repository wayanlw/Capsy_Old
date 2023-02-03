

SetCapsLockState "AlwaysOff"
CoordMode "Mouse", "Screen"

Capslock & LButton::click 2

; ------------------------------------------------------------------------------
;                                Capslock Toggle
; ------------------------------------------------------------------------------

#Capslock::
{
    If GetKeyState("CapsLock", "T") = 1
        SetCapsLockState "AlwaysOff"
    Else
        SetCapsLockState "AlwaysOn"
return
}

; ------------------------------------------------------------------------------
;                                Excel Area
; ------------------------------------------------------------------------------

#HotIf WinActive("ahk_class XLMAIN")
; HotIfWinActive "ahk_class XLMAIN"
    WheelLeft::Send "!{PgUp}"
    WheelRight::Send "!{PgDn}"

    ;---------------- dependants -------------
    `::,
    Capslock & 1::Send "^["
    Capslock & 2::Send "{F5}{Enter}"
    Capslock & 3::Send "{=}"
    Capslock & 4::Send "{F4}"

    ; ;-----------------pasting ----------------

    +!v::Send "^!v{v}{Enter}" ; paste values
    ^!f::Send "^!v{f}{Enter}" ; paste formulas
    ^!t::Send "^!v{t}{Enter}" ; paste formatting
    ^!z::Send "^!v{l}"	;paste links

     ; ;-------- Control up/down
    Capslock & u::Send "^{Up}"
    Capslock & o::Send "^{Down}"

    ; ;-------- switch sheets
    Capslock & [::Send "^{pgup}"
    Capslock & ]::Send "^{pgDn}"

    !,::Send "^{pgup}"
    !.::Send "^{pgDn}"

    ; ;------- Copy formula right / down
    Capslock & b::Send "^d"
    Capslock & t::Send "^r"


    ; ;------- F2 key
    Capslock & g::Send "{F2}"

    ; ;------- Arithmatic operators
    Capslock & F1::Send "{-}"
    Capslock & F2::Send "{+}"
    Capslock & F3::Send "{*}"
    Capslock & F4::Send "{/}"

    ; ; ---------------------------- alt Enter in excel ------------------------------
    Capslock & Enter::
	{
        If GetKeyState("space","p") = 1
        {
            Send "{Home}!{Enter}{Up}"
        }
        Else
        {
            Send "{End}!{Enter}"
        }
    return
	}

#Hotif

; ------------------------------------------------------------------------------
;                                   Main Keys
; ------------------------------------------------------------------------------

Capslock & q::Send "{Esc}"
Capslock & w::Send "^a"
Capslock & e::Send "^z" ; This has repetitive press. Sould be a comfortable place.
Capslock & r::Send "^y"
Capslock & t:: Send "^{Left}+^{Right}"
Capslock & y::Send "{Blind}{Home}" ;with space for contrl+End
Capslock & u::Send "{Blind}{pgUp}"
Capslock & i::Send "{Blind}{Up}"
Capslock & o::Send "{Blind}{pgDn}"
Capslock & p::Send "{Blind}{End}"
; Capslock & [::Send {{}{}}{Left} ; Sorround in []
; Capslock & ]::Send []{Left}     ; Sorround in {}
Capslock & \::Send "|"

Capslock & a:: Send "^s"
Capslock & s:: Send "^x"
Capslock & d:: Send "^c"
Capslock & f:: Send "^v"
Capslock & g:: Send "{Home}{Home}+{End}+{End}{Del}"
Capslock & h::Send "{Blind}^{Left}"
Capslock & j::Send "{Blind}{Left}"
Capslock & k::Send "{Blind}{Down}"
Capslock & l::Send "{Blind}{Right}"
Capslock & SC027::Send "{Blind}^{right}"
;Capslock & ':: --> Sorround with ""


Capslock & z::AltTab
Capslock & x:: Send "^f"
Capslock & c::Send "{Enter}"
Capslock & v::Send "{Delete}"
Capslock & b::Send "{Blind}{BS}"
Capslock & n::Send "{Blind}{BS}"
Capslock & m::Send "{Blind}^{BS}"
Capslock & ,::Send "{Delete}"
Capslock & .::Send "^{Delete}"
Capslock & /::Send "{Enter}"


; ------------------------------- Special Keys ---------------------------------

Capslock & alt::Send "{Blind}{Alt}"
Capslock & space::return
Capslock & BS::Send "{Blind}^{BS}"
#space::Send "{space}{left}"

Capslock & Tab::Send "{Blind}{Shift Down}"
Capslock & Tab up::Send "{Blind}{Shift up}"

!+q::Send "!{F4}"
!q::Send "^w"

; using alt+u/o to control+tab and control+shift+tab
!o::Send "^{Tab}"
!u::Send "^+{Tab}"

RAlt::RControl

Capslock & Enter::
{
    If GetKeyState("space","p") = 1
    {
        Send "{Home}{Home}{Enter}{Up}"
    }
    Else
    {
        Send "{End}{End}{Enter}"
    }
return
}

Capslock & Home::Send "{Home}{Home}+{End}+{End}^c{End}{Enter}^v{Up}{End}" ;duplicate the line up and go to the end of the duplicated
Capslock & End::Send "{Home}{Home}+{End}+{End}^c{End}{Enter}^v" ; duplicate line down and go to the end of the duplicated line
Capslock & PgDn::Send "{End}{space}{Delete}{End}" ; bring the below line to the current line
Capslock & PgUp::Send "{Home}{Home}{BackSpace}{space}{End}" ; Take the current line to the line above

; --------------------------------- F keys ---------------------------------*/

Capslock & F1:: Send "{AppsKey}"
; Capslock & F2:: --------------
; Capslock & F3:: --------------
; Capslock & F4:: --------------
; Capslock & F5:: --------------
; Capslock & F6:: --------------
; Capslock & F7:: --------------
; Capslock & F8:: --------------
; Capslock & F9:: --------------
; Capslock & F10:: --------------
; capslock & F11::

; ------------------------------- Number keys ------------------------------

; Capslock & `:: Send --------------
Capslock & 1:: Send "{AppsKey}"
Capslock & 2:: Send "{F2}"
Capslock & 3:: =
;Capslock & 4:: Excel F4
Capslock & 5:: Send "{Blind}^{Home}"
Capslock & 6:: Send "{Blind}^{End}"
Capslock & 7:: Send "{PgUp}"
Capslock & 8:: Send "{PgDn}"
;Capslock & 9:: Sorround with paranthesis or (
;Capslock & 0:: Sorround with ""
Capslock & -:: _
Capslock & =:: +


; ------------------------------------------------------------------------------
;                            Sorround the Selection
; ------------------------------------------------------------------------------

Capslock & 9::  ; Sourround in ()
{
    If GetKeyState("Space","p") = 1
    {
        OldClipboard := ClipboardAll()
        A_Clipboard := ""
        Send "^c"
        ClipWait 1
        A_Clipboard := "(" A_Clipboard ")"
        Send "^v"
        Sleep 500
        A_Clipboard := OldClipboard
        OldClipboard := ""
    }
    Else
    {
        Send "(){left}"
    }
return
}

Capslock & 0::  ; Sourround in ''
{
    If GetKeyState("Space","p") = 1
    {
        OldClipboard := ClipboardAll()
        A_Clipboard := ""
        Send "^c"
        ClipWait 1
        A_Clipboard := "'" A_Clipboard "'"
        Send "^v"
        Sleep 500
        A_Clipboard := OldClipboard
        OldClipboard := ""
    }
    Else
    {
        Send "''{left}"
    }
return
}

Capslock & '::  ; Sourround in ""
{
    If GetKeyState("Space","p") = 1
    {
        OldClipboard := ClipboardAll()
        A_Clipboard := ""
        Send "^c"
        ClipWait 1
        A_Clipboard := "`"" A_Clipboard "`""
        Send "^v"
        Sleep 500
        A_Clipboard := OldClipboard
        OldClipboard := ""
    }
    Else
    {
        Send "`"`"{left}"
    }
return
}

Capslock & [::  ; Sourround in []
{
    If GetKeyState("Space","p") = 1
    {
        OldClipboard := ClipboardAll()
        A_Clipboard := ""
        Send "^c"
        ClipWait 1
        A_Clipboard := "[" A_Clipboard "]"
        Send "^v"
        Sleep 500
        A_Clipboard := OldClipboard
        OldClipboard := ""
    }
    Else
    {
        Send "[]{left}"
    }
return
}

Capslock & ]::  ; Sourround in {}
{
    If GetKeyState("Space","p") = 1
    {
        OldClipboard := ClipboardAll()
        A_Clipboard := ""
        Send "^c"
        ClipWait 1
        A_Clipboard := "{" A_Clipboard "}"
        Send "^v"
        Sleep 500
        A_Clipboard := OldClipboard
        OldClipboard := ""
    }
    Else
    {
        Send "{}{left}"
    }
return
}

; ------------------------------- Numberpad keys --------------------------------
Capslock & Numpad8:: Send "{Blind}{Up}"
Capslock & Numpad4:: Send "{Blind}{Left}"
Capslock & Numpad5:: Send "{Blind}{Down}"
Capslock & Numpad6:: Send "{Blind}{Right}"

Capslock & NumpadDiv:: Send "{Blind}^{up}"
Capslock & Numpad7:: Send "{Blind}^{Left}"
Capslock & Numpad2:: Send "{Blind}^{Down}"
Capslock & Numpad9:: Send "{Blind}^{Right}"

Capslock & Numpad1:: Send "{Blind}{BS}"
Capslock & Numpad3:: Send "{Blind}{Del}"

Capslock & Numpad0::Send "{F2}"

Capslock & NumpadAdd:: Send "{Blind}{=}"
Capslock & NumpadEnter:: Send "{Blind}^{Enter}"

Capslock & NumLock:: Send "{Esc}"



; ------------------------------------------------------------------------------
;                               Search Functions
; ------------------------------------------------------------------------------


#s::
{
    Search := InputBox("Enter the search query","Google Search", "W400 H100")
    if search.result = "Cancel"
	{
		return
	} ; when cancel is not pressed
    else
	{
        ; run C:\Program Files (x86)\Google\Chrome\Application\chrome.exe http://www.google.com/search?q=%Search%&num=100&source=lnms&filter=0
        run "http://www.google.com/search?q=" Search.value "&num=100&source=lnms&filter=0"
    }
return
}

#+s::
{
    OldClipboard:= A_Clipboard
    A_Clipboard:= ""
    Send "^c" ;copies selected text
    ClipWait 1
    ; Run C:\Program Files (x86)\Google\Chrome\Application\chrome.exe http://www.google.com/search?q=%Clipboard%&num=100&source=lnms&filter=0
    Run "http://www.google.com/search?q=" A_Clipboard "&num=100&source=lnms&filter=0"
    Sleep 500
    A_Clipboard:= OldClipboard
    OldClipboard:= ""
    send "^c" ;copies selected text
return
}

#y::
{
    Search := InputBox("Enter the search query","Google Search", "W400 H100")
    if search.result = "Cancel"
	{
		return
	} ; when cancel is not pressed
    else
	{
        ; run C:\Program Files (x86)\Google\Chrome\Application\chrome.exe http://www.google.com/search?q=%Search%&num=100&source=lnms&filter=0
        run "https://www.youtube.com/results?search_query=" Search.value
    }
return
}

#+y::
{
    OldClipboard:= A_Clipboard
    A_Clipboard:= ""
    Send "^c" ;copies selected text
    ClipWait 1
    ; Run C:\Program Files (x86)\Google\Chrome\Application\chrome.exe http://www.google.com/search?q=%Clipboard%&num=100&source=lnms&filter=0
    Run "https://www.youtube.com/results?search_query=" A_Clipboard
    Sleep 500
    A_Clipboard:= OldClipboard
    OldClipboard:= ""
    send "^c" ;copies selected text
return
}
; ------------------------------------------------------------------------------
;                                 Exit or Suspend
; ------------------------------------------------------------------------------

>^q::
{
    MsgBox "Existing Capsy"
	ExitApp
}