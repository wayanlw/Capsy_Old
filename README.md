Using the Useless CapsLock key to achive efficiency, staying in the home row.

Functionality:
- Deactivates capslock for normal (accidental) use.
- Hold Capslock and drag anywhere in a window to move it (not just the title bar).
- Access the following functions when pressing Capslock:
Cursor keys - J, K, L, I (Normal mode) or HJKL (vim Mode)
Enter - ;
Home, PgDn, PgUp, End - Y, O, U, P (Normal mode) or O,U,I,O (VimMode)
      Save - A
      Cut, copy, paste - S, D, F
      Esc - Q
      Ctrl - LAlt
      Shift - Tab or Space
      Backspace and Del - N, M
      F2 (For Excel) - B
      Undo, redo - , and .
      Numpad at the right hand resting position when holding Ctrl+Shift+Alt (using keys m,.jkluio and spacebar)
      Toggle caps lock -  WinKey + Capslock
This is created with a combination of keybindings adopted from different users. Credits to
Daniel Kvarfordt - https://gist.github.com/Danik/5808330
ThatOneCoder - https://github.com/ThatOneCoder/ahk/blob/master/Wynshaft.ahk.txt
Gustavo Duarte: http://duartes.org/gustavo/blog/post/home-row-computing


## Mouse Functionality
#### Normal mouse with the keyboard (8 shortcuts)
Whilst holding the Right Shift key movve use qwerasdfzxcv keys for mouse functionality


| #   | Shortcut                    | Function            |
| --- | --------------------------- | ------------------- |
| 1   | RShift + E                  | move up             |
| 2   | RShift + D                  | move down           |
| 3   | RShift + S                  | Move left           |
| 4   | RShift + F                  | Move right          |
| 5   | RShift + W                  | Scroll down         |
| 6   | RShift + R                  | Scroll up           |
| 7   | RShift + Space / Rshift + ; | Left Button         |
| 8   | RShift + '                  | Control Left button |

#### Quickly move mouse cursor in the screen (7 shortcuts)

| #   | Shortcut   | Function      |
| --- | ---------- | ------------- |
| 1   | RShift + q | Top Left      |
| 2   | RShift + t | Top Right     |
| 3   | RShift + a | Middle Left   |
| 4   | RShift + c | Middle Center |
| 5   | RShift + g | Middle Right  |
| 6   | RShift + z | Bottom Left   |
| 7   | RShift + b | Bottom Right  |

#### Mapping the Real mouse buttons (4 shortcuts)
These button's are helpful when you're using the keyboard from your lefthand and mouse from your right hand. Enter and Delete keys are used very often in this situation.


| #   | Shortcut          | Function    |
| --- | ----------------- | ----------- |
| 1   | Side Button Up    | Enter       |
| 2   | Side Button Down  | Delete      |
| 3   | Mouse wheel left  | Scroll Left |
| 4   | Mouse wheel Right | Sroll right |

#### Hotkeys to be used in Microsoft Excel

