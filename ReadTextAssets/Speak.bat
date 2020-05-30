@echo off
setlocal EnableDelayedExpansion

for /f "Delims=" %%a in (Speak) do (set Text=%%a)
echo sapi.Speak "%Text%" >> Speak.vbs
Start Speak.vbs