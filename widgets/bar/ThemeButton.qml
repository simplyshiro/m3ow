import qs.components
import qs.styles

IconButton {
    colorType: IconButton.Color.Standard
    icon: Colors.darkTheme ? "light_mode" : "dark_mode"
    onClicked: Colors.toggleTheme()
}
