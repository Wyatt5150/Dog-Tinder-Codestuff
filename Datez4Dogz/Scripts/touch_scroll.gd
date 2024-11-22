# --- USAGE ---
# make this node a child of the container that you want it to apply to

extends Button
var holding:bool
var parent:Node
var prev:float
var vel:float
@export var max:float = 1920
@export var min:float = 0
enum AXIS {HORIZONTAL, VERTICAL}
@export var direction:AXIS

const acc:float = 2500

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	holding = false
	parent = get_parent()
	vel = 0
	
func _process(delta: float) -> void:
	var parentPos
	if direction == VERTICAL:
			parentPos = parent.position.y
	else:
		parentPos = parent.position.x
	if holding:
		vel = (get_mouse_pos()-prev)*(1/delta)
		set_parent_pos(parentPos+vel*delta)
		prev = get_mouse_pos()
	else:
		# drift back into bounds
		if parentPos > max:
			vel = 0
			set_parent_pos(move_toward(parentPos, max, 1000*delta))
		elif parentPos < min:
			vel = 0
			set_parent_pos(move_toward(parentPos, min, 1000*delta))
		# glide
		elif vel != 0:
			set_parent_pos(parentPos+vel*delta)
			vel = move_toward(vel, 0, acc*delta)
	
func button_down() -> void:
	prev = get_mouse_pos()
	holding = true

func get_mouse_pos() -> float:
	if direction == VERTICAL:
		return get_global_mouse_position().y
	else:
		return get_global_mouse_position().x

func set_parent_pos(newPos) -> void:
	if direction == VERTICAL:
		parent.position.y = newPos
	else:
		parent.position.x = newPos

func button_up() -> void:
	holding = false
	if abs(vel) < 1000:
		vel = 0
