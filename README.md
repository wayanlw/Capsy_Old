# Capsy
### Using the underutilized CapsLock key for an efficient keyboard workflow.

I believe the design of the qwerty keyboard is not efficient. This is a humble attempt to optimize the keyboard workflow with the amazing autohotkey tool. I got inspired to create this by using the VIM editor, whose phylosophy is minimizing handmovements.

Also I borrowed certain components from below users as well.

- Daniel Kvarfordt - https://gist.github.com/Danik/5808330
- ThatOneCoder - https://github.com/ThatOneCoder/ahk/blob/master/Wynshaft.ahk.txt
- Gustavo Duarte: http://duartes.org/gustavo/blog/post/home-row-computing

This script has saved me a ton of time. I run this on every computer that I use. The size of the program is less than 1 MB and it doesnt require admin priviledges.

**Disclaimer -  the script becomes very addictive after you use it for sometime.**

#### Benefits of the script
1. Minimize hand movements when using keyboard.
2. Enhance **Keyboard-Mouse** parallel use. (Using keyboard with the left hand and mouse with the right)
3. Using keyboard to move the cursor for quick small cursor movements

#### Functionality:
- Deactivates capslock for normal (accidental) use.
- Use CapsLock and Right-Shift keys as modifier keys
- Hold the Capslock and drag any window with the right mouse button (not just the title bar).
- Access the following functions when pressing Capslock:

## Installation Instructions
1. Donwnload `Capsy.exe` to your computer
2. Simply run the program by double clicking.
3. Doesn't require admin previledges



## How to use

#### Toggle Caps lock
CapsLock is deactivated by default. However, if one wants to activate it, can use the below combination to toggle.

| Function            | Hotkey             |
| ------------------- | ------------------ |
| Toggle Capslock key | ` win + capslock ` |

<br/>

#### Main Keybindings

