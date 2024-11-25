@tool
extends Panel
class_name BoolenSettingButton

enum PROPERTIES {
	YESNO,
	YESNOMAYBE,
	GENDER,
	ACTIVITY
}

const properties_map = {
	PROPERTIES.YESNO : ["Yes", "No"],
	PROPERTIES.YESNOMAYBE : ["Yes", "No", "Maybe"],
	PROPERTIES.GENDER : ["Male", "Female", "Other"],
	PROPERTIES.ACTIVITY : ["Low", "Medium", "High"]
}

@export var label_text : String = "Placeholder":
	set(new_val):
		%InputLabel.text = new_val
		label_text = new_val

@export var property : PROPERTIES = PROPERTIES.YESNO :
	set(new_val):
		property = new_val
		set_dropdown()

func _ready() -> void:
	set_dropdown()

func _get_value() -> String:
	var enum_text = %OptionButton.get_item_text(%OptionButton.selected)
	
	return %OptionButton.get_item_text(%OptionButton.selected)

func set_dropdown() -> void:
	%OptionButton.clear()
	for item in properties_map[property]:
		%OptionButton.add_item(item)
	
