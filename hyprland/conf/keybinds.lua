-- ============================================================
-- KEYBINDS - ported from ~/dotfiles/sway/config
-- Deferred to Quickshell (phase 3): launcher, rofi quick menus,
-- clipboard history, emoji picker, power menu, close
-- notifications, lock screen. Skipped for now: scratchpad and
-- special workspaces. See docs/cheatsheet.md for the full list.
-- ============================================================

local mod = "SUPER"
local terminal = "kitty --directory /home/kyannahm/Documents/26-27sem1"
local browser = "firefox"
local editor = "neovim"
local fileexplorer = "thunar"

-- --- Apps ---
hl.bind(mod .. " + Return", hl.dsp.exec_cmd(terminal))
hl.bind(mod .. " + F", hl.dsp.exec_cmd(browser))
hl.bind(mod .. " + C", hl.dsp.exec_cmd(editor))
hl.bind(mod .. " + E", hl.dsp.exec_cmd(fileexplorer))
hl.bind(mod .. " + ALT + E", hl.dsp.exec_cmd("nemo"))
hl.bind(mod .. " + G", hl.dsp.exec_cmd("github-desktop"))
hl.bind("CTRL + ALT + Escape", hl.dsp.exec_cmd("qps"))
hl.bind("CTRL + ALT + V", hl.dsp.exec_cmd("pavucontrol"))

-- --- Screenshot (hyprshot) ---
hl.bind("Print", hl.dsp.exec_cmd("hyprshot -m region -n -c"))
hl.bind(mod .. " + SHIFT + S", hl.dsp.exec_cmd("hyprshot -m region -n -c"))
hl.bind("SHIFT + Print", hl.dsp.exec_cmd("hyprshot -m screen -n -c"))
hl.bind("CTRL + Print", hl.dsp.exec_cmd("hyprshot -m active -n -c"))

-- --- Screen record (gpu-screen-recorder) ---
-- portal opens the Wayland picker for a screen; region uses slurp
hl.bind(mod .. " + ALT + R", hl.dsp.exec_cmd("gpu-screen-recorder -w portal -a default_output -f 60 -o ~/Videos/recording-$(date +%Y%m%d-%H%M%S).mp4"))
hl.bind("CTRL + ALT + R", hl.dsp.exec_cmd("gpu-screen-recorder -w portal -f 60 -o ~/Videos/recording-$(date +%Y%m%d-%H%M%S).mp4"))
hl.bind(mod .. " + SHIFT + ALT + R", hl.dsp.exec_cmd("gpu-screen-recorder -w region -region \"$(slurp)\" -f 60 -o ~/Videos/recording-$(date +%Y%m%d-%H%M%S).mp4"))

-- --- Color picker ---
hl.bind(mod .. " + SHIFT + C", hl.dsp.exec_cmd("hyprpicker -a"))

-- --- Suspend ---
hl.bind(mod .. " + SHIFT + L", hl.dsp.exec_cmd("systemctl suspend-then-hibernate"))

-- --- Volume / media (wpctl + playerctl) ---
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), { locked = true })
hl.bind(mod .. " + SHIFT + M", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true })
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ 0 && wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 2%+"), { locked = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ 0 && wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%-"), { locked = true })
hl.bind("CTRL + " .. mod .. " + space", hl.dsp.exec_cmd("playerctl play-pause"))
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"))
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"))
hl.bind("CTRL + " .. mod .. " + equal", hl.dsp.exec_cmd("playerctl next"))
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"))
hl.bind("CTRL + " .. mod .. " + minus", hl.dsp.exec_cmd("playerctl previous"))
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"))
hl.bind("XF86AudioStop", hl.dsp.exec_cmd("playerctl stop"))

-- --- Brightness ---
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl set 5%+"), { locked = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl set 5%-"), { locked = true })

-- --- Window focus / move ---
hl.bind(mod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mod .. " + down", hl.dsp.focus({ direction = "down" }))
hl.bind(mod .. " + SHIFT + left", hl.dsp.window.move({ direction = "left" }))
hl.bind(mod .. " + SHIFT + right", hl.dsp.window.move({ direction = "right" }))
hl.bind(mod .. " + SHIFT + up", hl.dsp.window.move({ direction = "up" }))
hl.bind(mod .. " + SHIFT + down", hl.dsp.window.move({ direction = "down" }))