| Function                             | Hotkey                           | Simulated Keys                                  |
| ------------------------------------ | -------------------------------- | ----------------------------------------------- |
| Escape                               | ` Capslock + q `                 | {Esc}                                           |
| Launcher Functionality Covered later | ` Capslock + w `                 | Launcher                                        |
| ~~~~~~~~~~~~~~~~~~~~~~~~             | ~~~~~~~~~~~~~~~~                 | ~~~~~~~~~~~~~~~~~~~~~~~~~~~                     |
| Up Arrow                             | ` Capslock + i `                 | {Up}                                            |
| Left Arrow                           | ` Capslock + j `                 | {Left}                                          |
| Down Arrow                           | ` Capslock + k `                 | {Down}                                          |
| Right Arrow                          | ` Capslock + l `                 | {Right}                                         |
| ~~~~~~~~~~~~~~~~~~~~~~~~             | ~~~~~~~~~~~~~~~~                 | ~~~~~~~~~~~~~~~~~~~~~~~~~~~                     |
| Ctrl + Left Arrow                    | ` Capslock + h `                 | {Ctrl}+{Left}                                   |
| Ctrl + Rigth Arrow                   | ` Capslock + ; `                 | {Ctrl}+{Right}                                  |
| ~~~~~~~~~~~~~~~~~~~~~~~~             | ~~~~~~~~~~~~~~~~                 | ~~~~~~~~~~~~~~~~~~~~~~~~~~~                     |
| Page Up                              | ` Capslock + u `                 | {pgUp}                                          |
| Page Down                            | ` Capslock + o `                 | {pgDn}                                          |
| ~~~~~~~~~~~~~~~~~~~~~~~~             | ~~~~~~~~~~~~~~~~                 | ~~~~~~~~~~~~~~~~~~~~~~~~~~~                     |
| Home (Go to the beginning of a line) | ` Capslock + y `                 | {Home}                                          |
| End (Go to the end of a line)        | ` Capslock + p `                 | {End}                                           |
| Go to the beginning of the page      | ` Capslock + Space + y `         | {Ctrl}+{Home}                                   |
| Go to the beginning of the page      | ` Capslock + Space + p `         | {Ctrl}+{End}                                    |
| ~~~~~~~~~~~~~~~~~~~~~~~~             | ~~~~~~~~~~~~~~~~                 | ~~~~~~~~~~~~~~~~~~~~~~~~~~~                     |
| Undo                                 | ` Capslock + e `                 | {Ctrl}+z                                        |
| Redo                                 | ` Capslock + r `                 | {Ctrl}+y                                        |
| ~~~~~~~~~~~~~~~~~~~~~~~~             | ~~~~~~~~~~~~~~~~                 | ~~~~~~~~~~~~~~~~~~~~~~~~~~~                     |
| Cut                                  | ` Capslock + s `                 | {Ctrl}+x                                        |
| Copy                                 | ` Capslock + d `                 | {Ctrl}+c                                        |
| Paste                                | ` Capslock + f `                 | {Ctrl}+v                                        |
| ~~~~~~~~~~~~~~~~~~~~~~~~             | ~~~~~~~~~~~~~~~~                 | ~~~~~~~~~~~~~~~~~~~~~~~~~~~                     |
| Select and Copy proceding word       | ` capslock + t `                 | {Ctrl}+{Left}  {Shift}+{Ctrl}+{Right}  {Ctrl}+c |
| Delete proceding word                | ` capslock + t (pressed twice) ` | {Ctrl}+{Left}  {Shift}+{Ctrl}+{Right}  {del}+   |
| ~~~~~~~~~~~~~~~~~~~~~~~~             | ~~~~~~~~~~~~~~~~                 | ~~~~~~~~~~~~~~~~~~~~~~~~~~~                     |
| Copy Line                            | ` Capslock + g `                 | {Home}  {Shift}+{End}  {Ctrl}+c                 |
| Delete Line                          | ` Capslock + g (pressed twice) ` | {Home}  {Shift}+{End}  {del}                    |
| Select Line                          | ` Capslock + g (hold) `          | {Home}  {Shift}+{End}                           |
| ~~~~~~~~~~~~~~~~~~~~~~~~             | ~~~~~~~~~~~~~~~~                 | ~~~~~~~~~~~~~~~~~~~~~~~~~~~                     |
| Sorround selection with curlybraces  | ` Capslock + space + [ `         | Converts xxx in to {xxx}                        |
| Sorround with Parnthesis             | ` Capslock + space + ( `         | Converts xxx in to (xxx)                        |
| Sorround with Quotation Marks        | ` Capslock + space + ' `         | Converts xxx in to "xxx"                        |
| ~~~~~~~~~~~~~~~~~~~~~~~~             | ~~~~~~~~~~~~~~~~                 | ~~~~~~~~~~~~~~~~~~~~~~~~~~~                     |
| Save                                 | ` Capslock + a `                 | {Ctrl}+s                                        |
| Save as                              | ` Capslock + a (pressed twice) ` | {Ctrl}+{Shift}+s                                |
| ~~~~~~~~~~~~~~~~~~~~~~~~             | ~~~~~~~~~~~~~~~~                 | ~~~~~~~~~~~~~~~~~~~~~~~~~~~                     |
| Backspace preceding word             | ` Capslock + m `                 | {Ctrl}+{BS}                                     |
| Delete                               | ` Capslock + , `                 | {Delete}                                        |
| Delete the next word                 | ` Capslock + . `                 | {Ctrl}+{Delete}                                 |
| ~~~~~~~~~~~~~~~~~~~~~~~~             | ~~~~~~~~~~~~~~~~                 | ~~~~~~~~~~~~~~~~~~~~~~~~~~~                     |
| Enter                                | ` Capslock + c `                 | {Enter}                                         |
| Delete                               | ` Capslock + v `                 | {Delete}                                        |
| BackSpace                            | ` Capslock + b `                 | {BS}                                            |
| ~~~~~~~~~~~~~~~~~~~~~~~~             | ~~~~~~~~~~~~~~~~                 | ~~~~~~~~~~~~~~~~~~~~~~~~~~~                     |
| Cycle open applications              | ` Capslock + z `                 | {Alt}+{Tab}                                     |
| ~~~~~~~~~~~~~~~~~~~~~~~~             | ~~~~~~~~~~~~~~~~                 | ~~~~~~~~~~~~~~~~~~~~~~~~~~~                     |
| Find                                 | ` Capslock + x `                 | {Ctrl}+f                                        |
| Find selection                       | ` Capslock + x (Long press) `    | {Ctrl}+c {Ctrl}+f                               |
|                                      |                                  |                                                 |

