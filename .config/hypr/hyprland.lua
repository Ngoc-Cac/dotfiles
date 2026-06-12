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


hl.config(CONFIG["hypr_config"])


-- hl.monitor({
--     output   = "",
--     mode     = "preferred",
--     position = "auto",
--     scale    = "auto"
-- })

require("animations")

require("win_rules")

require("binds")
