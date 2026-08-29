import QtQuick
import Quickshell.Services.Mpris

Item {
  id: root
  property color barColor: "white"
  readonly property bool active: Mpris.players.values.some(p => p.playbackState === MprisPlaybackState.Playing)

  implicitWidth: active ? bars.implicitWidth : 0
  implicitHeight: bars.implicitHeight
  opacity: active ? 1 : 0
  clip: true

  Behavior on opacity { NumberAnimation { duration: 220; easing.type: Easing.OutCubic } }

  Row {
    id: bars
    spacing: 2
    anchors.verticalCenter: parent.verticalCenter
    Repeater {
      model: 3
      Rectangle {
        width: 2; height: 4; radius: 1; color: root.barColor
        anchors.verticalCenter: parent.verticalCenter
        SequentialAnimation on height {
          running: root.active
          loops: Animation.Infinite
          NumberAnimation { to: 12; duration: 300 + index * 80; easing.type: Easing.InOutSine }
          NumberAnimation { to: 4;  duration: 300 + index * 80; easing.type: Easing.InOutSine }
        }
      }
    }
  }
}
