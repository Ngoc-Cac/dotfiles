CONFIG = require("config")
local main_mod = CONFIG["main_mod"]


-- shutdown app and hyprland
hl.bind(main_mod .. " + q", hl.dsp.window.close())
hl.bind(main_mod .. " + m", hl.dsp.exec_cmd(
  "command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown --vt 2 || hyprctl dispatch 'hl.dsp.exit()'"
))


-- apps and stuff
hl.bind(main_mod .. " + t", hl.dsp.exec_cmd(CONFIG["terminal"]))
hl.bind(main_mod .. " + f", hl.dsp.exec_cmd(CONFIG["file_manager"]))
hl.bind(main_mod .. " + o", hl.dsp.exec_cmd(CONFIG["launcher"]))
hl.bind(main_mod .. " + b", hl.dsp.exec_cmd(CONFIG["browser"]))
hl.bind(main_mod .. " + y", hl.dsp.exec_cmd(CONFIG["browser"] .. " --app=https://music.youtube.com/"))


-- screenshot
hl.bind(main_mod .. "+ SHIFT + s", hl.dsp.exec_cmd("grimblast copy area"))


-- audio controls
require("binds.audio")


-- navigation
require("binds.layouts")


-- MISC
hl.bind(main_mod .. "+ v", hl.dsp.exec_cmd("cliphist list | rofi -dmenu | cliphist decode | wl-copy"))

require("binds.zoom")

require("binds.hjkl_mode")
