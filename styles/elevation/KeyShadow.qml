import QtQuick
import QtQuick.Effects

import qs.styles
import qs.styles.motion

RectangularShadow {
    enum Elevation {
        Level0,
        Level1,
        Level2,
        Level3,
        Level4,
        Level5
    }

    property int elevation: KeyShadow.Elevation.Level0

    blur: elevation === KeyShadow.Elevation.Level0 ? 0
        : elevation === KeyShadow.Elevation.Level1 ? 1.2 * 2
        : elevation === KeyShadow.Elevation.Level2 ? 1.2 * 2
        : elevation === KeyShadow.Elevation.Level3 ? 1.2 * 3
        : elevation === KeyShadow.Elevation.Level4 ? 1.2 * 3
        : elevation === KeyShadow.Elevation.Level5 ? 1.2 * 4
        : null
    color: elevation === KeyShadow.Elevation.Level0 ? "transparent" : Qt.alpha(Color.scheme.shadow, 0.3)
    offset.y: elevation === KeyShadow.Elevation.Level0 ? 0
        : elevation === KeyShadow.Elevation.Level1 ? 1
        : elevation === KeyShadow.Elevation.Level2 ? 1
        : elevation === KeyShadow.Elevation.Level3 ? 1
        : elevation === KeyShadow.Elevation.Level4 ? 2
        : elevation === KeyShadow.Elevation.Level5 ? 4
        : null

    Behavior on blur {
        ExpressiveFastEffects {}
    }

    Behavior on color {
        ExpressiveFastColor {}
    }

    Behavior on spread {
        ExpressiveFastEffects {}
    }

    Behavior on offset.y {
        ExpressiveFastEffects {}
    }
}
