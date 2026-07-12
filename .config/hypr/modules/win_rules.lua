hl.workspace_rule({
  workspace = "1",
  persistent = true,
  default_name = "Default"
})

-- floating win in overlay workspace
hl.window_rule({
  match = { workspace = "special:Overlay" },
  float = true
})

-- General screen sharing and pop ups
hl.window_rule({
  name = "pop-up",
  match = { class = "^(xdg-desktop-portal-.*)$" },
  float = true,
  center = true,
  stay_focused = true,  -- basically pins the window, but only for that workspace
  persistent_size = true
})

hl.window_rule({
  name = "sharer-toolbar",
  match = { title = "^(.* is sharing a window.)$" },
  workspace = 'special:Overlay',
  float = true,
  move = { "(monitor_w - window_w) * 0.5", "monitor_h - window_h - 50" },
  pin = false,
  focus_on_activate = false,
  dim_around = false,
  decorate = false,
  no_dim = true,
  persistent_size = true
})

hl.window_rule({
  name = "pic-in-pic",
  match = { title = "^(Picture in picture)$" },
  float = true,
  move = { "monitor_w - window_w - 25", "monitor_h - window_h - 30" },
  pin = true,
  focus_on_activate = false,
  dim_around = false,
  no_dim = true,
  render_unfocused = true,
  opacity = "1.0 override 1.0 override 1.0 override",
  persistent_size = true
})


-- slack
hl.window_rule({
  name = "slack-preview",
  match = {
    class = "slack",
    title = "^(.* Huddle Preview)$",
  },
  float = true,
  center = true,
  stay_focused = true,
  no_max_size = true
})

hl.window_rule({
  name = "slack-huddle",
  match = { class = "slack", title = "^Slack$" },
  move = { "(monitor_w - window_w) * 0.5", "monitor_h - window_h - 50" },
  float = true,
  pin = true
})

hl.on("window.update_rules", function(win)
  local initially_slack = win.initial_title == "Slack" and win.title ~= "Slack"
  local not_huddle_preview = string.match(win.title, "Huddle") and
    not string.match(win.title, "Preview$")
  if
    win.class == "slack" and win.floating and
    (initially_slack or not_huddle_preview)
  then
    hl.dispatch(hl.dsp.window.float({ window = win }))
  end
end)
