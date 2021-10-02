#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%
F6::
 ;   OldClipboard:= Clipboard
 ;   Clipboard:= ""
 ;   SendInput, ^c ;copies selected text
 ;   ClipWait, 1
    ; Run C:\Program Files (x86)\Google\Chrome\Application\chrome.exe http://www.google.com/search?q=%Clipboard%&num=100&source=lnms&filter=0
	run "C:\Users\SuperUser\scoop\apps\mpv\current\mpv.exe" --ytdl-raw-options=format="bestvideo[height<=1080]+bestaudio" %Clipboard%
 ;   Sleep 500
 ;   Clipboard:= OldClipboard
 ;   OldClipboard:=""
 ;   ;    MsgBox %OldClipboard%
 ;   Send, ^c ;copies selected text
return
