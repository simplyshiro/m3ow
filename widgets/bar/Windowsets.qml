pragma ComponentBehavior: Bound

import QtQuick
import Quickshell.I3
import Quickshell.WindowManager

import qs.components
import qs.styles
import qs.styles.motion

Item {
    id: root

    readonly property int windowsetCount: 10

    readonly property real padding: 16
    readonly property real pillSize: 8
    readonly property real pillSizeFocused: pillSize * 3
    readonly property real spacing: 8

    implicitHeight: loader.height
    implicitWidth: loader.width

    Loader {
        id: loader

        active: (WindowManager.windowsets?.length ?? 0) > 0

        sourceComponent: Rectangle {
            id: container

            color: "transparent"
            implicitHeight: 40
            implicitWidth: root.pillSizeFocused + root.pillSize * (root.windowsetCount - 1) + (root.spacing * root.windowsetCount) + root.padding * 2
            radius: height

            function switchWindowset(direction: int): void {
                const windowsets = WindowManager.windowsets ?? [];
                const activeWindowset = windowsets.find(windowset => windowset.active);

                if (!activeWindowset) return;

                const activeId = parseInt(activeWindowset.name);

                if (isNaN(activeId)) return;

                let targetId = activeId;

                if (direction > 0) {
                    targetId = activeId <= 1 ? root.windowsetCount : activeId - 1;
                } else if (direction < 0) {
                    targetId = activeId >= root.windowsetCount ? 1 : activeId + 1;
                }

                if (targetId === activeId) return;

                const targetWindowset = windowsets.find(windowset => windowset.name == targetId);

                if (targetWindowset) {
                    targetWindowset.activate();
                } else {
                    I3.dispatch(`workspace number ${targetId}`);
                }
            }

            Row {
                anchors.centerIn: parent
                spacing: root.spacing

                Repeater {
                    id: repeater

                    model: root.windowsetCount

                    Rectangle {
                        required property int index

                        readonly property bool active: windowset?.active ?? false
                        readonly property bool occupied: windowset !== undefined
                        readonly property bool urgent: windowset?.urgent ?? false

                        readonly property var windowset: WindowManager.windowsets?.find(workspace => workspace.name === `${index + 1}`)

                        color: urgent ? Colors.scheme.error : active ? Colors.scheme.primary : occupied ? Colors.scheme._onSurface : Colors.scheme._onSurfaceVariant
                        implicitHeight: root.pillSize
                        implicitWidth: active ? root.pillSizeFocused : implicitHeight
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
                    if (wheel.angleDelta.y !== 0) {
                        container.switchWindowset(wheel.angleDelta.y);
                    }
                }

                StateLayer {
                    anchors.fill : parent
                    color: Colors.scheme._onSurface
                    radius: container.radius
                }
            }
        }
    }
}
