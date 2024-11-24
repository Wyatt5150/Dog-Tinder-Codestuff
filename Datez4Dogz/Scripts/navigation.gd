extends Control

func _ready() -> void:
	var tabs:TabContainer = $TabContainer
	tabs.set_tab_icon(0, load("res://Sprites/Icons/Discover.png"))
	tabs.set_tab_icon(1, load("res://Sprites/Icons/Matches.png"))
	tabs.set_tab_icon(2, load("res://Sprites/Icons/Settings.png"))

func _on_tab_container_tab_changed(tab: int) -> void:
	match tab:
		1:
			$TabContainer/ViewMatches.load_lists()
