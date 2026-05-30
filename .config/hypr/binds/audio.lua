local main_mod = require("config")["main_mod"]
local locked = { locked = true }
local locked_and_repeating = { locked = true, repeating = true }
local cmds = {
  mute = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle",
  lower_vol = "wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 2%-",
  inc_vol = "wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 2%+",
  pause = "playerctl play-pause",
  play_next = "playerctl next",
  play_prev = "playerctl previous"
}


hl.bind(main_mod .. " + F1", hl.dsp.exec_cmd(cmds["mute"]), locked_and_repeating)
hl.bind(main_mod .. " + F2", hl.dsp.exec_cmd(cmds["lower_vol"]), locked_and_repeating)
hl.bind(main_mod .. " + F3", hl.dsp.exec_cmd(cmds["inc_vol"]), locked_and_repeating)
hl.bind(main_mod .. " + F4", hl.dsp.exec_cmd(cmds["pause"]), locked)


hl.bind("XF86AudioMute", hl.dsp.exec_cmd(cmds["mute"]), locked_and_repeating)
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd(cmds["lower_vol"]), locked_and_repeating)
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd(cmds["inc_vol"]), locked_and_repeating)


hl.bind("XF86AudioPause", hl.dsp.exec_cmd(cmds["mute"]), locked)
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd(cmds["mute"]), locked)
hl.bind("XF86AudioNext", hl.dsp.exec_cmd(cmds["play_next"]), locked)
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd(cmds["play_prev"]), locked)
