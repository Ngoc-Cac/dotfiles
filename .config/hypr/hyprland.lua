local CONFIG = require("config")

local startup = {
  "waybar",
  CONFIG["terminal"],
  "systemctl" --user start hyprpolkitagent
}
hl.on("hyprland.start", function()
  for _, command in ipairs(startup) do
    hl.exec_once(command)
  end
end)

hl.config({
  general = {
    no_focus_fallback = true
  }
})

require("binds.utils")
require("binds.layouts")
