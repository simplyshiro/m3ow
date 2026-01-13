import QtQuick

import qs.styles
import qs.styles.motion

Rectangle {
    id: root

    enum Size {
        Xsmall,
        Small,
        Medium,
        Large,
        Xlarge
    }

    enum Shape {
        Round,
        Square
    }

    enum Color {
        Filled,
        Tonal,
        Outlined,
        Standard
    }

    enum Width {
        Default,
        Narrow,
        Wide
    }

    readonly property color containerColor: colorType === IconButton.Color.Filled ? Color.scheme.primary
        : colorType === IconButton.Color.Tonal ? Color.scheme.secondaryContainer
        : colorType === IconButton.Color.Outlined || colorType === IconButton.Color.Standard ? "transparent"
        : null
    readonly property color selectedContainerColor: colorType === IconButton.Color.Filled ? Color.scheme.primary
        : colorType === IconButton.Color.Tonal ? Color.scheme.secondary
        : colorType === IconButton.Color.Outlined ? Color.scheme.inverseSurface
        : colorType === IconButton.Color.Standard ? "transparent"
        : null
    readonly property color unselectedContainerColor: colorType === IconButton.Color.Filled ? Color.scheme.surfaceContainer
        : colorType === IconButton.Color.Tonal ? Color.scheme.secondaryContainer
        : colorType === IconButton.Color.Outlined || colorType === IconButton.Color.Standard ? "transparent"
        : null

    readonly property real containerShape: shape === IconButton.Shape.Round ? height
        : shape === IconButton.Shape.Square && (size === IconButton.Size.Xsmall || size === IconButton.Size.Small) ? Shape.cornerValue.medium
        : shape === IconButton.Shape.Square && size === IconButton.Size.Medium ? Shape.cornerValue.large
        : shape === IconButton.Shape.Square && (size === IconButton.Size.Large || size === IconButton.Size.Xlarge) ? Shape.cornerValue.extraLarge
        : null
    readonly property real leadingTrailingSpace: widthType === IconButton.Width.Default && size === IconButton.Size.Xsmall ? 6
        : widthType === IconButton.Width.Default && size === IconButton.Size.Small ? 8
        : widthType === IconButton.Width.Default && size === IconButton.Size.Medium ? 16
        : widthType === IconButton.Width.Default && size === IconButton.Size.Large ? 32
        : widthType === IconButton.Width.Default && size === IconButton.Size.Xlarge ? 48
        : widthType === IconButton.Width.Narrow && (size === IconButton.Size.Xsmall || size === IconButton.Size.Small) ? 4
        : widthType === IconButton.Width.Narrow && size === IconButton.Size.Medium ? 12
        : widthType === IconButton.Width.Narrow && size === IconButton.Size.Large ? 16
        : widthType === IconButton.Width.Narrow && size === IconButton.Size.Xlarge ? 32
        : widthType === IconButton.Width.Wide && size === IconButton.Size.Xsmall ? 10
        : widthType === IconButton.Width.Wide && size === IconButton.Size.Small ? 14
        : widthType === IconButton.Width.Wide && size === IconButton.Size.Medium ? 24
        : widthType === IconButton.Width.Wide && size === IconButton.Size.Large ? 48
        : widthType === IconButton.Width.Wide && size === IconButton.Size.Xlarge ? 72
        : null
    readonly property real selectedContainerShape: shape === IconButton.Shape.Square ? height
        : shape === IconButton.Shape.Round && (size === IconButton.Size.Xsmall || size === IconButton.Size.Small) ? Shape.cornerValue.medium
        : shape === IconButton.Shape.Round && size === IconButton.Size.Medium ? Shape.cornerValue.large
        : shape === IconButton.Shape.Round && (size === IconButton.Size.Large || size === IconButton.Size.Xlarge) ? Shape.cornerValue.extraLarge
        : null
    readonly property real shapePressedMorph: size === IconButton.Size.Xsmall || size === IconButton.Size.Small ? Shape.cornerValue.small
        : size === IconButton.Size.Medium ? Shape.cornerValue.medium
        : size === IconButton.Size.Large || size === IconButton.Size.Xlarge ? Shape.cornerValue.large
        : null

    required property string icon

    property bool checkable
    property bool checked
    property bool enabled: true
    property bool internalChecked

    property int colorType: IconButton.Color.Filled
    property int shape: IconButton.Shape.Round
    property int size: IconButton.Size.Small
    property int widthType: IconButton.Width.Default

    signal clicked

    onCheckedChanged: internalChecked = checked

    border.color: colorType === IconButton.Color.Outlined && !internalChecked ? Color.scheme.outlineVariant : "transparent"
    border.width: size === IconButton.Size.Xsmall || size === IconButton.Size.Small || size === IconButton.Size.Medium ? 1
        : size === IconButton.Size.Large ? 2
        : size === IconButton.Size.Large ? 3
        : null
    color: enabled && internalChecked ? selectedContainerColor : checkable && enabled && !internalChecked ? unselectedContainerColor : enabled ? containerColor : (colorType === IconButton.Color.Outlined && !enabled && !internalChecked) || colorType === IconButton.Color.Standard ? "transparent" : Qt.alpha(Color.scheme._onSurface, 0.1)
    implicitHeight: size === IconButton.Size.Xsmall ? 32
        : size === IconButton.Size.Small ? 40
        : size === IconButton.Size.Medium ? 56
        : size === IconButton.Size.Large ? 96
        : size === IconButton.Size.Xlarge ? 136
        : null
    implicitWidth: icon.font.pixelSize + leadingTrailingSpace * 2
    radius: mouseArea.pressed ? shapePressedMorph : internalChecked ? selectedContainerShape : containerShape

    Behavior on border.color {
        ExpressiveFastColor {}
    }

    Behavior on color {
        ExpressiveFastColor {}
    }

    Behavior on radius {
        ExpressiveFastSpatial {}
    }

    MouseArea {
        id: mouseArea

        anchors.fill: parent
        cursorShape: enabled ? Qt.PointingHandCursor : undefined
        enabled: root.enabled
        hoverEnabled: true
        onClicked: {
            if (root.checkable) {
                root.internalChecked = !root.internalChecked
            }

            root.clicked()
        }

        StateLayer {
            anchors.fill: parent
            color: icon.color
            radius: root.radius
        }
    }

    M3Icon {
        id: icon

        readonly property color iconColor: root.colorType === IconButton.Color.Filled ? Color.scheme._onPrimary
            : root.colorType === IconButton.Color.Tonal ? Color.scheme._onSecondaryContainer
            : root.colorType === IconButton.Color.Outlined || root.colorType === IconButton.Color.Standard ? Color.scheme._onSurfaceVariant
            : null
        readonly property color selectedIconColor: root.colorType === IconButton.Color.Filled ? Color.scheme._onPrimary
            : root.colorType === IconButton.Color.Tonal ? Color.scheme._onSecondary
            : root.colorType === IconButton.Color.Outlined ? Color.scheme.inverseOnSurface
            : root.colorType === IconButton.Color.Standard ? Color.scheme.primary
            : null
        readonly property color unselectedIconColor: root.colorType === IconButton.Color.Filled ? Color.scheme._onSurfaceVariant
            : root.colorType === IconButton.Color.Tonal ? Color.scheme._onSecondaryContainer
            : root.colorType === IconButton.Color.Outlined || root.colorType === IconButton.Color.Standard ? Color.scheme._onSurfaceVariant
            : null

        readonly property int iconSize: root.size === IconButton.Size.Xsmall ? 20
            : root.size === IconButton.Size.Small || root.size === IconButton.Size.Medium ? 24
            : root.size === IconButton.Size.Large ? 32
            : root.size === IconButton.Size.Xlarge ? 40
            : null

        anchors.fill: parent
        color: root.checkable && root.enabled && root.internalChecked ? selectedIconColor : root.checkable && root.enabled && !root.internalChecked ? unselectedIconColor : root.enabled ? iconColor : Qt.alpha(Color.scheme._onSurface, 0.38)
        fill: root.internalChecked ? 1 : mouseArea.containsMouse ? 1 : 0
        font.pixelSize: iconSize
        icon: root.icon

        Behavior on color {
            ExpressiveFastColor {}
        }

        Behavior on fill {
            ExpressiveFastSpatial {}
        }
    }
}
