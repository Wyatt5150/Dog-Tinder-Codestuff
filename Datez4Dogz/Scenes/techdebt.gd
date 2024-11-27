extends VBoxContainer
class_name DogContainer

@export var doug_field : PackedScene
var dougs : int = 1

func _validate() -> bool:
	var valid = true
	
	for child in self.get_children():
		if child is DogInfo:
			if not child._validate():
				valid = false
	
	return valid

func _get_dougs() -> Array:
	var dougs : Array = []
	
	for child in self.get_children():
		if child is DogInfo:
			dougs.append(child.CreateDog())
	
	return dougs

func _add_doug():
	dougs += 1
	var doug_scene : DogInfo = doug_field.instantiate()
	doug_scene._set_field_number(dougs)
	self.add_child(doug_scene)
	move_child(%AddRemoveDougs, -1)
	
func _remove_doug():
	if dougs < 2:
		return
	dougs -= 1
	self.get_child(self.get_child_count()-2).queue_free()
