import QtQuick
import QtQuick.Layouts
import Quickshell.Io
import Quickshell
import "../"

Rectangle {
    required property PanelWindow bar
    property string hoveredBgColor: "#44FFFFFF"
    id: container
    implicitHeight: parent.height
    implicitWidth: dateText.implicitWidth + 20

    color: {
        if (mousearea.containsMouse)
            return hoveredBgColor;
        return "transparent";
    }

    Behavior on color {
        ColorAnimation {
            duration: 200
        }
    }

    Text {
        id: dateText
        text: " " + Datetime.data?.dayName + " " + Datetime.data?.monthName + " " + Datetime.data?.dayNumber
        anchors.centerIn: parent
        color: Colors.white
        visible: true
        font {
            pointSize: TextSettings.fontSize
            family: TextSettings.mainFont
            weight: TextSettings.fontWeight
        }
    }

    MouseArea {
        id: mousearea

        anchors.fill: parent
        hoverEnabled: true

        acceptedButtons: Qt.LeftButton
        cursorShape: Qt.PointingHandCursor

        onClicked: {
            moMenu.toggleVisibility()
        }
    }

    MonthMenu {
        id: moMenu
        bar: container.bar
    }
}
