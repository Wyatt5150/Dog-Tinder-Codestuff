extends Control
const tabIconNames = ["Discover", "Message", "Settings", "Profile"]
func _ready() -> void:
	for i in range($TabContainer.get_tab_count()):
		$TabContainer.set_tab_title(i, "")
	_on_tab_container_tab_changed(0)

func _on_tab_container_tab_changed(tab: int) -> void:
	reset_icons()
	$TabContainer.set_tab_icon(tab, load("res://Sprites/Icons/"+tabIconNames[tab]+".png"))
	match tab:
		0:
			$TabContainer/Discover.load_user()
		1:
			$TabContainer/ViewMatches.load_list()
			$TabContainer/ViewMatches._on_back_button_down()
		3:
			$TabContainer/EditUserProfile.SetMode("edit")

func reset_icons():
	var tabs:TabContainer = $TabContainer
	for i in range(tabs.get_tab_count()):
		tabs.set_tab_icon(i, load("res://Sprites/Icons/"+tabIconNames[i]+"Outline.png"))
