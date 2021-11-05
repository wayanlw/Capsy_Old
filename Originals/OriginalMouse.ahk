/*
When Pressing The Middle Mouse Remap Button
Click It One Then User UP and DOWN Arrow
Keys


 The Arrow Keys Control The Mouse

 Up = Mouse Move Up
Down = Mouse Move Down
Left = Mouse Move Left
Right = Mouse Move Right


Home MouseWheel Up

End MouseWheel Down

Delete Left Mouse Button

Page Down Right Mouse Button

 Insert Middle Mouse Button
*/
SetBatchLines -1
#UseHook
Increment = 1
MouseDelay = 0

Left::
Right::
Up::
Down::
xVal=
yVal=
If GetKeyState("CapsLock","T")
   {
      IncrementValue := Increment
      Loop,
      {
      If (A_Index > IncrementValue * 15) and (IncrementValue < Increment * 5)
         IncrementValue := IncrementValue * 2
      If GetKeyState("Down", "P")
         yVal := IncrementValue
      Else If GetKeyState("Up", "P")
         yVal := -IncrementValue
      If !yVal
         yVal := 0
      If GetKeyState("Left", "P")
         xVal := -IncrementValue
      Else If GetKeyState("Right", "P")
         xVal := IncrementValue
      If !xVal
         xVal := 0
      If GetKeyState(A_ThisHotKey, "P")
         MouseMove, %xVal%, %yVal%,%MouseDelay%,R
      Else
         Break
      }
   }
Else
   Send % "{" . A_ThisHotKey . "}"
return

Esc::ExitApp


Home:: Send {WheelUp}
End:: Send {WheelDown}
Delete:: Send {LButton}
PgDn:: Send {RButton}
Insert:: Send {MButton}