extends Control

func _ready():
	%SmallText.add_theme_font_size_override("font_size", Settings.sizes["small"][2])
	%MediumText.add_theme_font_size_override("font_size", Settings.sizes["medium"][2])
	%LargeText.add_theme_font_size_override("font_size", Settings.sizes["large"][2])

func sync_buttons():
	match Settings.textSize:
		"small":
			%SmallText.button_pressed = true
		"medium":
			%MediumText.button_pressed = true
		"large":
			%LargeText.button_pressed = true

func _change_text_size(newSize: String) -> void:
	Settings.set_text_size(newSize)
