extends Control

func _ready() -> void:
	var tabs:TabContainer = $TabContainer
	tabs.set_tab_icon(0, load("res://Sprites/Icons/Discover.png"))
	tabs.set_tab_icon(1, load("res://Sprites/Icons/Matches.png"))
	tabs.set_tab_icon(2, load("res://Sprites/Icons/Settings.png"))
	tabs.set_tab_icon(3, load("res://Sprites/Icons/Profile.png"))
	for i in range($TabContainer.get_tab_count()):
		$TabContainer.set_tab_title(i, "")

func _on_tab_container_tab_changed(tab: int) -> void:
	match tab:
		1:
			$"TabContainer/View Matches".load_lists()
