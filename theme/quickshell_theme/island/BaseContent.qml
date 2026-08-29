import QtQuick

Row {
  spacing: viz.active ? 8 : 0
  Behavior on spacing { NumberAnimation { duration: 220; easing.type: Easing.OutCubic } }

  Visualizer { id: viz; anchors.verticalCenter: parent.verticalCenter }
  ClockLabel { anchors.verticalCenter: parent.verticalCenter }
}
