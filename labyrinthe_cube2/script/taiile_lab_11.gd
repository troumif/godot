extends Button


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	show()









func _on_pressed() -> void:
	pass # Replace with function body.
	if not Global.cote == 5:
		Global.cote -= 2 
	


func _on_play_pressed() -> void:
	pass # Replace with function body.
	hide()
