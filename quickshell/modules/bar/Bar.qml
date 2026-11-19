import Quickshell
import Quickshell.Wayland
import QtQuick
import QtQuick.Layouts
import "../../services"

Window {
    id: bar
    name: "quickshell" // matches the blur layer_rule in conf/decoration.lua
    visible: true
    color: "transparent"

    WlrLayershell.layer: WlrLayer.Top
    WlrLayershell.exclusiveZone: Theme.barHeight
    WlrLayershell.keyboardInteractivity: WlrKeyboardInteractivity.None

    anchors {
        top: Theme.barPosition === "top"
        bottom: Theme.barPosition === "bottom"
        left: true
        right: true
    }
    implicitHeight: Theme.barHeight

    Item {
        anchors.fill: parent
        anchors.margins: 4

        RowLayout {
            anchors.left: parent.left
            anchors.verticalCenter: parent.verticalCenter
            spacing: 6
            Section { Workspaces {} }
            Section { Media {} }
        }

        Section {
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            Clock {}
        }

        RowLayout {
            anchors.right: parent.right
            anchors.verticalCenter: parent.verticalCenter
            spacing: 6
            Section { Timer {} }
            Section { Status { barWindow: bar } }
        }
    }
}
