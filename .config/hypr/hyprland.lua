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
    no_focus_fallback = true
  }
})


require("binds")
