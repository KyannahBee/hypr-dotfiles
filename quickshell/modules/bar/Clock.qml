import QtQuick
import "../../services"

Text {
    id: clock
    color: Theme.colors.text
    font.pixelSize: 12
    text: Qt.formatDateTime(new Date(), "ddd dd MMM  HH:mm")

    Timer {
        interval: 1000
        running: true
        repeat: true
        onTriggered: clock.text = Qt.formatDateTime(new Date(), "ddd dd MMM  HH:mm")
    }
}
