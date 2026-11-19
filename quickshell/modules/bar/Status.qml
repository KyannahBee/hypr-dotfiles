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

        Text {
            id: volIcon
            text: "󰕾"
            color: Theme.colors.text
            font.pixelSize: 12
            MouseArea {
                anchors.fill: parent
                onClicked: volumePopup.visible = !volumePopup.visible
            }
        }
        Text {
            id: brightIcon
            text: "󰃝"
            color: Theme.colors.text
            font.pixelSize: 12
            MouseArea {
                anchors.fill: parent
                onClicked: brightnessPopup.visible = !brightnessPopup.visible
            }
        }
        Text {
            id: batIcon
            text: "󰁹"
            color: Theme.colors.text
            font.pixelSize: 12
            MouseArea {
                anchors.fill: parent
                onClicked: batteryPopup.visible = !batteryPopup.visible
            }
        }
        Text {
            id: netIcon
            text: "󰤨"
            color: Theme.colors.text
            font.pixelSize: 12
            MouseArea {
                anchors.fill: parent
                onClicked: networkPopup.visible = !networkPopup.visible
            }
        }
        Text {
            id: btIcon
            text: "󰂯"
            color: Theme.colors.text
            font.pixelSize: 12
            MouseArea {
                anchors.fill: parent
                onClicked: bluetoothPopup.visible = !bluetoothPopup.visible
            }
        }
        Text {
            id: appsIcon
            text: "󰘔"
            color: Theme.colors.text
            font.pixelSize: 12
            MouseArea {
                anchors.fill: parent
                onClicked: appsPopup.visible = !appsPopup.visible
            }
        }
    }

    VolumePopup { id: volumePopup; icon: volIcon; barWindow: root.barWindow }
    BrightnessPopup { id: brightnessPopup; icon: brightIcon; barWindow: root.barWindow }
    BatteryPopup { id: batteryPopup; icon: batIcon; barWindow: root.barWindow }
    NetworkPopup { id: networkPopup; icon: netIcon; barWindow: root.barWindow }
    BluetoothPopup { id: bluetoothPopup; icon: btIcon; barWindow: root.barWindow }
    AppsPopup { id: appsPopup; icon: appsIcon; barWindow: root.barWindow }
}
