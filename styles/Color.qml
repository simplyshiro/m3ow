pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Io

Singleton {
    id: root

    property bool darkTheme: scheme === dark
    property QtObject scheme: light

    function toggleTheme() {
        if (darkTheme) {
            scheme = light
        } else {
            scheme = dark
        }

        gsettingsToggleTheme.startDetached()
        footToggleTheme.startDetached()
    }

    Process {
        id: footToggleTheme

        property string signal: root.darkTheme ? "-SIGUSR1" : "-SIGUSR2"

        command: ["sh", "-c", `pkill ${signal} foot`]
    }

    Process {
        id: gsettingsToggleTheme

        property string scheme: root.darkTheme ? "'prefer-dark'" : "'prefer-light'"

        command: ["sh", "-c", `gsettings set org.gnome.desktop.interface color-scheme ${scheme}`]
    }

    QtObject {
        id: palette

        readonly property color primary100: "#ffffff"
        readonly property color primary99: "#fffbfe"
        readonly property color primary98: "#fef7ff"
        readonly property color primary95: "#f6edff"
        readonly property color primary90: "#eaddff"
        readonly property color primary80: "#d0bcff"
        readonly property color primary70: "#b69df8"
        readonly property color primary60: "#9a82db"
        readonly property color primary50: "#7f67be"
        readonly property color primary40: "#6750a4"
        readonly property color primary30: "#4f378b"
        readonly property color primary20: "#381e72"
        readonly property color primary10: "#21005d"
        readonly property color primary0: "#000000"

        readonly property color secondary100: "#ffffff"
        readonly property color secondary99: "#fffbfe"
        readonly property color secondary98: "#fef7ff"
        readonly property color secondary95: "#f6edff"
        readonly property color secondary90: "#e8def8"
        readonly property color secondary80: "#ccc2dc"
        readonly property color secondary70: "#b0a7c0"
        readonly property color secondary60: "#958da5"
        readonly property color secondary50: "#7a7289"
        readonly property color secondary40: "#625b71"
        readonly property color secondary30: "#4a4458"
        readonly property color secondary20: "#332d41"
        readonly property color secondary10: "#1d192b"
        readonly property color secondary0: "#000000"

        readonly property color tertiary100: "#ffffff"
        readonly property color tertiary99: "#fffbfa"
        readonly property color tertiary98: "#fff8f8"
        readonly property color tertiary95: "#ffecf1"
        readonly property color tertiary90: "#ffd8e4"
        readonly property color tertiary80: "#efb8c8"
        readonly property color tertiary70: "#d29dac"
        readonly property color tertiary60: "#b58392"
        readonly property color tertiary50: "#986977"
        readonly property color tertiary40: "#7d5260"
        readonly property color tertiary30: "#633b48"
        readonly property color tertiary20: "#492532"
        readonly property color tertiary10: "#31111d"
        readonly property color tertiary0: "#000000"

        readonly property color error100: "#ffffff"
        readonly property color error99: "#fffbf9"
        readonly property color error98: "#fff8f7"
        readonly property color error95: "#fceeee"
        readonly property color error90: "#f9dedc"
        readonly property color error80: "#f2b8b5"
        readonly property color error70: "#ec928e"
        readonly property color error60: "#e46962"
        readonly property color error50: "#dc362e"
        readonly property color error40: "#b3261e"
        readonly property color error30: "#8c1d18"
        readonly property color error20: "#601410"
        readonly property color error10: "#410e0b"
        readonly property color error0: "#000000"

        readonly property color neutral100: "#ffffff"
        readonly property color neutral99: "#fffbff"
        readonly property color neutral98: "#fef7ff"
        readonly property color neutral96: "#f7f2fa"
        readonly property color neutral95: "#f5eff7"
        readonly property color neutral94: "#f3edf7"
        readonly property color neutral92: "#ece6f0"
        readonly property color neutral90: "#e6e0e9"
        readonly property color neutral87: "#ded8e1"
        readonly property color neutral80: "#cac5cd"
        readonly property color neutral70: "#aea9b1"
        readonly property color neutral60: "#938f96"
        readonly property color neutral50: "#79767d"
        readonly property color neutral40: "#605d64"
        readonly property color neutral30: "#48464c"
        readonly property color neutral24: "#3b383e"
        readonly property color neutral22: "#36343b"
        readonly property color neutral20: "#322f35"
        readonly property color neutral17: "#2b2930"
        readonly property color neutral12: "#211f26"
        readonly property color neutral10: "#1d1b20"
        readonly property color neutral6: "#141218"
        readonly property color neutral4: "#0f0d13"
        readonly property color neutral0: "#000000"

        readonly property color neutralVariant100: "#ffffff"
        readonly property color neutralVariant99: "#fffbfe"
        readonly property color neutralVariant98: "#fdf7ff"
        readonly property color neutralVariant95: "#f5eefa"
        readonly property color neutralVariant90: "#e7e0ec"
        readonly property color neutralVariant80: "#cac4d0"
        readonly property color neutralVariant70: "#aea9b4"
        readonly property color neutralVariant60: "#938f99"
        readonly property color neutralVariant50: "#79747e"
        readonly property color neutralVariant40: "#605d66"
        readonly property color neutralVariant30: "#49454f"
        readonly property color neutralVariant20: "#322f37"
        readonly property color neutralVariant10: "#1d1a22"
        readonly property color neutralVariant0: "#000000"
    }

    QtObject {
        id: light

        readonly property color primary: palette.primary40
        readonly property color _onPrimary: palette.primary100
        readonly property color primaryContainer: palette.primary90
        readonly property color _onPrimaryContainer: palette.primary30

        readonly property color secondary: palette.secondary40
        readonly property color _onSecondary: palette.secondary100
        readonly property color secondaryContainer: palette.secondary90
        readonly property color _onSecondaryContainer: palette.secondary30

        readonly property color tertiary: palette.tertiary40
        readonly property color _onTertiary: palette.tertiary100
        readonly property color tertiaryContainer: palette.tertiary90
        readonly property color _onTertiaryContainer: palette.tertiary30

        readonly property color error: palette.error40
        readonly property color _onError: palette.error100
        readonly property color errorContainer: palette.error90
        readonly property color _onErrorContainer: palette.error30

        readonly property color surface: palette.neutral98
        readonly property color _onSurface: palette.neutral10
        readonly property color surfaceVariant: palette.neutralVariant90
        readonly property color _onSurfaceVariant: palette.neutralVariant30
        readonly property color surfaceContainerHighest: palette.neutral90
        readonly property color surfaceContainerHigh: palette.neutral92
        readonly property color surfaceContainer: palette.neutral94
        readonly property color surfaceContainerLow: palette.neutral96
        readonly property color surfaceContainerLowest: palette.neutral100
        readonly property color inverseSurface: palette.neutral20
        readonly property color inverseOnSurface: palette.neutral95
        readonly property color surfaceTint: primary
        readonly property color surfaceTintColor: primary

        readonly property color outline: palette.neutralVariant50
        readonly property color outlineVariant: palette.neutralVariant80

        readonly property color primaryFixed: palette.primary90
        readonly property color _onPrimaryFixed: palette.primary10
        readonly property color primaryFixedDim: palette.primary80
        readonly property color _onPrimaryFixedVariant: palette.primary30
        readonly property color inversePrimary: palette.primary80

        readonly property color secondaryFixed: palette.secondary90
        readonly property color _onSecondaryFixed: palette.secondary10
        readonly property color secondaryFixedDim: palette.secondary80
        readonly property color _onSecondaryFixedVariant: palette.secondary30

        readonly property color tertiaryFixed: palette.tertiary90
        readonly property color _onTertiaryFixed: palette.tertiary10
        readonly property color tertiaryFixedDim: palette.tertiary80
        readonly property color _onTertiaryFixedVariant: palette.tertiary30

        readonly property color surfaceBright: palette.neutral98
        readonly property color surfaceDim: palette.neutral87
        readonly property color scrim: palette.neutral0
        readonly property color shadow: palette.neutral0
    }

    QtObject {
        id: dark

        readonly property color primary: palette.primary80
        readonly property color _onPrimary: palette.primary20
        readonly property color primaryContainer: palette.primary30
        readonly property color _onPrimaryContainer: palette.primary90

        readonly property color secondary: palette.secondary80
        readonly property color _onSecondary: palette.secondary20
        readonly property color secondaryContainer: palette.secondary30
        readonly property color _onSecondaryContainer: palette.secondary90

        readonly property color tertiary: palette.tertiary80
        readonly property color _onTertiary: palette.tertiary20
        readonly property color tertiaryContainer: palette.tertiary30
        readonly property color _onTertiaryContainer: palette.tertiary90

        readonly property color error: palette.error80
        readonly property color _onError: palette.error20
        readonly property color errorContainer: palette.error30
        readonly property color _onErrorContainer: palette.error90

        readonly property color surface: palette.neutral6
        readonly property color _onSurface: palette.neutral90
        readonly property color surfaceVariant: palette.neutralVariant30
        readonly property color _onSurfaceVariant: palette.neutralVariant80
        readonly property color surfaceContainerHighest: palette.neutral22
        readonly property color surfaceContainerHigh: palette.neutral17
        readonly property color surfaceContainer: palette.neutral12
        readonly property color surfaceContainerLow: palette.neutral10
        readonly property color surfaceContainerLowest: palette.neutral4
        readonly property color inverseSurface: palette.neutral90
        readonly property color inverseOnSurface: palette.neutral20
        readonly property color surfaceTint: primary
        readonly property color surfaceTintColor: primary

        readonly property color outline: palette.neutralVariant60
        readonly property color outlineVariant: palette.neutralVariant30

        readonly property color primaryFixed: palette.primary90
        readonly property color _onPrimaryFixed: palette.primary10
        readonly property color primaryFixedDim: palette.primary80
        readonly property color _onPrimaryFixedVariant: palette.primary30
        readonly property color inversePrimary: palette.primary40

        readonly property color secondaryFixed: palette.secondary90
        readonly property color _onSecondaryFixed: palette.secondary10
        readonly property color secondaryFixedDim: palette.secondary80
        readonly property color _onSecondaryFixedVariant: palette.secondary30

        readonly property color tertiaryFixed: palette.tertiary90
        readonly property color _onTertiaryFixed: palette.tertiary10
        readonly property color tertiaryFixedDim: palette.tertiary80
        readonly property color _onTertiaryFixedVariant: palette.tertiary30

        readonly property color surfaceBright: palette.neutral24
        readonly property color surfaceDim: palette.neutral6
        readonly property color scrim: palette.neutral0
        readonly property color shadow: palette.neutral0
    }
}
