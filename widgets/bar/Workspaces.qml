pragma ComponentBehavior: Bound

import QtQuick
import Quickshell.Hyprland

import qs.components
import qs.styles
import qs.styles.motion

Item {
    id: root

    readonly property int workspaceCount: 10

    readonly property real padding: 16
    readonly property real pillSize: 8
    readonly property real pillSizeFocused: pillSize * 3
    readonly property real spacing: 8

    implicitHeight: loader.height
    implicitWidth: loader.width

    Loader {
        id: loader

        active: Hyprland.eventSocketPath
        sourceComponent: workspaces
    }

    Component {
        id: workspaces

        Rectangle {
            id: container

            color: "transparent"
            implicitHeight: 40
            implicitWidth: root.pillSizeFocused + root.pillSize * (root.workspaceCount - 1) + root.spacing * root.workspaceCount + root.padding * 2
            radius: height

            Row {
                anchors.centerIn: parent
                spacing: root.spacing

                Connections {
                    target: Hyprland

                    function onFocusedWorkspaceChanged() {
                        Hyprland.refreshWorkspaces();
                    }
                }

                Connections {
                    target: Hyprland.workspaces

                    function onValuesChanged() {
                        Hyprland.refreshWorkspaces();
                    }
                }

                Repeater {
                    id: repeater

                    delegate: Rectangle {
                        required property int index

                        readonly property bool focused: Hyprland.focusedWorkspace?.id === index + 1

                        readonly property var occupied: Hyprland.workspaces.values.reduce((accumulator, workspace) => {
                            accumulator[workspace.id] = workspace.lastIpcObject.windows > 0;
                            return accumulator;
                        }, {})

                        color: focused ? Color.scheme.primary : occupied[index + 1] ? Color.scheme._onSurface : Color.scheme._onSurfaceVariant
                        implicitHeight: root.pillSize
                        implicitWidth: focused ? root.pillSizeFocused : implicitHeight
                        radius: height

                        Behavior on color {
                            ExpressiveFastColor {}
                        }

                        Behavior on implicitWidth {
                            ExpressiveFastSpatial {}
                        }
                    }

                    model: root.workspaceCount
                }
            }

            MouseArea {
                anchors.fill: parent
                cursorShape: undefined
                hoverEnabled: true

                onWheel: (wheel) => {
                    if (wheel.angleDelta.y > 0) {
                        if (Hyprland.focusedWorkspace.id === 1) {
                            Hyprland.dispatch(`workspace ${root.workspaceCount}`);
                        } else {
                            Hyprland.dispatch("workspace -1");
                        }
                    }

                    if (wheel.angleDelta.y < 0) {
                        if (Hyprland.focusedWorkspace.id === root.workspaceCount) {
                            Hyprland.dispatch("workspace 1");
                        } else {
                            Hyprland.dispatch("workspace +1");
                        }
                    }
                }

                StateLayer {
                    anchors.fill : parent
                    color: Color.scheme._onSurface
                    radius: container.radius
                }
            }
        }
    }
}
