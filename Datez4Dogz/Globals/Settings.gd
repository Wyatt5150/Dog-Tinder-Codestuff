extends Node
var textSize
const sizes = {
	"small": [50,20,15],
	"medium": [60,40,20],
	"large": [70,50,30]
}


func set_text_size(newSize: String) -> void:
	textSize = newSize
	var title:Theme = load("res://Themes/BigHeaderTheme.tres")
	var header:Theme = load("res://Themes/SmallHeaderTheme.tres")
	var body:Theme = load("res://Themes/BodyTheme.tres")
	
	title.set_font_size("font_size", "Label", sizes[newSize][0])
	header.set_font_size("font_size", "Label", sizes[newSize][1])
	for type in ["Label","LineEdit","OptionButton","Button"]:
		body.set_font_size("font_size", type, sizes[newSize][2])
