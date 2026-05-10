-- primary display
hl.monitor({
  output = "DP-1",
  mode = "2560x1440@300.0",
  position = "1440x475",
  scale = 1,
  supports_hdr = -1,
  bitdepth = 10,
  cm = "wide",
})

-- secondary (vertical) display
hl.monitor({
  output = "HDMI-A-2",
  mode = "2560x1440",
  position = "0x0",
  scale = 1,
  supports_hdr = -1,
  bitdepth = 10,
  cm = wide,
  transform = 1,
})

-- workspace rules
local primary_workspaces = { "1", "2", "7", "9", "name:extra" }
local secondary_workspaces = { "3", "4", "6" }

for _, ws in ipairs(primary_workspaces) do
  hl.workspace_rule({ workspace = ws, monitor = "DP-1" })
end
for _, ws in ipairs(secondary_workspaces) do
  hl.workspace_rule({
    workspace = ws,
    monitor = "HDMI-A-2",
    layout_opts = { direction = "down" },
  })
end
