GroupAdd "AltTabWindow", "ahk_class XamlExplorerHostIslandWindow" ; windows 11
GroupAdd "AltTabWindow", "ahk_class MultitaskingViewFrame" ; windows 10
GroupAdd "AltTabWindow", "ahk_class TaskSwitcherWnd" ; not sure, some older version

; Alt & l::AltTab
; Alt & h::ShiftAltTab

#HotIf WinActive("ahk_group AltTabWindow")
h::Left
l::Right
j::Down
k::Up
#HotIf
