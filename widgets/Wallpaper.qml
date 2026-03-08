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
            WlrLayershell.exclusionMode: ExclusionMode.Ignore
            WlrLayershell.layer: WlrLayer.Background
            anchors.bottom: true
            anchors.left: true
            anchors.top: true
            anchors.right: true
            color: "transparent"
            screen: scope.modelData

            Image {
                anchors.fill: parent
                asynchronous: true
                cache: false
                fillMode: Image.PreserveAspectCrop
                source: `${Quickshell.shellDir}/wallpaper`
                sourceSize.height: parent.height
                sourceSize.width: parent.width
            }

            Rectangle {
                anchors.fill: parent
                color: Color.darkTheme ? Qt.alpha(Color.scheme.scrim, 0.16) : "transparent"

                Behavior on color {
                    ExpressiveSlowColor {}
                }
            }
        }
    }
}
