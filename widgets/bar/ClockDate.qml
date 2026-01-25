import QtQuick

import qs.components
import qs.services
import qs.styles

Rectangle {
    id: root

    readonly property real padding: 16

    color: "transparent"
    implicitHeight: 40
    implicitWidth: row.width + padding * 2
    radius: height

    Row {
        id: row

        anchors.centerIn: parent
        spacing: 8

        M3Text {
            anchors.verticalCenter: parent.verticalCenter
            color: Color.scheme._onSurfaceVariant
            grad: mouseArea.pressed ? -50 : mouseArea.containsMouse ? 50 : 0
            text: Qt.formatDateTime(Clock.date, "ddd, MMM d")
            typeScale: M3Text.TypeScale.LabelLarge
            verticalAlignment: Text.AlignVCenter
        }

        M3Text {
            anchors.verticalCenter: parent.verticalCenter
            grad: mouseArea.pressed ? -50 : mouseArea.containsMouse ? 50 : 0
            text: Qt.formatDateTime(Clock.date, "HH:mm")
            typeScale: M3Text.TypeScale.LabelLarge
            verticalAlignment: Text.AlignVCenter
        }
    }

    MouseArea {
        id: mouseArea

        anchors.fill: parent
        cursorShape: undefined
        hoverEnabled: true

        StateLayer {
            anchors.fill: parent
            color: Color.scheme._onSurface
            radius: root.radius
        }
    }
}
