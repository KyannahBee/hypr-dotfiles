#!/bin/bash
# battery.sh — rofi script-mode battery menu
# Deps: none (reads /sys/class/power_supply directly)
#
# SCOPE: read-only info — charge/discharge rate, time to empty/full and
# battery health. Nothing here changes power settings. The only row is
# Refresh (re-reads the values, same idea as Rescan in wifi.sh). The
# launch command hides the entry with -theme-str, since there's nothing
# to search.
#
# KNOWN LIMITATIONS:
# - Estimates are "at the current rate": power_now is an instantaneous
#   reading, so the number moves when load changes. We average a few
#   samples to smooth the worst jitter, nothing more.
# - Charging tapers past ~80% (CV phase), so a linear time-to-full is
#   optimistic up there — the menu says so instead of faking a curve.

set -euo pipefail

THEME_DIR="$HOME/.config/rofi"
THEME="$THEME_DIR/shared.rasi"
POSITION="$THEME_DIR/position/bottom.rasi"

BAT="/sys/class/power_supply/BAT0"

SAMPLES=3
SAMPLE_DELAY=0.25
TAPER_PCT=80

# Same 10-step set as waybar's battery format-icons
ICONS_LEVEL=("󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹")
ICON_CHARGING="󰂄"
ICON_PLUGGED="󰚥"
ICON_TIME="󰔟"
ICON_HEALTH="󱈏"
ICON_INFO="󰋽"
ICON_REFRESH="󰑐 Refresh"

read_bat() {
    cat "$BAT/$1" 2>/dev/null || echo 0
}

level_icon() {
    local idx=$(( $1 / 10 ))
    [ "$idx" -gt 9 ] && idx=9
    [ "$idx" -lt 0 ] && idx=0
    printf '%s' "${ICONS_LEVEL[$idx]}"
}

# µW / µWh -> "8.3"
fmt_watts() {
    awk -v v="$1" 'BEGIN{printf "%.1f", v / 1000000}'
}

# seconds -> "3h 17m" / "45m"
fmt_duration() {
    local s=$1
    local h=$(( s / 3600 ))
    local m=$(( (s % 3600) / 60 ))
    if [ "$h" -gt 0 ]; then
        printf '%dh %02dm' "$h" "$m"
    else
        printf '%dm' "$m"
    fi
}

avg_power() {
    local total=0 i
    for (( i = 0; i < SAMPLES; i++ )); do
        total=$(( total + $(read_bat power_now) ))
        [ "$i" -lt $(( SAMPLES - 1 )) ] && sleep "$SAMPLE_DELAY"
    done
    echo $(( total / SAMPLES ))
}

# All info goes in the message box (not selectable, not filterable);
# Refresh is the only real row. Lines are joined with &#10; because the
# message is Pango markup and a literal newline would end the rofi line.
show_menu() {
    local status pct now full design power header
    local -a lines=()
    status=$(read_bat status)
    pct=$(read_bat capacity)
    now=$(read_bat energy_now)
    full=$(read_bat energy_full)
    design=$(read_bat energy_full_design)

    case "$status" in
        Discharging)
            header="Discharging · ${pct}%"
            power=$(avg_power)
            if [ "$power" -gt 0 ]; then
                lines+=("$(level_icon "$pct")  Draining at $(fmt_watts "$power") W")
                lines+=("$ICON_TIME  $(fmt_duration $(( now * 3600 / power ))) remaining")
            else
                lines+=("$ICON_TIME  Calculating…")
            fi
            ;;
        Charging)
            header="Charging · ${pct}%"
            power=$(avg_power)
            if [ "$power" -gt 0 ]; then
                local left=$(( full - now ))
                [ "$left" -lt 0 ] && left=0
                lines+=("$ICON_CHARGING  Charging at $(fmt_watts "$power") W")
                lines+=("$ICON_TIME  $(fmt_duration $(( left * 3600 / power ))) until full")
                [ "$pct" -ge "$TAPER_PCT" ] && lines+=("$ICON_INFO  Charging slows near full")
            else
                lines+=("$ICON_TIME  Calculating…")
            fi
            ;;
        Full)
            header="Full · ${pct}%"
            lines+=("$ICON_PLUGGED  Plugged in, fully charged")
            ;;
        *)
            # "Not charging" (held by firmware threshold) or "Unknown"
            header="Not charging · ${pct}%"
            lines+=("$ICON_PLUGGED  Plugged in, not charging")
            ;;
    esac

    if [ "$design" -gt 0 ]; then
        lines+=("$ICON_HEALTH  Health $(( full * 100 / design ))% ($(fmt_watts "$full") / $(fmt_watts "$design") Wh)")
    fi

    local msg=" $header" line
    for line in "${lines[@]}"; do
        msg+="&#10;$line"
    done
    echo -en "\0message\x1f${msg}\n"

    # permanent: typing can't filter it away
    echo -en "${ICON_REFRESH}\0permanent\x1ftrue\n"
}

# --- Entry point ---
if [ -z "${1:-}" ]; then
    echo -en "\0prompt\x1fBattery\n"
    echo -en "\0no-custom\x1ftrue\n"
    show_menu
    exit 0
fi

case "$1" in
    "$ICON_REFRESH")
        show_menu
        ;;
    *)
        ;;
esac
