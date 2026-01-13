pragma Singleton

import QtQuick
import Quickshell

Singleton {
    property alias date: systemClock.date

    SystemClock {
        id: systemClock
    }
}
