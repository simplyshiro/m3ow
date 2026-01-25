import qs.components
import qs.styles

IconButton {
    colorType: IconButton.Color.Standard
    icon: Color.darkTheme ? "light_mode" : "dark_mode"
    onClicked: Color.toggleTheme()
}
