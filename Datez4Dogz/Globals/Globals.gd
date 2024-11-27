extends Node
var currentUser:UserProfile = UserProfile.new()

# default users
# all default users start in undecided and will be moved to the appropriate list during discover mode
var matched:Array = [] # current user and other user have accepted eachother
var deciding:UserProfile
var decidingIndex = -1

const dogData:Array = [
	["Rufus","shy at first but will warm up to new friends","3","m","FALSE","Daschund","s","m",],
	["Max","energetic and friendly","1","m","TRUE","Boston Terrier","s","h",],
	["Francine","Looking for walking buddies","7","f","TRUE","Poodle","m","l",],
	["Renala","Please ask to pet first","6","f","FALSE","Beagle","m","l",],
	["Skrimblim","I got that dog in me","2","m","TRUE","Chihuahua","s","h",],
	["Paskintio","On all levels except physical, I am a wolf","9","m","TRUE","German Shepherd","l","m",],
	["Bowlbo","*paws at you*","4","m","TRUE","Bulldog","m","l",],
	["Cathy","Dog with a blog","5","f","TRUE","Husky","l","h",],
	["Leon","bwork","8","m","TRUE","Golden Retriever","l","h",],
	["Sans","Frisbee or ball?","7","m","TRUE","Rottweiler","l","l",],
	["Bertha","The key to my heart is head scritches","3","f","TRUE","Alaskan Malamute","l","m",],
	["Isabelle","Belly rubs >","7","f","FALSE","Australian Cattle Dog","m","m",],
	["Pinky","Looking for an active dog to help inspire me","5","f","TRUE","Corgi","m","l",],
	["Rose","Faster than your dog","4","f","TRUE","Pomeranian","s","h",],
	["Snot","Watch out for when this one sneezes","2","m","FALSE","Rottweiler","l","l",],
	["Fang","What's your favorite food?","6","m","TRUE","German Shepherd","l","h",],
	["Beo","Still searching for the perfect stick","10","m","TRUE","Beagle","m","m",],
	["Moop","I can catch my own tail","1","m","FALSE","Golden Retriever","l","l",],
	["Chuck","BONES","3","m","TRUE","American Eskimo Dog","l","m",],
	["Snoopy","Gamer dog","2","m","TRUE","Beagle","m","h",],
	["Dakota","Laziest dog on the planet","7","f","FALSE","St. Bernard","l","l",],
	["Argus","Will steal your food","8","f","TRUE","Shiba Inu","m","m",],
	["Kai","Can jump higher than you","5","m","TRUE","Pit Bull","m","h",],
	["Diamond","Definition of the lap dog","7","f","TRUE","Bulldog","m","h",],
	["Mia","Tiny dog with a big heart","6","f","FALSE","Chihuahua","s","h",],
	["Jack","Center of attention","1","m","TRUE","Doberman","l","m",],
	["Baker","Arf Arf","2","f","TRUE","Shih Tzu","s","m",],
	["Jill","I have a weak sense of smell","4","f","FALSE","Great Dane","l","l",],
	["Yorkie","Got any steak?","3","f","TRUE","Border Collie","m","l",],
	["Luna","Sophisticate","7","f","TRUE","Husky","h","h",]
]
const userData:Array = [
	["Markus","Walking in the park","m","He/Him"],
	["Amelia","New dog owner here","f","She/Her"],
	["Xander","Do you bark or do you arf?","n","They/Them"],
	["Triss","They call me the subwoofer","f","She/They"],
	["Jaquan","Howdy y'all","m","He/Him"],
	["Bethany","Long walks on the beach","f","She/Her"],
	["Ryuji","Can dogs have boba tea?","m","He/Him"],
	["Michelle","Dogs > Cats","f","She/Her"],
	["Tanner","This app is great but I wish there was an iguana mode","m","He/Him"],
	["Qwen","I love dogs so much","n","They/Them"],
	["Aiden","Erm... How do you do? *tips fedora*","m","He/Him"],
	["Caitlyn","What is a dog's favorite music genre?","f","She/Her"],
	["Violet","How old are you in dog yearsS?","f","She/Her"],
	["Jeice","Let's talk about dogs!","m","He/Him"],
	["Viktor","A dog's best friend","m","He/Him"],
	["David","<3","m","He/Him"],
	["Anthony","Puppers are poggers","m","He/They"],
	["Shelby","Dog food recommendations?","f","She/Her"],
	["Sophia","Dog friendly resturaunts?","f","She/Her"],
	["Valeria","WHY ARE ALL MY LETTERS CAPITAL","f","She/Her"],
	["Yasmine","Dogs are a gift","f","She/Her"],
	["Daniel","I tried teaching my dog how to play video games","m","He/Him"],
	["Carlos","Tell me your favorite dog video","m","He/Him"],
	["Tori","Currently writing a book","f","She/Her"],
	["Ellie","Looking for someone to walk with me and my dog","f","She/Her"],
	["Candace","Come as you are","f","She/Her"],
	["Lydia","Hi everyone","f","She/Her"],
	["Sven","Can't wait to meet you and your dog!","m","He/Him"],
	["Tony","Need help training my dog","m","He/Him"],
	["Astarion","Good evening","n","They/Them"]
]
var dogDistribution:Array = []

