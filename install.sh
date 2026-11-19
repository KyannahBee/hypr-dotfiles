#!/usr/bin/env bash
# install.sh - run once on a new machine to link this repo into ~/.config.
# The full dependency list and README land in issue #16.
set -euo pipefail

REPO="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

mkdir -p "$HOME/.config/quickshell"
ln -sfn "$REPO/hyprland" "$HOME/.config/hypr"
ln -sfn "$REPO/quickshell" "$HOME/.config/quickshell/hyprdot"

echo "linked $HOME/.config/hypr -> $REPO/hyprland"
echo "linked $HOME/.config/quickshell/hyprdot -> $REPO/quickshell"
