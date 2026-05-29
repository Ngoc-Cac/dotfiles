CONFIG = require("config")
local main_mod = CONFIG["main_mod"]

hl.bind(main_mod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(main_mod .. " + P", hl.dsp.window.pseudo())
hl.bind(main_mod .. " + J", hl.dsp.layout("togglesplit"))    -- dwindle only

-- Move focus with main_mod + arrow keys
hl.bind(main_mod .. "+ ALT + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(main_mod .. "+ ALT + right", hl.dsp.focus({ direction = "right" }))
hl.bind(main_mod .. "+ ALT + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(main_mod .. "+ ALT + down",  hl.dsp.focus({ direction = "down" }))
hl.bind(main_mod .. "+ ALT + h",     hl.dsp.focus({ direction = "left" }))
hl.bind(main_mod .. "+ ALT + l",     hl.dsp.focus({ direction = "right" }))
hl.bind(main_mod .. "+ ALT + k",     hl.dsp.focus({ direction = "up" }))
hl.bind(main_mod .. "+ ALT + j",     hl.dsp.focus({ direction = "down" }))

-- navigating workspaces
for i = 1, 10 do
  local key = i % 10
  hl.bind(main_mod .. " + " .. key, hl.dsp.focus({ workspace = i }))
  hl.bind(main_mod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end
