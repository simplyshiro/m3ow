import QtQuick

import qs.styles.motion

Text {
    id: root

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

    property bool emphasized: false

    property int fontSize: getFontSize(typeScale)
    property int grad: 0
    property int typeScale: M3Text.TypeScale.BodyMedium
    property int weight: getWeight(typeScale, emphasized)

    property real opsz: fontMetrics.font.pointSize

    function getFontSize(typeScale: int): int {
        switch (typeScale) {
        case M3Text.TypeScale.DisplayLarge:
            return 57;
        case M3Text.TypeScale.DisplayMedium:
            return 45;
        case M3Text.TypeScale.DisplaySmall:
            return 36;
        case M3Text.TypeScale.HeadlineLarge:
            return 32;
        case M3Text.TypeScale.HeadlineMedium:
            return 28;
        case M3Text.TypeScale.HeadlineSmall:
            return 24;
        case M3Text.TypeScale.TitleLarge:
            return 22;
        case M3Text.TypeScale.TitleSmall:
        case M3Text.TypeScale.BodyMedium:
        case M3Text.TypeScale.LabelLarge:
            return 14;
        case M3Text.TypeScale.BodySmall:
        case M3Text.TypeScale.LabelMedium:
            return 12;
        case M3Text.TypeScale.LabelSmall:
            return 11;
        default:
            return 16;
        }
    }

    function getLetterSpacing(typeScale: int): real {
        switch (typeScale) {
        case M3Text.TypeScale.BodySmall:
        case M3Text.TypeScale.LabelMedium:
        case M3Text.TypeScale.LabelSmall:
            return 0.1;
        default:
            return 0;
        }
    }

    function getLineHeight(typeScale: int): real {
        switch (typeScale) {
        case M3Text.TypeScale.DisplayLarge:
            return 64;
        case M3Text.TypeScale.DisplayMedium:
            return 52;
        case M3Text.TypeScale.DisplaySmall:
            return 44;
        case M3Text.TypeScale.HeadlineLarge:
            return 40;
        case M3Text.TypeScale.HeadlineMedium:
            return 36;
        case M3Text.TypeScale.HeadlineSmall:
            return 32;
        case M3Text.TypeScale.TitleLarge:
            return 28;
        case M3Text.TypeScale.TitleSmall:
        case M3Text.TypeScale.BodyMedium:
        case M3Text.TypeScale.LabelLarge:
            return 20;
        case M3Text.TypeScale.BodySmall:
        case M3Text.TypeScale.LabelMedium:
        case M3Text.TypeScale.LabelSmall:
            return 16;
        default:
            return 24;
        }
    }

    function getWeight(typeScale: int, emphasized: bool): int {
        let baseWeight = 400;

        switch (typeScale) {
        case M3Text.TypeScale.TitleMedium:
        case M3Text.TypeScale.TitleSmall:
        case M3Text.TypeScale.LabelLarge:
        case M3Text.TypeScale.LabelMedium:
        case M3Text.TypeScale.LabelSmall:
            baseWeight = 500;
            break;
        default:
            baseWeight = 400;
            break;
        }

        return emphasized ? baseWeight + 100 : baseWeight;
    }

    color: Colors.scheme._onSurface
    font.family: "sans-serif"
    font.hintingPreference: Font.PreferNoHinting
    font.letterSpacing: getLetterSpacing(typeScale)
    font.pixelSize: fontSize
    font.preferTypoLineMetrics: true

    font.variableAxes: {
        "GRAD": grad,
        "opsz": opsz,
        "wght": weight
    }

    font.weight: weight
    lineHeight: getLineHeight(typeScale)
    lineHeightMode: Text.FixedHeight
    renderType: Text.NativeRendering

    Behavior on color {
        ExpressiveFastColor {}
    }

    FontMetrics {
        id: fontMetrics

        font.family: "sans-serif"
        font.pixelSize: root.fontSize
    }
}
