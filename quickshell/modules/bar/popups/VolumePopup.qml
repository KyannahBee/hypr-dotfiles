import Quickshell
import Quickshell.Services.Pipewire
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
    implicitHeight: 80

    anchor.window: barWindow
    anchor.item: icon
    anchor.edges: Theme.barPosition === "top" ? Edges.Bottom : Edges.Top
    anchor.gravity: Theme.barPosition === "top" ? Edges.Bottom : Edges.Top

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 10
        spacing: 6

        RowLayout {
            Layout.fillWidth: true
            Text { text: "󰕾"; color: Theme.colors.text }
            Slider {
                Layout.fillWidth: true
                from: 0; to: 1.5; stepSize: 0.01
                value: Pipewire.defaultAudioSink?.audio?.volume ?? 0
                onMoved: if (Pipewire.defaultAudioSink)
                    Pipewire.defaultAudioSink.audio.volume = value
            }
            Text {
                color: Theme.colors.text
                text: Math.round((Pipewire.defaultAudioSink?.audio?.volume ?? 0) * 100) + "%"
            }
        }

        CheckBox {
            text: "Mute"
            checked: Pipewire.defaultAudioSink?.audio?.muted ?? false
            onToggled: if (Pipewire.defaultAudioSink)
                Pipewire.defaultAudioSink.audio.muted = checked
        }
    }
}
