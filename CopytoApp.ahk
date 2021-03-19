#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

+!c::

    If !WinTag
    {
        MsgBox, Tag a target window in NotePad
        ,`rWordPad or a GUI edit field:`r`r 1
        . Activate window`n 2
        . Press Ctrl+Win+Alt+T
        Return
    }

    OldClipboard:= ClipboardAll
    SendInput, ^c
    ClipWait,
    If ErrorLevel
    {
        MsgBox, No text selected!
        Return
    }
    IfWinExist, %winTitlePart%
    {

        WinGetTitle, actWin, A

        IfWinNotActive, %winTitlePart%
            WinActivate, %winTitlePart%

        IfWinActive, %winTitlePart%
        {
            SendInput, ^v`r
            WinActivate, %actWin%
        }
        sleep 500
    }
    Else
    {
        MsgBox, Window < "%winTitlePart%" > does not Exist!
    }
    Clipboard := OldClipboard
Return

; ------------------------ Tag the destination window --------------------------

^#+z::
    Click, %A_CaretX%, %A_CaretY%
    MouseGetPos, , , WinTag, Control
    WinGetTitle, winTitlePart, ahk_id %WinTag%
    MsgBox, , Capsy CopyToApp, < %winTitlePart% > is tagged as the destination window!`rPress Ctrl+Win+Shift+R to reset.
    ; MsgBox, , Capsy CopyToApp, < %winTitlePart% > is tagged as the destination window!`rUnique ID: %WinTag%`rControl: %Control%`rCtrl+Win+Alt+R to activate.,3
Return

; ----------------------- Reset the destination window -------------------------

^#+r::
    WinActivate, ahk_id %WinTag%
    MsgBox, , Capsy CopyToApp, CopyToApp windows is reset!, 1
    WinTag:=""
Return

; ----------------------------- Suspend and quit -------------------------------

>!q::Suspend

>^q::
    MsgBox, , Capsy, Existing Capsy
ExitApp