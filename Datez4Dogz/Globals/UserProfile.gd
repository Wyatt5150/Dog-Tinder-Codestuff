# profile for a human
extends Profile
class_name UserProfile

### TRAITS ###
var pronouns:String
var location:String

var smoker:bool

var dogs:Array = [] # array of dog profiles

### PREFERENCES ###
# Human
var smoker_preference : bool
var gender_preference : String

# Dogs
var vaccinated_preference : bool
var neutered_preference : String # YESNOMAYBE # NEUTEREDPREF, MAYBE = must be neutered if different sex
var size : String
var activity : String