<br/>

#### Special Key Combinations

| Function                                            | Hotkey                      | Simulated Keys                                                          |
| --------------------------------------------------- | --------------------------- | ----------------------------------------------------------------------- |
| Control (Holding)                                   | `CapsLock + Space `         | {Ctrl (Hold)}                                                           |
| Shift (Can be used in combinations with other keys) | `Capslock + Tab `           | {Shift}                                                                 |
| ~~~~~~~~~~~~~~~~~~~~~~~~                            | ~~~~~~~~~~~~~~~~            | ~~~~~~~~~~~~~~~~~~~~~~~~~~~                                             |
| Enter Blank line below                              | `capslock + enter `         | {End}{enter}                                                            |
| Enter Blank line above                              | `capslock + space + enter ` | {Home}{enter}{Up}                                                       |
| ~~~~~~~~~~~~~~~~~~~~~~~~                            | ~~~~~~~~~~~~~~~~            | ~~~~~~~~~~~~~~~~~~~~~~~~~~~                                             |
| Duplicate the current line                          | `capslock + Up `            | {Home}   {Shift}+{End}  {Ctrl}+c  {End}  {Enter}  {Ctrl}+v  {up}  {End} |
| Duplicate the current line Down                     | `capslock + Down `          | {Home}   {Shift}+{End}  {Ctrl}+c  {End}  {Enter} {Ctrl}+v               |
|                                                     |                             |                                                                         |


<br>

#### Launcher

Launcher = `Capslock + w`. The key combination should be entered immediately after pressing the launcher combination.
| Function        | Hotkey        | Simulated Keys                          |
|-----------------|---------------|-----------------------------------------|
| Delete all      | ` Launcher + fa ` | {Ctrl}a{delete}                         |
| Delete to Start | ` Launcher + fs ` | {Shift}{Home}{delete}                   |
| Delete to End   | ` Launcher + fe ` | {Shift}{End}{delete}                    |
| copy all        | ` Launcher + da ` | {Ctrl}a{Ctrl}c                          |
| copy to start   | ` Launcher + ds ` | {Shift}{Home}{Ctrl}c                    |
| copy to end     | ` Launcher + de ` | {Shift}{End}{Ctrl}c                     |
| cut all         | ` Launcher + va ` | {Ctrl}a{Ctrl}x                          |
| cut word        | ` Launcher + vw ` | {Ctrl}{right}{Shift}{Ctrl}{left}{Ctrl}x |
| cut line        | ` Launcher + vv ` | {Home}{Shift}{End}{Ctrl}x               |
| cut to start    | ` Launcher + vs ` | {Shift}{Home}{Ctrl}x                    |
| cut to end      | ` Launcher + ve ` | {Shift}{End}{Ctrl}x                     |
| Select all      | ` Launcher + sa ` | {Ctrl}a                                 |
| Select to start | ` Launcher + ss ` | {Shift}{home}{Shift}{home}              |
| Select to end   | ` Launcher + se ` | {Shift}{End}{Shift}{End}                |
| Select word     | ` Launcher + sw ` | {Ctrl}{right}{Shift}{Ctrl}{left}        |

<br>

