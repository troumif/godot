extends MeshInstance2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _process(delta: float) -> void:
	pass

	position.x = 425+150/(Global.cote-1)*Global.zposition
	position.y = 150+75-150/(Global.cote-1)*Global.yposition
	print(Global.xposition)
	
	if Global.position_ouvert == 1:
		show()
	else:
		hide()
	if Global.position_on_off == 1 :
		hide()
