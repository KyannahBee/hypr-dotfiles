-- ============================================================
-- MODERN LAYER - general layout, decoration, animations
-- Issue #7. Differs from the swayfx config on purpose: sway had
-- zero gaps and no rounding; here gaps are minimal and rounding
-- is small.
-- No colors are set in this file (AGENTS.md rule 4): the theme
-- service in phase 2 pushes all colors from themes/<name>/.
-- ============================================================

hl.config({
    general = {
        gaps_in = 2,
        gaps_out = 4,
        border_size = 2,
        layout = "dwindle",
    },

    decoration = {
        rounding = 4,
        rounding_power = 2,

        active_opacity = 1.0,
        inactive_opacity = 1.0,

        shadow = {
            enabled = true,
            range = 8,
            render_power = 3,
        },

        blur = {
            enabled = true,
            size = 8,
            passes = 2,
        },

        dim_strength = 0.4,
        dim_special = 0.2,
    },

    animations = {
        enabled = true,
    },
})

-- Blur for the Quickshell shell layers (bar, island)
hl.layer_rule({ name = "blur-quickshell", match = { namespace = "^quickshell$" }, blur = true, blur_popups = true })

-- Curves (stock set)
hl.curve("easeOutQuint",   { type = "bezier", points = { {0.23, 1},    {0.32, 1}    } })
hl.curve("easeInOutCubic", { type = "bezier", points = { {0.65, 0.05}, {0.36, 1}    } })
hl.curve("linear",         { type = "bezier", points = { {0, 0},       {1, 1}       } })
hl.curve("almostLinear",   { type = "bezier", points = { {0.5, 0.5},   {0.75, 1}    } })
hl.curve("quick",          { type = "bezier", points = { {0.15, 0},    {0.1, 1}     } })
hl.curve("easy",           { type = "spring", mass = 1, stiffness = 238.1191, damping = 24.21279333 })

-- Animations: layers and workspaces fade, windows pop in
hl.animation({ leaf = "global",        enabled = true, speed = 10,   bezier = "default" })
hl.animation({ leaf = "border",        enabled = true, speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows",       enabled = true, speed = 4.79, spring = "easy" })
hl.animation({ leaf = "windowsIn",     enabled = true, speed = 4.1,  spring = "easy",      style = "popin 87%" })
hl.animation({ leaf = "windowsOut",    enabled = true, speed = 1.49, bezier = "linear",    style = "popin 87%" })
hl.animation({ leaf = "fadeIn",        enabled = true, speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut",       enabled = true, speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade",          enabled = true, speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers",        enabled = true, speed = 3.81, bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersIn",      enabled = true, speed = 4,    bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut",     enabled = true, speed = 1.5,  bezier = "linear",      style = "fade" })
hl.animation({ leaf = "fadeLayersIn",  enabled = true, speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces",    enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn",  enabled = true, speed = 1.21, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "zoomFactor",    enabled = true, speed = 7,    bezier = "quick" })

-- Minimal layout preset (issue #7): uncomment to turn blur,
-- rounding, and animations off.
-- hl.config({
--     decoration = { rounding = 0, blur = { enabled = false } },
--     animations = { enabled = false },
-- })
