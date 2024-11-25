extends Control

func _ready() -> void:
	PopulateFields()

func Submit() -> void:
	if CheckValid():
		await UpdateUser()

func CheckValid() -> bool:
	var fields = %ContentContainer.get_children()
	var valid = true
	
	for field in fields:
		if field is SettingPanel:
			if field._validate():
				continue
			
			valid = false
	
	return valid

func UpdateUser():
	var user = Globals.currentUser
	var fields = %ContentContainer.get_children()
	
	for field in fields:
		if field is BoolenSettingButton:
			user.set(field.name, field._get_value())
		
		if field is SettingPanel: 
			user.set(field.name, field._get_value())
	
	Globals.currentUser = user

func PopulateFields():
	var user = Globals.currentUser
	var fields = %ContentContainer.get_children()
	
	for field in fields:
		if user.get(field.name) == null:
			continue
		
		if field is BoolenSettingButton:
			field._set_value(user.get(field.name))
		
		if field is SettingPanel: 
			field._set_value(user.get(field.name))
