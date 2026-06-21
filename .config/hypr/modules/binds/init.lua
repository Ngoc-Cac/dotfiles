CONFIG = require("config")
local main_mod = CONFIG["main_mod"]


-- shutdown app and hyprland
hl.bind(main_mod .. " + q", hl.dsp.window.close())
hl.bind(main_mod .. " + m", hl.dsp.exec_cmd(
  "command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown --vt 2 || hyprctl dispatch 'hl.dsp.exit()'"
))


-- apps and stuff
hl.bind(main_mod .. " + RETURN", hl.dsp.exec_cmd(CONFIG["terminal"]))
hl.bind(main_mod .. " + f", hl.dsp.exec_cmd(CONFIG["file_manager"]))
hl.bind(main_mod .. " + o", hl.dsp.exec_cmd(CONFIG["launcher"]))
hl.bind(main_mod .. " + b", hl.dsp.exec_cmd(CONFIG["browser"]))
hl.bind(
  main_mod .. " + y",
  hl.dsp.exec_cmd(CONFIG["browser"] .. " --profile-directory=Default --app=https://music.youtube.com/")
)


-- screenshot
hl.bind(main_mod .. "+ SHIFT + s", hl.dsp.exec_cmd("grimblast -nf copy area"))
-- view cliphist
hl.bind(main_mod .. "+ v", hl.dsp.exec_cmd("cliphist list | rofi -dmenu | cliphist decode | wl-copy"))


require("modules.binds.audio")  -- audio controls

require("modules.binds.layouts")  -- navigation

require("modules.binds.zoom")  -- zoom with scroll wheel

require("modules.binds.hjkl_mode")
