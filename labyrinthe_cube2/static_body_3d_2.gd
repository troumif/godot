extends StaticBody3D

const SPEED = 5.0
const JUMP_VELOCITY = 4.5
var rotation_speed = 0.01
var move = 0
var gravity := 50.0
var jump_strength := 20.0




func _process(delta: float) -> void:
	if Input.is_action_pressed("cam_bas"):
		rotation.x -=rotation_speed
	if Input.is_action_pressed("cam_haut"):
		rotation.x +=rotation_speed
	if Input.is_action_pressed("cam_droite"):
		rotation.y +=rotation_speed
	if Input.is_action_pressed("cam_gauche"):
		rotation.y -=rotation_speed
	move = Vector3(SPEED,0,0).rotated(rotation)
	position += move*delta
	print(rotation)
	
