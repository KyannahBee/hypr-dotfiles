-- ============================================================
-- HYPRLAND CONFIG - entry point
-- Loads the split files in conf/
-- ============================================================

require("conf.monitors")
require("conf.input")
require("conf.env")
require("conf.autostart")
require("conf.keybinds")
require("conf.windowrules")

-- Added by later issues:
-- require("conf.decoration")  (issue #7)
