pragma ComponentBehavior: Bound

import QtQuick
import Quickshell
import Quickshell.Hyprland
import Quickshell.Wayland

import qs.components
import qs.styles
import qs.widgets.power

Variants {
    id: root

    default property list<PowerButton> powerButtons

    model: Quickshell.screens

    Scope {
        id: scope

        required property ShellScreen modelData

        Loader {
            id: loader

            active: false

            PanelWindow {
                WlrLayershell.exclusionMode: ExclusionMode.Ignore
                WlrLayershell.keyboardFocus: WlrKeyboardFocus.Exclusive
                WlrLayershell.layer: WlrLayer.Overlay
                anchors.bottom: true
                anchors.left: true
                anchors.right: true
                anchors.top: true
                color: Qt.alpha(Color.scheme.scrim, 0.32)
                screen: scope.modelData
                visible: loader.active

                contentItem {
                    Keys.onPressed: event => {
                        if (event.key === Qt.Key_Escape) {
                            loader.active = false;
                        } else {
                            for (let i = 0; i < root.powerButtons.length; i++) {
                                let powerButton = root.powerButtons[i];

                                if (event.key === powerButton.keybind) {
                                    powerButton.execute();
                                }
                            }
                        }
                    }

                    focus: true
                }

                MouseArea {
                    anchors.fill: parent
                    cursorShape: undefined
                    onClicked: loader.active = false
                }

                Rectangle {
                    id: rectangle

                    readonly property real leadingTrailingSpace: 48

                    anchors.centerIn: parent
                    color: Color.scheme.surfaceContainer
                    implicitHeight: row.height + leadingTrailingSpace * 2
                    implicitWidth: row.width + leadingTrailingSpace * 2
                    radius: Shape.cornerValue.extraLarge

                    Row {
                        id: row

                        anchors.centerIn: parent
                        spacing: 12

                        Repeater {
                            model: root.powerButtons

                            delegate: IconButton {
                                required property PowerButton modelData

                                colorType: modelData.colorType
                                icon: modelData.icon
                                onClicked: modelData.execute()
                                size: IconButton.Size.Large
                                widthType: modelData.widthType
                            }
                        }
                    }
                }
            }
        }

        GlobalShortcut {
            name: "powerPanel"
            onPressed: loader.active = !loader.active
        }
    }
}
