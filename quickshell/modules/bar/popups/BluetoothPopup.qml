import Quickshell.Services.Bluetooth
import QtQuick
import "../../../services"

PopupWindow {
    id: root
    property Item icon
    property var barWindow
    visible: false
    color: Theme.withAlpha(Theme.colors.surface, 0.95)
    implicitWidth: 200
    implicitHeight: 44

    anchor.window: barWindow
    anchor.item: icon
    anchor.edges: Theme.barPosition === "top" ? Edges.Bottom : Edges.Top
    anchor.gravity: Theme.barPosition === "top" ? Edges.Bottom : Edges.Top

    Text {
        anchors.centerIn: parent
        color: Theme.colors.text
        font.pixelSize: 12
        text: Bluetooth.adapter
              ? (Bluetooth.adapter.enabled ? "󰂱 on, " + Bluetooth.devices.length + " devices" : "󰂲 off")
              : "no adapter"
        MouseArea {
            anchors.fill: parent
            onClicked: if (Bluetooth.adapter) Bluetooth.adapter.enabled = !Bluetooth.adapter.enabled
        }
    }
}
