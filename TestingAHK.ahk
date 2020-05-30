

SetBatchLines -1 
#UseHook 
Increment = 1 
MouseDelay = 0 

e:: 
d:: 
s:: 
f:: 
Rshift::
xVal= 
yVal= 
If GetKeyState("rshift","p") = 1 
   { 
      IncrementValue := Increment        
      Loop, 
      { 
      If (A_Index > IncrementValue * 15) and (IncrementValue < Increment * 5)  
         IncrementValue := IncrementValue * 2 
      If GetKeyState("d", "P") 
         yVal := IncrementValue 
      Else If GetKeyState("e", "P") 
         yVal := -IncrementValue 
      If !yVal 
         yVal := 0 
      If GetKeyState("s", "P") 
         xVal := -IncrementValue 
      Else If GetKeyState("f", "P") 
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

#If GetKeyState("rshift","P") = 1
x:: Send {WheelUp}
z:: Send {WheelDown}
space:: Send {LButton}
w:: Send {RButton}
Insert:: Send {MButton}


CoordMode, Screen
r::MouseMove, 0, -A_ScreenHeight*1/6 ,0, R
v::MouseMove, 0, A_ScreenHeight*1/6 ,0, R
g::MouseMove, A_ScreenWidth*1/6, 0 ,0, R
a::MouseMove, -A_ScreenWidth*1/6, 0 ,0, R

#if



; my debugging tools 
+esc::exitapp ; <-- shift escape to exit program

 f11::listvars
 f12::reload
/
/*


;close the active window
---------------------------------------
^k::
WinGetActiveTitle, Title
WinClose, %Title%
Return


#SingleInstance, Force
CapsLock & q::WinClose, A
;

CapsLock & q::WinClose, A

