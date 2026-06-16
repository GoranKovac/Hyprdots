local mainMod = "SUPER"
local apps = require("def_programs")

local num_keys = {
    "KP_End",
    "KP_Down",
    "KP_Next",
    "KP_Left",
    "KP_Begin",
    "KP_Right",
    "KP_Home",
    "KP_Up",
    "KP_Prior",
    "KP_Insert",
}

hl.config({ binds = { scroll_event_delay = 100 } })

-- Apps
hl.bind(mainMod .. " + SHIFT + W", hl.dsp.exec_cmd("wayscriber --active"))
--hl.bind(mainMod .. " + C",         hl.dsp.exec_cmd(apps.cp))
hl.bind(mainMod .. " + C", hl.dsp.exec_cmd("foot -a CLIPSE clipse"))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(apps.record))
hl.bind(mainMod .. " + F12", hl.dsp.exec_cmd(apps.quicktools))
hl.bind(mainMod .. " + SHIFT + F", hl.dsp.exec_cmd(apps.locate))
hl.bind(mainMod .. " + ALT + SPACE", hl.dsp.exec_cmd(apps.system))
hl.bind("CTRL + SHIFT + ESCAPE", hl.dsp.exec_cmd(apps.htop))
hl.bind("ALT + F4", hl.dsp.exec_cmd(apps.powermenu))

hl.bind(mainMod .. " + T", hl.dsp.exec_cmd(apps.terminal))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(apps.browser))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(apps.editor))
hl.bind(mainMod .. " + N", hl.dsp.exec_cmd("foot -a NVIM nvim"))
hl.bind(mainMod .. " + F", hl.dsp.exec_cmd(apps.fileManager))
hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd(apps.menu))
hl.bind(mainMod .. " + S", hl.dsp.exec_cmd(apps.hshotregion))
hl.bind("PRINT", hl.dsp.exec_cmd(apps.hshotactive))
hl.bind(mainMod .. " + P", hl.dsp.exec_cmd(apps.hpick))

-- Window management
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + CTRL + F", hl.dsp.window.fullscreen(1))
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"))

-- Move focus
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "l" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "r" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "u" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "d" }))

-- Swap windows
hl.bind(mainMod .. " + SHIFT + left", hl.dsp.window.swap({ direction = "l" }))
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.window.swap({ direction = "r" }))
hl.bind(mainMod .. " + SHIFT + up", hl.dsp.window.swap({ direction = "u" }))
hl.bind(mainMod .. " + SHIFT + down", hl.dsp.window.swap({ direction = "d" }))

-- Special workspaces
hl.bind(mainMod .. " + grave", hl.dsp.workspace.toggle_special("TERM"))
hl.bind(mainMod .. " + RETURN", hl.dsp.workspace.toggle_special("SYS"))

-- Switch / move to workspaces [1-10]
for i = 1, 10 do
    local key = tostring(i % 10)
    hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Numpad workspace binds
for i = 1, #num_keys do
    hl.bind(mainMod .. " + " .. num_keys[i], hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. num_keys[i], hl.dsp.window.move({ workspace = i }))
end

-- Mouse
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Media / brightness
hl.bind(
    "XF86AudioRaiseVolume",
    hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
    { locked = true, repeating = true }
)
hl.bind(
    "XF86AudioLowerVolume",
    hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
    { locked = true, repeating = true }
)
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), { locked = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })

hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
