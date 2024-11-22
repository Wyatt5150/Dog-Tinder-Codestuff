extends Control

func NewUser() -> void:
	SceneManager.Change_Scene(SceneManager.SCENES.SETUP)

func ReturningUser() -> void:
	SceneManager.Change_Scene(SceneManager.SCENES.DISCOVER)
