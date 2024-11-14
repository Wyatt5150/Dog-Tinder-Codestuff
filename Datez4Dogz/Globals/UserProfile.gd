# profile for a human
class_name UserProfile extends Profile

var pronouns:String
var location:String
var smoker:bool
var dogs:Array = [] # array of dog profiles

# stuff that the user is matched based on
var userPrefs:Dictionary = {
	"lookingFor": "", # friendship, relationship, either
	"ageMin": -1,
	"ageMax": -1,
	"gender": [], # array of genders they're okay with
	"smoker":false
}
# preferences relating to dogs
var dogPrefs:Dictionary = {
	"vaccinated": true,
	"neutered": "", # true, false, ifSame (dogs of same sex as yours must be neutered)
	"size": [], # small, medium, large (dog sizes you're okay with)
	"activity": [] # low, medium, high ()
}
	
# flag for default users
var acceptedCurrent:bool
	
func _init() -> void:
	profileType = "user"
	pass
