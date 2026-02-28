import QtQuick

NumberAnimation {
    duration: 300
    easing.bezierCurve: [0.34, 0.88, 0.34, 1, 1, 1]
    easing.type: Easing.BezierSpline
}
