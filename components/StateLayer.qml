import QtQuick

import qs.styles.motion

Rectangle {
    opacity: parent.pressed ? 0.1 : parent.containsMouse ? 0.08 : 0
    visible: parent.enabled

    Behavior on color {
        ExpressiveFastColor {}
    }

    Behavior on opacity {
        ExpressiveFastEffects {}
    }
}
