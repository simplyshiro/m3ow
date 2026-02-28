import QtQuick

NumberAnimation {
    duration: 350
    easing.bezierCurve: [0.42, 1.67, 0.21, 0.9, 1, 1]
    easing.type: Easing.BezierSpline
}
