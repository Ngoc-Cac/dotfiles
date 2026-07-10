local CONFIG = require("config")


hl.on("hyprland.start", function()
  for _, command in ipairs(CONFIG['startup_cmds']) do
    hl.exec_cmd("uwsm app -- " .. command)
  end
  hl.exec_cmd(CONFIG["terminal"], { workspace = "special:Terminal silent" })
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
