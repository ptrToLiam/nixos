-- Binds :: General
hl.bind("ALT + Return",            hl.dsp.exec_cmd("ghostty"))
hl.bind("ALT + SHIFT + Return",    hl.dsp.exec_cmd("foot"))
hl.bind(mainMod .. " + SHIFT + D", hl.dsp.exec_cmd(discord))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.exec_cmd("signal-desktop"))
hl.bind(mainMod .. " + SHIFT + E", hl.dsp.exec_cmd("emacs -c -a 'emacs'"))
hl.bind(mainMod .. " + SHIFT + F", hl.dsp.exec_cmd("focus"))
hl.bind(mainMod .. " + E",         hl.dsp.exec_cmd("thunar"))
hl.bind(mainMod .. " + S",         hl.dsp.exec_cmd("spotify"))
hl.bind(mainMod .. " + P",         hl.dsp.exec_cmd(colorpick))

hl.bind("Print",                   hl.dsp.exec_cmd(screenshot_area))
hl.bind("SHIFT + Print",           hl.dsp.exec_cmd(screenshot))
hl.bind(mainMod .. " + Space",     hl.dsp.exec_cmd("dms ipc call spotlight toggle"))
hl.bind(mainMod .. " + X",         hl.dsp.exec_cmd("dms ipc call powermenu toggle"))
hl.bind(mainMod .. " + M",         hl.dsp.exec_cmd("dms ipc call processlist toggle"))
hl.bind(mainMod .. " + I",         hl.dsp.exec_cmd("dms ipc call settings toggle"))
hl.bind(mainMod .. " + V",         hl.dsp.exec_cmd("dms ipc call clipboard toggle"))
hl.bind(mainMod .. " + CTRL + P",  hl.dsp.exec_cmd("dms ipc call notepad toggle"))
hl.bind(mainMod .. " + CTRL + C",  hl.dsp.exec_cmd("dms ipc call control-center toggle"))
hl.bind(mainMod .. " + N",         hl.dsp.exec_cmd("dms ipc call notifications toggle"))
hl.bind(mainMod .. " + SHIFT + N", hl.dsp.exec_cmd("dms ipc call night toggle"))
hl.bind(mainMod .. " + CTRL + B",  hl.dsp.exec_cmd("dms ipc call bar toggle"))
hl.bind(mainMod .. " + CTRL + Q",  hl.dsp.exec_cmd(lock))

