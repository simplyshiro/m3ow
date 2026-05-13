import QtQuick
import Quickshell
import Quickshell.Wayland

import qs.styles

PanelWindow {
    WlrLayershell.exclusionMode: ExclusionMode.Ignore
    WlrLayershell.layer: WlrLayer.Overlay
    WlrLayershell.namespace: "quickshell:scrim"
    anchors.bottom: true
    anchors.left: true
    anchors.right: true
    anchors.top: true
    color: Qt.alpha(Color.scheme.scrim, 0.32)
}
