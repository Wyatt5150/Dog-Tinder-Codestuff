# profile for a dog
class_name DogProfile extends Profile

var vaccinated:bool
var neutered:bool
var breed:String
var size:SIZE
var activity:ACTIVITY
	
func _init() -> void:
	profileType = PROFILETYPE.DOG

func size_string():
	match size:
		SIZE.SMALL: 
			return "small"
		SIZE.MEDIUM: 
			return "medium"
		SIZE.LARGE: 
			return "large"

func activity_string():
	match activity:
		ACTIVITY.HIGH: 
			return "high"
		ACTIVITY.MEDIUM: 
			return "medium"
		ACTIVITY.LOW:
			return "low"
