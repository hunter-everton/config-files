import Quickshell
import Quickshell.Io
import Quickshell.Wayland
import QtQuick
import QtQuick.Layouts
import "bar"
import "launcher"

ShellRoot {
    Component.onCompleted: [Controller.init()]

    Bar {}
}
