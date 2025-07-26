import QtQuick
import QtQuick.Layouts
import Quickshell.Io
import Quickshell.Hyprland
import Quickshell.Wayland
import "../"

Rectangle {
    readonly property Toplevel activeWindow: ToplevelManager.activeToplevel

    id: container
    color: "transparent"
    implicitHeight: parent.height
    implicitWidth: text.implicitWidth + 20

    Text {
        id: text
        anchors.centerIn: parent
        text: activeWindow?.activated?activeWindow?.appId : "desktop"
        font.pointSize: TextSettings.fontSize
        font.family: TextSettings.mainFont
        font.weight: TextSettings.fontWeight
        color: Colors.white
    }
}


