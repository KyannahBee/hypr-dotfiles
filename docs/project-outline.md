# Project outline - SwayFX to Hyprland + Quickshell

The goal is a modern Hyprland + Quickshell desktop. It keeps the workflow of
the old SwayFX setup, adds blur and animations, and puts wallpaper, theme, and
layout switching behind a dynamic island and a settings menu.

## What the old setup uses, and what replaces it

| Old package (SwayFX) | Role | New home |
| --- | --- | --- |
| swayfx | compositor | Hyprland (native blur, animations, rounding) |
| waybar | top bar | Quickshell bar module |
| rofi | launcher plus wifi, bluetooth, volume, brightness, battery menus | Quickshell launcher, island quick actions, settings menu |
| dunst | notifications | Quickshell notification module |
| wlogout | power menu | Quickshell power menu |
| gtklock | lock screen | hyprlock |
| cliphist + tofi | clipboard history | Quickshell clipboard module |
| bemoji | emoji picker | Quickshell emoji picker |
| gammastep | night light | hyprsunset |
| grimshot, wf-recorder, slurp | screenshots and recording | grimblast or hyprshot, wl-screenrec |
| hyprpicker | color picker | keep as is |
| colorschemes/ + switch.sh | theme and wallpaper switching | `themes/<name>/theme.json` plus a theme service |
| wallpaper.jpg symlink | wallpaper | swww or hyprpaper with transitions |

The live old setup is in `~/dotfiles`; read it there for comparison.

## Target layout

    hypr-dotfiles/
    ├── AGENTS.md
    ├── install.sh
    ├── hyprland/
    │   ├── hyprland.lua         # entry point, requires conf/*.lua
    │   ├── conf/                # monitors, input, keybinds, windowrules,
    │   │                        # autostart, decoration, animations
    │   └── scripts/
    ├── quickshell/
    │   ├── shell.qml
    │   ├── modules/             # bar, island, launcher, settings,
    │   │                        # notifications, osd, power, clipboard
    │   ├── services/            # theme, wallpaper, hyprland IPC, stats
    │   └── assets/
    ├── themes/
    │   └── pixel-castle/        # theme.json + wallpaper.jpg
    └── docs/                  # project-outline.md, cheatsheet.md (keybinds)

## Phases and GitHub issues

Each phase maps to small issues. Work one issue at a time and verify it
before you close it.

### Phase 0 - baseline

1. Vendor the SwayFX reference copy into `swayfx-reference/`. Dropped: we
   read `~/dotfiles` directly instead of keeping a frozen copy.
2. Repo scaffolding: `AGENTS.md`, this outline, `.gitignore`, `install.sh`
   stub.

### Phase 1 - Hyprland core

3. Base config: monitors, input devices, environment variables, autostart
   (polkit, keyring, mpris proxy, quickshell). The clipboard watcher and
   night light move to the Quickshell shell and the phase 2 theme service.
   Done: commit 7d340c3 (issue #4).
4. Port the keybinds from `~/dotfiles/sway/config`: apps, workspaces,
   media keys, screenshots, color picker, reload. Scratchpad binds are
   deferred to the special-workspace work; launcher, lock, power menu,
   and quick menus are deferred to Quickshell (phase 3).
   Done: commit fd8da71 (issue #5). Full list in docs/cheatsheet.md.
5. Port window rules: floating dialogs, picture-in-picture, per-app float.
   Special workspace assignments are deferred (no special workspaces yet).
   Done: conf/windowrules.lua (issue #6).
6. Modern layer: blur, animations, rounded corners, shadows, dimming.
   Done: conf/decoration.lua (issue #7). Minimal gaps (2/4) and small
   rounding (4) differ from the swayfx zero-gap pixel look on purpose.

### Phase 2 - theming engine

7. Theme schema (`themes/<name>/theme.json`) and port of the pixel-castle
   theme from `~/dotfiles/colorschemes/pixel-castle/` as the first theme.
8. Live theme switcher: one command or one click updates Hyprland colors,
   Quickshell palette, kitty, GTK, cursor, and wallpaper without a restart.

### Phase 3 - Quickshell shell

9. Quickshell scaffold plus top bar: workspaces, window title, clock, tray,
   system stats (port of the modules in `~/dotfiles/waybar/config.jsonc`).
10. Dynamic island: a collapsed pill at the top center that expands on click
    with quick actions (theme, wallpaper, brightness, volume, wifi,
    bluetooth, do not disturb).
11. App launcher with search (replaces rofi drun).
12. Settings menu: appearance (theme and wallpaper thumbnails), layout
    presets (minimal, standard, full), effects (blur strength, animation
    speed), and a keybind list.
13. Notifications and OSD (volume, brightness) to replace dunst.
14. Power menu and lock screen (replaces wlogout and gtklock).
15. Clipboard history and emoji picker (replaces cliphist and bemoji).

### Phase 4 - polish

16. Install script, dependency list, and verification docs.

## Layout presets

The settings menu switches between layout presets. Each preset is a set of
flags that the Quickshell shell and Hyprland read at runtime:

- `minimal` - thin bar only, no island, no blur, sharp corners.
- `standard` - bar plus island, blur on, rounded corners.
- `full` - bar plus island plus extra widgets, stronger blur, full
  animations.

## How to verify each piece

- Hyprland changes: `hyprctl reload`, then read the Hyprland log and confirm
  there are no config errors. Spot-check with `hyprctl monitors`,
  `hyprctl binds`, and `hyprctl getoption`.
- Quickshell changes: run `qs -c hyprdot`, watch the output for QML errors,
  then click through the module you changed.
- Theme switch: run the switcher, then confirm the bar, island, windows, and
  wallpaper all changed in one go.
- Every issue lists its own acceptance checks. Close an issue only after
  those checks pass on a real session.
