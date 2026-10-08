//@ pragma DefaultEnv QSG_RENDER_LOOP=threaded
//@ pragma DropExpensiveFonts
//@ pragma NativeTextRendering

import QtQuick
import Quickshell

import qs.widgets
import qs.widgets.bar
import qs.widgets.power

ShellRoot {
    Wallpaper {}
    Bar {}
    PowerDialog {}
}
