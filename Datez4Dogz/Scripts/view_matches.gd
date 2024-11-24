extends Control

@export var profileListItem:PackedScene

func _ready():
	_on_back_button_down()

func load_lists():
	var parents = [$VBoxContainer/Matched, $VBoxContainer/Pending]
	var profiles = [Globals.matched, Globals.accepted]
	var headers = ["Matches", "Pending Response"]
	
	for i in range(parents.size()):
		for child in parents[i].get_children():
			child.queue_free()
		
		var item = Label.new()
		item.text = headers[i]
		item.theme = load("res://Themes/SmallHeaderTheme.tres")
		parents[i].add_child(item)
			
		for profile in profiles[i]:
			item = profileListItem.instantiate()
			item.load_profile(profile)
			parents[i].add_child(item)
			item.button_down.connect(load_profile.bind(profile))
		
func load_profile(profile:UserProfile):
	$ProfileView.load_user(profile)
	$ProfileView.visible = true
	$ProfileView.mouse_filter = MOUSE_FILTER_STOP
	pass


func _on_back_button_down() -> void:
	var obj : Control
	$ProfileView.visible = false
	$ProfileView.mouse_filter = MOUSE_FILTER_IGNORE
	pass # Replace with function body.
