local apps = require("def_programs")

-- Workspace → monitor assignments
hl.workspace_rule({ workspace = "1", monitor = "DP-2" })
hl.workspace_rule({ workspace = "2", monitor = "DP-2" })
hl.workspace_rule({ workspace = "3", monitor = "DP-2" })
hl.workspace_rule({ workspace = "4", monitor = "DP-2" })
hl.workspace_rule({ workspace = "5", monitor = "DP-2" })
hl.workspace_rule({ workspace = "6", monitor = "DP-2" })
hl.workspace_rule({ workspace = "7", monitor = "DP-3" })
hl.workspace_rule({ workspace = "8", monitor = "DP-2" })
hl.workspace_rule({ workspace = "9", monitor = "HDMI-A-1" })
hl.workspace_rule({ workspace = "10", monitor = "DP-2" })

-- Special workspaces
hl.workspace_rule({ workspace = "special:TERM", on_created_empty = "foot" })
hl.workspace_rule({ workspace = "SYS" })

-- Suppress maximize requests from all apps
hl.window_rule({
    name = "suppress-maximize-events",
    match = { class = ".*" },
    suppress_event = "maximize",
})

-- Fix XWayland dragging issues
hl.window_rule({
    name = "fix-xwayland-drags",
    match = {
        class = "^$",
        title = "^$",
        xwayland = true,
        float = true,
        fullscreen = false,
        pin = false,
    },
    no_focus = true,
})

-- hyprland-run helper
hl.window_rule({
    name = "move-hyprland-run",
    match = { class = "hyprland-run" },
    move = "20 monitor_h-120",
    float = true,
})

-- Gaming tearing on workspace 10
hl.window_rule({ name = "wr-tearing", immediate = true, match = { workspace = "10" } })

-- App → workspace assignments
hl.window_rule({ name = "wr-discord", workspace = 7, match = { class = "discord" } })
hl.window_rule({
    name = "wr-reaper",
    workspace = 3,
    match = { class = "REAPER" },
    render_unfocused = true,
})
hl.window_rule({ name = "wr-godot", workspace = 5, match = { class = "Godot" } })
hl.window_rule({ name = "wr-firefox", workspace = 1, match = { class = "firefox" } })
hl.window_rule({ name = "wr-nautilus", workspace = 2, match = { class = "org.gnome.Nautilus" } })
hl.window_rule({ name = "wr-fusion", workspace = 8, match = { class = "Fusion" } })
hl.window_rule({ name = "wr-zed", workspace = 4, match = { class = "dev.zed.Zed" } })
hl.window_rule({ name = "wr-steam-ws", workspace = 10, match = { class = "steam" } })
hl.window_rule({ name = "wr-mpv", workspace = 6, match = { class = "mpv" } })
hl.window_rule({ name = "wr-fmod-ws", workspace = 6, match = { class = "^fmodstudio$" } })

-- gcr-prompter (keyring)
-- hl.window_rule({ name = "wr-gcr-ws",     workspace = 4,   match = { class = "gcr-prompter", title = "Unlock Keyring" } })
-- hl.window_rule({ name = "wr-gcr-focus",  stay_focused = true, match = { class = "gcr-prompter" } })

-- Steam: float main window and all popups (two separate rules, no negative match)
hl.window_rule({ name = "wr-steam-main", float = true, match = { class = "steam", title = "^Steam$" } })
hl.window_rule({ name = "wr-steam-popups", float = true, match = { class = "steam", title = "negative:^Steam$" } })

-- Float misc apps
hl.window_rule({
    name = "wr-galculator",
    float = true,
    size = "700 500",
    move = "50% 50%",
    match = { class = "galculator" },
})
hl.window_rule({
    name = "wr-wiremix",
    float = true,
    size = "700 500",
    move = "(monitor_w-720) (monitor_h-562)",
    match = { class = "WIREMIX" },
})
hl.window_rule({
    name = "wr-transmission",
    float = true,
    size = "700 500",
    move = "50% 50%",
    match = { class = "com.transmissionbt.transmission_66309_20599666" },
})
hl.window_rule({ name = "wr-mpv-float", float = true, match = { class = "mpv" } })
hl.window_rule({ name = "wr-clipse", float = true, size = "700 700", match = { class = "clipse" } })

-- fmodstudio: float everything, except untile Event windows
hl.window_rule({ name = "wr-fmod-float", float = true, match = { class = "^fmodstudio$" } })
hl.window_rule({ name = "wr-fmod-tile", float = false, match = { class = "^fmodstudio$", title = ".*Event.*" } })

-- Layer rules
hl.layer_rule({ name = "menu", match = { namespace = "launcher" }, blur = true })
hl.layer_rule({ name = "notification", match = { namespace = "notifications" }, blur = true })

-- Clipboard
hl.window_rule({
    name = "wr-clipse",
    float = true,
    size = "500 800",
    move = "50% 50%",
    match = { class = "CLIPSE" },
})
