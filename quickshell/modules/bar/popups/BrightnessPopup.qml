import Quickshell
import Quickshell.Io
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "../../../services"

PopupWindow {
    id: root
    property Item icon
    property var barWindow
    visible: false
    color: Theme.withAlpha(Theme.colors.surface, 0.95)
    implicitWidth: 240
    implicitHeight: 60

    anchor.window: barWindow
    anchor.item: icon
    anchor.edges: Theme.barPosition === "top" ? Edges.Bottom : Edges.Top
    anchor.gravity: Theme.barPosition === "top" ? Edges.Bottom : Edges.Top

    property int current: 50

    Process {
        id: read
        command: "sh -c 'c=$(brightnessctl get); m=$(brightnessctl max); echo $((c * 100 / m))'"
        running: root.visible
        stdout: StdioCollector {
            onStreamFinished: root.current = parseInt(text.trim()) || 50
        }
    }

    Process {
        id: write
        command: "brightnessctl set " + root.current + "%"
        running: false
    }

    RowLayout {
        anchors.fill: parent
        anchors.margins: 10
        Text { text: "󰃝"; color: Theme.colors.text }
        Slider {
            Layout.fillWidth: true
            from: 5; to: 100; stepSize: 1
            value: root.current
            onMoved: {
                root.current = Math.round(value)
                write.startDetached()
            }
        }
        Text { color: Theme.colors.text; text: root.current + "%" }
    }
}
