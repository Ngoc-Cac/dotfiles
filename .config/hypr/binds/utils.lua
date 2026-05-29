CONFIG = require("config")
local main_mod = CONFIG["main_mod"]

local closeWindowBind = hl.bind(main_mod .. " + C", hl.dsp.window.close())
-- closeWindowBind:set_enabled(false)
-- shutdown hyprland
hl.bind(main_mod .. " + M", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))

hl.bind(main_mod .. " + Q", hl.dsp.exec_cmd(CONFIG["terminal"]))
hl.bind(main_mod .. " + E", hl.dsp.exec_cmd(CONFIG["file_manager"]))
hl.bind(main_mod .. " + R", hl.dsp.exec_cmd(CONFIG["launcher"]))
