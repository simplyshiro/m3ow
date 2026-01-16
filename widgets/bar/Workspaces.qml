pragma ComponentBehavior: Bound

import QtQuick
import Quickshell.Hyprland

import qs.components
import qs.styles
import qs.styles.motion

Rectangle {
    id: root

    readonly property real padding: 16
    readonly property color pillColor: Color.scheme._onSurfaceVariant
    readonly property color pillColorOccupied: Color.scheme._onSurface
    readonly property color pillColorFocused: Color.scheme.primary
    readonly property real pillSize: 8
    readonly property real pillSizeFocused: pillSize * 3
    readonly property real pillSpacing: 8

    color: "transparent"
    implicitHeight: 40
    implicitWidth: pillSizeFocused + (pillSize - 1) * repeater.model + pillSpacing * repeater.model + padding * 2
    radius: height

    Row {
        anchors.centerIn: parent
        spacing: root.pillSpacing

        Repeater {
            id: repeater

            model: 10

            delegate: Rectangle {
                id: pill

                required property int index
                readonly property int id: index + 1
                readonly property bool focused: Hyprland.focusedWorkspace?.id === id

                readonly property var occupied: {
                    Hyprland.workspaces.values.reduce((acc, curr) => {
                        acc[curr.id] = curr.lastIpcObject.windows >= 0;
                        return acc;
                    }, {})
                }

                color: focused ? root.pillColorFocused : occupied[id] ? root.pillColorOccupied : root.pillColor
                implicitHeight: root.pillSize
                implicitWidth: focused ? root.pillSizeFocused : root.pillSize
                radius: height

                Behavior on color {
                    ExpressiveFastColor {}
                }

                Behavior on implicitWidth {
                    ExpressiveFastSpatial {}
                }
            }
        }
    }

    MouseArea {
        anchors.fill: parent
        cursorShape: undefined
        hoverEnabled: true

        onWheel: (wheel) => {
            if (wheel.angleDelta.y > 0) {
                if (Hyprland.focusedWorkspace.id === 1) {
                    Hyprland.dispatch(`workspace ${repeater.model}`);
                } else {
                    Hyprland.dispatch("workspace -1");
                }
            }

            if (wheel.angleDelta.y < 0) {
                if (Hyprland.focusedWorkspace.id === repeater.model) {
                    Hyprland.dispatch("workspace 1");
                } else {
                    Hyprland.dispatch("workspace +1");
                }
            }
        }

        StateLayer {
            anchors.fill : parent
            color: Color.scheme._onSurface
            radius: root.radius
        }
    }
}
