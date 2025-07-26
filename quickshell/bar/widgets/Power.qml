import Quickshell
import QtQuick
import Quickshell.Hyprland
import Quickshell.Io
import "../"

Rectangle {
    id: root
    required property PanelWindow bar
    property bool active: false

    Timer {
        interval: 600
        running: true
        repeat: true
    }

    color: {
        if (root.active) 
            return Colors.white; 
        if (mousearea.containsMouse)
            return "#44FFFFFF";
        return "transparent";
    }

    implicitWidth: powerText.implicitWidth + 10
    implicitHeight: parent.height

    Behavior on color {
        ColorAnimation {
            duration: 200
        }
    }

    Text {
        id: powerText
        text: ``
        anchors.centerIn: parent
        visible: true
        font {
            family: "JetBrainsMono Nerd Font"
            pointSize: TextSettings.fontSize
        }
        color: root.active? Colors.clear_dark : Colors.white
    }
   
    MouseArea {
        id: mousearea
        anchors.fill: parent

        hoverEnabled: true
        cursorShape: Qt.PointingHandCursor

        onClicked: event => {
            menu.toggleVisibility()
        }
    }

    PowerMenu {
        id: menu
        bar: root.bar
    }

    Component.onCompleted: () => {
        menu.onVisibleChanged.connect(() => {
            root.active = menu.visible
        })
    }
}
