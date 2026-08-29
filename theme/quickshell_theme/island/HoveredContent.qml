import QtQuick
import Quickshell
import Quickshell.Services.Mpris

Row {
  id: root
  spacing: 24
  readonly property var player: Mpris.players.values.find(p => p.playbackState === MprisPlaybackState.Playing) ?? Mpris.players.values[0] ?? null
  property string art: ""

  Connections {
    target: root.player
    ignoreUnknownSignals: true
    function onTrackArtUrlChanged() { if (root.player?.trackArtUrl) root.art = root.player.trackArtUrl }
  }
  Component.onCompleted: if (player?.trackArtUrl) art = player.trackArtUrl

  Row {
    spacing: 10
    anchors.verticalCenter: parent.verticalCenter

    Rectangle {
      width: 44; height: 44; radius: 8; color: "#222"
      Image {
        anchors.fill: parent
        source: root.art
        fillMode: Image.PreserveAspectCrop
        cache: true; asynchronous: true
        visible: source != ""
      }
    }

    Column {
      anchors.verticalCenter: parent.verticalCenter
      spacing: 2
      Row {
        spacing: 6
        Visualizer { barColor: "#7fd9c4"; anchors.verticalCenter: parent.verticalCenter }
        Text {
          text: (root.player?.trackTitle ?? "—").toUpperCase()
          color: "white"; font.family: "FiraCode Nerd Font"; font.pixelSize: 14; font.bold: true
          anchors.verticalCenter: parent.verticalCenter
        }
      }
      Text {
        text: (root.player?.trackArtists ?? []).join(", ")
        color: "#888"; font.family: "FiraCode Nerd Font"; font.pixelSize: 11
        visible: text !== ""
      }
    }
  }

  Column {
    anchors.verticalCenter: parent.verticalCenter
    spacing: -2
    SystemClock { id: clock; precision: SystemClock.Minutes }
    Text {
      text: Qt.formatDateTime(clock.date, "HH:mm")
      color: "white"; font.family: "FiraCode Nerd Font"; font.pixelSize: 26; font.bold: true
      anchors.horizontalCenter: parent.horizontalCenter
    }
    Text {
      text: Qt.formatDateTime(clock.date, "ddd, MMM d")
      color: "#888"; font.family: "FiraCode Nerd Font"; font.pixelSize: 11
      anchors.horizontalCenter: parent.horizontalCenter
    }
  }

  Row {
    spacing: 10
    anchors.verticalCenter: parent.verticalCenter

    Text { text: "\uf1eb"; color: "#7fd9c4"; font.family: "FiraCode Nerd Font"; font.pixelSize: 17; anchors.verticalCenter: parent.verticalCenter }

    Item {
      width: 44; height: 26
      anchors.verticalCenter: parent.verticalCenter
      Rectangle { anchors.fill: parent; radius: height / 2; color: "#1a1a1a" }
      Text {
        anchors.centerIn: parent
        text: "\uf240"; color: "#7fd9c4"
        font.family: "FiraCode Nerd Font"; font.pixelSize: 24
      }
      Text {
        anchors.centerIn: parent
        anchors.horizontalCenterOffset: -3
        text: "80"; color: "#0a0a0a"
        font.family: "FiraCode Nerd Font"; font.pixelSize: 9; font.bold: true
      }
    }
  }
}
