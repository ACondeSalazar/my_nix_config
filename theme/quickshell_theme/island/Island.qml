import Quickshell
import Quickshell.Io
import QtQuick

Scope {
  id: root
  property bool autoHide: true
  property bool hovered: false
  readonly property bool revealed: !autoHide || hovered
  readonly property string state: (autoHide || !hovered) ? "base" : "hovered"

  Variants {
    model: Quickshell.screens
    PanelWindow {
      required property var modelData
      screen: modelData
      color: "transparent"
      exclusiveZone: 0
      anchors { top: true; left: true; right: true }
      implicitHeight: content.implicitHeight + 8
      mask: Region { item: trigger; Region { item: content } }

      Item {
        id: trigger
        width: 240; height: 6
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        HoverHandler { id: th; onHoveredChanged: root.hovered = th.hovered || ch.hovered }
      }

      IslandContent {
        id: content
        anchors.horizontalCenter: parent.horizontalCenter
        y: root.revealed ? 4 : -height - 2
        state: root.state
        Behavior on y { NumberAnimation { duration: 200; easing.type: Easing.OutCubic } }
        HoverHandler { id: ch; onHoveredChanged: root.hovered = th.hovered || ch.hovered }
      }
    }
  }

  IpcHandler {
    target: "island"
    function toggle() { root.autoHide = !root.autoHide }
  }
}
