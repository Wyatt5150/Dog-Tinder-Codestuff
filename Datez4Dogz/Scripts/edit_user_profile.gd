extends Control
var mode:String = "create"

func SetMode(m:String):
	mode = m
	if mode == "edit":
		%LoginSection.visible = false
		%Username.visible = false
		%Password.visible = false
		PopulateFields()

func BackButton() -> void:
	SceneManager.Change_Scene(SceneManager.SCENES.MAIN)

func Submit() -> void:
	if CheckValid():
		await UpdateUser()
		if mode == "create":
			SceneManager.Change_Scene(SceneManager.SCENES.NAVIGATION)

func CheckValid() -> bool:
	var fields = %ContentContainer.get_children()
	var valid = true
	
	if mode == "create":
		if not %Username._validate():
			valid = false
		if not %Password._validate():
			valid = false
	
	for field in fields:
		if field is SettingPanel:
			if field._validate():
				continue
		
			valid = false
	
	return valid

func UpdateUser():
	var new_user = UserProfile.new()
	var fields = %ContentContainer.get_children()
	
	for field in fields:
		if field is BoolenSettingButton:
			new_user.set(field.name, field._get_value())
		
		if field is SettingPanel: 
			new_user.set(field.name, field._get_value())
		
	Globals.currentUser = new_user

func PopulateFields():
	var user = Globals.currentUser
	var fields = %ContentContainer.get_children()
	
	for field in fields:
		if field is BoolenSettingButton:
			field._set_value(user.get(field.name))
		
		if field is SettingPanel: 
			field._set_value(user.get(field.name))
