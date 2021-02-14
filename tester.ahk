#SingleInstance, Force
; SendMode Input
SetWorkingDir, %A_ScriptDir%

; ------------------------------------------------------------------------------
;                         Excel insert rows and columns
; ------------------------------------------------------------------------------





capslock & space::return
capslock & UP::
    If GetKeyState("SPACE","p") = 1
    {
        SendInput {Home}{Home}+{End}+{End}^x{DEL}{UP}{Enter}{up}^v
        RETURN
    }
    Else
    {
        SendInput,{Home}{Home}+{End}+{End}^c{End}{Enter}+{Home}^v{UP}{END}
        RETURN
    }

capslock & Down::
    If GetKeyState("SPACE","p") = 1
    {
        SendInput {Home}{Home}+{End}+{End}^x{DEL}{End}{Enter}^v
        RETURN
    }
    Else
    {
        SendInput,{Home}{Home}+{End}+{End}^c{End}{Enter}+{Home}^v
        RETURN
    }

