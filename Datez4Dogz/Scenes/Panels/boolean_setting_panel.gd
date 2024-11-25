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
	PROPERTIES.YESNO : {"Yes" : true, "No" : false},
	PROPERTIES.YESNOMAYBE : {
		"Yes" : "Yes", 
		"No" : "No", 
		"Maybe" : "Maybe"
	},
	PROPERTIES.GENDER : {
		"Male" : UserProfile.GENDER.MALE, 
		"Female" : UserProfile.GENDER.FEMALE, 
		"Other" : UserProfile.GENDER.NONBINARY
	},
	PROPERTIES.ACTIVITY : {
		"Low" : UserProfile.ACTIVITY.LOW, 
		"Medium" : UserProfile.ACTIVITY.MEDIUM, 
		"High" : UserProfile.ACTIVITY.HIGH
	}
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

func _get_value():
	var enum_text = %OptionButton.get_item_text(%OptionButton.selected)
	
	return properties_map[property][enum_text]

func _set_value(value):
	for i in range(0,%OptionButton.get_item_count()):
		if properties_map[property][%OptionButton.get_item_text(i)] == value:
			%OptionButton.select(i)
	

func set_dropdown() -> void:
	%OptionButton.clear()
	for item in properties_map[property].keys():
		%OptionButton.add_item(item)
	
