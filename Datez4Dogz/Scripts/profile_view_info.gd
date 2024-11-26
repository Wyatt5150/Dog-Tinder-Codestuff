extends VBoxContainer


func _populate_info(profile : Profile):
	%Name.text = profile.name
	%Bio.text = profile.bio
	
	if profile is UserProfile:
		%DogInfo.hide()
		%HumanInfo.show()
		_human_info(profile)
	
	if profile is DogProfile:
		%HumanInfo.hide()
		%DogInfo.show()
		_dog_info(profile)

func _human_info(profile : UserProfile):
	
	var info_string : String = str(profile.age) + " - " + profile.pronouns
	%Info.text = info_string
	
	if _is_true(profile.smoker):
		%Smoker.text = "Yes"
	else:
		%Smoker.text = "No"
	

func _dog_info(profile : DogProfile):
	var info_string : String = str(profile.age) + " - " + profile.gender_string()
	%Info.text = info_string
	
	# Vax
	if _is_true(profile.vaccinated):
		%Vaccinated.text = "Yes"
	else:
		%Vaccinated.text = "No"
	
	# Neutered
	if _is_true(profile.neutered):
		%Neutered.text = "Yes"
	else:
		%Neutered.text = "No"
	if profile.gender == Profile.GENDER.FEMALE:
		%NeuteredLabel.text = "Spayed"
	else:
		%NeuteredLabel.text = "Neutered"
	
	%Activity.text = profile.activity_string()
	%Size.text = profile.size_string()
	

func _is_true(yesno : Profile.YESNOMAYBE) -> bool:
	if yesno == Profile.YESNOMAYBE.YES:
		return true
	return false
