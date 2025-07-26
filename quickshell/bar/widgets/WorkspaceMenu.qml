pragma ComponentBehavior: Bound
import Quickshell
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts
import "../"

PopupWindow {
    id: panel
    readonly property HyprlandWorkspace mon: Hyprland.focusedWorkspace
    required property PanelWindow bar

    color: Colors.clear_dark
    visible: false
    anchor.window: bar
    anchor.rect.x: 0
    anchor.rect.y: bar.height
    implicitWidth: 160
    implicitHeight: 120

    function toggleVisibility() {
        if (panel.visible) {
            rowie.state = "Closed"
        } else {
            panel.visible = true
            grab.active = true
            rowie.state = "Open"
        }
    }

    HyprlandFocusGrab {
        id: grab
        windows: [panel]
        onActiveChanged: {
            if (!grab.active) {
                rowie.state = "Closed"
            }
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
                grab.active = false
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
            columnSpacing: this.rowSpacing
            rows: 3
            columns: this.rows

            Repeater {
                model: 9

                delegate: Rectangle {
                    id: square
                    required property var modelData
                    required property int index

                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    color: (square.index + 1 == mon?.id)? Colors.primary : Colors.white

                    MouseArea { // yeah don't wanna over complicate this
                        anchors.fill: parent
                        hoverEnabled: true
                        onClicked: {
                            Hyprland.dispatch("workspace " + (square.index + 1))
                        }
                        // onClicked: {
                        //     rowie.state = "Closed"
                        // }
                    }
                }
            }
        }
    }
}

