pragma ComponentBehavior: Bound
import Quickshell
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts
import Quickshell.Io
import "../"

PopupWindow {
    id: panel
    required property PanelWindow bar

    color: Colors.clear_dark
    visible: false

    anchor.window: bar
    anchor.rect.x: bar.width
    anchor.rect.y: bar.height

    implicitWidth: 300
    implicitHeight: 90

    HyprlandFocusGrab {
        id: grab
        windows: [panel]
        onActiveChanged: {
            if (!grab.active) {
                rowie.state = "Closed"
            }
        }
    }

    function toggleVisibility() {
        if (panel.visible) {
            rowie.state = "Closed"
        } else {
            panel.visible = true
            grab.active = true
            rowie.state = "Open"
        }
    }

    RowLayout {
        id: rowie
        width: parent.width - 20
        height: parent.height - 20
        anchors.centerIn: parent

        state: "Closed"
        states: [
            State {
                name: "Open"
                PropertyChanges { rowie.opacity: 1 }
                // PropertyChanges { rowie.scale: 1 }
            },
            State {
                name: "Closed"
                PropertyChanges { rowie.opacity: 0 }
                // PropertyChanges { rowie.scale: 0 }
            }
        ]

        onOpacityChanged: {
            if (opacity == 0) {
                panel.visible = false
            }
        }

        Behavior on opacity { 
            NumberAnimation { duration: 160 }
        }

        GridLayout {
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.preferredWidth: 3

            uniformCellWidths: true
            uniformCellHeights: true

            rowSpacing: 5
            columnSpacing: 5

            rows: 1
            columns: 4

            Rectangle {
                id: lock
                
                Layout.fillHeight: true
                Layout.fillWidth: true

                border.color: Colors.white
                border.width: 2

                color: {
                    if (lock_mousearea.containsMouse)
                        return "#44FFFFFF";
                    return "transparent";
                }

                Text {
                    text: ""
                    color: Colors.white
                    anchors.centerIn: parent
                    font {
                        pointSize: 35
                    }
                }

                Process {
                    id: lock_proc
                    running: false
                    command: ["hyprlock"]
                }

                MouseArea {
                    id: lock_mousearea
                    anchors.fill: parent

                    hoverEnabled: true
                    cursorShape: Qt.PointingHandCursor

                    onClicked: lock_proc.running = true
                }
            }

            Rectangle {
                id: exit
                
                Layout.fillHeight: true
                Layout.fillWidth: true

                border.color: Colors.white
                border.width: 2

                color: {
                    if (exit_mousearea.containsMouse)
                        return "#44FFFFFF";
                    return "transparent";
                }

                Text {
                    text: ""
                    color: Colors.white
                    anchors.centerIn: parent
                    font {
                        pointSize: 35
                    }
                }

                Process {
                    id: exit_proc
                    running: false
                    command: ["hyprctl", "dispatch", "exit"]
                }

                MouseArea {
                    id: exit_mousearea
                    anchors.fill: parent

                    hoverEnabled: true
                    cursorShape: Qt.PointingHandCursor

                    onClicked: exit_proc.running = true
                }
            }

            Repeater {
                model: 2

                Rectangle {
                    id: button
                    required property int index

                    property var icons: [``, ``]
                    property var functions:  ["poweroff", "reboot"]

                    Layout.fillHeight: true
                    Layout.fillWidth: true

                    border.color: Colors.white
                    border.width: 2

                    color: {
                        if (mousearea.containsMouse)
                            return "#44FFFFFF";
                        return "transparent";
                    }

                    Text {
                        text: icons[index]
                        color: Colors.white
                        anchors.centerIn: parent
                        font {
                            pointSize: 35
                        }
                    }

                    Process {
                        id: proc
                        running: false
                        command: ["systemctl", functions[index]]
                    }

                    MouseArea {
                        id: mousearea
                        anchors.fill: parent

                        hoverEnabled: true
                        cursorShape: Qt.PointingHandCursor

                        onClicked: proc.running = true
                    }
                }
            }
        }
    }
}
