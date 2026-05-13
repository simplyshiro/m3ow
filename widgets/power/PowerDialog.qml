pragma ComponentBehavior: Bound

import QtQuick
import Quickshell
import Quickshell.Hyprland
import Quickshell.Wayland

import qs.components
import qs.services
import qs.styles
import qs.widgets
import qs.widgets.power

Item {
    Variants {
        model: Quickshell.screens

        Scope {
            id: scope

            required property ShellScreen modelData

            LazyLoader {
                activeAsync: GlobalStates.powerDialogActive

                Scrim {
                    screen: scope.modelData
                }
            }
        }
    }

    LazyLoader {
        activeAsync: GlobalStates.powerDialogActive

        PanelWindow {
            WlrLayershell.exclusionMode: ExclusionMode.Ignore
            WlrLayershell.keyboardFocus: WlrKeyboardFocus.Exclusive
            WlrLayershell.layer: WlrLayer.Overlay
            WlrLayershell.namespace: "quickshell:powerDialog"
            anchors.bottom: true
            anchors.left: true
            anchors.right: true
            anchors.top: true
            color: "transparent"

            contentItem {
                Keys.onPressed: event => {
                    if (event.key === Qt.Key_Escape) {
                        GlobalStates.powerDialogActive = false;
                    }
                }

                focus: true
            }

            MouseArea {
                anchors.fill: parent
                cursorShape: undefined
                onClicked: GlobalStates.powerDialogActive = false
            }

            Rectangle {
                readonly property real leadingTrailingSpace: 48

                anchors.centerIn: parent
                color: Color.scheme.surfaceContainer
                implicitHeight: row.height + leadingTrailingSpace * 2
                implicitWidth: row.width + leadingTrailingSpace * 2
                radius: Shape.corner.extraLarge

                Row {
                    id: row

                    anchors.centerIn: parent
                    spacing: 12

                    PowerButton {
                        colorType: IconButton.Color.Filled
                        command: "systemctl poweroff"
                        icon: "power_settings_new"
                        widthType: IconButton.Width.Wide
                    }

                    PowerButton {
                        command: "systemctl reboot"
                        icon: "restart_alt"
                        widthType: IconButton.Width.Narrow
                    }

                    PowerButton {
                        command: "systemctl reboot --boot-loader-entry=auto-windows"
                        icon: "window"
                    }

                    PowerButton {
                        command: "loginctl terminate-user ''"
                        icon: "logout"
                        widthType: IconButton.Width.Narrow
                    }
                }
            }
        }
    }

    GlobalShortcut {
        name: "togglePowerDialog"
        onPressed: GlobalStates.powerDialogActive = !GlobalStates.powerDialogActive
    }
}
