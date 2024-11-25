# superclass for profiles
# holds information that both dogs and humans would have
extends Resource
class_name Profile

enum GENDER {
	MALE,
	FEMALE,
	NONBINARY
}
enum SIZE {
	SMALL,
	MEDIUM,
	LARGE
}
enum ACTIVITY {
	HIGH,
	MEDIUM,
	LOW
}
enum PROFILETYPE {
	DOG,
	USER
}

var profileType:PROFILETYPE

var name:String = ""
var bio:String = "" # brief description about user/dog
var age:int
var gender:GENDER 
var pictures:Array = []
	
func _init() -> void:
	pass

func gender_string():
	match gender:
		GENDER.FEMALE:
			return "female"
		GENDER.MALE:
			return "male"
		GENDER.NONBINARY:
			return "nonbinary"
