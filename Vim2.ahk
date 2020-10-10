
#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

#Persistent
; SetCapsLockState, AlwaysOff
SetScrollLockState, AlwaysOff

#If GetKeyState("Capslock","T") = 1


h::SendInput {Blind}{Left} ; SendInput {Blind}^{Left}
j::SendInput {Blind}{Down} 
k::SendInput {Blind}{Up}
l::SendInput {Blind}{Right}
+h::SendInput {Blind}{Left} 
+j::SendInput {Blind}{Down} 
+k::SendInput {Blind}{Up}
+l::SendInput {Blind}{Right}
i::SetCapsLockState,off
q::Sendinput {Esc}
/::SendInput ^f
p::SendInput ^v
u::SendInput ^z
r::SendInput ^y

w::SendInput {Blind}^{Left}
e::SendInput {Blind}^{Right}
+w::SendInput {Blind}^{Left}
+e::SendInput {Blind}^{Right}

,::SendInput {Blind}{Home}
.::SendInput {Blind}{End}
<::SendInput {Blind}{Home}
>::SendInput {Blind}{End}

b::SendInput {Blind}{BS}

o::SendInput {Home}{enter}
+o::SendInput {End}{enter}


t::SendInput {pgup}
+t::SendInput ^{home}
g::SendInput {pgdn}
+g::SendInput ^{end}


n & w::sendinput ^{right}+^{left}{delete}
n & s::sendinput +{Home}{delete}
n & e::sendinput +{end}{delete}
n & d::sendinput {Home}+{End}{delete}
n & a::sendinput ^a{delete}

m & w::
    sendinput ^{right}+^{left}{delete}
    SetCapsLockState,off
    return

m & s::
    sendinput +{Home}{delete}
    SetCapsLockState,off
    return
m & e::
    sendinput +{end}{delete}
    SetCapsLockState,off
    return
m & d::
    sendinput {Home}+{End}{delete}
    SetCapsLockState,off
    return
m & a::
    sendinput ^a{delete}
    SetCapsLockState,off
    Return

y & w::sendinput ^{right}+^{left}^c
y & s::sendinput +{Home}^c
y & e::sendinput +{end}^c
y & d::sendinput {Home}+{End}^c
y & a::sendinput ^a^c

d:: sendinput {delete}
+d:: 
    sendinput {delete} 
    SetCapsLockState,off

x:: 
    sendinput ^x

c:: sendinput ^c
v:: sendinput ^v


z::send AltTab

alt::SendInput {Blind}{Alt}
 
#If
