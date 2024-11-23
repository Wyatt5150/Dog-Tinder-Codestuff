extends Button
var profile:Profile
var clickPos:Vector2
var validClick:bool

signal clicked(profile)

func set_profile(p:Profile):
	profile = p
	$Image.texture = profile.pictures[0]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if validClick and clickPos.distance_to(get_global_mouse_position()) > 10:
		validClick = false


func _on_button_down() -> void:
	clickPos = get_global_mouse_position()
	validClick = true

func _on_button_up() -> void:
	if validClick:
		emit_signal("clicked",profile)
		validClick = false