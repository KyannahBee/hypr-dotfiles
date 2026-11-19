import Quickshell
import QtQuick
import "../../services"

Text {
    id: clock
    color: Theme.colors.text
    font.pixelSize: 12
    text: Qt.formatDateTime(sysclock.date, "ddd dd MMM  HH:mm")

    SystemClock {
        id: sysclock
        precision: SystemClock.Minutes
    }
}
