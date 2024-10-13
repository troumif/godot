extends MeshInstance2D

func _ready() -> void:
	hide()

func _on_controls_pressed() -> void:
	pass # Replace with function body.
	if Global.menu == 1:
		show()
	else :
		hide()
