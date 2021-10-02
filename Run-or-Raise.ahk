#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%
#WinActivateForce ; Prevent task bar buttons from flashing when different windows are activated quickly one after the other.
#1::OpenOrShowAppBasedOnExeName("msedge.exe")
#2::OpenOrShowAppBasedOnExeName("excel.exe")
#3::OpenOrShowAppBasedOnExeName("freecommander.exe")

; AppAddress: The address to the .exe (Eg: "C:\Windows\System32\SnippingTool.exe")
OpenOrShowAppBasedOnExeName(AppExeName)
{
	; AppExeName := SubStr(AppAddress, InStr(AppAddress, "\", false, -1) + 1)
	IfWinExist ahk_exe %AppExeName%
	{
		; IfWinActive
		; {
		; 	WinMinimize
		; 	Return
		; }
		; else
		; {
		WinActivate
		Return
		; }
	}
	else
	{
		Run, %AppExeName%, UseErrorLevel
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
>^q::
    MsgBox, , Capsy, Existing Capsy
ExitApp