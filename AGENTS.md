# AGENTS.md - hypr-dotfiles

This repo ports the SwayFX desktop setup to Hyprland + Quickshell. The live
SwayFX config in `~/dotfiles` (sway, waybar, rofi, gtklock, colorschemes) is
the baseline. Read it directly; do not copy it into this repo.

## Repo layout

- `hyprland/` - Hyprland config. `hyprland.conf` is the entry point and it
  includes the files in `conf/`.
- `quickshell/` - the Quickshell shell: `shell.qml`, `modules/`, `services/`,
  `assets/`.
- `themes/` - one folder per theme. Each theme has a `theme.json` (colors and
  style flags) and a `wallpaper.jpg`.
- `docs/` - the project outline and other notes.
- `install.sh` - links the configs into `~/.config` and lists dependencies.

## Working rules

1. Write docs, comments, and chat replies in ASD-STE100 plain English: short
   sentences, active voice, no contractions.
2. Base all porting work on the live config in `~/dotfiles`. Do not copy it
   into this repo.
3. Work one GitHub issue at a time. Each issue must be small enough to finish
   and verify in one sitting.
4. Never hardcode colors in QML or Hyprland files. All colors come from the
   active theme in `themes/`.
5. Verify before you claim a task is done:
   - Hyprland: run `hyprctl reload`, then check the Hyprland log for config
     errors.
   - Quickshell: run `qs -c hyprdot` and check the output for QML errors.
   - Write in the issue what you ran and what you saw.
6. Commit once per issue. Put the issue number in the commit message, for
   example: `git commit -m "bar: add clock module (#9)"`. Do not commit unless
   the user confirms the exact change in chat first.
7. Update `docs/project-outline.md` when the plan changes. Keep this file
   current.

## Theme format

Each theme lives in `themes/<name>/`:

- `theme.json` - colors and style flags:

      {
        "name": "pixel-castle",
        "colors": {
          "bg": "#1a1624",
          "surface": "#2e2640",
          "text": "#e8dff0",
          "subtext": "#a899b8",
          "accent": "#c87fa0",
          "border_active": "#c87fa0",
          "border_inactive": "#3d3355"
        },
        "style": {
          "blur": true,
          "rounding": 12,
          "animations": true
        }
      }

- `wallpaper.jpg` - the default wallpaper for the theme.

The theme service reads `theme.json` and pushes the colors to Hyprland,
Quickshell, kitty, and GTK at runtime.
