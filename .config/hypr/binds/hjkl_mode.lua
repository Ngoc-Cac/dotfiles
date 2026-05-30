local arrow_map = { H = "left", J = "down", K = "up", L = "right" }

hl.bind("ALT + Tab", hl.dsp.submap("HJKL Mode"))
hl.define_submap("HJKL Mode", function()
  hl.bind("Tab", hl.dsp.submap("reset"))

  -- weird bug: https://github.com/hyprwm/Hyprland/discussions/14445#discussioncomment-16894377
  for k, arrow in pairs(arrow_map) do
    hl.bind(k, hl.dsp.send_shortcut({ mods = "", key = arrow }), { repeating = true })
    hl.bind(k, hl.dsp.send_shortcut({ mods = "", key = arrow }), { release = true })

    hl.bind("CTRL + " .. k, hl.dsp.send_shortcut({ mods = "CTRL", key = arrow }), { repeating = true })
    hl.bind("CTRL + " .. k, hl.dsp.send_shortcut({ mods = "CTRL", key = arrow }), { release = true })
  end
end)
