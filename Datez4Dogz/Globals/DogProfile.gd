# profile for a dog
class_name DogProfile extends Profile

var vaccinated:bool
var neutered:bool
var breed:String
var size:SIZE
var activity:ACTIVITY
	
func _init() -> void:
	profileType = PROFILETYPE.DOG
	pass
