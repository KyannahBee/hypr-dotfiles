import QtQuick
import "../../services"

Text {
    id: t
    property int elapsed: 0
    property bool running: false

    color: Theme.colors.text
    font.pixelSize: 12
    text: {
        const m = Math.floor(elapsed / 60)
        const s = elapsed % 60
        return m.toString().padStart(2, "0") + ":" + s.toString().padStart(2, "0")
    }

    Timer {
        interval: 1000
        running: t.running
        repeat: true
        onTriggered: t.elapsed++
    }

    MouseArea {
        anchors.fill: parent
        acceptedButtons: Qt.LeftButton | Qt.RightButton
        onClicked: mouse => {
            if (mouse.button === Qt.RightButton) {
                t.elapsed = 0
                t.running = false
            } else {
                t.running = !t.running
            }
        }
    }
}