| Excel Function                              | Shortcut           | Simulated Keys         |
| ------------------------------------------- | ------------------ | ---------------------- |
| Trace Precedents                            | capslock + 1       | {Ctrl}[                |
| Trace Dependants                            | capslock + 2       | {F5}{Enter}            |
| Equals                                      | capslock + 3       | {=}                    |
| Plus                                        | capslock + 4       | {+}                    |
| Calculate formulat inside the cell          | capslock + 5       | {F9}                   |
|                                             |                    |                        |
| Paste as values                             | {Ctrl}{Alt}v       | {Ctrl}{Alt}v{v}{enter} |
| Paste forumulas                             | {Ctrl}{Alt}f       | {Ctrl}{Alt}v{f}{enter} |
| Paste formatting                            | {Ctrl}{Alt}t       | {Ctrl}{Alt}v{t}{enter} |
| Paste Links                                 | {Ctrl}{Alt}z       | {Ctrl}{Alt}v{l}        |
|                                             |                    |                        |
| Conditional formatting data bars            | {Ctrl}{Alt}s       | {Alt}H{L}{d}{enter}    |
| Conditional formatting color scales         | {Ctrl}{Alt}d       | {Alt}H{L}{s}{enter}    |
| Clear conditional formatting from selection | {Ctrl}{Alt}x       | {Alt}H{L}{c}{s}{enter} |
|                                             |                    |                        |
| Move to the top cell in range               | Capslock + u       | {Ctrl}{up}             |
| Select to the top cell in range             | Capslock + tab + u | {Ctrl}{Shift}{up}      |
| Move to the bottom cell in Range            | Capslock + o       | {Ctrl}{Down}           |
| Select to the  bottom cell in Range         | Capslock + tab + o | {Ctrl}{Shift}{Down}    |
|                                             |                    |                        |
| Go to previous sheet                        | Capslock + [       | {Ctrl}{pgup}           |
| Go to next sheet                            | Capslock + ]       | {Ctrl}{pgDn}           |
|                                             |                    |                        |
| Copy horizontally                           | Capslock + b:      | {Ctrl}d                |
| Copy vertically                             | Capslock + t:      | {Ctrl}r                |
|                                             |                    |                        |
| Edit in cell                                | Capslock + g:      | {F2}                   |
|                                             |                    |                        |
| Minus                                       | capslock + F1      | {-}                    |
| Plus                                        | capslock + F2      | {+}                    |
| Mulitply                                    | capslock + F3      | {*}                    |
| Divide                                      | capslock + F4      | {/}                    |


#### Toggle Caps lock
| #    |  Function           |  Shortcut      |
|------|---------------------|----------------|
|      | Toggle Capslock key | win + capslock |


#### Letter keybindings in order of the place in the keyboard

| Shift (Can be used in combinations)  | Capslock & Tab               | Shift                                   |
|--------------------------------------|------------------------------|-----------------------------------------|
|                                      |                              |                                         |
| Escape                               | Capslock & q                 | {Esc}                                   |
| Launcher Functionality Covered later | Capslock & w                 | Launcher                                |
| Undo                                 | Capslock & e                 | {Ctrl}z  This has repetiti              |
| Redo                                 | Capslock & r                 | {Ctrl}y  redo                           |
| Select and Copy proceding word       | capslock & t                 | {Ctrl}{Left}{Shift}{Ctrl}{Right}{Ctrl}c |
| Delete proceding word                | capslock & t (pressed twice) | {Ctrl}{Left}{Shift}{Ctrl}{Right}{del}   |
| Home                                 | Capslock & y                 | {Home}                                  |
| Page Up                              | Capslock & u                 | {pgUp}                                  |
| Up Arrow                             | Capslock & i                 | {Up}                                    |
| Page Down                            | Capslock & o                 | {pgDn}                                  |
| End Arrow                            | Capslock & p                 | {End}                                   |
| {                                    | Capslock & [                 | {                                       |
| }                                    | Capslock & ]                 | }                                       |
| |                                    | Capslock & \                 | |                                       |
|                                      |                              |                                         |
| Save                                 | Capslock & a                 | {Ctrl}s                                 |
| Save as                              | Capslock & a (pressed twice) | {Ctrl}{Shift}s                          |
| Cut                                  | Capslock & s                 | {Ctrl}x                                 |
| Copy                                 | Capslock & d                 | {Ctrl}c                                 |
| Paste                                | Capslock & f                 | {Ctrl}v                                 |
| Copy Line                            | Capslock & g                 | {Home}{Shift}{End}{Ctrl}c               |
| Delete Line                          | Capslock & g (pressed twice) | {Home}{Shift}{End}{del}                 |
| Ctrl + Left Arrow                    | Capslock & h                 | {Ctrl}{Left}                            |
| Left Arrow                           | Capslock & j                 | {Left}                                  |
| Down Arrow                           | Capslock & k                 | {Down}                                  |
| Right Arrow                          | Capslock & l                 | {Right}                                 |
| Ctrl + Rigth Arrow                   | Capslock & S                 | {Ctrl}{Right}                           |
|                                      |                              |                                         |
| Cycle open applications              | Capslock & z                 | {Alt}{Tab}                              |
| Select all                           | Capslock & c                 | {Ctrl}a{Ctrl}c                          |
| Delete all                           | Capslock & c (Pressed Twice) | {Ctrl}a{del}                            |
| Delete                               | Capslock & v                 | {Delete}                                |
| BackSpace                            | Capslock & b                 | {BS}                                    |
| BackSpace                            | Capslock & n                 | {BS}                                    |
| Backspace preceding word             | Capslock & m                 | {Ctrl}{BS}                              |
| Delete                               | Capslock & ,                 | {Delete}                                |
| Delete the next word                 | Capslock & .                 | {Ctrl}{Delete}                          |
| Find                                 | Capslock & /                 | {Ctrl}f                                 |


####