#### Number Pad
Insert numbers without reaching the number pad. This becomes more useful if you're using a keyboard without a number pad.
| Function | Hotkey                         | Simulated Keys |
| -------- | ------------------------------ | -------------- |
| 0        | ` Ctrl + Alt + Shift + Space ` | 0              |
| 1        | ` Ctrl + Alt + Shift + m `     | 1              |
| 2        | ` Ctrl + Alt + Shift + , `     | 2              |
| 3        | ` Ctrl + Alt + Shift + . `     | 3              |
| 4        | ` Ctrl + Alt + Shift + j `     | 4              |
| 5        | ` Ctrl + Alt + Shift + k `     | 5              |
| 6        | ` Ctrl + Alt + Shift + l `     | 6              |
| 7        | ` Ctrl + Alt + Shift + u `     | 7              |
| 8        | ` Ctrl + Alt + Shift + i `     | 8              |
| 9        | ` Ctrl + Alt + Shift + o `     | 9              |

<br>

#### Searching the WebA
| Function                     | Hotkey             |
|------------------------------|--------------------|
| Search Web                   | ` Win + s `        |
| Search selection in Web      | ` Win + Ctrl + s ` |
| Serach Youtube               | ` Win + y `        |
| Search Seleection in Youtube | ` Win + Ctrl + y ` |

<br>

#### Interact with application windows
| Function                 | Hotkey                                                                                   | Simulated Keys |
| ------------------------ | ---------------------------------------------------------------------------------------- | -------------- |
| Window always on top     | ` capslock + F12 `                                                                       |                |
| Close tab / instance     | ` Alt + q `                                                                              | {Ctrl}+{w}     |
| Exit Current Application | ` Alt + Shift + q `                                                                      | {Alt}+{F4}     |
| Move windows             | Drag the window from anywhere with the right mouse button whilst holding the Capsloc Key |                |


#### Quick Copy text to a Notepad
| Function                         | Hotkey         |
|----------------------------------|----------------|
| Copy selection to a notepad file | ` Ctrl + Alt + c ` |

