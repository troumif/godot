extends Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	show()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Global.dpl == 1:
		self.text = "spatial"
	else:
		self.text = "non-spatial"


func _on_play_pressed() -> void:
	hide()
