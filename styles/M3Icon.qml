import QtQuick

import qs.styles.motion

M3Text {
    required property string icon

    property real fill

    font.family: "Material Symbols Sharp"
    font.pixelSize: 24

    font.variableAxes: {
        "FILL": fill.toFixed(1),
        "GRAD": grad,
        "opsz": opsz,
        "wght": weight
    }

    horizontalAlignment: Text.AlignHCenter
    text: icon
    verticalAlignment: Text.AlignVCenter

    Behavior on fill {
        ExpressiveFastSpatial {}
    }
}
