# AGENTS.md - hypr-dotfiles

This repo ports the SwayFX desktop setup to Hyprland + Quickshell. The live
SwayFX config in `~/dotfiles` (sway, waybar, rofi, gtklock, colorschemes) is
the baseline. Read it directly; do not copy it into this repo.

## Repo layout

- `hyprland/` - Hyprland config. `hyprland.lua` is the entry point and it
  requires the files in `conf/`. Hyprland 0.57 uses the Lua config format.
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
8. Known unverified: the `hl.dsp.*` dispatcher names in
   `hyprland/conf/keybinds.lua` (for example `hl.dsp.focus({ workspace = ... })`,
   `hl.dsp.window.center()`, `hl.dsp.layout(...)`, `hl.dsp.reload_config()`)
   and the `hl.curve(...)`, `hl.animation(...)`, and `hl.layer_rule(...)`
   shapes in `hyprland/conf/decoration.lua` parse under
   `Hyprland --verify-config` but their runtime behavior is not yet checked
   against the Hyprland 0.57 Lua API. If `hyprctl reload` reports a config
   error in one of those files, check these names first, then confirm the
   binds with `hyprctl binds` and the decoration values with
   `hyprctl getoption decoration:rounding`, `hyprctl getoption decoration:blur`,
   and `hyprctl getoption animations:enabled`.

## Theme format

Each theme lives in `themes/<name>/`:

- `theme.json` - colors and style flags. The full pixel-castle palette:

      {
        "name": "pixel-castle",
        "colors": {
          "bg": "#1a1624",
          "bg2": "#221d2e",
          "surface": "#2e2640",
          "text": "#e8dff0",
          "subtext": "#a899b8",
          "accent": "#c87fa0",
          "border_active": "#c87fa0",
          "border_inactive": "#3d3355",
          "purple": "#7b6b9e",
          "purple_hi": "#a08bc0",
          "stone": "#c8bfd8",
          "pink": "#c87fa0",
          "pink_hi": "#e8a0c0",
          "pink_active": "#b86c8e",
          "teal": "#4a9e8a",
          "teal_hi": "#6ab8a8",
          "gold": "#c8a060",
          "water": "#3d4a7a"
        },
        "style": {
          "blur": true,
          "rounding": 4,
          "animations": true
        }
      }

  Required color keys: `bg`, `surface`, `text`, `subtext`, `accent`,
  `border_active`, `border_inactive`. The other keys are optional extras
  for Quickshell modules. `accent` and `pink` hold the same value on
  purpose: `accent` is required by the schema, but `pink` is the real
  color name from the SwayFX palette. If the two ever differ, `pink`
  wins.

- `wallpaper.jpg` - the default wallpaper for the theme.

The theme service reads `theme.json` and pushes the colors to Hyprland,
Quickshell, kitty, and GTK at runtime.
The `style` flags (blur, rounding, animations) are applied the same way:
the theme service pushes them to Hyprland at runtime with `hyprctl
keyword`. The Hyprland Lua config does not read `theme.json`.
