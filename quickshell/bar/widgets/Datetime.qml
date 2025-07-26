pragma Singleton

import Quickshell
import Quickshell.Io
import QtQuick

Singleton {
    id: root
    property var data

    Process {
        id: dateProc
        command: ["date", '+{"year": "%Y", "dayName": "%a", "dayNumber": "%d", "monthName": "%B", "time": {"hours": "%H", "minutes": "%M"}}' ]

        running: true
        stdout: SplitParser {
            onRead: data => {
                root.data = JSON.parse(data)
            }
        }
    }

    Timer {
        interval: 1000
        running: true
        repeat: true
        onTriggered: dateProc.running = true
    }
}
