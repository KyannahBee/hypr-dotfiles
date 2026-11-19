import QtQuick
import "../../services"

Rectangle {
    id: root
    radius: (Theme.style.rounding ?? 8) / 2
    color: Theme.withAlpha(Theme.colors.accent, 0.35)
    implicitHeight: Theme.barHeight - 8
    implicitWidth: row.implicitWidth + 16

    default property alias content: row.data

    Row {
        id: row
        anchors.centerIn: parent
        spacing: 8
    }
}
