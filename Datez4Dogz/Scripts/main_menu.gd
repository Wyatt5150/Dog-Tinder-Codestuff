extends Control

func NewUser() -> void:
	SceneManager.Change_Scene(SceneManager.SCENES.SETUP)

func ReturningUser() -> void:
	await Globals.set_current_user_default()
	SceneManager.Change_Scene(SceneManager.SCENES.NAVIGATION)