hl.bind(mainMod .. " + C",         hl.dsp.window.close())
hl.bind("ALT + F4",                hl.dsp.window.kill())
hl.bind(mainMod .. " + F",         hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + CTRL + F",  hl.dsp.window.fullscreen({ action = "toggle" }))
hl.bind(mainMod .. " + F4",        hl.dsp.exit())
hl.bind(mainMod .. " + right",     hl.dsp.window.resize({ x = 10,  y = 0,   relative = true }),   { repeating = true })
hl.bind(mainMod .. " + left",      hl.dsp.window.resize({ x = -10, y = 0,   relative = true }),   { repeating = true })
hl.bind(mainMod .. " + up",        hl.dsp.window.resize({ x = 0,   y = -10, relative = true }),   { repeating = true })
hl.bind(mainMod .. " + down",      hl.dsp.window.resize({ x = 0,   y = 10,  relative = true }),   { repeating = true })

-- Binds :: Window & Navigation
hl.bind(mainMod .. " + H",                    hl.dsp.focus({ direction = "l" }))
hl.bind(mainMod .. " + L",                    hl.dsp.focus({ direction = "r" }))
hl.bind(mainMod .. " + K",                    hl.dsp.focus({ direction = "u" }))
hl.bind(mainMod .. " + J",                    hl.dsp.focus({ direction = "d" }))
hl.bind(mainMod .. " + comma",                hl.dsp.focus({ monitor = "-1" }))
hl.bind(mainMod .. " + period",               hl.dsp.focus({ monitor = "+1" }))
hl.bind(mainMod .. " + SHIFT + H",            hl.dsp.window.move({ direction = "l" }))
hl.bind(mainMod .. " + SHIFT + L",            hl.dsp.window.move({ direction = "r" }))
hl.bind(mainMod .. " + SHIFT + K",            hl.dsp.window.move({ direction = "u" }))
hl.bind(mainMod .. " + SHIFT + J",            hl.dsp.window.move({ direction = "d" }))
hl.bind(mainMod .. " + SHIFT + comma",        hl.dsp.workspace.move({ monitor = "-1" }))
hl.bind(mainMod .. " + SHIFT + period",       hl.dsp.workspace.move({ monitor = "+1" }))
hl.bind(mainMod .. " + mouse:272",            hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273",            hl.dsp.window.resize(), { mouse = true })

-- Binds :: Workspace
hl.bind(mainMod .. " + 0",                    hl.dsp.focus({ workspace = "name:extra" }))
hl.bind(mainMod .. " + SHIFT + 0",            hl.dsp.window.move({ workspace = "name:extra" }))
hl.bind("ALT + SHIFT + 0",                    hl.dsp.window.move({ workspace = "name:extra", follow = false }))
hl.bind(mainMod .. " + CTRL + SHIFT + right", hl.dsp.window.move({ workspace = "+1" }))
hl.bind(mainMod .. " + CTRL + SHIFT + left",  hl.dsp.window.move({ workspace = "-1" }))
hl.bind("ALT + CTRL + SHIFT + right",         hl.dsp.window.move({ workspace = "+1", follow = false }))
hl.bind("ALT + CTRL + SHIFT + left",          hl.dsp.window.move({ workspace = "-1", follow = false }))

hl.bind(mainMod .. " + mouse_down",           hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",             hl.dsp.focus({ workspace = "e-1" }))
hl.bind(mainMod .. " + Tab",                  hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + SHIFT + Tab",          hl.dsp.focus({ workspace = "e-1" }))

hl.bind(mainMod .. " + CTRL + right",         hl.dsp.focus({ workspace = "+1" }))
hl.bind(mainMod .. " + CTRL + left",          hl.dsp.focus({ workspace = "-1" }))

for i=1, 9 do
  hl.bind(mainMod .. " + " .. i,              hl.dsp.focus({ workspace = i }))
  hl.bind(mainMod .. " + SHIFT + " .. i,      hl.dsp.window.move({ workspace = i }))
  hl.bind("ALT + SHIFT + " .. i,              hl.dsp.window.move({ workspace = i, follow = false }))
end

-- Binds :: MultiMedia
hl.bind("XF86AudioPlay",         hl.dsp.exec_cmd("playerctl play-pause"),                { locked = true })
hl.bind("XF86AudioNext",         hl.dsp.exec_cmd("playerctl next"),                      { locked = true })
hl.bind("XF86AudioPrev",         hl.dsp.exec_cmd("playerctl previous"),                  { locked = true })
hl.bind("XF86AudioMute",         hl.dsp.exec_cmd("dms ipc call audio mute"),             { locked = true })
hl.bind("XF86AudioMicMute",      hl.dsp.exec_cmd("dms ipc call audio micmute"),          { locked = true })
hl.bind("XF86AudioRaiseVolume",  hl.dsp.exec_cmd("dms ipc call audio increment 3"),      { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume",  hl.dsp.exec_cmd("dms ipc call audio decrement 3"),      { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",   hl.dsp.exec_cmd("dms ipc call brightness increment 5 backlight:acpi_video0"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("dms ipc call brightness decrement 5 backlight:acpi_video0"), { locked = true, repeating = true })

-- Binds :: Gestures
hl.gesture({
  fingers = 3,
  direction = "horizontal",
  action = "workspace",
})

-- Binds :: Submaps
hl.bind(mainMod .. " + R",  hl.dsp.submap("resize"))
hl.define_submap("resize", function()
  local resize_binds = {
    { keys = { "left",  "H" }, x = -10, y =   0 },
    { keys = { "right", "L" }, x =  10, y =   0 },
    { keys = { "up",    "K" }, x =   0, y = -10 },
    { keys = { "down",  "J" }, x =   0, y =  10 },
  }
  for _, b in ipairs(resize_binds) do
    for _, k in ipairs(b.keys) do
      hl.bind(k, hl.dsp.window.resize({ x = b.x, y = b.y, relative = true }), { repeating = true })
      hl.bind(k, hl.dsp.submap("reset"), { release = true })
    end
  end
  hl.bind("escape", hl.dsp.submap("reset"))
end)

hl.bind(mainMod .. " + B", hl.dsp.submap("browser"))
hl.define_submap("browser", function()
  local program_binds = {
    { key = "B", cmd = "brave" },
    { key = "F", cmd = "floorp" },
    { key = "SHIFT + F", cmd = "firefox" },
  }
  for _, program in ipairs(program_binds) do
    hl.bind(program.key, hl.dsp.exec_cmd(program.cmd))
    hl.bind(program.key, hl.dsp.submap("reset"), { release = true })
  end
  hl.bind("escape", hl.dsp.submap("reset"))
end)

hl.bind(mainMod .. "+ SHIFT + V", hl.dsp.submap("video"))
hl.define_submap("video", function()
  local program_binds = {
    { key = "O", cmd = "obs" },
    { key = "K", cmd = "kdenlive" },
  }
  for _, program in ipairs(program_binds) do
    hl.bind(program.key, hl.dsp.exec_cmd(program.cmd))
    hl.bind(program.key, hl.dsp.submap("reset"), { release = true })
  end
  hl.bind("escape", hl.dsp.submap("reset"))
end)