-- --- Move workspace to output direction ---
-- sway runs two commands per key: right+up for greater, left+down for less
hl.bind(mod .. " + greater", function()
    hl.dispatch(hl.dsp.exec_raw("moveworkspacetomonitor right"))
    hl.dispatch(hl.dsp.exec_raw("moveworkspacetomonitor up"))
end)
hl.bind(mod .. " + less", function()
    hl.dispatch(hl.dsp.exec_raw("moveworkspacetomonitor left"))
    hl.dispatch(hl.dsp.exec_raw("moveworkspacetomonitor down"))
end)

-- --- Resize by 50px ---
hl.bind(mod .. " + minus", hl.dsp.exec_raw("resizeactive -50 0"))
hl.bind(mod .. " + equal", hl.dsp.exec_raw("resizeactive 50 0"))

-- --- Fullscreen / floating / center / close ---
hl.bind(mod .. " + SHIFT + F", hl.dsp.window.fullscreen({ mode = 0 }))
hl.bind(mod .. " + ALT + F", hl.dsp.global("fullscreen"))
hl.bind(mod .. " + ALT + space", hl.dsp.window.float({ action = "toggle" }))
hl.bind("CTRL + " .. mod .. " + backslash", hl.dsp.window.center())
hl.bind(mod .. " + Q", hl.dsp.window.close())

-- --- Mouse window management ---
hl.bind(mod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- --- Cycle windows / layout ---
hl.bind("ALT + Tab", hl.dsp.window.cycle_next())
hl.bind("SHIFT + ALT + Tab", hl.dsp.window.cycle_next({ prev = true }))
hl.bind("CTRL + ALT + Tab", hl.dsp.layout("togglesplit"))

-- --- Workspaces 1-10: switch / move window ---
for i = 1, 10 do
    local key = i % 10
    hl.bind(mod .. " + " .. key, hl.dsp.focus({ workspace = i }))
    hl.bind(mod .. " + ALT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- --- Workspaces: next / prev ---
hl.bind("CTRL + " .. mod .. " + right", hl.dsp.focus({ workspace = "e+1" }))
hl.bind("CTRL + " .. mod .. " + left", hl.dsp.focus({ workspace = "e-1" }))
hl.bind(mod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))
hl.bind(mod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mod .. " + Page_Up", hl.dsp.focus({ workspace = "e-1" }))
hl.bind(mod .. " + Page_Down", hl.dsp.focus({ workspace = "e+1" }))

-- --- Move window to next / prev workspace ---
hl.bind(mod .. " + ALT + Page_Up", hl.dsp.window.move({ workspace = "e-1" }))
hl.bind(mod .. " + ALT + Page_Down", hl.dsp.window.move({ workspace = "e+1" }))
hl.bind("CTRL + " .. mod .. " + SHIFT + right", hl.dsp.window.move({ workspace = "e+1" }))
hl.bind("CTRL + " .. mod .. " + SHIFT + left", hl.dsp.window.move({ workspace = "e-1" }))

-- --- Pin / reload ---
hl.bind(mod .. " + ALT + P", hl.dsp.window.pin({ action = "toggle" }))
hl.bind("CTRL + " .. mod .. " + SHIFT + R", hl.dsp.reload_config())

-- --- Resize mode (submap) ---
hl.define_submap("resize", function()
    hl.bind("H", hl.dsp.exec_raw("resizeactive -20 0"))
    hl.bind("L", hl.dsp.exec_raw("resizeactive 20 0"))
    hl.bind("K", hl.dsp.exec_raw("resizeactive 0 -20"))
    hl.bind("J", hl.dsp.exec_raw("resizeactive 0 20"))
    hl.bind("Return", hl.dsp.submap("reset"))
    hl.bind("Escape", hl.dsp.submap("reset"))
end)
hl.bind(mod .. " + X", hl.dsp.submap("resize"))
