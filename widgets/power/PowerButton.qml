import QtQuick
import Quickshell.Io

import qs.components

IconButton {
    id: root

    required property string command

    property int keybind

    colorType: IconButton.Color.Tonal
    size: IconButton.Size.Large
    widthType: IconButton.Width.Default

    readonly property Process process: Process {
        command: ["sh", "-c", root.command]
    }

    function execute() {
        process.startDetached();
        Qt.quit();
    }
}