func _ready() -> void:
	for i in range(30):
		dogDistribution.append([])
		for n in range(randi_range(1,3)):
			dogDistribution[i].append(randi_range(0,dogData.size()-1))

func set_current_user_default():
	# make dog
	var dog = DogProfile.new()
	dog.name = "Doug"
	dog.bio = "Good boi"
	dog.gender = Profile.GENDER.MALE
	dog.activity = Profile.ACTIVITY.LOW
	dog.size = Profile.SIZE.SMALL
	dog.neutered = Profile.YESNOMAYBE.YES
	dog.vaccinated = Profile.YESNOMAYBE.YES
	dog.age = 3
	dog.pictures = [load("res://Sprites/DogPics/oakley.jpg"),load("res://Sprites/DogPics/oakley2.jpg"),load("res://Sprites/DogPics/oakleyAnnieRollo.jpg")]
	
	# make user
	currentUser = UserProfile.new()
	currentUser.name = "Standard Regualar Person"
	currentUser.pronouns = "De/Fault"
	currentUser.age = 28
	currentUser.location = "Somewhere, Real"
	currentUser.bio = "This is a default me!"
	currentUser.gender = Profile.GENDER.FEMALE
	currentUser.smoker = Profile.YESNOMAYBE.NO
	
	currentUser.smoker_preference = Profile.YESNOMAYBE.NO
	currentUser.activity_preference = Profile.ACTIVITY.NOPREF
	currentUser.size_preference = Profile.SIZE.NOPREF
	currentUser.gender_preference = Profile.GENDER.NOPREF
	currentUser.neutered_preference = Profile.YESNOMAYBE.NO
	currentUser.vaccinated_preference = Profile.YESNOMAYBE.YES
	
	currentUser.dogs.append(dog)
	
	currentUser.pictures = [load("res://icon.svg")]
	
func print_csv(path:String):
	var file = FileAccess.open(path, FileAccess.READ)
	file.get_csv_line()

	print("[")
	while !file.eof_reached():
		var s = ""
		for field in file.get_csv_line():
			s+="\""+field+"\","
		
		s = "[" + s.substr(0,s.length()-1) + "]"
		if !file.eof_reached():
			s+=","
		print("\t",s)
	print("]")

# profile creation
func make_user(i:int):
	var profile = UserProfile.new()
	var data = userData[i%userData.size()-1]

	profile.name = data[0]
	profile.bio = data[1]
	match data[2]:
		"f":
			profile.gender = Profile.GENDER.FEMALE
		"m":
			profile.gender =  Profile.GENDER.MALE
		"n":
			profile.gender =  Profile.GENDER.NONBINARY
			
	if data[3] == "":
		match profile.gender:
			Profile.GENDER.FEMALE:
				profile.pronouns = "She/Her"
			Profile.GENDER.MALE:
				profile.pronouns =  "He/Him"
			Profile.GENDER.NONBINARY:
				profile.pronouns =  "They/Them"
	else:
		profile.pronouns = data[3]
		
	profile.location = currentUser.location
	var rand = randfn(30,10)
	while rand < 18 or rand > 100:
		rand = randfn(30,10)
	profile.age = rand
	
	if currentUser.smoker_preference and randi_range(1,10) == 1:
		profile.smoker = Profile.YESNOMAYBE.NO
	else:
		profile.smoker = Profile.YESNOMAYBE.NO
	
	for dog in dogDistribution[i]:
		profile.dogs.append(make_dog(dog))
		
	var files = DirAccess.get_files_at("Sprites/DogPics")
	profile.pictures = []
	profile.pictures.append(load("res://Sprites/UserPics/defaultUser.png"))
	#for filename in DirAccess.get_files_at("Sprites/UserPics"):
		#if filename.contains(username) and !filename.contains(".import"):
			#profile.pictures.append(load("res://Sprites/UserPics/"+filename))
			
	return profile

