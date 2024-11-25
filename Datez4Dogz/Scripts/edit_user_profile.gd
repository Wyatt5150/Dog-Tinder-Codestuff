extends Control

func BackButton() -> void:
	SceneManager.Change_Scene(SceneManager.SCENES.MAIN)

func Submit() -> void:
	if CheckValid():
		SceneManager.Change_Scene(SceneManager.SCENES.NAVIGATION)
	else:
		#TODO: Generate popup that says "Complete all required fields"
		pass

func CheckValid() -> bool:
	var fields = %ContentContainer.get_children()
	var valid = true
	
	for field in fields:
		if !(field is SettingPanel): # Skips non-SettingsPanels
			continue
		
		if field._validate():
			continue
		
		valid = false
	
	return valid
