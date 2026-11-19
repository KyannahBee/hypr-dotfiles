pragma Singleton

import Quickshell
import Quickshell.Io
import QtQuick

// Stub theme reader. TODO(issue #22): the live theme service replaces this
// and also pushes colors to Hyprland, kitty, and GTK. Until then this
// reads the active theme once at startup and fails soft to defaults.
Singleton {
    id: root

    property string activeTheme: "pixel-castle"
    property var theme: ({})

    readonly property var colors: theme.colors ?? ({})
    readonly property var style: theme.style ?? ({})
    readonly property string barPosition: theme.bar?.position ?? "top"
    readonly property int barHeight: theme.bar?.height ?? 28

    // "#rrggbb" + alpha 0..1 -> "#aarrggbb"
    function withAlpha(hex, alpha) {
        if (!hex || !hex.startsWith("#") || hex.length !== 7)
            return "transparent"
        const a = Math.round(Math.max(0, Math.min(1, alpha)) * 255)
        return "#" + a.toString(16).padStart(2, "0") + hex.slice(1)
    }

    FileView {
        path: Qt.resolvedUrl("../themes/active.txt")
        onLoaded: {
            const name = text().trim()
            if (name.length > 0)
                root.activeTheme = name
        }
    }

    FileView {
        path: Qt.resolvedUrl("../themes/" + root.activeTheme + "/theme.json")
        onLoaded: root.theme = JSON.parse(text())
    }
}
