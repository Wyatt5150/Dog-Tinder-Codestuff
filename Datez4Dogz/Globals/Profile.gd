# superclass for profiles
# holds information that both dogs and humans would have
class_name Profile
var profileType:String

var name:String = ""
var bio:String = "" # brief description about user/dog
var age:int
var gender:String # m, f, n (used for preference selection)
var pictures:Array = []
	
func _init() -> void:
	pass
