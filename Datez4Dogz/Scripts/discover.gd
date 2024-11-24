extends Control

func _ready() -> void:
	load_user()

func load_user():
	if Globals.undecided.is_empty():
		$NooneFound.mouse_filter = MOUSE_FILTER_STOP
		$NooneFound.visible = true
	else:
		$NooneFound.mouse_filter = MOUSE_FILTER_IGNORE
		$NooneFound.visible = false
		$ProfileView.load_user(Globals.undecided[0])

func _on_accept_pressed() -> void:
	Globals.accept_user(0)
	load_user()

func _on_decline_pressed() -> void:
	Globals.decline_user(0)
	load_user()
