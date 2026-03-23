pragma ComponentBehavior: Bound

import QtQuick
import Quickshell
import Quickshell.Hyprland
import Quickshell.Wayland

import qs.components
import qs.services
import qs.styles
import qs.widgets.power

Scope {
    Variants {
        delegate: LazyLoader {
            id: loader

            required property ShellScreen modelData

            active: GlobalStates.powerDialogActive

            component: PanelWindow {
                WlrLayershell.exclusionMode: ExclusionMode.Ignore
                WlrLayershell.keyboardFocus: WlrKeyboardFocus.Exclusive
                WlrLayershell.layer: WlrLayer.Overlay
                anchors.bottom: true
                anchors.left: true
                anchors.right: true
                anchors.top: true
                color: Qt.alpha(Color.scheme.scrim, 0.32)
                screen: loader.modelData
                visible: loader.active

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
                    id: rectangle

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

        model: Quickshell.screens
    }

    GlobalShortcut {
        name: "togglePowerDialog"
        onPressed: GlobalStates.powerDialogActive = !GlobalStates.powerDialogActive
    }
}
