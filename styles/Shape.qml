pragma Singleton

import QtQuick
import Quickshell

Singleton {
    readonly property QtObject cornerValue: QtObject {
        readonly property real none: 0
        readonly property real extraSmall: 4
        readonly property real small: 8
        readonly property real medium: 12
        readonly property real large: 16
        readonly property real largeIncreased: 20
        readonly property real extraLarge: 28
        readonly property real extraLargeIncreased: 32
        readonly property real extraExtraLarge: 48
    }
}
