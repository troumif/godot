extends VehicleBody3D
 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	steering = Input.get_axis("ui_right","ui_left")*0.4
	engine_force = Input.get_axis("ui_down","ui_up")*400
	print(position.x)
	move_and_collide()
