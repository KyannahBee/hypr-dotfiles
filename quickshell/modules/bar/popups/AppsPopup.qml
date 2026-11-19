import Quickshell
import Quickshell.Hyprland
import QtQuick
import "../../../services"

PopupWindow {
    id: root
    property Item icon
    property var barWindow
    visible: false
    color: Theme.withAlpha(Theme.colors.surface, 0.95)
    implicitWidth: 260
    implicitHeight: Math.min(320, list.contentHeight + 8)

    anchor.window: barWindow
    anchor.item: icon
    anchor.edges: Theme.barPosition === "top" ? Edges.Bottom : Edges.Top
    anchor.gravity: Theme.barPosition === "top" ? Edges.Bottom : Edges.Top

    ListView {
        id: list
        anchors.fill: parent
        anchors.margins: 4
        model: Hyprland.toplevels
        clip: true
        delegate: Text {
            required property var modelData
            width: list.width
            color: Theme.colors.text
            font.pixelSize: 11
            elide: Text.ElideRight
            text: modelData.title ?? ""
            MouseArea {
                anchors.fill: parent
                onClicked: Hyprland.dispatch("focusWindow address:" + modelData.address)
            }
        }
    }
}
