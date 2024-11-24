extends Control

const sizes = {
	"small": [35,20,15],
	"medium": [50,35,20],
	"large": [70,50,30]
}

func _ready():
	%SmallText.add_theme_font_size_override("font_size", sizes["small"][2])
	%MediumText.add_theme_font_size_override("font_size", sizes["medium"][2])
	%LargeText.add_theme_font_size_override("font_size", sizes["large"][2])

func _change_text_size(newSize: String) -> void:
	var title:Theme = load("res://Themes/BigHeaderTheme.tres")
	var header:Theme = load("res://Themes/SmallHeaderTheme.tres")
	var body:Theme = load("res://Themes/BodyTheme.tres")
	
	title.set_font_size("font_size", "Label", sizes[newSize][0])
	header.set_font_size("font_size", "Label", sizes[newSize][1])
	body.set_font_size("font_size", "Label", sizes[newSize][2])
