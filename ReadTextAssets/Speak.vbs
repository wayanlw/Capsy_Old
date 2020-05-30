Dim sapi
Set sapi=CreateObject("sapi.spvoice")
Set sapi.Voice = sapi.GetVoices.Item(1)
sapi.Speak "gReplace, NoLineBreak, New_Clipboard, %LineBreak%, `.%A_Space% , All. 	StringReplace, Speak, NoLineBreak, , , All. 	Clipboard:=Old_Clipboard. 	FileDelete, Speak" 
sapi.Speak "gReplace, NoLineBreak, New_Clipboard, %LineBreak%, `.%A_Space% , All. 	StringReplace, Speak, NoLineBreak, , , All. 	Clipboard:=Old_Clipboard. 	FileDelete, Speak" 
