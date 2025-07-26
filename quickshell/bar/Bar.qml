import Quickshell
import Quickshell.Io
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import "widgets" as Widgets

Scope {

    Variants {
        model: Quickshell.screens

        PanelWindow {
            id: bar
            property var modelData
            screen: modelData

            color: "#AA000000"

            implicitHeight: 30

            Rectangle {
                color: Colors.white

                anchors.left: parent.left
                anchors.right: parent.right
                anchors.bottom: parent.bottom

                implicitHeight: 2
            }

            anchors {
                top: true
                left: true
                right: true
            }

            RowLayout {
                id: leftWidgets
                spacing: 0
                Layout.fillWidth: true
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.bottom: parent.bottom

                Widgets.Workspaces {bar: bar}
            }

            RowLayout {
                id: centerWidgets
                spacing: 0
                anchors.centerIn: parent
                
                Widgets.ActiveWindow {}
            }

            RowLayout {
                id: rightWidgets
                spacing: 5
                Layout.fillWidth: true
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom

                // Widgets.Sound {}
                Widgets.Date {bar: bar}
                Widgets.Time {}
                Widgets.Power {bar: bar}
            }
        }
    }
}
