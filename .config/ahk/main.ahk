#SingleInstance force

#Include alt-tab.ahk
#Include ahk-binds.ahk
#Include hjkl-mode.ahk

; the language switch stuff, its really annoying
; #Space::return
#Space::
{
    ; WindowsTerminal.exe 
    if WinExist("ahk_exe alacritty.exe")
        WinActivate
}

!Enter::Run "alacritty.exe"  ; "wt.exe"
!g::Run "glazewm.exe"

; alt + q to close window
!q::WinClose("A")

; for debugging the window group: Ctrl + Alt + W
; ^!w::MsgBox(WinGetClass("A"))
