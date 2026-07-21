CONFIG = require("config")
local main_mod = CONFIG["main_mod"]

local function zoom_incr(step)
  local newZoom = math.max(1, hl.get_config("cursor.zoom_factor") + step)
  hl.config({ cursor = { zoom_factor = newZoom } })
end

hl.bind(main_mod .. " + mouse_up", function() zoom_incr(0.4) end)
hl.bind(main_mod .. " + mouse_down", function() zoom_incr(-0.4) end)
hl.bind(main_mod .. " + mouse:273", function() hl.config({ cursor = { zoom_factor = 1 } }) end)
