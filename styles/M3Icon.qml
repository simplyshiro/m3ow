import QtQuick

M3Text {
    required property string icon

    property real fill

    font.family: "Material Symbols Sharp"
    font.pixelSize: 24

    font.variableAxes: {
        "FILL": fill,
        "GRAD": grad,
        "opsz": opsz,
        "wght": weight
    }

    horizontalAlignment: Text.AlignHCenter
    text: icon
    verticalAlignment: Text.AlignVCenter
}
