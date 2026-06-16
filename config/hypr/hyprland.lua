require("monitors")
require("def_programs")
require("keybinds")
require("autostart")
require("workspaces")

-- Core
hl.config({
    misc = {
        enable_anr_dialog       = false,
        focus_on_activate       = true,
        render_unfocused_fps    = 30,
        force_default_wallpaper = 0,
        disable_hyprland_logo   = true,
    },
    binds = {
        drag_threshold = 1,
    },
    cursor = {
        no_warps = true,
    },
})



-- Environment variables
hl.env("XCURSOR_SIZE",                "24")
hl.env("HYPRCURSOR_SIZE",             "24")
hl.env("EDITOR",                      "vim")
hl.env("FZF_DEFAULT_COMMAND",         "fd --type f -H")
hl.env("ELECTRON_OZONE_PLATFORM_HINT","wayland")
hl.env("PULSE_LATENCY_MSEC",          "30")

-- Input
hl.config({
    input = {
        kb_layout          = "us",
        kb_variant         = "",
        kb_model           = "",
        kb_options         = "",
        kb_rules           = "",
        numlock_by_default = true,
        mouse_refocus      = false,
        accel_profile      = "flat",
        sensitivity        = 0,
        touchpad = {
            natural_scroll = false,
        },
        touchdevice = {
            enabled = false,
        },
    },
})

-- Look and feel
hl.config({
    general = {
        gaps_in         = 5,
        gaps_out        = 15,
        border_size     = 4,
        col = {
            active_border   = "rgba(33ccffee)",
            inactive_border = "rgba(595959aa)",
        },
        resize_on_border = false,
        allow_tearing    = true,
        layout           = "dwindle",
    },

    decoration = {
        rounding         = 0,
        rounding_power   = 2,
        active_opacity   = 1.0,
        inactive_opacity = 1.0,
        shadow = {
            enabled      = false,
            range        = 4,
            render_power = 3,
            color        = "rgba(1a1a1aee)",
        },
        blur = {
            enabled  = true,
            size     = 3,
            passes   = 1,
            vibrancy = 0.1696,
        },
    },

    animations = {
        enabled = true,
    },

    dwindle = {
        preserve_split = true,
    },

    master = {
        new_status = "master",
    },
})

-- Bezier curves
hl.curve("easeOutQuint",   { type = "bezier", points = { {0.23, 1},    {0.32, 1}    } })
hl.curve("easeInOutCubic", { type = "bezier", points = { {0.65, 0.05}, {0.36, 1}    } })
hl.curve("linear",         { type = "bezier", points = { {0, 0},       {1, 1}       } })
hl.curve("almostLinear",   { type = "bezier", points = { {0.5, 0.5},   {0.75, 1}    } })
hl.curve("quick",          { type = "bezier", points = { {0.15, 0},    {0.1, 1}     } })

-- Animations
hl.animation({ leaf = "global",        enabled = true, speed = 10,   bezier = "default" })
hl.animation({ leaf = "border",        enabled = true, speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows",       enabled = true, speed = 4.79, bezier = "easeOutQuint" })
hl.animation({ leaf = "windowsIn",     enabled = true, speed = 4.1,  bezier = "easeOutQuint", style = "popin 87%" })
hl.animation({ leaf = "windowsOut",    enabled = true, speed = 1.49, bezier = "linear",       style = "popin 87%" })
hl.animation({ leaf = "fadeIn",        enabled = true, speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut",       enabled = true, speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade",          enabled = true, speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers",        enabled = true, speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn",      enabled = true, speed = 4,    bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut",     enabled = true, speed = 1.5,  bezier = "linear",       style = "fade" })
hl.animation({ leaf = "fadeLayersIn",  enabled = true, speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces",    enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn",  enabled = true, speed = 1.21, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
