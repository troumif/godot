extends CheckButton


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	


func _on_pressed() -> void:
	pass # Replace with function body.
	Global.position_on_off *=-1


func _on_play_pressed() -> void:
	pass # Replace with function body.
	hide()
