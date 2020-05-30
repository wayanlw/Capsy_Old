;----------------------------------------
;WYNSHAFT'S CUSTOM KEYBOARD SCRIPT
;----------------------------------------
;	,_'_,
;	[O.o] <---KYLE
;	/)__)
;	-"--"- "Yo Steve... that chick you banged used to be a DUDE MAAAAN!!!"
;	
;	,___,
;	[O.o] <---STEVE
;	/)__)
;	-"--"- Wh..WHAT... RLY???

;	,_'_,
;	[¬.¬] <---KYLE
;	/)__)
;	-"--"- YA RLY

;	||_||
;	[O.O] <---STEVE
;	/)__)
;	-"--"- NO WAI!!!!!


;----------------------------------------
;		Keyboard Edit >>>>>> START
;----------------------------------------










;	  ----------------------
;		NOTES >>>>>> START
;	  ----------------------
; All letter and number keys are the same in this scipts
; # = Win key
; ! = Alt
; ^ = Control
; + = Shift
;	  ----------------------
;		NOTES >>>>>> END
;	  ----------------------

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
SetTitleMatchMode, 2

SetCapsLockState, AlwaysOff



;----------------------------------------
;		WindowPad Edit >>>>>> Start
;----------------------------------------

; WindowPad v1.60
;   http://www.autohotkey.com/forum/topic21703.html
;   Requires AutoHotkey v1.0.48 or later.

if 0 > 0
{
    ; Command-line mode: interpret each arg as a pseudo-command.
    ; Suspend all hotkeys which may be created by WindowPadInit.
    Suspend On
    ; Load options and Gather exclusions.
    gosub WindowPadInit
    ; Execute command line(s).  Each args should be in one of these formats:
    ;   <command>
    ;   <command>,<args_no_spaces>
    ;   "<command>, <args>"    ; In this case the initial comma is optional.
    Loop %0%
        wp_ExecLine(%A_Index%)
    ExitApp
}

WindowPadInit:
    ; If this script is #included in another script, this section may not be
    ; auto-executed.  In that case, the following should be called manually:
    WindowPad_Init(WINDOWPAD_INI_PATH)
  return

WindowPad_Init(IniPath="")
{
    global WINDOWPAD_INI_PATH
    ;
    ; Init icons and tray menu.
    ;
    if A_IsCompiled  ; Load icons from my custom WindowPad.exe.
    {
        ; Default icon is 32x32, so doesn't look good in the tray.
        Menu, Tray, Icon, %A_ScriptFullPath%, 2
    }
    else if (A_LineFile = A_ScriptFullPath)
    {   ; Set the tray icon, but only if not included in some other script.
        wp_SetTrayIcon(true)
        ; Use OnMessage to catch "Suspend Hotkeys" or "Pause Script"
        ; so the "disabled" icon can be used.
        OnMessage(0x111, "WM_COMMAND")
    }
        
    Menu, Tray, NoStandard
    Menu, Tray, MainWindow
    Menu, Tray, Add, &Debug, TrayDebug
    ifExist, %A_ScriptDir%\WindowPad.html
    {
        Menu, Tray, Add, &Help, TrayHelp
        Menu, Tray, Add
    }
    Menu, Tray, Add, &Reload, TrayReload
    if !A_IsCompiled
    {
        Menu, Tray, Add, &Edit, TrayEdit
        Menu, Tray, Add
    }
    Menu, Tray, Add, &Suspend, TraySuspend
    Menu, Tray, Add, E&xit, TrayExit
    Menu, Tray, Default, &Debug    
    ;
    ; Load settings.
    ;
    if IniPath =
        Loop, %A_LineFile%\..\Wynshaft.ini
            IniPath := A_LoopFileFullPath
    ifNotExist %IniPath%
    {
        IniPath = %A_ScriptDir%\Wynshaft.ini
        FileInstall, Wynshaft.Default.ini, %IniPath%
    }
    WINDOWPAD_INI_PATH := IniPath
    WindowPad_LoadSettings(IniPath)
}

WindowPad_LoadSettings(ininame)
{
    local v
    
    ; Misc Options
    IniRead, v, %ininame%, Options, TitleMatchMode, %A_TitleMatchMode%
    SetTitleMatchMode, %v%
    
    ; Hotkeys: Exclude Windows
    v := wp_INI_GetList(ininame, "Exclude Windows", "Window")
    Loop, Parse, v, `n
        GroupAdd, HotkeyExclude, %A_LoopField%
    
    ; Read the Hotkeys section in.
    v := wp_INI_ReadSection(ininame, "Hotkeys")
    ; Replace the first = with ::.
    ; ('=' is required for WritePrivateProfileSection to work properly.)
    v := RegExReplace(v, "m`a)^(.*?)=", "$1::")
    Hotkey, IfWinNotActive, ahk_group HotkeyExclude
    Hotkey_Params(v)
    
    ; Gather: Exclude Windows
    v := wp_INI_GetList(ininame, "Gather: Exclude Windows", "Window")
    Loop, Parse, v, `n
        GroupAdd, GatherExclude, %A_LoopField%

    ; Gather: Exclude Processes
    ProcessGatherExcludeList := wp_INI_GetList(ininame
        , "Gather: Exclude Processes", "Process", ",")
}

wp_INI_GetList(ininame, Section, Key, Delim="`n")
{
    v := wp_INI_ReadSection(ininame, Section)
    Loop, Parse, v, `n
    {
        pos := InStr(A_LoopField, "=")
        if (pos && SubStr(A_LoopField,1,pos-1) = Key)
            list .= (list ? Delim : "") . SubStr(A_LoopField, pos+1)
    }
    return list
}

wp_INI_ReadSection(Filename, Section)
{
    char_type := A_IsUnicode ? "UShort" : "UChar"
    char_size := A_IsUnicode ? 2 : 1
    
    ; Expand relative paths, since GetPrivateProfileSection only searches %A_WinDir%.
    Loop, %Filename%, 0
        Filename := A_LoopFileLongPath
    
    VarSetCapacity(buf, 0x7FFF*char_size, 0)

    len := DllCall("GetPrivateProfileSection"
        , "uint", &Section, "uint", &buf, "uint", 0x7FFF, "uint", &Filename)
    
    VarSetCapacity(text, len*char_size), p := &buf
    ; For each null-terminated substring,
    while (s := DllCall("MulDiv", "int", p, "int", 1, "int", 1, "str"))
        ; append it to the output and advance to the next substring.
        text .= s "`n",  p += (StrLen(s)+1)*char_size
    
    ; Strip the trailing newline
    text := SubStr(text, 1, -1)
    
    ; Windows Me/98/95:
    ;   The returned string includes comments.
    ;
    ; This removes comments. Also, I'm not sure if leading/trailing space is
    ; automatically removed on Win9x, so the regex removes that too.
    if A_OSVersion in WIN_ME,WIN_98,WIN_95
        text := RegExReplace(text, "m`n)^[ `t]*(?:;.*`n?|`n)|^[ `t]+|[ `t]+$")
    
    return text
}


