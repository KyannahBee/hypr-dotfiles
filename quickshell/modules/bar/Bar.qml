import Quickshell
import Quickshell.Wayland
import QtQuick
import QtQuick.Layouts
import "../../services"

WlrLayershell {
    id: bar
    visible: true
    color: "transparent"
    namespace: "quickshell" // matches the blur layer_rule in conf/decoration.lua
    layer: WlrLayer.Top
    keyboardFocus: WlrKeyboardFocus.None
    exclusiveZone: Theme.barHeight

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
