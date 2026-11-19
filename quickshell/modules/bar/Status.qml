import QtQuick
import "../../services"
import "popups"

Item {
    id: root
    property var barWindow
    implicitWidth: icons.implicitWidth
    implicitHeight: Theme.barHeight - 12

    Row {
        id: icons
        spacing: 10

        Repeater {
            model: [
                { glyph: "󰕾", popup: "VolumePopup.qml" },
                { glyph: "󰃝", popup: "BrightnessPopup.qml" },
                { glyph: "󰁹", popup: "BatteryPopup.qml" },
                { glyph: "󰤨", popup: "NetworkPopup.qml" },
                { glyph: "󰂯", popup: "BluetoothPopup.qml" },
                { glyph: "󰘔", popup: "AppsPopup.qml" },
            ]
            delegate: Text {
                id: icon
                required property string glyph
                required property string popup
                text: glyph
                color: Theme.colors.text
                font.pixelSize: 12

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        const p = loader.item
                        if (p) p.visible = !p.visible
                    }
                }

                Loader {
                    id: loader
                    active: false
                    source: popup
                    onLoaded: {
                        item.icon = icon
                        item.barWindow = root.barWindow
                        item.visible = true
                    }
                }
            }
        }
    }
}
