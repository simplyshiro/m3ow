import qs.components
import qs.styles

IconButton {
    checkable: true
    checked: Color.darkTheme
    colorType: IconButton.Color.Standard
    icon: Color.darkTheme ? "dark_mode" : "light_mode"
    onClicked: Color.toggleTheme()
}
