@tool
extends Panel

@export var label_text : String = "Placeholder":
	set(new_val):
		%InputLabel.text = new_val
		label_text = new_val
