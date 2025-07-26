pragma Singleton
import Quickshell
import QtQuick

Singleton {
  readonly property color primary: "#aebac8"
  readonly property color clear_dark: "#AA000000"
  readonly property color white: "#d4d7dc"



  function withAlpha(color: color, alpha: real): color {
    return Qt.rgba(color.r, color.g, color.b, alpha);
  }
}

