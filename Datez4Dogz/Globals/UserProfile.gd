# profile for a human
class_name UserProfile extends Profile
enum RELATIONSHIPTYPE {
	FRIEND,
	ROMANTIC
}
enum NEUTEREDPREF {
	YES,
	NO,
	MAYBE
}
	

var pronouns:String
var location:String
var smoker:bool
var dogs:Array = [] # array of dog profiles

# stuff that the user is matched based on
var userPrefs:Dictionary = {
	"lookingFor": [], # array of RELATIONSHIPTYPE that user is looking for
	"ageMin": -1,
	"ageMax": -1,
	"gender": [], # array of GENDER they're okay with
	"smoker":false
}
# preferences relating to dogs
var dogPrefs:Dictionary = {
	"vaccinated": true,
	"neutered": NEUTEREDPREF.YES, # NEUTEREDPREF, MAYBE = must be neutered if different sex
	"size": [], # array of SIZE
	"activity": [] # array of ACTIVITY
}
	
# flag for default users
var acceptedCurrent:bool
	
func _init() -> void:
	profileType = PROFILETYPE.USER
	pass

func looking_for_string():
	var lookingFor = ""
	if userPrefs["lookingFor"].has(RELATIONSHIPTYPE.FRIEND):
		lookingFor += "Friendship"
	if userPrefs["lookingFor"].has(RELATIONSHIPTYPE.ROMANTIC):
		if lookingFor != "":
			lookingFor +=" or "
		lookingFor += "Relationship"
