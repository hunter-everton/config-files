import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Hyprland
import QtQuick.Controls

import "../"

PopupWindow {
    id: panel
    required property PanelWindow bar

    visible: true
    color: "transparent"

    anchor.window: bar
    anchor.rect.x: bar.width
    anchor.rect.y: bar.height

    implicitWidth: 350
    implicitHeight: 300

    HyprlandFocusGrab {
        id: grab
        windows: [ panel ]
        onActiveChanged:  if (!grab.active) { baseRect.state = "Closed" }
    }

    function toggleVisibility() {
        if (panel.visible) {
            baseRect.state = "Closed"
        } else {
            panel.visible = true
            grab.active = true
            baseRect.state = "Open"
        }
    }

    Rectangle {
        id: baseRect
        color: Colors.clear_dark
        anchors.centerIn: parent
        width: parent.width
        height: parent.height

        state: "Closed"
        states: [
            State {
                name: "Closed"
                PropertyChanges { baseRect.opacity: 0 }
            },
            State {
                name: "Open"
                PropertyChanges { baseRect.opacity: 1 }
            }
        ]
        Behavior on opacity { NumberAnimation { duration: 150 } }

        onOpacityChanged: if (opacity == 0) {
            panel.visible = false
            grab.active = false
        }

        ColumnLayout {
            anchors.fill: parent
            spacing:0

            Rectangle {
                implicitHeight: 30
                Layout.fillWidth: true
                color: "transparent"

                Text {
                    rotation: 0

                    anchors.centerIn: parent

                    color: Colors.white
                    text: Datetime.data?.monthName + " " + Datetime.data?.year
                    font.pointSize: 13
                    font.family: TextSettings.mainFont
                    font.weight: TextSettings.fontWeight
                }
            }

            DayOfWeekRow {
                id: daysRow

                locale: grid.locale

                Layout.fillWidth: true
                Layout.fillHeight: true

                Layout.leftMargin: 10
                Layout.rightMargin: 10
                Layout.bottomMargin: 0
                Layout.topMargin: 0

                spacing: 5

                delegate: Text {
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter

                    color: Colors.white
                    text: model.shortName
                    font.pointSize: 9
                    font.family: TextSettings.mainFont
                    font.weight: TextSettings.fontWeight
                }
            }

            MonthGrid {
                id: cal

                Layout.fillWidth: true
                Layout.fillHeight: true

                Layout.leftMargin: 10
                Layout.rightMargin: 10
                Layout.bottomMargin: 10
                Layout.topMargin: 0

                spacing: 5

                delegate: Rectangle {
                    id: calRect
                    required property var model
                    color: (model.month === cal.month)?
                    (calRect.model.day == Datetime.data?.dayNumber)? Colors.primary : Colors.white
                    : Colors.clear_dark

                    Text {
                        font.family: TextSettings.mainFont
                        font.weight: TextSettings.fontWeight
                        anchors.centerIn: parent
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignVCenter
                        text: calRect.model.day
                        color: (model.month === cal.month)?
                        (calRect.model.day == Datetime.data?.dayNumber)? Colors.clear_dark : "black"
                        : Colors.white
                    }
                }
            }
        }
    }
}
