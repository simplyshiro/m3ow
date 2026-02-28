import QtQuick

NumberAnimation {
    duration: 500
    easing.bezierCurve: [0.38, 1.21, 0.22, 1, 1, 1]
    easing.type: Easing.BezierSpline
}