#### Microsoft Excel Hotkeys
| Excel Function                              | Hotkey                 | Simulated Keys               |
| ------------------------------------------- | ---------------------- | ---------------------------- |
| Trace Precedents                            | ` Capslock + 1 `       | {Ctrl}[                      |
| Trace Dependants                            | ` Capslock + 2 `       | {F5}{Enter}                  |
| Equals                                      | ` Capslock + 3 `       | {=}                          |
| Plus                                        | ` Capslock + 4 `       | {+}                          |
| Calculate formulat inside the cell          | ` Capslock + 5 `       | {F9}                         |
| ~~~~~~~~~~~~~~~~~~~~~~~~                    | ~~~~~~~~~~~~~~~~       | ~~~~~~~~~~~~~~~~~~~~~~~~~~~  |
| Paste as values                             | ` {Ctrl}+{Alt}+v `     | {Ctrl}+{Alt}+v  {v}  {enter} |
| Paste forumulas                             | ` {Ctrl}+{Alt}+f `     | {Ctrl}+{Alt}+v  {f}  {enter} |
| Paste formatting                            | ` {Ctrl}+{Alt}+t `     | {Ctrl}+{Alt}+v  {t}  {enter} |
| Paste Links                                 | ` {Ctrl}+{Alt}+z `     | {Ctrl}+{Alt}+v  {l}          |
| ~~~~~~~~~~~~~~~~~~~~~~~~                    | ~~~~~~~~~~~~~~~~       | ~~~~~~~~~~~~~~~~~~~~~~~~~~~  |
| Conditional formatting data bars            | ` {Ctrl}+{Alt}+s `     | {Alt}+H {L} {d} {enter}      |
| Conditional formatting color scales         | ` {Ctrl}+{Alt}+d `     | {Alt}+H {L} {s} {enter}      |
| Clear conditional formatting from selection | ` {Ctrl}+{Alt}+x `     | {Alt}+H {L} {c} {s} {enter}  |
| ~~~~~~~~~~~~~~~~~~~~~~~~                    | ~~~~~~~~~~~~~~~~       | ~~~~~~~~~~~~~~~~~~~~~~~~~~~  |
| Move to the top cell in range               | ` Capslock + u `       | {Ctrl}+{up}                  |
| Select to the top cell in range             | ` Capslock + Tab + u ` | {Ctrl}+{Shift}+{up}          |
| Move to the bottom cell in Range            | ` Capslock + o `       | {Ctrl}+{Down}                |
| Select to the bottom cell in range          | ` Capslock + Tab + o ` | {Ctrl}+{Shift}+{Down}        |
| Move to the left most cell in range         | ` Capslock + h `       | {Ctrl}+{left}                |
| Select to the left most cell in range       | ` Capslock + Tab + h ` | {Ctrl}+{Shift}+{left}        |
| Move to the right most cell in Range        | ` Capslock + ; `       | {Ctrl}+{right}               |
| Select to the right most cell in range      | ` Capslock + Tab + ; ` | {Ctrl}+{Shift}+{right}       |
| ~~~~~~~~~~~~~~~~~~~~~~~~                    | ~~~~~~~~~~~~~~~~       | ~~~~~~~~~~~~~~~~~~~~~~~~~~~  |
| Go to previous sheet                        | ` Capslock + [ `       | {Ctrl}+{pgup}                |
| Go to next sheet                            | ` Capslock + ] `       | {Ctrl}+{pgDn}                |
| ~~~~~~~~~~~~~~~~~~~~~~~~                    | ~~~~~~~~~~~~~~~~       | ~~~~~~~~~~~~~~~~~~~~~~~~~~~  |
| Copy vertically                             | ` Capslock + b `       | {Ctrl}+d                     |
| Copy horizontally                           | ` Capslock + t `       | {Ctrl}+r                     |
| ~~~~~~~~~~~~~~~~~~~~~~~~                    | ~~~~~~~~~~~~~~~~       | ~~~~~~~~~~~~~~~~~~~~~~~~~~~  |
| Edit in cell                                | ` Capslock + g: `      | {F2}                         |
| ~~~~~~~~~~~~~~~~~~~~~~~~                    | ~~~~~~~~~~~~~~~~       | ~~~~~~~~~~~~~~~~~~~~~~~~~~~  |
| Minus                                       | ` Capslock + F1 `      | {-}                          |
| Plus                                        | ` Capslock + F2 `      | {+}                          |
| Mulitply                                    | ` Capslock + F3 `      | {*}                          |
| Divide                                      | ` Capslock + F4 `      | {/}                          |

<br>

## Mouse Functionality
#### Normal mouse with the keyboard
Whilst holding the Right Shift key move use qwerasdfzxcv keys for mouse functionality
| Function              | Hotkey                        |
|-----------------------|-------------------------------|
|  move up              |  `RShift + E`                   |
|  move down            |  `RShift + D`                   |
|  Move left            |  `RShift + S`                   |
|  Move right           |  `RShift + F`                   |
|  Scroll down          |  `RShift + W`                   |
|  Scroll up            |  `RShift + R`                   |
|  Left Button          |  `RShift + Space / Rshift + ;`  |
|  Control Left button  |  `RShift + '`                   |


#### Quickly move mouse cursor in the screen

| Function        | Hotkey       |
|-----------------|--------------|
|  Top Left       |  `RShift + q`  |
|  Top Right      |  `RShift + t`  |
|  Middle Left    |  `RShift + a`  |
|  Middle Center  |  `RShift + c`  |
|  Middle Right   |  `RShift + g`  |
|  Bottom Left    |  `RShift + z`  |
|  Bottom Right   |  `RShift + b`  |

#### Mapping the Real mouse buttons
These button's are helpful when you're using the keyboard from your lefthand and mouse from your right hand. Enter and Delete keys are used very often in this situation.


| Function      |  Shortcut           |
|---------------|---------------------|
|  Enter        |  Side Button Up     |
|  Delete       |  Side Button Down   |
|  Scroll Left  |  Mouse wheel left   |
|  Sroll right  |  Mouse wheel Right  |

#### Exit Capsy
| Exit Script | ` RightCtrl + q` |
| ----------- | ----------------- |