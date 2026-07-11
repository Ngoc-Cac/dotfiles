return {
  hypr_config = {
    general = {
      col = {
        active_border   = { colors = {"rgb(ebdbb2)", "rgb(d65d0e)"}, angle = 30 },
        inactive_border = "rgba(595959aa)",
      },
      no_focus_fallback = true,  -- no wrapping basically

      resize_on_border = true,  -- resize by clicking and dargging
      border_size = 2,
      layout = 'monocle'
    },

    decoration = {
      rounding = 5,
      rounding_power = 2,

      active_opacity = 1.0,
      inactive_opacity = 0.8,

      blur = {
        enabled = true,
        size = 3,
        passes = 3,
        vibrancy = 0.1696
      },
    },

    input = {
      kb_options = "lv3:caps_switch_capslock_with_ctrl"  -- Ctrl + CapsLock for CapsLock
    },

    binds = {
      scroll_event_delay = 0  -- ms to wait until passing the next scroll to bind
    },

    dwindle = {
      force_split = 2,
      preserve_split = true
    },

    misc = {
      disable_hyprland_logo = true
    }
  },
  startup_cmds = {
    --- the commented lines should only be enabled if NOT using uwsm ---
    -- some syncing stuff for the xdg-desktop-portal-hyprland
    -- "systemctl --user start hyprpolkitagent",

    -- wallpaper, idling and status bar
    -- "hyprpaper", "hypridle", "waybar",

    -- wifi applet
    "nm-applet --indicator", "blueman-applet",

    -- input stuff
    "wl-paste --watch cliphist store",
    "fcitx5 -dr",
  },
  main_mod     = "SUPER",
  launcher     = "rofi-launcher.sh",
  powermenu    = "rofi-powermenu.sh",
  terminal     = "uwsm app -- kitty",
  file_manager = "uwsm app -- thunar",
  browser      = "uwsm app -- brave"
}
