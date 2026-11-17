-- ============================================================
-- WINDOW RULES - ported from the for_window rules in
-- ~/dotfiles/sway/config. Special workspace assignments are
-- deferred (no special workspaces yet).
-- sway app_id -> Hyprland class; ppt -> percent
-- ============================================================

-- --- Float only, by class ---
local float_only = {
    "guifetch", "yad", "zenity", "blueman-manager", "feh", "imv",
    "org.gnome.FileRoller", "file-roller", "system-config-printer", "qps",
}
for _, c in ipairs(float_only) do
    hl.window_rule({ name = "float-" .. c, match = { class = "^" .. c .. "$" }, float = true })
end

-- --- Float + percent size + center ---
hl.window_rule({ name = "float-settings",    match = { class = "^org.gnome.Settings$" },        float = true, size = "70% 80%", center = true })
hl.window_rule({ name = "float-pavucontrol", match = { class = "^org.pulseaudio.pavucontrol$" }, float = true, size = "60% 70%", center = true })
hl.window_rule({ name = "float-nwg-look",    match = { class = "^nwg-look$" },                float = true, size = "50% 60%", center = true })
hl.window_rule({ name = "float-nmtui",       match = { class = "^kitty$", title = "^nmtui$" }, float = true, size = "60% 70%", center = true })

-- --- Dialogs by title ---
local dialog_titles = {
    "^(Select|Open)( a)? (File|Folder)(s)?$",
    "^File (Operation|Upload)( Progress)?$",
    ".* Properties$",
    "^Export Image as PNG$",
    "^Save As$",
    "^Library$",
}
for _, t in ipairs(dialog_titles) do
    hl.window_rule({ name = "float-dialog", match = { title = t }, float = true })
end

-- --- Steam friends list ---
hl.window_rule({ name = "float-steam-friends", match = { class = "^steam$", title = "^Friends List$" }, float = true })

-- --- Picture-in-picture: float + sticky + size + position ---
hl.window_rule({ name = "pip", match = { title = "^Picture[-( ]in[-( ][Pp]icture" }, float = true, pin = true, size = "30% 30%", move = "69% 67%" })
