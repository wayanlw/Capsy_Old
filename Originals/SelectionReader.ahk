#Persistent

/* Script by: DuckM4n
YT Channel: https://www.youtube.com/channel/UCDEBZtJ8avI7A1AVfkEeB1A/?sub_confirmation=1
*/


#SingleInstance Force
FileCreateDir, %A_ScriptDir%\ReadTextAssets
SetWorkingDir, %A_ScriptDir%\ReadTextAssets

VB=
(
Dim sapi
Set sapi=CreateObject("sapi.spvoice")
)

LineBreak=
(


)

IfNotExist, NoCmdWindow.vbs
	FileAppend, Set oShell = CreateObject ("Wscript.Shell")`nDim strArgs`nstrArgs = "cmd /c Speak.bat"`noShell.Run strArgs`, 0`, false, NoCmdWindow.vbs
IfNotExist, Speak.bat
	FileAppend, @echo off`nsetlocal EnableDelayedExpansion`n`nfor /f "Delims=" `%`%a in (Speak) do (set Text=`%`%a)`necho sapi.Speak "`%Text`%" >> Speak.vbs`nStart Speak.vbs, Speak.bat

#S::
	Process, Close, wscript.exe ; Added By Hellbent
	sleep,200 ; Added By Hellbent
	Old_Clipboard:=Clipboard
	Send, ^c
	Sleep, 15
	New_Clipboard:=Clipboard
	StringReplace, NoLineBreak, New_Clipboard, %LineBreak%, `.%A_Space% , All
	StringReplace, Speak, NoLineBreak, ", , All
	Clipboard:=Old_Clipboard
	FileDelete, Speak
	FileAppend, % Speak, Speak
	FileDelete, Speak.vbs
	FileAppend, %VB%`nSet sapi.Voice = sapi.GetVoices.Item(0)`n, Speak.vbs
	Run, NoCmdWindow.vbs
	return
	
#F::
	Process, Close, wscript.exe ; Added By Hellbent
	sleep,200 ; Added By Hellbent
	Old_Clipboard:=Clipboard
	Send, ^c
	Sleep, 15
	New_Clipboard:=Clipboard
	StringReplace, NoLineBreak, New_Clipboard, %LineBreak%, `.%A_Space% , All
	StringReplace, Speak, NoLineBreak, ", , All
	Clipboard:=Old_Clipboard
	FileDelete, Speak
	FileAppend, % Speak, Speak
	FileDelete, Speak.vbs
	FileAppend, %VB%`nSet sapi.Voice = sapi.GetVoices.Item(2)`nsapi.Rate = 2`n, Speak.vbs
	Run, NoCmdWindow.vbs
	return
		
#Z::
	Process, Close, wscript.exe ; Added By Hellbent
	sleep,200 ; Added By Hellbent
	Old_Clipboard:=Clipboard
	Send, ^c
	Sleep, 15
	New_Clipboard:=Clipboard
	StringReplace, NoLineBreak, New_Clipboard, %LineBreak%, `.%A_Space% , All
	StringReplace, Speak, NoLineBreak, ", , All
	Clipboard:=Old_Clipboard
	FileDelete, Speak
	FileAppend, % Speak, Speak
	FileDelete, Speak.vbs
	FileAppend, %VB%`nSet sapi.Voice = sapi.GetVoices.Item(1)`n, Speak.vbs
	Run, NoCmdWindow.vbs
	return
	
#Q::
Process, Close, wscript.exe
return


;; Exit Hotkey Added By Hellbent
*^+F1::
	Process, Close, wscript.exe 
	ExitApp