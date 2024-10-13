extends Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	show()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	self.text =str(Global.cote)
	

func _on_play_pressed() -> void:
	pass # Replace with function body.
	hide()
