import Quickshell
import QtQuick

Text {
  color: "white"
  font.family: "FiraCode Nerd Font"
  font.pixelSize: 16
  font.bold: true
  text: Qt.formatDateTime(clock.date, "HH:mm")

  SystemClock { id: clock; precision: SystemClock.Minutes }
}
