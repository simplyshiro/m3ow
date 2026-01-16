import QtQuick
import Quickshell.Io

import qs.components

QtObject {
    id: root

    required property string command
    required property string icon
    property int keybind
    property int colorType: IconButton.Color.Tonal
    property int widthType: IconButton.Width.Default

    readonly property Process process: Process {
        command: ["sh", "-c", root.command]
    }

    function execute() {
        process.startDetached();
        Qt.quit();
    }
}
