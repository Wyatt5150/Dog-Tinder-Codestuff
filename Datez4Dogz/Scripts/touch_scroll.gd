# --- USAGE ---
# make this node a child of the container that you want it to apply to

extends Button
var holding:bool
var parent:Node
var prevY:float
var vel:float
@export var maxY:float = 1920
@export var minY:float = 0

const acc:float = 2500

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	holding = false
	parent = get_parent()
	vel = 0
	
	pass
	
func _process(delta: float) -> void:
	if holding:
		vel = (get_global_mouse_position().y-prevY)*(1/delta)
		parent.position.y += vel*delta
		prevY = get_global_mouse_position().y
	else:
		if parent.position.y > maxY:
			vel = 0
			parent.position.y = move_toward(parent.position.y, maxY, 1000*delta)
		elif parent.position.y < minY:
			vel = 0
			parent.position.y = move_toward(parent.position.y, minY, 1000*delta)
		# glide
		elif vel != 0:
			parent.position.y += vel*delta
		
			vel = move_toward(vel, 0, acc*delta)
	

func button_down() -> void:
	prevY = get_global_mouse_position().y
	holding = true
	pass


func button_up() -> void:
	holding = false
	if abs(vel) < 1000:
		vel = 0
	pass
