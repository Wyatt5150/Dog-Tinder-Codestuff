# profile for a human
extends Profile
class_name UserProfile

### TRAITS ###
var pronouns:String
var location:String

var smoker : YESNOMAYBE

var dogs:Array = [] # array of dog profiles

### PREFERENCES ###
# Human
var smoker_preference : YESNOMAYBE
var gender_preference : GENDER

# Dogs
var vaccinated_preference : YESNOMAYBE
var neutered_preference : YESNOMAYBE # MAYBE = must be neutered if different sex
var size_preference : SIZE
var activity_preference : SIZE
