local main_mod = require("config")["main_mod"]
local lck = { locked = true }
local lck_and_rpt = { locked = true, repeating = true }
local cmds = {
  mute = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle",
  set_vol = "wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@",
  pause = "playerctl play-pause",
  play_next = "playerctl next",
  play_prev = "playerctl previous"
}


hl.bind(main_mod .. " + F1", hl.dsp.exec_cmd(cmds["mute"]), lck_and_rpt)
hl.bind(main_mod .. " + F2", hl.dsp.exec_cmd(cmds["set_vol"] .. " 2%-"), lck_and_rpt)
hl.bind(main_mod .. " + F3", hl.dsp.exec_cmd(cmds["set_vol"] .. " 2%+"), lck_and_rpt)
hl.bind(main_mod .. " + F4", hl.dsp.exec_cmd(cmds["pause"]), lck)


hl.bind("XF86AudioMute", hl.dsp.exec_cmd(cmds["mute"]), lck_and_rpt)
hl.bind(
  "ALT + XF86AudioLowerVolume",
  hl.dsp.exec_cmd(cmds["set_vol"] .. " 1%-"),
  lck_and_rpt
)
hl.bind(
  "ALT + XF86AudioRaiseVolume",
  hl.dsp.exec_cmd(cmds["set_vol"] .. " 1%+"),
  lck_and_rpt
)
hl.bind(
  "XF86AudioLowerVolume",
  hl.dsp.exec_cmd(cmds["set_vol"] .. " 2%-"),
  lck_and_rpt
)
hl.bind(
  "XF86AudioRaiseVolume",
  hl.dsp.exec_cmd(cmds["set_vol"] .. " 2%+"),
  lck_and_rpt
)
hl.bind(
  "CTRL + XF86AudioLowerVolume",
  hl.dsp.exec_cmd(cmds["set_vol"] .. " 5%-"),
  lck_and_rpt
)
hl.bind(
  "CTRL + XF86AudioRaiseVolume",
  hl.dsp.exec_cmd(cmds["set_vol"] .. " 5%+"),
  lck_and_rpt
)


hl.bind("XF86AudioPause", hl.dsp.exec_cmd(cmds["mute"]), lck)
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd(cmds["mute"]), lck)
hl.bind("XF86AudioNext", hl.dsp.exec_cmd(cmds["play_next"]), lck)
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd(cmds["play_prev"]), lck)
