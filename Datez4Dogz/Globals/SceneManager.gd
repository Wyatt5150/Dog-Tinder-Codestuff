extends Node

enum SCENES {
	MAIN,
	SETUP,
	NAVIGATION
}

const SCENES_MAP = {
	SCENES.MAIN : "res://Scenes/MainMenu.tscn",
	SCENES.SETUP : "res://Scenes/EditUserProfile.tscn",
	SCENES.NAVIGATION : "res://Scenes/navigation.tscn"
}

func Change_Scene(scene : SCENES) -> void:
	if scene == SCENES.NAVIGATION:
		await Globals.next_user()
	get_tree().change_scene_to_file(SCENES_MAP[scene])
