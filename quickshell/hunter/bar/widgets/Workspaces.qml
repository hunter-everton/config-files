import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Hyprland
import "../"

Rectangle {
    id: root
    required property PanelWindow bar
    readonly property HyprlandWorkspace mon: Hyprland.focusedWorkspace
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
    
    implicitHeight: parent.height
    implicitWidth: text.width + 16

    Text {
        anchors.centerIn: parent
        id: text
        // text: "Workspace " + root.mon?.id
        text: root.mon?.id
        font {
            family: TextSettings.mainFont
            pointSize: TextSettings.fontSize
            weight: TextSettings.fontWeight
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

    WorkspaceMenu {
        id: menu
        bar: root.bar
    }

    Component.onCompleted: () => {
        menu.onVisibleChanged.connect(() => {
            root.active = menu.visible
        })
    }

    Behavior on color {
        ColorAnimation { duration: 150 }
    }
}

