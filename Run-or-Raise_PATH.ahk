#SingleInstance, Force
SendMode Input ; with this the launcher keys will not work with the mouse section d: f: etc.  (w)

#WinActivateForce ; Prevent task bar buttons from flashing when different windows are activated quickly one after the other.
#1::OpenOrShowAppBasedOnExeName("C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe")
#2::OpenOrShowAppBasedOnExeName("C:\Users\SuperUser\scoop\apps\freecommander\current\FreeCommander.exe")
#3::OpenOrShowAppBasedOnExeName("C:\Program Files\Microsoft Office\root\Office16\EXCEL.EXE")
#4::OpenOrShowAppBasedOnExeName("C:\Program Files\Microsoft Office\root\Office16\OUTLOOK.EXE")


; AppAddress: The address to the .exe (Eg: "C:\Windows\System32\SnippingTool.exe")
OpenOrShowAppBasedOnExeName(AppAddress)
{
    AppExeName := SubStr(AppAddress, InStr(AppAddress, "\", false, -1) + 1)
    IfWinExist ahk_exe %AppExeName%
    {
        IfWinActive
        {
            WinGet, ActiveProcess, ProcessName, A
            WinGet, OpenWindowsAmount, Count, ahk_exe %ActiveProcess%

            If OpenWindowsAmount = 1 ; If only one Window exist, do nothing
                Return

            Else
            {
                WinGetTitle, FullTitle, A
                AppTitle := SubStr(FullTitle, InStr(FullTitle, " ", false, -1) + 1)
                SetTitleMatchMode, 2
                WinGet, WindowsWithSameTitleList, List, %AppTitle%
                If WindowsWithSameTitleList > 1 ; If several Window of same type (title checking) exist
                {
                    WinActivate, % "ahk_id " WindowsWithSameTitleList%WindowsWithSameTitleList%	; Activate next Window
                }
            }
            Return
        }
        else
        {
            WinActivate
            Return
        }
    }
    else
    {
        Run, %AppAddress%, UseErrorLevel
        If ErrorLevel
        {
            Msgbox, File %AppExeName% Not Found
            Return
        }
        else
        {
            WinWait, ahk_exe %AppExeName%
            WinActivate ahk_exe %AppExeName%
            Return
        }
    }
}
; >^q::
;     MsgBox, , Capsy, Existing Capsy
; ExitApp