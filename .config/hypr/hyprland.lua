local CONFIG = require("config")


local startup = {
  "systemctl --user start hyprpolkitagent",

  -- idle inhibitor and wallpaper
  "hyprpaper", "hypridle",

  -- wifi applet
  "nm-applet --indicator", "blueman-applet",

  "waybar", CONFIG["terminal"],
}

hl.on("hyprland.start", function()
  for _, command in ipairs(startup) do hl.exec_cmd(command) end
end)


hl.config({
  general = {
    col = {
      active_border   = { colors = {"rgba(33ccffee)", "rgba(00ff99ee)"}, angle = 45 },
      inactive_border = "rgba(595959aa)",
    },
    no_focus_fallback = true,  -- no wrapping basically

    resize_on_border = true,  -- resize by clicking and dargging
    border_size = 2,
  },

  decoration = {
    rounding = 5,
    rounding_power = 2,

    active_opacity = 1.0,
    inactive_opacity = 0.8,

    blur = {
      enabled = true,
      size = 3,
      passes = 1,
      vibrancy = 0.1696,
    },
  },

  dwindle = { force_split = 2 }
})


-- hl.monitor({
--     output   = "",
--     mode     = "preferred",
--     position = "auto",
--     scale    = "auto"
-- })


require("win_rules")

require("binds")
