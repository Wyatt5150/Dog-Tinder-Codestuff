extends Control

func BackButton() -> void:
	SceneManager.Change_Scene(SceneManager.SCENES.MAIN)

func Submit() -> void:
	SceneManager.Change_Scene(SceneManager.SCENES.DISCOVER)
