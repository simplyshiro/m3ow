import QtQuick
import Quickshell

import qs.components
import qs.widgets
import qs.widgets.bar
import qs.widgets.power

ShellRoot {
    Bar {}

    PowerDialog {
        PowerButton {
            colorType: IconButton.Color.Filled
            command: "systemctl poweroff"
            icon: "power_settings_new"
            keybind: Qt.Key_P
            widthType: IconButton.Width.Wide
        }

        PowerButton {
            command: "systemctl reboot"
            icon: "restart_alt"
            keybind: Qt.Key_R
            widthType: IconButton.Width.Narrow
        }

        PowerButton {
            command: "systemctl reboot --boot-loader-entry=auto-windows"
            icon: "window"
            keybind: Qt.Key_W
        }

        PowerButton {
            command: "loginctl terminate-user ''"
            icon: "logout"
            keybind: Qt.Key_L
            widthType: IconButton.Width.Narrow
        }
    }

    Wallpaper {}
}
