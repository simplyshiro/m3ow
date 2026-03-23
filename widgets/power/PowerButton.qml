import QtQuick
import Quickshell.Io

import qs.components

IconButton {
    id: root

    required property string command

    colorType: IconButton.Color.Tonal

    onClicked: {
        process.startDetached();
        Qt.quit();
    }

    size: IconButton.Size.Large
    widthType: IconButton.Width.Default

    readonly property Process process: Process {
        command: ["sh", "-c", root.command]
    }
}
