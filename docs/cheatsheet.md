# Keybind cheatsheet

Ported from `~/dotfiles/sway/config`. SUPER is the Windows key (Mod4).

## Apps

| Keys | Action | Status |
| --- | --- | --- |
| SUPER+Return | kitty, opens in ~/Documents/26-27sem1 | ported |
| SUPER+F | firefox | ported |
| SUPER+C | neovim | ported |
| SUPER+E | thunar | ported |
| SUPER+Alt+E | nemo | ported |
| SUPER+G | github-desktop | ported |
| Ctrl+Alt+Escape | qps | ported |
| Ctrl+Alt+V | pavucontrol | ported |
| SUPER+Space | app launcher | deferred to Quickshell (phase 3) |
| SUPER+L | lock screen | deferred to Quickshell (phase 3) |

## Menus (rofi in sway)

| Keys | Action | Status |
| --- | --- | --- |
| SUPER+W | wifi menu | deferred to Quickshell island |
| SUPER+B | bluetooth menu | deferred to Quickshell island |
| SUPER+V | volume menu | deferred to Quickshell island |
| SUPER+H | brightness menu | deferred to Quickshell island |
| SUPER+P | battery menu | deferred to Quickshell island |

## Clipboard and emoji

| Keys | Action | Status |
| --- | --- | --- |
| SUPER+Alt+V | clipboard history | deferred to Quickshell clipboard module |
| SUPER+Period | emoji picker | deferred to Quickshell emoji picker |

## Screenshot and recording

| Keys | Action | Status |
| --- | --- | --- |
| Print | screenshot area (hyprshot) | ported |
| SUPER+Shift+S | screenshot area | ported |
| Shift+Print | screenshot output | ported |
| Ctrl+Print | screenshot active window | ported |
| SUPER+Alt+R | record screen with audio (gpu-screen-recorder, portal picker) | ported |
| Ctrl+Alt+R | record screen (gpu-screen-recorder, portal picker) | ported |
| SUPER+Shift+Alt+R | record selected area (gpu-screen-recorder + slurp) | ported |
| SUPER+Shift+C | color picker (hyprpicker) | ported |

## Session

| Keys | Action | Status |
| --- | --- | --- |
| Ctrl+Alt+Delete | power menu | deferred to Quickshell (phase 3) |
| SUPER+Shift+L | suspend-then-hibernate | ported |
| Ctrl+Alt+C | close all notifications | deferred to Quickshell (phase 3) |

## Volume, media, brightness

| Keys | Action | Status |
| --- | --- | --- |
| XF86AudioMute / SUPER+Shift+M | toggle mute | ported |
| XF86AudioMicMute | toggle mic mute | ported |
| XF86AudioRaiseVolume | volume +2% | ported |
| XF86AudioLowerVolume | volume -2% | ported |
| Ctrl+SUPER+Space, XF86AudioPlay/Pause | play-pause | ported |
| Ctrl+SUPER+Equal, XF86AudioNext | next track | ported |
| Ctrl+SUPER+Minus, XF86AudioPrev | previous track | ported |
| XF86AudioStop | stop | ported |
| XF86MonBrightnessUp/Down | brightness +/-5% | ported |

## Window management

| Keys | Action | Status |
| --- | --- | --- |
| SUPER+Arrows | focus window | ported |
| SUPER+Shift+Arrows | move window | ported |
| SUPER+Greater | move workspace to output right, then up | ported |
| SUPER+Less | move workspace to output left, then down | ported |
| SUPER+Minus / SUPER+Equal | shrink / grow width 50px | ported |
| SUPER+Shift+F | fullscreen toggle | ported |
| SUPER+Alt+F | fullscreen global | removed: no Hyprland equivalent, old bind was dead |
| SUPER+Alt+Space | floating toggle | ported |
| Ctrl+SUPER+Backslash | center window | ported |
| SUPER+Q | close window | ported |
| SUPER+LMB drag | move window | ported |
| SUPER+RMB drag | resize window | ported |
| Alt+Tab / Shift+Alt+Tab | cycle windows next/prev | ported |
| Ctrl+Alt+Tab | toggle split direction | ported (sway also cycled tabbed; Hyprland dwindle has no tabbed layout) |
| SUPER+Alt+P | pin (sticky) toggle | ported |
| Ctrl+SUPER+Shift+R | reload config | ported |
| SUPER+X, then h/l/k/j | resize mode, 20px steps | ported |

## Workspaces

| Keys | Action | Status |
| --- | --- | --- |
| SUPER+1..0 | switch to workspace 1-10 | ported |
| SUPER+Alt+1..0 | move window to workspace 1-10 | ported |
| Ctrl+SUPER+Right/Left | next/prev workspace | ported |
| SUPER+scroll up/down | prev/next workspace | ported |
| SUPER+Page_Up/Page_Down | prev/next workspace | ported |
| SUPER+Alt+Page_Up/Page_Down | move window to prev/next workspace | ported |
| Ctrl+SUPER+Shift+Right/Left | move window to next/prev workspace | ported |

## Scratchpad (skipped for now)

| Keys | Action | Status |
| --- | --- | --- |
| SUPER+S | show scratchpad | skipped, special workspaces later |
| Ctrl+SUPER+Shift+Up/Down | move to / show scratchpad | skipped, special workspaces later |
| Ctrl+Shift+Escape | btop scratchpad | skipped, special workspaces later |
| SUPER+M / SUPER+D / SUPER+R | music / comms / todo scratchpads | skipped, special workspaces later |
