^CapsLock::
+CapsLock::
CapsLock::HJKLMode.toggle()

; any keys not in the hotif directives disables the mode
Loop Parse, "acefgimnopqrstvxyz"
{
    HotIf("HJKLMode.active")
    Hotkey("~" A_LoopField, (_) => HJKLMode.toggle())
}
HotIf()

#HotIf HJKLMode.active
~Space::HJKLMode.toggle()

; weird ass scrolling because I couldn't make ^d and ^u work
d::WheelDown
u::WheelUp

; navigation
h::Left
l::Right
j::Down
k::Up

w::^Right
b::^Left
#HotIf


class HJKLMode
{
    static active := false

    ; +E0x20 is the non-interactive window thingy
    static overlay_status := Gui("+AlwaysOnTop +ToolWindow -Caption +E0x20")
    static _show_opts := "x" (30) " y" (20) " NoActivate"

    static __New()
    {
        this.overlay_status.BackColor := "343434"
        WinSetTransColor(" 150", this.overlay_status)

        this.overlay_status.SetFont("cWhite s16 bold")
        this.overlay_status.Add("Text", "w175 h20 Center", "HJKL Active")
    }

    static toggle()
    {
        this.active := !this.active
        if this.active
            this.overlay_status.Show(this._show_opts)
        else
            this.overlay_status.Hide()
    }

    /* static toggle_pause()
    {
        this.paused := !this.paused
        if this.active ; de-activate when active
            this.toggle()
    }
    */
}
