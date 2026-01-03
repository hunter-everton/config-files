import QtQuick
import QtQuick.Layouts
import Quickshell.Io
import Quickshell
import "../"

Rectangle {
    id: rect

    implicitHeight: parent.height
    implicitWidth: dateText.implicitWidth + 10

    property string hoveredBgColor: "#44FFFFFF"
    
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
        property var time: Datetime.data?.time
        id: dateText
        text: " " + ((this.time?.hours % 12 == 0)? 12 : this.time?.hours % 12) + ":" + this.time?.minutes + ((this.time?.hours / 12 > 1)? " PM" : " AM")
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
    }
}
