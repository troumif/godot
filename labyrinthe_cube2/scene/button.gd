extends Button


func _ready() -> void:
	hide() 

func _on_pressed() -> void:
	pass # Replace with function body.
	Global.position_ouvert *=-1
	


func _on_check_button_pressed() -> void:
	pass # Replace with function body.
	if Global.position_on_off == -1 :
		hide()
	else:
		show()
