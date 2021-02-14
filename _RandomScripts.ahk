#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

#UseHook

; ------------------------------------------------------------------------------
;                                   Launcher
; ------------------------------------------------------------------------------

Capslock & q::

    Input Key, L2 T2 ; L3 to limit the input to 3 eys. T5 , wait for 5 seconds
    ;----------------------Delete all
    if Key=fa
    {
        sendinput ^a{delete}
        return
    }
    ;----------------------Delete to Start
    else if key=fd
    {
        sendinput, +{Home}{delete}
        return
    }
    ;----------------------Delete to End
    else if key=ff
    {
        sendinput, +{End}{delete}
        return
    }

    ;-----------------------copy all
    else if key=da
    {
        sendinput, ^a^c
        return
    }
    ;-----------------------copy to start
    else if key=ds
    {
        sendinput, +{Home}^c
        return
    }
    ;-----------------------copy to end
    else if key=dd
    {
        sendinput, +{End}^c
        return
    }

    ;----------------------- cut all
    else if key=va
    {
        sendinput, ^a^x
        return
    }
    ;----------------------- cut word
    else if key=vw
    {
        sendinput, ^{right}+^{left}^x
        return
    }
    ;----------------------- cut line
    else if key=vv
    {
        sendinput, {Home}+{End}^x
        return
    }
    ;----------------------- cut to start
    else if key=vs
    {
        sendinput, +{Home}^x
        return
    }
    ;----------------------- cut to end
    else if key=ve
    {
        sendinput, +{End}^x
        return
    }

    ;----------------------- Select all
    else if key=sa
    {
        sendinput, ^a
        return
    }

; -------------------------------- select line ---------------------------------

    else if key=ss
    {
        sendinput, {Home}{home}+{End}+{End}
        return
    }

; -------------------------------- select word ---------------------------------

    else if key=sw
    {
        sendinput, ^{right}+^{left}
        return
    }


return






; ------------------------------------------------------------------------------
;                         Excel insert rows and columns
; ------------------------------------------------------------------------------

; capslock & space::return
; capslock & UP::
;     If GetKeyState("SPACE","p") = 1
;     {
;         SendInput {Home}{Home}+{End}+{End}^x{DEL}{UP}{Enter}{up}^v
;         RETURN
;     }
;     Else
;     {
;         SendInput,{Home}{Home}+{End}+{End}^c{End}{Enter}+{Home}^v{UP}{END}
;         RETURN
;     }

; capslock & Down::
;     If GetKeyState("SPACE","p") = 1
;     {
;         SendInput {Home}{Home}+{End}+{End}^x{DEL}{End}{Enter}^v
;         RETURN
;     }
;     Else
;     {
;         SendInput,{Home}{Home}+{End}+{End}^c{End}{Enter}+{Home}^v
;         RETURN
;     }

;     ; ------------------------- Sourround in curly braces --------------------------

; #+[::
;     OldClipboard := Clipboard
;     Clipboard := ""
;     Send ^c
;     ClipWait, 1
;     Clipboard = {%Clipboard%}
;     Send ^v
;     Sleep 200
;     Clipboard := OldClipboard
;     OldClipboard := ""
;     ; Send, ^c
; return

; ; ------------------------ space as control and enter --------------------------

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
