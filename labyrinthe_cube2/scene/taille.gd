extends Label

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

	show()


func _on_character_body_3d_finish() -> void:
	pass # Replace with function body.
	show()
	self.text = Global.cote * Global.cote * Global.cote
