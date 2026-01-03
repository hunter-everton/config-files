pragma Singleton
import Quickshell
import QtQuick

Singleton {
  readonly property color primary: "#aaaaaa"
  readonly property color clear_dark: "#ee000000"
  readonly property color white: '#ffffff'



  function withAlpha(color: color, alpha: real): color {
    return Qt.rgba(color.r, color.g, color.b, alpha);
  }
}

