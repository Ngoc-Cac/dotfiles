^CapsLock::
+CapsLock::
^+CapsLock::
CapsLock::HJKLMode.toggle()
!CapsLock::HJKLMode.toggle_mousse()

; any keys not in the hotif directives disables the mode
Loop Parse, "acefgimnopqrstvxyz"
{
    HotIf("HJKLMode.active")
    Hotkey("~*" A_LoopField, (_) => HJKLMode.toggle())
}
HotIf()

#HotIf HJKLMode.active and not HJKLMode.mouse_active
~Space::HJKLMode.toggle()

; navigation
h::Left
l::Right
j::Down
k::Up
#HotIf

#HotIf HJKLMode.mouse_active
h::MouseMove(-20, 0, 0, "R")
l::MouseMove(20, 0, 0, "R")
j::MouseMove(0, 20, 0, "R")
k::MouseMove(0, -20, 0, "R")

Space::MouseClick()
#HotIf

#HotIf HJKLMode.active or HJKLMode.mouse_active
; weird ass scrolling because I couldn't make ^d and ^u work
d::WheelDown
u::WheelUp
#HotIf

#HotIf HJKLMode.active
w::^Right
b::^Left
#HotIf


class HJKLMode
{
    static active := false
    static mouse_active := false

    ; +E0x20 is the non-interactive window thingy
    static hjkl_overlay := Gui("+AlwaysOnTop +ToolWindow -Caption +E0x20")
    static _show_opts := "x" (30) " y" (20) " NoActivate"

    static __New()
    {
        this.hjkl_overlay.BackColor := "343434"
        WinSetTransColor(" 150", this.hjkl_overlay)

        this.hjkl_overlay.SetFont("cWhite s16 bold")
        this.hjkl_overlay.Add("Text", "w175 h20 Center", "HJKL Active")
    }

    static toggle()
    {
        this.active := !this.active
        if this.active
            this.hjkl_overlay.Show(this._show_opts)
        else
            this.hjkl_overlay.Hide()
    }

    static toggle_mousse()
    {
        this.mouse_active := !this.mouse_active
        ; change pointer size (pixels) 
        if this.mouse_active
            DllCall("SystemParametersInfo", "UInt", 0x2029, "UInt", 0, "UInt", 40, "UInt", 0)
        else
            DllCall("SystemParametersInfo", "UInt", 0x2029, "UInt", 0, "UInt", 30, "UInt", 0)
    }
}
