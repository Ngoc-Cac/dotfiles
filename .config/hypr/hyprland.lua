local CONFIG = require("config")


local startup = {
  "systemctl",  --user start hyprpolkitagent
  "gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'",
  "waybar",
  CONFIG["terminal"],
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
