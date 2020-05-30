/*
When Pressing The Middle Mouse Remap Button
Click It One Then User UP and DOWN Arrow
Keys


 The Arrow Keys Control The Mouse

 Up = Mouse Move H
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

k:: 
l:: 
i:: 
j::




xVal= 
yVal= 
If GetKeyState("CapsLock","T") = 1
   { 
     
      IncrementValue := Increment        
      Loop, 
      { 
      If (A_Index > IncrementValue * 15) and (IncrementValue < Increment * 5)  
         IncrementValue := IncrementValue * 2 
      If GetKeyState("k", "P") ; Down
         yVal := IncrementValue 
      Else If GetKeyState("i", "P") ; up
         yVal := -IncrementValue 
      If !yVal 
         yVal := 0 
      If GetKeyState("j", "P") ;left
         xVal := -IncrementValue 
      Else If GetKeyState("l", "P") ;right
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


#If GetKeyState("CapsLock","T") = 1
u:: Send {WheelUp}
o:: Send {WheelDown}
h:: Send {LButton}
SC027:: Send {RButton}
Insert:: Send {MButton}




CoordMode, Screen
WinGetPos, winX, winY, winWidth, winHeight, A
tl := TEST
tr := A_ScreenHeight/3


F11::MsgBox %tl%
y::MouseMove, A_ScreenWidth*1/6, A_ScreenHeight*1/6
,::MouseMove, A_ScreenWidth*1/2, A_ScreenHeight*1/2
p::MouseMove, A_ScreenWidth*5/6, A_ScreenHeight*1/6
N::MouseMove,  A_ScreenWidth*1/6, A_ScreenHeight*5/6
/::MouseMove,  A_ScreenWidth*5/6, A_ScreenHeight*5/6
#if

>^q::
    MsgBox Exiting the script
    ExitApp





