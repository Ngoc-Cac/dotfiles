return {
  hypr_config = {
    general = {
      col = {
        active_border   = { colors = {"rgb(ebdbb2)", "rgb(d65d0e)"}, angle = 30 },
        inactive_border = "rgba(595959aa)",
      },
      no_focus_fallback = true,  -- no wrapping basically

      resize_on_border = true,  -- resize by clicking and dargging
      border_size = 2
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

    dwindle = {
      force_split = 2,
      preserve_split = true
    },

    misc = {
      disable_hyprland_logo = true
    }
  },
  main_mod     = "SUPER",
  launcher     = "rofi -show drun -run-command 'uwsm app -- {cmd}' -drun-command 'uwsm app -- {cmd}'",
  terminal     = "uwsm app -- kitty",
  file_manager = "uwsm app -- dolphin",
  browser      = "uwsm app -- brave"
}
