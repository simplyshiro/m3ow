import QtQuick
import QtQuick.Layouts

import qs.styles
import qs.styles.elevation
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
        Elevated,
        Filled,
        Tonal,
        Outlined,
        Standard
    }

    readonly property color containerColor: colorType === M3Button.Color.Elevated ? Color.scheme.surfaceContainerLow
        : colorType === M3Button.Color.Filled ? Color.scheme.primary
        : colorType === M3Button.Color.Tonal ? Color.scheme.secondaryContainer
        : colorType === M3Button.Color.Outlined || colorType === M3Button.Color.Standard ? "transparent"
        : null
    readonly property color selectedContainerColor: colorType === M3Button.Color.Elevated ? Color.scheme.primary
        : colorType === M3Button.Color.Filled ? Color.scheme.primary
        : colorType === M3Button.Color.Tonal ? Color.scheme.secondary
        : colorType === M3Button.Color.Outlined ? Color.scheme.inverseSurface
        : colorType === M3Button.Color.Standard ? "transparent"
        : null
    readonly property color unselectedContainerColor: colorType === M3Button.Color.Elevated ? Color.scheme.surfaceContainerLow
        : colorType === M3Button.Color.Filled ? Color.scheme.surfaceContainer
        : colorType === M3Button.Color.Tonal ? Color.scheme.secondaryContainer
        : colorType === M3Button.Color.Outlined || colorType === M3Button.Color.Standard ? "transparent"
        : null

    readonly property real containerShape: shape === M3Button.Shape.Round ? height
        : shape === M3Button.Shape.Square && (size === M3Button.Size.Xsmall || size === M3Button.Size.Small) ? Shape.cornerValue.medium
        : shape === M3Button.Shape.Square && size === M3Button.Size.Medium ? Shape.cornerValue.large
        : shape === M3Button.Shape.Square && (size === M3Button.Size.Large || size === M3Button.Size.Xlarge) ? Shape.cornerValue.extraLarge
        : null
    readonly property real leadingTrailingSpace: size === M3Button.Size.Xsmall ? 12
        : size === M3Button.Size.Small ? 16
        : size === M3Button.Size.Medium ? 24
        : size === M3Button.Size.Large ? 48
        : size === M3Button.Size.Xlarge ? 64
        : null
    readonly property real selectedContainerShape: shape === M3Button.Shape.Square ? height
        : shape === M3Button.Shape.Round && (size === M3Button.Size.Xsmall || size === M3Button.Size.Small) ? Shape.cornerValue.medium
        : shape === M3Button.Shape.Round && size === M3Button.Size.Medium ? Shape.cornerValue.large
        : shape === M3Button.Shape.Round && (size === M3Button.Size.Large || size === M3Button.Size.Xlarge) ? Shape.cornerValue.extraLarge
        : null
    readonly property real shapePressedMorph: size === M3Button.Size.Xsmall || size === M3Button.Size.Small ? Shape.cornerValue.small
        : size === M3Button.Size.Medium ? Shape.cornerValue.medium
        : size === M3Button.Size.Large || size === M3Button.Size.Xlarge ? Shape.cornerValue.large
        : null

    required property string text

    property bool checkable
    property bool checked
    property bool enabled: true
    property bool internalChecked

    property int colorType: M3Button.Color.Filled
    property int shape: M3Button.Shape.Round
    property int size: M3Button.Size.Small

    property string icon

    signal clicked

    onCheckedChanged: internalChecked = checked

    border.color: colorType === M3Button.Color.Outlined && !internalChecked ? Color.scheme.outlineVariant : "transparent"
    border.width: size === M3Button.Size.Xsmall || size === M3Button.Size.Small || size === M3Button.Size.Medium ? 1
        : size === M3Button.Size.Large ? 2
        : size === M3Button.Size.Large ? 3
        : null
    color: enabled && internalChecked ? selectedContainerColor : checkable && enabled && !internalChecked ? unselectedContainerColor : enabled ? containerColor : (colorType === M3Button.Color.Outlined && !enabled && !internalChecked) || colorType === M3Button.Color.Standard ? "transparent" : Qt.alpha(Color.scheme._onSurface, 0.1)
    implicitHeight: size === M3Button.Size.Xsmall ? 32
        : size === M3Button.Size.Small ? 40
        : size === M3Button.Size.Medium ? 56
        : size === M3Button.Size.Large ? 96
        : size === M3Button.Size.Xlarge ? 136
        : null
    implicitWidth: rowLayout.width + leadingTrailingSpace * 2
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

    KeyShadow {
        anchors.fill: root
        elevation: root.colorType === M3Button.Color.Elevated ? 1 : 0
        radius: root.radius
        z: -1
    }

    AmbientShadow {
        anchors.fill: root
        elevation: root.colorType === M3Button.Color.Elevated ? 1 : 0
        radius: root.radius
        z: -1
    }

    MouseArea {
        id: mouseArea

        anchors.fill: parent
        cursorShape: enabled ? Qt.PointingHandCursor : undefined
        enabled: root.enabled
        hoverEnabled: true
        onClicked: {
            if (root.checkable) {
                root.internalChecked = !root.internalChecked;
            }

            root.clicked();
        }

        StateLayer {
            anchors.fill: parent
            color: label.color
            radius: root.radius
        }
    }

    RowLayout {
        id: rowLayout

        readonly property color iconLabelColor: root.colorType === M3Button.Color.Elevated || root.colorType === M3Button.Color.Standard ? Color.scheme.primary
            : root.colorType === M3Button.Color.Filled ? Color.scheme._onPrimary
            : root.colorType === M3Button.Color.Tonal ? Color.scheme._onSecondaryContainer
            : root.colorType === M3Button.Color.Outlined ? Color.scheme._onSurfaceVariant
            : null
        readonly property color selectedIconLabelColor: root.colorType === M3Button.Color.Elevated || root.colorType === M3Button.Color.Filled ? Color.scheme._onPrimary
            : root.colorType === M3Button.Color.Tonal ? Color.scheme._onSecondary
            : root.colorType === M3Button.Color.Outlined ? Color.scheme.inverseOnSurface
            : null
        readonly property color unselectedIconLabelColor: root.colorType === M3Button.Color.Elevated ? Color.scheme.primary
            : root.colorType === M3Button.Color.Filled ? Color.scheme._onSurfaceVariant
            : root.colorType === M3Button.Color.Tonal ? Color.scheme._onSecondaryContainer
            : root.colorType === M3Button.Color.Outlined ? Color.scheme._onSurfaceVariant
            : null

        anchors.centerIn: parent
        spacing: root.size === M3Button.Size.Xsmall || root.size === M3Button.Size.Small || root.size === M3Button.Size.Medium ? 8
            : root.size === M3Button.Size.Large ? 12
            : root.size === M3Button.Size.Xlarge ? 16
            : null

        M3Icon {
            Layout.topMargin: label.font.pixelSize * 0.115
            color: root.checkable && root.enabled && root.internalChecked ? rowLayout.selectedIconLabelColor : root.checkable && root.enabled && !root.internalChecked ? rowLayout.unselectedIconLabelColor : root.enabled ? rowLayout.iconLabelColor : Qt.alpha(Color.scheme._onSurface, 0.38)
            fill: root.internalChecked ? 1 : mouseArea.containsMouse ? 1 : 0
            font.pixelSize: root.size === M3Button.Size.Xsmall ? 20
                : root.size === M3Button.Size.Small || root.size === M3Button.Size.Medium ? 24
                : root.size === M3Button.Size.Large ? 32
                : root.size === M3Button.Size.Xlarge ? 40
                : null
            icon: root.icon
            verticalAlignment: Text.AlignVCenter
            visible: root.icon
            weight: mouseArea.pressed ? 300 : mouseArea.containsMouse ? 600 : 400
        }

        M3Text {
            id: label

            color: root.checkable && root.enabled && root.internalChecked ? rowLayout.selectedIconLabelColor : root.checkable && root.enabled && !root.internalChecked ? rowLayout.unselectedIconLabelColor : root.enabled ? rowLayout.iconLabelColor : Qt.alpha(Color.scheme._onSurface, 0.38)
            grad: root.internalChecked ? 125 : mouseArea.pressed ? -50 : mouseArea.containsMouse ? 50 : Color.darkTheme ? -25 : 0
            text: root.text
            typeScale: root.size === M3Button.Size.Xsmall || root.size === M3Button.Size.Small ? M3Text.TypeScale.LabelLarge
                : root.size === M3Button.Size.Medium ? M3Text.TypeScale.TitleMedium
                : root.size === M3Button.Size.Large ? M3Text.TypeScale.HeadlineSmall
                : root.size === M3Button.Size.Xlarge ? M3Text.TypeScale.HeadlineLarge
                : null
            verticalAlignment: Text.AlignVCenter
        }
    }
}
