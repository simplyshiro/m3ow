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

    property int elevation: AmbientShadow.Elevation.Level0

    blur: elevation === AmbientShadow.Elevation.Level0 ? 0
        : elevation === AmbientShadow.Elevation.Level1 ? 1.2 * 3
        : elevation === AmbientShadow.Elevation.Level2 ? 1.2 * 6
        : elevation === AmbientShadow.Elevation.Level3 ? 1.2 * 8
        : elevation === AmbientShadow.Elevation.Level4 ? 1.2 * 10
        : elevation === AmbientShadow.Elevation.Level5 ? 1.2 * 12
        : null
    color: elevation === AmbientShadow.Elevation.Level0 ? "transparent" : Qt.alpha(Color.scheme.shadow, 0.15)
    spread: elevation === AmbientShadow.Elevation.Level0 ? 0
        : elevation === AmbientShadow.Elevation.Level1 ? 1
        : elevation === AmbientShadow.Elevation.Level2 ? 2
        : elevation === AmbientShadow.Elevation.Level3 ? 3
        : elevation === AmbientShadow.Elevation.Level4 ? 4
        : elevation === AmbientShadow.Elevation.Level5 ? 6
        : null
    offset.y: elevation === AmbientShadow.Elevation.Level0 ? 0
        : elevation === AmbientShadow.Elevation.Level1 ? 1
        : elevation === AmbientShadow.Elevation.Level2 ? 2
        : elevation === AmbientShadow.Elevation.Level3 ? 4
        : elevation === AmbientShadow.Elevation.Level4 ? 6
        : elevation === AmbientShadow.Elevation.Level5 ? 8
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
