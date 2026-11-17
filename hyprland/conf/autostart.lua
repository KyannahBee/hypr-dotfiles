-- --- Autostart (ported from sway exec_always / exec) ---
-- hl.on("hyprland.start") fires once at startup, not on reload,
-- so it matches exec-once behavior and avoids duplicate agents.

hl.on("hyprland.start", function()
    -- Polkit authentication agent
    hl.exec_cmd("/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1")
    -- Keyring
    hl.exec_cmd("gnome-keyring-daemon --start --components=secrets")
    -- Quickshell shell: bar, launcher, notifications, island
    -- (replaces waybar, dunst, rofi, wlogout, gtklock, cliphist, bemoji)
    hl.exec_cmd("qs -c hyprdot")
    -- Cursor theme for GTK apps
    hl.exec_cmd("gsettings set org.gnome.desktop.interface cursor-theme 'Pink-Paw'")
    hl.exec_cmd("gsettings set org.gnome.desktop.interface cursor-size 20")
    -- Media proxy for bluetooth
    hl.exec_cmd("mpris-proxy")
    -- Trash cleanup (30 days)
    hl.exec_cmd("trash-empty 30")
end)
