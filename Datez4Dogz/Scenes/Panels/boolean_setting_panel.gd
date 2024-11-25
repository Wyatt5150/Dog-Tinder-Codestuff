@tool
extends Panel
class_name BoolenSettingButton

enum PROPERTIES {
	YESNO,
	NOYES,
	YESNOMAYBE,
	GENDER_SELECT,
	GENDER_PREF,
	ACTIVITY_SELECT,
	ACTIVITY_PREF,
	SIZE_SELECT,
	SIZE_PREF
}

const properties_map = {
	PROPERTIES.YESNO : {
		"Yes" : Profile.YESNOMAYBE.YES, 
		"No" : Profile.YESNOMAYBE.NO
	},
	PROPERTIES.NOYES : {
		"No" : Profile.YESNOMAYBE.NO,
		"Yes" : Profile.YESNOMAYBE.YES 
	},
	PROPERTIES.YESNOMAYBE : {
		"Yes" : Profile.YESNOMAYBE.YES, 
		"No" : Profile.YESNOMAYBE.NO, 
		"Maybe" : Profile.YESNOMAYBE.NOPREF
	},
	PROPERTIES.GENDER_SELECT : {
		"Male" : Profile.GENDER.MALE, 
		"Female" : Profile.GENDER.FEMALE, 
		"Other" : Profile.GENDER.NONBINARY
	},
	PROPERTIES.GENDER_PREF : {
		"No Preference" : Profile.GENDER.NOPREF,
		"Male" : Profile.GENDER.MALE, 
		"Female" : Profile.GENDER.FEMALE, 
		"Other" : Profile.GENDER.NONBINARY
	},
	PROPERTIES.ACTIVITY_SELECT : {
		"Low" : UserProfile.ACTIVITY.LOW, 
		"Medium" : UserProfile.ACTIVITY.MEDIUM, 
		"High" : UserProfile.ACTIVITY.HIGH
	},
	PROPERTIES.ACTIVITY_PREF : {
		"No Preference" : Profile.ACTIVITY.NOPREF,
		"Low" : Profile.ACTIVITY.LOW, 
		"Medium" : Profile.ACTIVITY.MEDIUM, 
		"High" : Profile.ACTIVITY.HIGH
	},
	PROPERTIES.SIZE_SELECT : {
		"Small" : Profile.SIZE.SMALL, 
		"Medium" : Profile.SIZE.MEDIUM, 
		"Large" : Profile.SIZE.LARGE
	},
	PROPERTIES.SIZE_PREF : {
		"No Preference" : Profile.SIZE.NOPREF,
		"Small" : Profile.SIZE.SMALL, 
		"Medium" : Profile.SIZE.MEDIUM, 
		"Large" : Profile.SIZE.LARGE
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
	
