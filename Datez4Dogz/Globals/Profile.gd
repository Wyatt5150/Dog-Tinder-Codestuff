# superclass for profiles
# holds information that both dogs and humans would have
extends Resource
class_name Profile

enum YESNOMAYBE {
	YES,
	NO,
	NOPREF
}

enum GENDER {
	MALE,
	FEMALE,
	NONBINARY,
	NOPREF
}
enum SIZE {
	SMALL,
	MEDIUM,
	LARGE,
	NOPREF
}
enum ACTIVITY {
	HIGH,
	MEDIUM,
	LOW,
	NOPREF
}

var name:String = ""
var bio:String = "" # brief description about user/dog
var age:int
var gender:GENDER 
var pictures:Array = []

func gender_string():
	match gender:
		GENDER.FEMALE:
			return "female"
		GENDER.MALE:
			return "male"
		GENDER.NONBINARY:
			return "nonbinary"
			
func get_color():
	var rng = RandomNumberGenerator.new()
	rng.seed = hash(name)
	var vals = [rng.randf_range(0,1), rng.randf_range(0,1), rng.randf_range(0,1)]
	if !vals.has(1):
		vals[rng.randf_range(0,2)] = 1
	
	return Color(vals[0],vals[1],vals[2])
	
