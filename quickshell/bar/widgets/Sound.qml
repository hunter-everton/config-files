import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Quickshell
import Quickshell.Services.Pipewire
import "../"

Text {
    id: text
    visible: Pipewire.ready

    text: ` ${volume}`
    color: Colors.white

    property PwNode sink: Pipewire.defaultAudioSink
    property string volume: Pipewire.ready ? `${Math.floor(sink.audio.volume * 100)}%` : ""

    PwObjectTracker { objects: [ sink ] }

    font {
        pointSize: TextSettings.fontSize
        family: TextSettings.mainFont
    }
}

