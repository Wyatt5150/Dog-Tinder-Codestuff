extends Control

func load_user():
	if Globals.deciding == null:
		$NooneFound.mouse_filter = MOUSE_FILTER_STOP
		$NooneFound.visible = true
	else:
		$NooneFound.mouse_filter = MOUSE_FILTER_IGNORE
		$NooneFound.visible = false
		$ProfileView.load_user(Globals.deciding)

func _on_accept_pressed() -> void:
	Globals.accept_user(0)
	load_user()

func _on_decline_pressed() -> void:
	Globals.decline_user(0)
	load_user()
