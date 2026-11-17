-- ============================================================
-- HYPRLAND CONFIG - entry point
-- Loads the split files in conf/
-- ============================================================

require("conf.monitors")
require("conf.input")
require("conf.env")
require("conf.autostart")
require("conf.keybinds")

-- Added by later issues:
-- require("conf.windowrules") (issue #6)
-- require("conf.decoration")  (issue #7)
