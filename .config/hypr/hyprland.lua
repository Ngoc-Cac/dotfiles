local CONFIG = require("config")


local startup = {
  --- the commented lines should only be enabled if NOT using uwsm ---
  -- some syncing stuff for the xdg-desktop-portal-hyprland
  -- "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP",
  -- "systemctl --user start hyprpolkitagent",

  -- wallpaper, idling and status bar
  -- "hyprpaper", "hypridle", "waybar",

  -- wifi applet
  "nm-applet --indicator", "blueman-applet",

  -- input stuff
  "wl-paste --watch cliphist store",
  "fcitx5 -dr",

  CONFIG["terminal"],
}

hl.on("hyprland.start", function()
  for _, command in ipairs(startup) do
    hl.exec_cmd("uwsm app -- " .. command)
  end
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