; Tray menu subroutines. May also be assigned to hotkeys in Wynshaft.ini.
TrayDebug:
    ListHotkeys
  return
TrayHelp:
    Run, %A_ScriptDir%\WindowPad.html
  return
TrayReload:
    Reload
  return
TrayEdit:
    Edit
  return
TraySuspend:
    WM_COMMAND(65305,0)
    Suspend
    Menu, Tray, % A_IsSuspended ? "Check" : "Uncheck", &Suspend
  return
TrayExit:
  ExitApp


;
; WindowPadMove: move and resize window based on a "pad" concept.
;
WPM(x, y, w, h, T) {
    WindowPadMove(x, y, w, h, T)
}
WindowPadMove(sideX, sideY, widthFactor, heightFactor, winTitle)
{
    if ! hwnd := wp_WinExist(winTitle)
        return

    if sideX =
        sideX = R
    if sideY =
        sideY = R
    if widthFactor is not number
        widthFactor := sideX ? 0.5 : 1.0
    if heightFactor is not number
        heightFactor := sideY ? 0.5 : 1.0
    
    WinGetPos, x, y, w, h
    
    if wp_IsWhereWePutIt(hwnd, x, y, w, h)
    {   ; Check if user wants to restore.
        if SubStr(sideX,1,1) = "R"
        {   ; Restore on X-axis.
            restore_x := wp_GetProp(hwnd,"wpRestoreX")
            restore_w := wp_GetProp(hwnd,"wpRestoreW")
            StringTrimLeft, sideX, sideX, 1
        }
        if SubStr(sideY,1,1) = "R"
        {   ; Restore on Y-axis.
            restore_y := wp_GetProp(hwnd,"wpRestoreY")
            restore_h := wp_GetProp(hwnd,"wpRestoreH")
            StringTrimLeft, sideY, sideY, 1
        }
        if (restore_x != "" || restore_y != "")
        {   ; If already at the "restored" size and position, do the normal thing instead.
            if ((restore_x = x || restore_x = "") && (restore_y = y || restore_y = "")
                && (restore_w = w || restore_w = "") && (restore_h = h || restore_h = ""))
            {
                restore_x =
                restore_y =
                restore_w =
                restore_h =
            }
        }
    }
    else
    {   ; WindowPad didn't put that window here, so save this position before moving.
        wp_SetRestorePos(hwnd, x, y, w, h)
        if SubStr(sideX,1,1) = "R"
            StringTrimLeft, sideX, sideX, 1
        if SubStr(sideY,1,1) = "R"
            StringTrimLeft, sideY, sideY, 1
    }
    
    ; If no direction specified, restore or only switch monitors.
    if (sideX+0 = "" && restore_x = "")
        restore_x := x, restore_w := w
    if (sideY+0 = "" && restore_y = "")
        restore_y := y, restore_h := h
    
    ; Determine which monitor contains the center of the window.
    m := wp_GetMonitorAt(x+w/2, y+h/2)
    
    ; Get work area of active monitor.
    gosub wp_CalcMonitorStats
    ; Calculate possible new position for window.
    gosub wp_CalcNewSizeAndPosition

    ; If the window is already there,
    if (newx "," newy "," neww "," newh) = (x "," y "," w "," h)
    {   ; ..move to the next monitor along instead.
    
        if (sideX or sideY)
        {   ; Move in the direction of sideX or sideY.
            SysGet, monB, Monitor, %m% ; get bounds of entire monitor (vs. work area)
            x := (sideX=0) ? (x+w/2) : (sideX>0 ? monBRight : monBLeft) + sideX
            y := (sideY=0) ? (y+h/2) : (sideY>0 ? monBBottom : monBTop) + sideY
            newm := wp_GetMonitorAt(x, y, m)
        }
        else
        {   ; Move to center (Numpad5)
            newm := m+1
            SysGet, mon, MonitorCount
            if (newm > mon)
                newm := 1
        }
    
        if (newm != m)
        {   m := newm
            ; Move to opposite side of monitor (left of a monitor is another monitor's right edge)
            sideX *= -1
            sideY *= -1
            ; Get new monitor's work area.
            gosub wp_CalcMonitorStats
        }
        else
        {   ; No monitor to move to, alternate size of window instead.
            if sideX
                widthFactor /= 2
            else if sideY
                heightFactor /= 2
            else
                widthFactor *= 1.5
        }
        
        ; Calculate new position for window.
        gosub wp_CalcNewSizeAndPosition
    }

    ; Restore before resizing...
    WinGet, state, MinMax
    if state
        WinRestore

    WinDelay := A_WinDelay
    SetWinDelay, 0
    
    if (is_resizable := wp_IsResizable())
    {
        ; Move and resize.
        WinMove,,, newx, newy, neww, newh
        
        ; Since some windows might be resizable but have restrictions,
        ; check that the window has sized correctly.  If not, adjust.
        WinGetPos, newx, newy, w, h
    }
    if (!is_resizable || (neww != w || newh != h))
    {
        ; If the window is smaller on a given axis, center it within
        ; the space.  Otherwise align to the appropriate side.
        newx := Round(newx + (neww-w)/2 * (1 + (w>neww)*sideX))
        newy := Round(newy + (newh-h)/2 * (1 + (h>newh)*sideY))
        ; Move but (usually) don't resize.
        WinMove,,, newx, newy, w, h
    }
    
    ; Explorer uses WM_EXITSIZEMOVE to detect when a user finishes moving a window
    ; in order to save the position for next time. May also be used by other apps.
    PostMessage, 0x232
    
    SetWinDelay, WinDelay
    
    wp_RememberPos(hwnd)
    return

wp_CalcNewSizeAndPosition:
    ; Calculate desired size.
    neww := restore_w != "" ? restore_w : Round(monWidth * widthFactor)
    newh := restore_h != "" ? restore_h : Round(monHeight * heightFactor)
    ; Fall through to below:
wp_CalcNewPosition:
    ; Calculate desired position.
    newx := restore_x != "" ? restore_x : Round(monLeft + (sideX+1) * (monWidth  - neww)/2) 
    newy := restore_y != "" ? restore_y : Round(monTop  + (sideY+1) * (monHeight - newh)/2)
    return

wp_CalcMonitorStats:
    ; Get work area (excludes taskbar-reserved space.)
    SysGet, mon, MonitorWorkArea, %m%
    monWidth  := monRight - monLeft
    monHeight := monBottom - monTop
    return
}


;
; WindowScreenMove: Move window between screens, preserving relative position and size.
;
WindowScreenMove(md, winTitle)
{
    if !wp_WinExist(winTitle)
        return
    
    SetWinDelay, 0

    WinGet, state, MinMax
    if state
        WinRestore

    WinGetPos, x, y, w, h
    
    ; Determine which monitor contains the center of the window.
    ms := wp_GetMonitorAt(x+w/2, y+h/2)
    
    SysGet, mc, MonitorCount

    ; Determine which monitor to move to.
    if md in ,N,Next
    {
        md := ms+1
        if (md > mc)
            md := 1
    }
    else if md in P,Prev,Previous
    {
        md := ms-1
        if (md < 1)
            md := mc
    }
    
    if (md=ms or (md+0)="" or md<1 or md>mc)
        return
    
    ; Get source and destination work areas (excludes taskbar-reserved space.)
    SysGet, ms, MonitorWorkArea, %ms%
    SysGet, md, MonitorWorkArea, %md%
    msw := msRight - msLeft, msh := msBottom - msTop
    mdw := mdRight - mdLeft, mdh := mdBottom - mdTop
    
    ; Calculate new size.
    if (wp_IsResizable()) {
        w := Round(w*(mdw/msw))
        h := Round(h*(mdh/msh))
    }
    
    ; Move window, using resolution difference to scale co-ordinates.
    WinMove,,, mdLeft + (x-msLeft)*(mdw/msw), mdTop + (y-msTop)*(mdh/msh), w, h

    if state = 1
        WinMaximize
}


;
; MaximizeToggle: Maximize or restore the window.
;
MaximizeToggle(winTitle)
{
    if wp_WinExist(winTitle)
    {
        WinGet, state, MinMax
        if state
            WinRestore
        else
            WinMaximize
    }
}


;
; GatherWindows: "Gather" windows on a specific screen.
;
GatherWindows(md)
{
    global ProcessGatherExcludeList
    
    SetWinDelay, 0
    
    ; List all visible windows.
    WinGet, win, List
    
    ; Copy bounds of all monitors to an array.
    SysGet, mc, MonitorCount
    Loop, %mc%
        SysGet, mon%A_Index%, MonitorWorkArea, %A_Index%
    
    if md = M
    {   ; Special exception for 'M', since the desktop window
        ; spreads across all screens.
        CoordMode, Mouse, Screen
        MouseGetPos, x, y
        md := wp_GetMonitorAt(x, y, 0)
    }
    else if md is not integer
    {   ; Support A, P and WinTitle.
        ; (Gather at screen containing specified window.)
        wp_WinExist(md)
        WinGetPos, x, y, w, h
        md := wp_GetMonitorAt(x+w/2, y+h/2, 0)
    }
    if (md<1 or md>mc)
        return
    
    ; Destination monitor
    mdx := mon%md%Left
    mdy := mon%md%Top
    mdw := mon%md%Right - mdx
    mdh := mon%md%Bottom - mdy
    
    Loop, %win%
    {
        ; If this window matches the GatherExclude group, don't touch it.
        if (WinExist("ahk_group GatherExclude ahk_id " . win%A_Index%))
            continue
        
        ; Set Last Found Window.
        if (!WinExist("ahk_id " . win%A_Index%))
            continue

        WinGet, procname, ProcessName
        ; Check process (program) exclusion list.
        if procname in %ProcessGatherExcludeList%
            continue
        
        WinGetPos, x, y, w, h
        
        ; Determine which monitor this window is on.
        xc := x+w/2, yc := y+h/2
        ms := 0
        Loop, %mc%
            if (xc >= mon%A_Index%Left && xc <= mon%A_Index%Right
                && yc >= mon%A_Index%Top && yc <= mon%A_Index%Bottom)
            {
                ms := A_Index
                break
            }
        ; If already on destination monitor, skip this window.
        if (ms = md)
            continue
        
        WinGet, state, MinMax
        if (state = 1) {
            WinRestore
            WinGetPos, x, y, w, h
        }
    
        if ms
        {
            ; Source monitor
            msx := mon%ms%Left
            msy := mon%ms%Top
            msw := mon%ms%Right - msx
            msh := mon%ms%Bottom - msy
            
            ; If the window is resizable, scale it by the monitors' resolution difference.
            if (wp_IsResizable()) {
                w *= (mdw/msw)
                h *= (mdh/msh)
            }
        
            ; Move window, using resolution difference to scale co-ordinates.
            WinMove,,, mdx + (x-msx)*(mdw/msw), mdy + (y-msy)*(mdh/msh), w, h
        }
        else
        {   ; Window not on any monitor, move it to center.
            WinMove,,, mdx + (mdw-w)/2, mdy + (mdh-h)/2
        }

        if state = 1
            WinMaximize
    }
}


;
; FillVirtualScreen: Expand the window to fill the virtual screen (all monitors).
;
FillVirtualScreen(winTitle)
{
    if hwnd := wp_WinExist(winTitle)
    {
        WinGetPos, x, y, w, h
        if !wp_IsWhereWePutIt(hwnd, x, y, w, h)
            wp_SetRestorePos(hwnd, x, y, w, h)
        ; Get position and size of virtual screen.
        SysGet, x, 76
        SysGet, y, 77
        SysGet, w, 78
        SysGet, h, 79
        ; Resize window to fill all...
        WinMove,,, x, y, w, h
        wp_RememberPos(hwnd)
    }
}


;
; Hotkeys: Activate hotkeys defined in INI section [Hotkeys: %section%].
;
Hotkeys(section, options)
{
    local this_hotkey, section_var, hotkeys, wait_for_keyup, m, m1, pos, k
    static key_regex = "^(?:.* & )?[#!^+&<>*~$]*(.+)"
    
    this_hotkey := A_ThisHotkey
    
    if !section
        goto HC_SendThisHotkeyAndReturn
    
    pos := RegExMatch(options, "i)(?<=\bD)\d*\.?\d*", m)
    if pos
    {
        options := SubStr(options, 1, pos-2) . SubStr(options, pos+StrLen(m))
        if (m+0 = "")
            m := 0.1
        Input, k, L1 T%m%
        if ErrorLevel != Timeout
        {
            gosub HC_SendThisHotkey
            Send %k%
            return
        }
    }
    
    section_var := RegExReplace(section, "[^\w#@$]", "_")
    hotkeys := Hotkeys_%section_var%
    
    if hotkeys =
    {
        ; Load each hotkeys section on first use. Since the ini file may be
        ; edited between enabling and disabling the hotkeys, loading them
        ; each and every time would be hazardous.
        hotkeys := wp_INI_ReadSection(WINDOWPAD_INI_PATH, "Hotkeys: " section)
        if hotkeys =
            goto HC_SendThisHotkeyAndReturn
        
        ; key=command  ->  key::command
        hotkeys := RegExReplace(hotkeys, "m`a)^(.*?)=", "$1::")
        
        Hotkeys_%section_var% := hotkeys
    }
        
    ; If Options were omitted and this is a key-down hotkey,
    ; automatically disable the hotkeys when the key is released.
    if (wait_for_keyup := (options="" && SubStr(this_hotkey,-2) != " up"))
        options = On ; Explicit "on" in case hotkey exists but is disabled.
    
    Hotkey, IfWinNotActive, ahk_group HotkeyExclude
    Hotkey_Params(hotkeys, options)
    
    if (wait_for_keyup)
    {
        if (!RegExMatch(this_hotkey, key_regex, m) || GetKeyState(m1)="") {
            MsgBox, % "Error retrieving primary key of hotkey in Hotkeys().`n"
                    . "`tHotkey: " this_hotkey "`n"
                    . "`tResult: " m1
                    . "`nPlease inform Lexikos. Tip: Press Ctrl+C to copy this message."
            return
        }
        
        KeyWait, %m1%
        
        Hotkey_Params(hotkeys, "Off")

        ; A_ThisHotkey: "The key name of the *most recently executed* hotkey"
        ;if(some other hotkey was executed during KeyWait)
        if (this_hotkey = A_ThisHotkey)
            goto HC_SendThisHotkeyAndReturn
    }
    return

HC_SendThisHotkey:
HC_SendThisHotkeyAndReturn:
    if ! InStr(this_hotkey, "~")
        if (RegExMatch(this_hotkey, key_regex, m) && GetKeyState(m1)!="") {
            Hotkey, %this_hotkey%, Off
            Send {Blind}{%m1%}
            Hotkey, %this_hotkey%, On
        }
    return
}


;
; Commands implemented as labels for simplicity.
;
Send:
    Send, %Params%
    return
Minimize:
    if wp_WinExist(Params)
        PostMessage, 0x112, 0xF020  ; WM_SYSCOMMAND, SC_MINIMIZE
    return
Unminimize:
    if wp_WinLastMinimized()
        WinRestore
    return
Restore:
    if wp_WinExist(Params)
        WinRestore
    return


;
; Internal Functions
;

wp_IsWhereWePutIt(hwnd, x, y, w, h)
{
    if wp_GetProp(hwnd,"wpHasRestorePos")
    {   ; Window has restore info. Check if it is where we last put it.
        last_x := wp_GetProp(hwnd,"wpLastX")
        last_y := wp_GetProp(hwnd,"wpLastY")
        last_w := wp_GetProp(hwnd,"wpLastW")
        last_h := wp_GetProp(hwnd,"wpLastH")
        return (last_x = x && last_y = y && last_w = w && last_h = h)
    }
    return false
}

wp_RememberPos(hwnd)
{
    WinGetPos, x, y, w, h, ahk_id %hwnd%
    ; Remember where we put it, to detect if the user moves it.
    wp_SetProp(hwnd,"wpLastX",x)
    wp_SetProp(hwnd,"wpLastY",y)
    wp_SetProp(hwnd,"wpLastW",w)
    wp_SetProp(hwnd,"wpLastH",h)
}

wp_SetRestorePos(hwnd, x, y, w, h)
{
    ; Next time user requests the window be "restored" use this position and size.
    wp_SetProp(hwnd,"wpHasRestorePos",true)
    wp_SetProp(hwnd,"wpRestoreX",x)
    wp_SetProp(hwnd,"wpRestoreY",y)
    wp_SetProp(hwnd,"wpRestoreW",w)
    wp_SetProp(hwnd,"wpRestoreH",h)
}

; Execute a pseudo-command with params.
wp_ExecLine(cmdline)
{
    if RegExMatch(cmdline, "^\s*(?<Name>\S+?)(?:[, `t]\s*(?<Params>.*?))?\s*$", a)
    {
        global Params := aParams  ; Global for use by label-based pseudo-commands.
        if (n := IsFunc(aName)) && n <= 6
        {   ; %aName% is a function with up to 5 params.
            if n > 2
            {   ; Two or more required parameters.
                if RegExMatch(aParams, "^(?:[^,]*,){1," n-2 "}\s*", aParams)
                    StringSplit, p, aParams, `,, %A_Space%%A_Tab%
                else ; no comma
                    p0 := 1
                p%p0% := SubStr(Params, StrLen(aParams) + 1)
            }
            else
                ; At most one required parameter.
                p1 := Params
            ; Call function with values supplied for only the required params.
            ; This allows commas to be treated literally in the last param.
            return %aName%(p1, p2, p3, p4, p5)
        }
        else
            ; aName is a label or invalid.
            gosub %aName%
    }
}

; Get the index of the monitor containing the specified x and y co-ordinates.
wp_GetMonitorAt(x, y, default=1)
{
    SysGet, m, MonitorCount
    ; Iterate through all monitors.
    Loop, %m%
    {   ; Check if the window is on this monitor.
        SysGet, Mon, Monitor, %A_Index%
        if (x >= MonLeft && x <= MonRight && y >= MonTop && y <= MonBottom)
            return A_Index
    }

    return default
}

; Get/set window property. type should be int, uint or float.
wp_GetProp(hwnd, property_name, type="int") {
    return DllCall("GetProp", "uint", hwnd, "str", property_name, type)
}
wp_SetProp(hwnd, property_name, data, type="int") {
    return DllCall("SetProp", "uint", hwnd, "str", property_name, type, data)
}

; Determine if we should attempt to resize the last found window.
wp_IsResizable()
{
    WinGetClass, Class
    if Class in Chrome_XPFrame,MozillaUIWindowClass
        return true
    WinGet, Style, Style
    return (Style & 0x40000) ; WS_SIZEBOX
}

; Custom WinExist() for implementing a couple extra "special" values.
wp_WinExist(WinTitle)
{
    if WinTitle = P
        return wp_WinPreviouslyActive()
    if WinTitle = M
    {
        MouseGetPos,,, win
        return WinExist("ahk_id " win)
    }
    if WinTitle = _
        return wp_WinLastMinimized()
    return WinExist(WinTitle!="" ? WinTitle : "A")
}

; Get next window beneath the active one in the z-order.
wp_WinPreviouslyActive()
{
    active := WinActive("A")
    WinGet, win, List

    ; Find the active window.
    ; (Might not be win1 if there are always-on-top windows?)
    Loop, %win%
        if (win%A_Index% = active)
        {
            if (A_Index < win)
                N := A_Index+1
            
            ; hack for PSPad: +1 seems to get the document (child!) window, so do +2
            ifWinActive, ahk_class TfPSPad
                N += 1
            
            break
        }

    ; Use WinExist to set Last Found Window (for consistency with WinActive())
    return WinExist("ahk_id " . win%N%)
}

; Get most recently minimized window.
wp_WinLastMinimized()
{
    WinGet, w, List

    Loop %w%
    {
        wi := w%A_Index%
        WinGet, m, MinMax, ahk_id %wi%
        if m = -1 ; minimized
        {
            lastFound := wi
            break
        }
    }

    return WinExist("ahk_id " . (lastFound ? lastFound : 0))
}


; Hotkey_Params( line [, Options ] )
;   Associates a hotkey with a parameter string.
;
; Expects a newline(`n)-delimited list of hotkeys in the form:
;   Hotkey:: LabelName, Params
;
; Note:
;   - Spaces are optional.
;   - As with hotkey labels, there should be no space between 'Hotkey' and '::'.
;   - Unlike the Hotkey command, LabelName MUST NOT be omitted.
;   - Params MUST NOT contain a newline character (`n).
;   - Params may contain zero or more commas.
;   - , (comma) is supported as a hotkey.
;   - Unlike the Hotkey command, 'Toggle' should be specified in the Options, not as a label.
;
; Returns the number of hotkeys successfully enabled/disabled.
;
Hotkey_Params(line, Options="")
{
    static List ; List of hotkeys and associated labels + parameters.
        , sCmdLine ; temp var used by hotkey subroutine.
    
    count = 0
    
    ; Note: The parsing loop operates on a temporary copy of 'line',
    ;       so 'line' can be (and is) reused within the loop.
    
    Loop, Parse, line, `n, %A_Space%%A_Tab%
    {
        ; Clear ErrorLevel in case UseErrorLevel is (not) specified.
        ErrorLevel =

        if ! RegExMatch(A_LoopField, "^\s*(?<Hotkey>.+?)::\s*(?<Name>.+?)(?:[, `t]\s*(?<Params>.*?))?\s*$", line)
            continue
        
        if !(IsLabel(lineName) || IsFunc(lineName))
            continue
        
        if Options = Toggle ; Not supported as an option (must be Label.)
        {
            ; Toggle hotkey.  If it doesn't exist, the next line will enable it.
            Hotkey, %lineHotkey%, Toggle, UseErrorLevel
            ; Ensure the hotkey will execute the correct label.
            Hotkey, %lineHotkey%, hp_ExecuteHotkeyWithParams, UseErrorLevel
        } else
            Hotkey, %lineHotkey%, hp_ExecuteHotkeyWithParams, %Options%
        
        ; Check ErrorLevel in case UseErrorLevel was specified.
        if ErrorLevel
            continue
        
        ; Rebuild line to remove whitespace.
        line := lineHotkey "::" lineName "," lineParams
        
        ; Update an existing hotkey's label + params,
        temp := RegExReplace(List, "m`n)^\Q" lineHotkey "\E::.*$", line, repl, 1)
        if (repl > 0)
            List := temp
        else    ; or add a new hotkey to the list.
            List .= (List ? "`n" : "") . line

        count += 1
    }
    return count

hp_ExecuteHotkeyWithParams:
    if RegExMatch(List, "m`n)^\Q" A_ThisHotkey "\E::\K.*", sCmdLine)
        wp_ExecLine(sCmdLine)
return
}



;
; Tray Icon Override:
;   Provides a way to customize the icons without compiling the script.
;

WM_COMMAND(wParam, lParam)
{
    static IsPaused, IsSuspended
    Critical
    id := wParam & 0xFFFF
    if id in 65305,65404,65306,65403
    {  ; "Suspend Hotkeys" or "Pause Script"
        if id in 65306,65403  ; pause
            IsPaused := ! IsPaused
        else  ; at this point, A_IsSuspended has not yet been toggled.
            IsSuspended := ! A_IsSuspended
        wp_SetTrayIcon(!(IsPaused or IsSuspended))
    }
}

wp_SetTrayIcon(is_enabled)
{
    icon := is_enabled ? "Wynshaft.ico" : "Wynshaft.ico"
    icon = %A_ScriptDir%\icons\%icon%

    ; avoid an error message if the icon doesn't exist
    IfExist, %icon%
        Menu, TRAY, Icon, %icon%,, 1
}

;----------------------------------------
;		WindowPad Edit >>>>>> End
;----------------------------------------





;----------------------------------------
;		ALT Window Drag >>>>>> Start
;----------------------------------------


Alt & LButton::
CoordMode, Mouse  ; Switch to screen/absolute coordinates.
MouseGetPos, EWD_MouseStartX, EWD_MouseStartY, EWD_MouseWin
WinGetPos, EWD_OriginalPosX, EWD_OriginalPosY,,, ahk_id %EWD_MouseWin%
WinGet, EWD_WinState, MinMax, ahk_id %EWD_MouseWin% 
if EWD_WinState = 0  ; Only if the window isn't maximized 
    SetTimer, EWD_WatchMouse, 10 ; Track the mouse as the user drags it.
return

EWD_WatchMouse:
GetKeyState, EWD_LButtonState, LButton, P
if EWD_LButtonState = U  ; Button has been released, so drag is complete.
{
    SetTimer, EWD_WatchMouse, off
    return
}
GetKeyState, EWD_EscapeState, Escape, P
if EWD_EscapeState = D  ; Escape has been pressed, so drag is cancelled.
{
    SetTimer, EWD_WatchMouse, off
    WinMove, ahk_id %EWD_MouseWin%,, %EWD_OriginalPosX%, %EWD_OriginalPosY%
    return
}

; Otherwise, reposition the window to match the change in mouse coordinates
; caused by the user having dragged the mouse:

CoordMode, Mouse
MouseGetPos, EWD_MouseX, EWD_MouseY
WinGetPos, EWD_WinX, EWD_WinY,,, ahk_id %EWD_MouseWin%
SetWinDelay, -1   ; Makes the below move faster/smoother.
WinMove, ahk_id %EWD_MouseWin%,, EWD_WinX + EWD_MouseX - EWD_MouseStartX, EWD_WinY + EWD_MouseY - EWD_MouseStartY
EWD_MouseStartX := EWD_MouseX  ; Update for the next timer-call to this subroutine.
EWD_MouseStartY := EWD_MouseY
return

;----------------------------------------
;		ALT Window Drag >>>>>> End
;----------------------------------------





;----------------------------------------
;		Capslock Controls >>>>>> Start
;----------------------------------------

SetCapsLockState, AlwaysOff


CapsLock & i::
       if getkeystate("alt") = 0
               Send,{Up}
       else
               Send,+{Up}
return

CapsLock & l::
       if getkeystate("alt") = 0
               Send,{Right}
       else
               Send,+{Right}
return

CapsLock & j::
       if getkeystate("alt") = 0
               Send,{Left}
       else
               Send,+{Left}
return

CapsLock & k::
       if getkeystate("alt") = 0
               Send,{Down}
       else
               Send,+{Down}
return

CapsLock & ,::
       if getkeystate("alt") = 0
               Send,^{Down}
       else
               Send,+^{Down}
return

CapsLock & 8::
       if getkeystate("alt") = 0
               Send,^{Up}
       else
               Send,+^{Up}
return

CapsLock & u::
       if getkeystate("alt") = 0
               Send,{Home}
       else
               Send,+{Home}
return

CapsLock & o::
       if getkeystate("alt") = 0
               Send,{End}
       else
               Send,+{End}
return

CapsLock & H::
       if getkeystate("alt") = 0
               Send,^{Left}
       else
               Send,+^{Left}
return

CapsLock & '::                         
		if getkeystate("alt") = 0
			Send,^{Right}
		else
			Send,+^{Right}
return

CapsLock & SC027::
      if getkeystate("alt") = 0 
			Send,^{Right}
		else
			Send,+^{Right}
return

CapsLock & BS::Send,{Del}
CapsLock & b::Send ^x
CapsLock & x::Send ^x
CapsLock & n::Send ^c
CapsLock & c::Send ^c
CapsLock & m::Send ^v
CapsLock & v::Send ^v
CapsLock & -::Send, #{Down}
CapsLock & =::Send, #{Up}
CapsLock & d::Send ^d
CapsLock & s::Send ^s
CapsLock & a::Send ^a
CapsLock & z::Send ^z
CapsLock & y::Send ^y
CapsLock & q::WinClose, A
return
If ! errorLevel {
    ;~ #IfWinExist, CCNav
    ;~ WinActivate
    IfExist, D:\Dropbox\C Drive\AutoHotKey\CCNav\Home\ccnav.ahk
	Run, D:\Dropbox\C Drive\AutoHotKey\CCNav\Home\ccnav.ahk
	Return
} else {
	Return
}

;Prevents CapsState-Shifting
CapsLock & Space::Send,{Del}

Capslock::SetCapsLockState, AlwaysOff
+Capslock::SetCapsLockState, Off

;----------------------------------------
;		Capslock Controls >>>>>> End
;----------------------------------------


SetCapsLockState, AlwaysOff


;----------------------------------------
;		Shortcut Controls >>>>>> Start
;----------------------------------------

;--------------------------------------------------------

LAlt & RAlt:: 
FileRecycleEmpty
MsgBox,,, Recycle Bin Emptied!, 2
return
;--------------------------------------------------------

#g:: run, http://www.google.com
return

;--------------------------------------------------------

#m:: run, http://www.gmail.com
return

;--------------------------------------------------------

#t:: run, http://www.thesaurus.com
return

;--------------------------------------------------------

#f:: run, http://www.facebook.com
return

;--------------------------------------------------------

#s:: run, http://www.speedtest.net
return

;--------------------------------------------------------

; Windows Key + n opens notepad++
#n::
Run notepad++
return

;--------------------------------------------------------

; Windows Key + w opens WinSCP
#w::
Run C:\Program Files (x86)\WinSCP\WinSCP.exe
return

;--------------------------------------------------------

; Windows Key + a opens Aptana Studio 3
#a::
Run C:\Users\WYNSHAFT\AppData\Local\Aptana Studio 3\AptanaStudio3.exe
return

;--------------------------------------------------------

; Windows Key + e opens Eclipse IDE
#e::
Run C:\eclipse\eclipse.exe
return

;--------------------------------------------------------

; ` opens everything
`::
Run C:\Program Files\Everything\Everything.exe
return

;--------------------------------------------------------


End::!F4

;--------------------------------------------------------

RCtrl::#F2

;--------------------------------------------------------

RAlt::#F3

;--------------------------------------------------------

; If everything is the target window escape key will close it
#IfWinActive Everything
Escape::
WinMinimize
return

;--------------------------------------------------------

#p::PrintScreen

;--------------------------------------------------------

;----------------------------------------
;		Shortcut Controls >>>>>> Start
;----------------------------------------










;----------------------------------------
;		Keyboard Edit >>>>>> END
;----------------------------------------

;                                                        
;           b   A                                                       
;           $b  Vb.                                                     
;           '$b  V$b.                                                   
;            $$b  V$$b.                                                 
;            '$$b. V$$$$oooooooo.         ..                             
;             '$$P* V$$$$$""**$$$b.    .o$$P                             
;              " .oooZ$$$$b..o$$$$$$$$$$$$C                             
;              .$$$$$$$$$$$$$$$$$$$$$$$$$$$b.                           
;              $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$                           
;        .o$$$o$$$$$$$$P""*$$$$$$$$$P"""*$$$P                           
;       .$$$**$$$$P"q$C    "$$$b        .$$P                             
;       $$P   "$$$b  "$ . .$$$$$b.      *"                               
;       $$      $$$.     "***$$$$$$$b. A.                               
;       V$b   . Z$$b.  .       "*$$$$$b$$:                               
;        V$$.  "*$$$b.  b.         "$$$$$                               
;         "$$b     "*$.  *b.         "$$$b                               
;           "$$b.     "L  "$$o.        "*"     .ooo..                   
;             "*$$o.        "*$$o.          .o$$$$$$$$b.                 
;                 "*$$b.       "$$b.       .$$$$$*"   ""*.               
;                    "*$$o.      "$$$o.    $$$$$'                       
;                       "$$o       "$$$b.  "$$$$   ...oo..               
;                         "$b.      "$$$$b. "$$$$$$$P*"""""             
;                        . "$$       "$$$$b  "$$$$P"                     
;                         L."$.      .$$$$$.  $$$$                       
;          ..              $$$;      o$$$$$$  $$$$                       
;       . $.l              "$$'    .$$$$$$$P  $$$P                       
;     .I .$b b '.           "P   .P*""*$$$$;  $$$                       
;   .$P  $$o ". ".  .        " ."      $$$$   $$;                       
;  .$$;  $$$. "A "$. ".       '       o$$$P  .$P                         
; .$$$b  $$$$. *$. "$$$$o.          .$$$$P   $"                         
;.$$$$$  $$$$$. "$$o."**$$$$o.'  .o$$$$P"    P                           
;$$P"$$b $$$$$$o  "*$$$$boooooc$$$$$$$P"   .                             
;$$  $$$."$$$"*$$.   "$$$$$$$$$$$$$$$$C  .o"                             
;I"  $P"$."$$b. "*$.    "**$$$$$*"*$$$$$$$"                             
;'   $  "$."$$$.   ""'              "*$$*                               
;    $.   "."$$$$o                                                   
;    "I       "$$$$b. .                                                 
;                "$$$b."$o.                                             
;                  "*$$."$$$o.       
;                    "$$o $$$$b.                                         
;                     '$$o'$$$$$b.                                       
;                      '$$.'$$$**$o                                     
;                       '$$.$$$. '$$                                     
;                        $$; $$$o. "$.                                   
;                        "$: $$ "*o  ".                                 
;                     L   $$ $P    l  '.                                 
;                     $. .$$ $;                                         
;                     ;$.$$P $                                           
;                     "$$$$ P'      
;                      $$$;:                                             
;                      $$P                                               
;                     o$P                                               
;                     $P                                                 
;                     I' 


;_______ad88888888888888888888888a, 
;________a88888"8888888888888888888888, 
;______,8888"__"P88888888888888888888b, 
;______d88_________`""P88888888888888888, 
;_____,8888b_______________""88888888888888, 
;_____d8P'''__,aa,______________""888888888b 
;_____888bbdd888888ba,__,I_________"88888888, 
;_____8888888888888888ba8"_________,88888888b 
;____,888888888888888888b,________,8888888888 
;____(88888888888888888888,______,88888888888, 
;____d888888888888888888888,____,8___"8888888b 
;____88888888888888888888888__.;8'"""__(888888 
;____8888888888888I"8888888P_,8"_,aaa,__888888 
;____888888888888I:8888888"_,8"__`b8d'__(88888 
;____(8888888888I'888888P'_,8)__________88888 
;_____88888888I"__8888P'__,8")__________88888 
;_____8888888I'___888"___,8"_(._.)_______88888 
;_____(8888I"_____"88,__,8"_____________,8888P 
;______888I'_______"P8_,8"_____________,88888) 
;_____(88I'__________",8"__M""""""M___,888888' 
;____,8I"____________,8(____"aaaa"___,8888888 
;___,8I'____________,888a___________,8888888) 
;__,8I'____________,888888,_______,888888888 
;_,8I'____________,8888888'`-===-'888888888' 
;,8I'____________,8888888"________88888888" 
;8I'____________,8"____88_________"888888P 
;8I____________,8'_____88__________`P888" 
;8I___________,8I______88____________"8ba,. 
;(8,_________,8P'______88______________88""8bma,. 
;_8I________,8P'_______88,______________"8b___""P8ma, 
;_(8,______,8d"________`88,_______________"8b_____`"8a 
;__8I_____,8dP_________,8X8,________________"8b.____:8b 
;__(8____,8dP'__,I____,8XXX8,________________`88,____8) 
;___8,___8dP'__,I____,8XxxxX8,_____I,_________8X8,__,8 
;___8I___8P'__,I____,8XxxxxxX8,_____I,________`8X88,I8 
;___I8,__"___,I____,8XxxxxxxxX8b,____I,________8XXX88I, 
;___`8I______I'__,8XxxxxxxxxxxxXX8____I________8XXxxXX8, 
;____8I_____(8__,8XxxxxxxxxxxxxxxX8___I________8XxxxxxXX8, 
;___,8I_____I[_,8XxxxxxxxxxxxxxxxxX8__8________8XxxxxxxxX8, 
;___d8I,____I[_8XxxxxxxxxxxxxxxxxxX8b_8_______(8XxxxxxxxxX8, 
;___888I____`8,8XxxxxxxxxxxxxxxxxxxX8_8,_____,8XxxxxxxxxxxX8 
;___8888,____"88XxxxxxxxxxxxxxxxxxxX8)8I____.8XxxxxxxxxxxxX8 
;__,8888I_____88XxxxxxxxxxxxxxxxxxxX8_`8,__,8XxxxxxxxxxxxX8" 
;__d88888_____`8XXxxxxxxxxxxxxxxxxX8'__`8,,8XxxxxxxxxxxxX8" 
;__888888I_____`8XXxxxxxxxxxxxxxxX8'____"88XxxxxxxxxxxxX8" 
;__88888888bbaaaa88XXxxxxxxxxxxXX8)______)8XXxxxxxxxxXX8" 
;__8888888I,_``""""""8888888888888888aaaaa8888XxxxxXX8" 
;__(8888888I,______________________.__```"""""88888P" 
;___88888888I,___________________,8I___8,_______I8" 
;____"""88888I,________________,8I'____"I8,____;8" 
;___________`8I,_____________,8I'_______`I8,___8) 
;____________`8I,___________,8I'__________I8__:8' 
;_____________`8I,_________,8I'___________I8__:8 
;______________`8I_______,8I'_____________`8__(8 
;_______________8I_____,8I'________________8__(8; 
;_______________8I____,8"__________________I___88, 
;______________.8I___,8'_______________________8"8, 
;______________(PI___'8_______________________,8,`8, 
;_____________.88'____________,@@___________.a8X8,`8, 
;_____________(88_____________@@@_________,a8XX888,`8, 
;____________(888_____________@@'_______,d8XX8"__"b_`8, 
;___________.8888,_____________________a8XXX8"____"a_`8, 
;__________.888X88___________________,d8XX8I"______9,_`8, 
;_________.88:8XX8,_________________a8XxX8I'_______`8__`8, 
;________.88'_8XxX8a_____________,ad8XxX8I'________,8___`8, 
;________d8'__8XxxxX8ba,______,ad8XxxX8I"__________8__,__`8, 
;_______(8I___8XxxxxxX888888888XxxxX8I"____________8__II__`8 
;_______8I'___"8XxxxxxxxxxxxxxxxxxX8I'____________(8__8)___8; 
;______(8I_____8XxxxxxxxxxxxxxxxxX8"______________(8__8)___8I 
;______8P'_____(8XxxxxxxxxxxxxxX8I'________________8,_(8___:8 
;_____(8'_______8XxxxxxxxxxxxxxX8'_________________`8,_8____8 
;_____8I________`8XxxxxxxxxxxxX8'___________________`8,8___;8 
;_____8'_________`8XxxxxxxxxxX8'_____________________`8I__,8' 
;_____8___________`8XxxxxxxxX8'_______________________8'_,8' 
;_____8____________`8XxxxxxX8'________________________8_,8' 
;_____8_____________`8XxxxX8'________________________d'_8' 
;_____8______________`8XxxX8_________________________8_8' 
;_____8________________"8X8'_________________________"8" 
;_____8,________________`88___________________________8 
;_____8I________________,8'__________________________d) 
;_____`8,_______________d8__________________________,8 
;______(b_______________8'_________________________,8' 
;_______8,_____________dP_________________________,8' 
;_______(b_____________8'________________________,8' 
;________8,___________d8________________________,8' 
;________(b___________8'_______________________,8' 
;_________8,_________a8_______________________,8' 
;_________(b_________8'______________________,8' 
;__________8,_______,8______________________,8' 
;__________(b_______8'_____________________,8' 
;___________8,_____,8_____________________,8' 
;___________(b_____8'____________________,8' 
;____________8,___d8____________________,8' 
;____________(b__,8'___________________,8' 
;_____________8,,I8___________________,8' 
;_____________I8I8'__________________,8' 
;_____________`I8I__________________,8' 
;______________I8'_________________,8' 
;______________"8_________________,8' 
;______________(8________________,8' 
;______________8I_______________,8' 
;______________(b,___8,________,8) 
;______________`8I___"88______,8i8, 
;_______________(b,__________,8"8") 
;_______________`8I__,8______8)_8_8 
;________________8I__8I______"__8_8 
;________________(b__8I_________8_8 
;________________`8__(8,________b_8, 
;_________________8___8)________"b"8, 
;_________________8___8(_________"b"8 
;_________________8___"I__________"b8, 
;_________________8________________`8) 
;_________________8_________________I8 
;_________________8_________________(8 
;_________________8,_________________8, 
;_________________Ib_________________8) 
;_________________(8_________________I8 
;__________________8_________________I8 
;__________________8_________________I8 
;__________________8,________________I8 
;__________________Ib________________8I 
;__________________(8_______________(8' 
;___________________8_______________I8 
;___________________8,______________8I 
;___________________Ib_____________(8' 
;___________________(8_____________I8 
;___________________`8_____________8I 
;____________________8____________(8' 
;____________________8,___________I8 
;____________________Ib___________8I 
;____________________(8___________8' 
;_____________________8,_________(8 
;_____________________Ib_________I8 
;_____________________(8_________8I 
;______________________8,________8' 
;______________________(b_______(8 
;_______________________8,______I8 
;_______________________I8______I8 
;_______________________(8______I8 
;________________________8______I8, 
;________________________8______8_8, 
;________________________8,_____8_8' 
;_______________________,I8_____"8" 
;______________________,8"8,_____8, 
;_____________________,8'_`8_____`b 
;____________________,8'___8______8, 
;___________________,8'____(a_____`b 
;__________________,8'_____`8______8, 
;__________________I8/______8______`b, 
;__________________I8-/_____8_______`8, 
;__________________(8/-/____8________`8, 
;___________________8I/-/__,8_________`8 
;___________________`8I/--,I8________-8) 
;____________________`8I,,d8I_______-8) 
;______________________"bdI"8,_____-I8 
;___________________________`8,___-I8' 
;____________________________`8,,--I8 
;_____________________________`Ib,,I8 
;______________________________`I8I


SetCapsLockState, AlwaysOff