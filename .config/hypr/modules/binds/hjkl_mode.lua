local arrow_map = { H = "left", J = "down", K = "up", L = "right" }

hl.bind("code:66", hl.dsp.submap("HJKL Mode"))
hl.define_submap("HJKL Mode", function()
  hl.bind("code:66", hl.dsp.submap("reset"))

  for k, arrow in pairs(arrow_map) do
    hl.bind(k, hl.dsp.send_shortcut({ mods = "", key = arrow }))
    hl.bind("CTRL + " .. k, hl.dsp.send_shortcut({ mods = "CTRL", key = arrow }))
    hl.bind("SHIFT + " .. k, hl.dsp.send_shortcut({ mods = "SHIFT", key = arrow }))
    hl.bind(
      "CTRL + SHIFT + " .. k,
      hl.dsp.send_shortcut({ mods = "CTRL + SHIFT", key = arrow })
    )
  end

  hl.bind("CTRL + d", hl.dsp.send_shortcut({ mods = "", key = "mouse_down" }))
  hl.bind("CTRL + u", hl.dsp.send_shortcut({ mods = "", key = "mouse_up" }))
end)
