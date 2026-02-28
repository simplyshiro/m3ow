import QtQuick

NumberAnimation {
    duration: 150
    easing.bezierCurve: [0.31, 0.94, 0.34, 1, 1, 1]
    easing.type: Easing.BezierSpline
}
