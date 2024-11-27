extends VBoxContainer
class_name DogInfo

func _validate() -> bool:
	var fields = self.get_children()
	var valid = true
	
	for field in fields:
		if field is SettingPanel:
			if field._validate():
				continue
		
			valid = false
	
	return valid

func CreateDog() -> DogProfile:
	var new_doug = DogProfile.new()
	var fields = self.get_children()
	
	for field in fields:
		if field is BoolenSettingButton:
			new_doug.set(field.name, field._get_value())
		
		if field is SettingPanel: 
			new_doug.set(field.name, field._get_value())
		
	return new_doug

func _set_field_number(number : int):
	%Label.text = "Dog " + str(number)
