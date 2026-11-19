import Quickshell.Services.Mpris
import QtQuick
import "../../services"

Item {
    id: root

    readonly property var player: {
        const players = Mpris.players.values
        return players.find(p => (p.identity ?? "").toLowerCase().includes("spotify"))
               ?? players[0] ?? null
    }

    implicitWidth: layout.implicitWidth
    implicitHeight: layout.implicitHeight

    Row {
        id: layout
        anchors.centerIn: parent
        spacing: 6

        Text {
            text: root.player?.playbackState === MprisPlaybackState.Playing ? "󰏤" : "♪"
            color: Theme.colors.text
            font.pixelSize: 12
        }

        Text {
            color: Theme.colors.subtext
            font.pixelSize: 11
            width: Math.min(implicitWidth, 200)
            elide: Text.ElideRight
            text: root.player ? root.player.trackArtist + " - " + root.player.trackTitle : ""
        }
    }

    MouseArea {
        anchors.fill: parent
        onClicked: root.player?.togglePlaying()
        onWheel: if (root.player)
            (wheel.angleDelta.y > 0 ? root.player.previous() : root.player.next())
    }
}
