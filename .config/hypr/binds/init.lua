CONFIG = require("config")
local main_mod = CONFIG["main_mod"]


-- shutdown app and hyprland
hl.bind(main_mod .. " + C", hl.dsp.window.close())
hl.bind(main_mod .. " + M", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))


-- apps and stuff
hl.bind(main_mod .. " + Q", hl.dsp.exec_cmd(CONFIG["terminal"]))
hl.bind(main_mod .. " + E", hl.dsp.exec_cmd(CONFIG["file_manager"]))
hl.bind(main_mod .. " + R", hl.dsp.exec_cmd(CONFIG["launcher"]))


-- screenshot
hl.bind(main_mod .. "+ SHIFT + S", hl.dsp.exec_cmd("grimblast copy area"))


-- audio controls
require("binds.audio")


-- navigation
require("binds.layouts")
