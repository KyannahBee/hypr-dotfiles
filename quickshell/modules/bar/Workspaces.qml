import Quickshell.Hyprland
import QtQuick
import "../../services"

Row {
    spacing: 2

    Repeater {
        model: 10
        delegate: Rectangle {
            id: ws
            required property int index
            width: 22
            height: Theme.barHeight - 12
            radius: 4
            color: Hyprland.focusedWorkspace?.id === index + 1
                   ? Theme.withAlpha(Theme.colors.pink, 0.8) : "transparent"

            Text {
                anchors.centerIn: parent
                text: ws.index + 1
                font.pixelSize: 11
                color: Hyprland.focusedWorkspace?.id === ws.index + 1
                       ? Theme.colors.bg : Theme.colors.text
            }

            MouseArea {
                anchors.fill: parent
                onClicked: Hyprland.dispatch("workspace " + (ws.index + 1))
                onWheel: Hyprland.dispatch(
                    wheel.angleDelta.y > 0 ? "workspace e-1" : "workspace e+1")
            }
        }
    }
}
