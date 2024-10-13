extends Button


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	show()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_pressed() -> void:
	pass # Replace with function body.
	if self.text == "controles":
		self.text = "fermer controles"
		Global.menu = 1
	else:
		self.text = "controles"
		Global.menu = 2
		
