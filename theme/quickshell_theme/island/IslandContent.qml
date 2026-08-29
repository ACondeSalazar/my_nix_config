import QtQuick

Rectangle {
  id: root
  color: "#0a0a0a"
  radius: state === "hovered" ? 16 : height / 2
  implicitHeight: loader.implicitHeight + (state === "hovered" ? 16 : 10)
  implicitWidth: loader.implicitWidth + (state === "hovered" ? 36 : 22)

  property string rendered: state
  Timer { id: swap; interval: 120; onTriggered: root.rendered = root.state }
  onStateChanged: { loader.opacity = 0; swap.restart() }
  onRenderedChanged: loader.opacity = 1

  Behavior on implicitWidth  { NumberAnimation { duration: 240; easing.type: Easing.OutCubic } }
  Behavior on implicitHeight { NumberAnimation { duration: 240; easing.type: Easing.OutCubic } }
  Behavior on radius         { NumberAnimation { duration: 240; easing.type: Easing.OutCubic } }

  Loader {
    id: loader
    anchors.centerIn: parent
    sourceComponent: root.rendered === "hovered" ? hoveredC : baseC
    Behavior on opacity { NumberAnimation { duration: 120; easing.type: Easing.OutCubic } }
  }

  Component { id: baseC;    BaseContent {} }
  Component { id: hoveredC; HoveredContent {} }
}
