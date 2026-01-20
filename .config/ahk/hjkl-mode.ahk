class HJKLMode
{
    static active := false
    static paused := false

    ; +E0x20 is the non-interactive window thingy
    static overlay_status := Gui("+AlwaysOnTop +ToolWindow -Caption +E0x20")
    static _show_opts := "x" (30) " y" (20) " NoActivate"

    static init_gui()
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

    static toggle_pause()
    {
        this.paused := !this.paused
        if this.active ; de-activate when active
            this.toggle()
    }
}
HJKLMode.init_gui()

#HotIf not HJKLMode.paused
CapsLock::HJKLMode.toggle()
#HotIf

#HotIf HJKLMode.active
; weird ass scrolling
d::WheelDown
u::WheelUp

; just vim stuff
h::Left
l::Right
j::Down
k::Up
#HotIf
