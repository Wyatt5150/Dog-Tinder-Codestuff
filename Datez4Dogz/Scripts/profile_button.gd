extends Button
var profile:Profile
var clickPos:Vector2
var validClick:bool

signal clicked(profile)

func _ready() -> void:
	deselect()

func set_profile(p:Profile):
	profile = p
	$ProfileIcon.set_profile(p)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if validClick and clickPos.distance_to(get_global_mouse_position()) > 10:
		validClick = false

func _on_button_down() -> void:
	clickPos = get_global_mouse_position()
	validClick = true

func _on_button_up() -> void:
	if validClick:
		clicked.emit(profile)
		validClick = false

func select():
	$Selected.visible = true

func deselect():
	$Selected.visible = false
