import QtQuick

import qs.styles.motion

Text {
    enum TypeScale {
        DisplayLarge,
        DisplayMedium,
        DisplaySmall,
        HeadlineLarge,
        HeadlineMedium,
        HeadlineSmall,
        TitleLarge,
        TitleMedium,
        TitleSmall,
        BodyLarge,
        BodyMedium,
        BodySmall,
        LabelLarge,
        LabelMedium,
        LabelSmall
    }

    property int typeScale: M3Text.TypeScale.BodyMedium

    property bool emphasized: false

    property int grad: Color.scheme === Color.dark ? -25 : 0
    property int weight: emphasized && typeScale === M3Text.TypeScale.DisplayLarge ? 500
        : emphasized && typeScale === M3Text.TypeScale.DisplayMedium ? 500
        : emphasized && typeScale === M3Text.TypeScale.DisplaySmall ? 500
        : emphasized && typeScale === M3Text.TypeScale.HeadlineLarge ? 500
        : emphasized && typeScale === M3Text.TypeScale.HeadlineMedium ? 500
        : emphasized && typeScale === M3Text.TypeScale.HeadlineSmall ? 500
        : emphasized && typeScale === M3Text.TypeScale.TitleLarge ? 500
        : emphasized && typeScale === M3Text.TypeScale.TitleMedium ? 600
        : emphasized && typeScale === M3Text.TypeScale.TitleSmall ? 600
        : emphasized && typeScale === M3Text.TypeScale.BodyLarge ? 500
        : emphasized && typeScale === M3Text.TypeScale.BodyMedium ? 500
        : emphasized && typeScale === M3Text.TypeScale.BodySmall ? 500
        : emphasized && typeScale === M3Text.TypeScale.LabelLarge ? 600
        : emphasized && typeScale === M3Text.TypeScale.LabelMedium ? 600
        : emphasized && typeScale === M3Text.TypeScale.LabelSmall ? 600
        : typeScale === M3Text.TypeScale.DisplayLarge ? 400
        : typeScale === M3Text.TypeScale.DisplayMedium ? 400
        : typeScale === M3Text.TypeScale.DisplaySmall ? 400
        : typeScale === M3Text.TypeScale.HeadlineLarge ? 400
        : typeScale === M3Text.TypeScale.HeadlineMedium ? 400
        : typeScale === M3Text.TypeScale.HeadlineSmall ? 400
        : typeScale === M3Text.TypeScale.TitleLarge ? 400
        : typeScale === M3Text.TypeScale.TitleMedium ? 500
        : typeScale === M3Text.TypeScale.TitleSmall ? 500
        : typeScale === M3Text.TypeScale.BodyLarge ? 400
        : typeScale === M3Text.TypeScale.BodyMedium ? 400
        : typeScale === M3Text.TypeScale.BodySmall ? 400
        : typeScale === M3Text.TypeScale.LabelLarge ? 500
        : typeScale === M3Text.TypeScale.LabelMedium ? 500
        : typeScale === M3Text.TypeScale.LabelSmall ? 500
        : null

    property real opsz: font.pixelSize * 72 / 96

    color: Color.scheme._onSurface
    font.family: "Google Sans"
    font.hintingPreference: Font.PreferNoHinting
    font.letterSpacing: typeScale === M3Text.TypeScale.DisplayLarge ? 0
        : typeScale === M3Text.TypeScale.DisplayMedium ? 0
        : typeScale === M3Text.TypeScale.DisplaySmall ? 0
        : typeScale === M3Text.TypeScale.HeadlineLarge ? 0
        : typeScale === M3Text.TypeScale.HeadlineMedium ? 0
        : typeScale === M3Text.TypeScale.HeadlineSmall ? 0
        : typeScale === M3Text.TypeScale.TitleLarge ? 0
        : typeScale === M3Text.TypeScale.TitleMedium ? 0
        : typeScale === M3Text.TypeScale.TitleSmall ? 0
        : typeScale === M3Text.TypeScale.BodyLarge ? 0
        : typeScale === M3Text.TypeScale.BodyMedium ? 0
        : typeScale === M3Text.TypeScale.BodySmall ? 0.1
        : typeScale === M3Text.TypeScale.LabelLarge ? 0
        : typeScale === M3Text.TypeScale.LabelMedium ? 0.1
        : typeScale === M3Text.TypeScale.LabelSmall ? 0.1
        : null
    font.pixelSize: typeScale === M3Text.TypeScale.DisplayLarge ? 57
        : typeScale === M3Text.TypeScale.DisplayMedium ? 45
        : typeScale === M3Text.TypeScale.DisplaySmall ? 36
        : typeScale === M3Text.TypeScale.HeadlineLarge ? 32
        : typeScale === M3Text.TypeScale.HeadlineMedium ? 28
        : typeScale === M3Text.TypeScale.HeadlineSmall ? 24
        : typeScale === M3Text.TypeScale.TitleLarge ? 22
        : typeScale === M3Text.TypeScale.TitleMedium ? 16
        : typeScale === M3Text.TypeScale.TitleSmall ? 14
        : typeScale === M3Text.TypeScale.BodyLarge ? 16
        : typeScale === M3Text.TypeScale.BodyMedium ? 14
        : typeScale === M3Text.TypeScale.BodySmall ? 12
        : typeScale === M3Text.TypeScale.LabelLarge ? 14
        : typeScale === M3Text.TypeScale.LabelMedium ? 12
        : typeScale === M3Text.TypeScale.LabelSmall ? 11
        : null
    font.preferTypoLineMetrics: true

    font.variableAxes: {
        "GRAD": 100,
        "ROND": 0,
        "opsz": opsz,
        "slnt": 0,
        "wdth": 100,
        "wght": weight
    }

    font.weight: weight
    lineHeight: typeScale === M3Text.TypeScale.DisplayLarge ? 64
        : typeScale === M3Text.TypeScale.DisplayMedium ? 52
        : typeScale === M3Text.TypeScale.DisplaySmall ? 44
        : typeScale === M3Text.TypeScale.HeadlineLarge ? 40
        : typeScale === M3Text.TypeScale.HeadlineMedium ? 36
        : typeScale === M3Text.TypeScale.HeadlineSmall ? 32
        : typeScale === M3Text.TypeScale.TitleLarge ? 28
        : typeScale === M3Text.TypeScale.TitleMedium ? 24
        : typeScale === M3Text.TypeScale.TitleSmall ? 20
        : typeScale === M3Text.TypeScale.BodyLarge ? 24
        : typeScale === M3Text.TypeScale.BodyMedium ? 20
        : typeScale === M3Text.TypeScale.BodySmall ? 16
        : typeScale === M3Text.TypeScale.LabelLarge ? 20
        : typeScale === M3Text.TypeScale.LabelMedium ? 16
        : typeScale === M3Text.TypeScale.LabelSmall ? 16
        : null
    lineHeightMode: Text.FixedHeight
    renderType: Text.NativeRendering

    Behavior on color {
        ExpressiveFastColor {}
    }

    Behavior on grad {
        ExpressiveFastSpatial {}
    }

    Behavior on weight {
        ExpressiveFastSpatial {}
    }
}
