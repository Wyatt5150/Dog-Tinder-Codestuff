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

@export_group("Validation") 
@export var display_error_text : bool = true :
	set(new_val):
		%ErrorText.visible = new_val
		self._set_minimum_size()
		display_error_text = new_val
@export var invalid_text : String = "Invalid Input" : 
	set(new_val):
		%ErrorText.text = new_val
		invalid_text = new_val

@export_subgroup("Required Field", "required")
@export var required_use : bool = false
@export var required_invalid_message : String = "Field is required."

@export_subgroup("Minimum Length", "min_")
@export var min_length : int = 0
@export var min_invalid_message : String = "Must be longer than %s characters."

@export_subgroup("Regex Settings", "regex_")
@export var regex_key : REGEX_KEYS = REGEX_KEYS.NONE :
	set(new_val):
		validate_regex = RegEx.new()
		match new_val:
			REGEX_KEYS.CUSTOM:
				validate_regex.compile(regex_custom)
			_:
				validate_regex.compile(REGEX_MAP[new_val]["key"])
				regex_invalid_message = REGEX_MAP[new_val]["error"]
		regex_key = new_val
@export var regex_custom : String :
	set(new_val):
		if regex_key == REGEX_KEYS.CUSTOM:
			validate_regex.compile(new_val)
		regex_custom = new_val
@export var regex_invalid_message : String = "Invalid Input."

var validate_regex : RegEx
enum REGEX_KEYS {
	NONE,
	ALPHANUMERIC,
	ALPHABET,
	NUMERIC,
	PASSWORD,
	EMAIL,
	CUSTOM
}
const REGEX_MAP = {
	REGEX_KEYS.NONE : {
		"key" : r"^.*$",
		"error" : "None"
	},
	REGEX_KEYS.ALPHANUMERIC : {
		"key" : r"^\w*$",
		"error" : "Field must contain only letters and numbers."
	},
	REGEX_KEYS.ALPHABET : {
		"key" : r"^[a-zA-Z]*$",
		"error" : "Field must contain only letters."
	},
	REGEX_KEYS.NUMERIC : {
		"key" : r"^\d*$",
		"error" : "Field must contain only numbers."
	},
	REGEX_KEYS.PASSWORD : {
		"key" : r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[A-Za-z\d@$!%*?& ]{8,20}$",
		"error" : "Invalid Password."
	},
	REGEX_KEYS.EMAIL : {
		"key" : r"^\S+@\S+\.\S+$",
		"error" : "Email is not valid."
	},
}



enum ERROR {
	OK,
	REQUIRED_FIELD,
	INVALID_REGEX,
	TOO_SHORT
}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self._set_minimum_size()



func _validate() -> bool:
	var user_input = %InputText.text
	
	if required_use:
		if len(user_input) < 1:
			_handle_validation_error(ERROR.REQUIRED_FIELD)
			return false
	
	if len(user_input) < min_length:
		_handle_validation_error(ERROR.TOO_SHORT)
		return false
	
	if not validate_regex.search(user_input):
		_handle_validation_error(ERROR.INVALID_REGEX)
		return false
	
	_handle_validation_error(ERROR.OK)
	return true
	

func _handle_validation_error(error : ERROR) -> void:
	
	if error == ERROR.OK:
		self.display_error_text = false
		return
	
	match error:
		ERROR.TOO_SHORT:
			self.invalid_text = min_invalid_message % str(min_length-1)
		ERROR.INVALID_REGEX:
			self.invalid_text = regex_invalid_message
		ERROR.REQUIRED_FIELD:
			self.invalid_text = required_invalid_message
	
	self.display_error_text = true


func _set_minimum_size() -> void:
	var children = $VBoxContainer2.get_children()
	var minimum = 0
	for child : Control in children:
		if child.visible:
			minimum += child.custom_minimum_size.y
	
	self.custom_minimum_size.y = minimum
