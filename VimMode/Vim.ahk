
#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

#Persistent
; SetCapsLockState, AlwaysOff
SetScrollLockState, AlwaysOff



~$CapsLock::
    KeyWait, CapsLock,D

    GetKeyState, state, CapsLock, T 

    if state = D 
        ToolTip, <<<<<<< VIM--MODE >>>>>>>>  

    if state = U 
        ToolTip, I

    SetTimer, RemoveToolTip, 2000 
return 

RemoveToolTip: 
    SetTimer, RemoveToolTip, Off 
    ToolTip 
return

SetCapsLockOff(){
    SetCapsLockState,off
    ToolTip, I
    SetTimer, RemoveToolTip, 2000
}

SetCapsLockOn(){
    SetCapsLockState,on
    ToolTip, <<<<<<< VIM--MODE >>>>>>>>
    SetTimer, RemoveToolTip, 2000
}

#If GetKeyState("Capslock","T") = 1

h::SendInput {Blind}{Left} ; SendInput {Blind}^{Left}
j::SendInput {Blind}{Down} 
k::SendInput {Blind}{Up}
l::SendInput {Blind}{Right}
+h::SendInput {Blind}{Left} 
+j::SendInput {Blind}{Down} 
+k::SendInput {Blind}{Up}
+l::SendInput {Blind}{Right}
i::SetCapsLockOff()
+i::
    SendInput {Home}
    SetCapsLockOff()    ; SetCapsLockState,off
    ; ToolTip, Normal
    ; SetTimer, RemoveToolTip, 2000
Return

+a::
    SendInput {End}
    SetCapsLockOff()
Return

q::Sendinput {Esc}
/::SendInput ^f
p::SendInput ^v
+p:: sendinput !v
u::SendInput ^z
r::SendInput ^y

b::SendInput {Blind}^{Left}
e::SendInput {Blind}^{Right}
+b::SendInput {Blind}^{Left}
+e::SendInput {Blind}^{Right}

+6::SendInput {Blind}{Home}
+4::SendInput {Blind}{End}
6::SendInput {Blind}{Home}
4::SendInput {Blind}{End}

;b::SendInput {Blind}{BS}

o::
    SendInput {End}{Enter}
    SetCapsLockOff()
Return
+o::
    SendInput {Home}{Enter}
    SetCapsLockOff()
Return

t::SendInput {pgup}
+t::SendInput {pgdn}
;g::SendInput ^{end}


n & w::sendinput ^{right}+^{left}{delete}

n & s::sendinput +{Home}{delete}
n & e::sendinput +{end}{delete}
n & d::sendinput {Home}+{End}{delete}
n & a::sendinput ^a{delete}

SC027 & w::sendinput ^{right}+^{left}
SC027 & s::sendinput +{Home}
SC027 & e::sendinput +{end}
SC027 & d::sendinput {Home}+{End}
SC027 & a::sendinput ^a

m & w::
    sendinput ^{right}+^{left}{delete}
    SetCapsLockOff()
return
m & s::
    sendinput +{Home}{delete}
    SetCapsLockOff()
return
m & e::
    sendinput +{end}{delete}
    SetCapsLockOff()
return
m & d::
    sendinput {Home}+{End}{delete}
    SetCapsLockOff()
return
m & a::
    sendinput ^a{delete}
    SetCapsLockOff()
Return

; ----------------- Copy Related

y::
    keywait,y
    keywait, y, d ,t 0.2
    if errorlevel 
        Sendinput, ^c
    else
        Sendinput, {Home}+{End}^c
return



y & w::sendinput ^{right}+^{left}^c
y & s::sendinput +{Home}^c
y & e::sendinput +{end}^c
y & d::sendinput {Home}+{End}^c
y & a::sendinput ^a^c

;-------------------- Cut related

+d::sendinput, +{End}{Delete}

d::
    keywait,d
    keywait, d, d ,t 0.2
    if errorlevel 
        Sendinput, ^x 
    else
        Sendinput, {Home}+{End}^x
return

;------------------- Delete Related
x:: sendinput {delete}

+x:: 
    sendinput {delete} 
    SetCapsLockOff()
Return

;------------------- Top of Document / Bottom of Document
+g::SendInput ^{end}
g::
    keywait,g
    keywait, g, d ,t 0.2
    if errorlevel 
        return
    else
        Sendinput, ^{Home}
return



c::
    Sendinput {delete}
    SetCapsLockOff()
Return

+c:: 
    sendinput, +{End}{Delete}
    SetCapsLockState,off
return

v:: sendinput ^v

;--------------- Find the next occurance of the current word
f:: 
    sendinput ^f
    SetCapsLockOff()
    return
+f::
    sendinput ^{right}+^{left}^c 
    sendinput ^f
    sleep 100
    sendinput ^v{Enter}
return

#If 


; Esc::
;     sendinput {Esc}
;     SetCapsLockOn()
;     return