func make_dog(i:int):
	var dog = DogProfile.new()
	var data = dogData[i%dogData.size()]
	
	dog.name = data[0]
	dog.bio = data[1]
	dog.breed = data[5]
	dog.age = data[2]
	dog.neutered = Profile.YESNOMAYBE.YES if data[4] == "TRUE" else Profile.YESNOMAYBE.NO
	
	match data[3]:
		"f":
			dog.gender = Profile.GENDER.FEMALE
		"m":
			dog.gender =  Profile.GENDER.MALE
		"n":
			dog.gender =  Profile.GENDER.NONBINARY
	
	match data[6]:
		"s":
			dog.size = Profile.SIZE.SMALL
		"m":
			dog.size =  Profile.SIZE.MEDIUM
		"l":
			dog.size =  Profile.SIZE.LARGE
			
	match data[7]:
		"l":
			dog.activity = Profile.ACTIVITY.LOW
		"m":
			dog.activity =  Profile.ACTIVITY.MEDIUM
		"h":
			dog.activity =  Profile.ACTIVITY.HIGH
	
	if randi_range(1,4) == 1:
		dog.vaccinated = Profile.YESNOMAYBE.NO
	else:
		dog.vaccinated = Profile.YESNOMAYBE.YES
	
	dog.pictures = []
	for extension in ["png","jpeg","jpg"]:
		var pic = load("res://Sprites/DogPics/"+dog.name+"."+extension)
		if pic != null:
			dog.pictures.append(pic)
	
	return dog

# get user to discover
func next_user():
	decidingIndex+=1
	if decidingIndex >= userData.size():
		deciding = null
		return
	var user = make_user(decidingIndex)
	
	while !current_compatibile_with(user):
		decidingIndex+=1
		if decidingIndex >= userData.size():
			deciding = null
			return
		user = make_user(decidingIndex)
	deciding = user

func current_compatibile_with(otherUser:UserProfile):
	print(otherUser.name)
	if currentUser.gender_preference != Profile.GENDER.NOPREF:
		if currentUser.gender_preference != otherUser.gender:
			return false
	
	if currentUser.smoker_preference == Profile.YESNOMAYBE.NO: 
		if otherUser.smoker == Profile.YESNOMAYBE.YES:
			return false
	
	for dog:DogProfile in otherUser.dogs:
		if currentUser.vaccinated_preference == Profile.YESNOMAYBE.YES:
			if dog.vaccinated != Profile.YESNOMAYBE.YES:
				return false
		if currentUser.size_preference != Profile.SIZE.NOPREF:
			if currentUser.size_preference != dog.size:
				return false
		if currentUser.activity_preference != Profile.ACTIVITY.NOPREF:
			if currentUser.activity_preference != dog.activity:
				return false
		
		if dog.neutered != Profile.YESNOMAYBE.YES:
			if currentUser.neutered_preference == Profile.YESNOMAYBE.YES:
				if dog.neutered == Profile.YESNOMAYBE.NO:
					return false
			if currentUser.neutered_preference == Profile.YESNOMAYBE.NOPREF:
				for userDog:DogProfile in currentUser.dogs:
					if dog.gender != userDog.gender:
						return false
	
	return true

# user decisions
func accept_user(user):
	# moves specified user to matched list if both users accepted eachother, otherwise moves user to accepted
	# user can be the user profile or their index in undecided
	matched.append(deciding)
	next_user()

func decline_user(user):
	next_user()
