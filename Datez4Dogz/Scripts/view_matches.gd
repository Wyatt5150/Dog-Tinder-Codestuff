extends Control

@export var profileListItem:PackedScene
@export var profileView:PackedScene

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
	pass
