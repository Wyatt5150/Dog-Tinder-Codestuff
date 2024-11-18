@tool
extends Panel
class_name SettingPanel

@export_group("Text")
@export var label_text : String = "" : 
	set(new_val):
		%InputLabel.text = new_val
		label_text = new_val
@export var placeholder_text : String = "" : 
	set(new_val):
		%InputText.placeholder_text = new_val
		placeholder_text = new_val
@export var secret : bool = false :
	set(new_val):
		%InputText.secret = new_val
		secret = new_val

@export var display_subtext : bool = true :
	set(new_val):
		%Subtext.visible = new_val
		self._set_minimum_size()
		display_subtext = new_val
@export var subtext : String = "" : 
	set(new_val):
		%Subtext.text = new_val
		subtext = new_val

@export var display_error_text : bool = true :
	set(new_val):
		%ErrorText.visible = new_val
		self._set_minimum_size()
		display_error_text = new_val
@export var invalid_text : String = "Invalid Input" : 
	set(new_val):
		%ErrorText.text = new_val
		invalid_text = new_val

@export_group("Validation Settings")
@export var expand_on_focus : bool = false
@export var has_required_field : bool = false

@export_group("Regex Settings")
@export var use_regex : bool = false
@export var regex_key : String :
	set(new_val):
		password_regex.compile(new_val)
		regex_key = new_val

var password_regex : RegEx = RegEx.new()
### Common Regex Keys ###
# Password Validation : ^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,10}$
# Email Validation : 


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self._set_minimum_size()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func validate() -> bool:
	return true
	

func _set_minimum_size() -> void:
	var children = $VBoxContainer2.get_children()
	var minimum = 0
	for child : Control in children:
		if child.visible:
			minimum += child.custom_minimum_size.y
	
	self.custom_minimum_size.y = minimum
