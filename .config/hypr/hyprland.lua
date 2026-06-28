local CONFIG = require("config")


local startup = {
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
}

hl.on("hyprland.start", function()
  for _, command in ipairs(startup) do
    hl.exec_cmd("uwsm app -- " .. command)
  end

  hl.dsp.exec_cmd(CONFIG["terminal"], { workspace = "special:term silent" })
end)

hl.config(CONFIG["hypr_config"])


-- hl.monitor({
--     output   = "",
--     mode     = "preferred",
--     position = "auto",
--     scale    = "auto"
-- })

require("modules.animations")

require("modules.win_rules")

require("modules.binds")
