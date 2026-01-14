import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Wayland

import qs.styles
import qs.styles.elevation
import qs.styles.motion
import qs.widgets.bar

Variants {
    model: Quickshell.screens

    Scope {
        id: scope

        required property ShellScreen modelData

        PanelWindow {
            anchors.bottom: true
            anchors.left: true
            anchors.right: true
            color: "transparent"
            exclusiveZone: bar.height
            mask: Region {}
            screen: scope.modelData
        }

        PanelWindow {
            WlrLayershell.exclusionMode: ExclusionMode.Ignore
            anchors.bottom: true
            anchors.left: true
            anchors.right: true
            anchors.top: true
            color: "transparent"

            mask: Region {
                item: bar
            }

            screen: scope.modelData

            Item {
                id: item

                anchors.fill: parent

                KeyShadow {
                    anchors.fill: bar
                    elevation: 2
                }

                AmbientShadow {
                    anchors.fill: bar
                    elevation: 2
                }

                Rectangle {
                    id: bar

                    anchors.bottom: parent.bottom
                    anchors.left: parent.left
                    anchors.right: parent.right
                    color: Color.scheme.surfaceContainer
                    implicitHeight: 64

                    RowLayout {
                        anchors.bottom: parent.bottom
                        anchors.left: parent.left
                        anchors.leftMargin: 40
                        anchors.top: parent.top
                        spacing: 8

                        Workspaces {}
                    }

                    RowLayout {
                        anchors.bottom: parent.bottom
                        anchors.right: parent.right
                        anchors.rightMargin: 40
                        anchors.top: parent.top
                        spacing: 8

                        ThemeButton {}
                        ClockDate {}
                    }

                    Behavior on color {
                        ExpressiveFastColor {}
                    }
                }
            }
        }
    }
}
