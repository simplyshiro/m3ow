import QtQuick
import Quickshell
import Quickshell.Wayland

import qs.styles
import qs.styles.motion

Variants {
    model: Quickshell.screens

    Scope {
        id: scope

        required property ShellScreen modelData

        PanelWindow {
            id: panelWindow

            WlrLayershell.layer: WlrLayer.Background
            anchors.bottom: true
            anchors.left: true
            anchors.right: true
            anchors.top: true
            color: "transparent"
            screen: scope.modelData

            Image {
                anchors.fill: parent
                asynchronous: true
                cache: false
                fillMode: Image.PreserveAspectCrop
                source: `${Quickshell.shellDir}/wallpaper`
                sourceSize.height: panelWindow.screen.height
                sourceSize.width: panelWindow.screen.width
            }

            Rectangle {
                anchors.fill: parent
                color: Color.darkTheme ? Qt.alpha(Color.scheme.scrim, 0.16) : "transparent"

                Behavior on color {
                    ExpressiveFastColor {}
                }
            }
        }
    }
}
