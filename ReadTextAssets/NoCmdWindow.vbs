Set oShell = CreateObject ("Wscript.Shell")
Dim strArgs
strArgs = "cmd /c Speak.bat"
oShell.Run strArgs, 0, false