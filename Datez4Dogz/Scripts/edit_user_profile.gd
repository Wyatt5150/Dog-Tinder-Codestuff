extends Control

func BackButton() -> void:
	SceneManager.Change_Scene(SceneManager.SCENES.MAIN)

func Submit() -> void:
	if CheckValid():
		await CreateUser()
		SceneManager.Change_Scene(SceneManager.SCENES.NAVIGATION)

func CheckValid() -> bool:
	var fields = %ContentContainer.get_children()
	var valid = true
	
	for field in fields:
		if field is SettingPanel:
			if field._validate():
				continue
		
			valid = false
	
	return valid

func CreateUser():
	var new_user = UserProfile.new()
	var fields = %ContentContainer.get_children()
	
	for field in fields:
		if field is BoolenSettingButton:
			new_user.set(field.name, field._get_value())
		
		if field is SettingPanel: 
			new_user.set(field.name, field._get_value())
		
		
	
	Globals.currentUser = new_user
