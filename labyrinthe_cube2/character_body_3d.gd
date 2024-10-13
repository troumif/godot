extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 4.5
var rotation_speed = 0.06
var move = 0
var gravity := 50.0
var jump_strength := 20.0
var f = global_transform.basis*Vector3(0,0,0)



func _process(delta: float) -> void:
	if Input.is_action_pressed("cam_haut"):
		if rotation.x-rotation_speed > PI/2:
			rotation.x = PI/2
		else:
			rotation.x += rotation_speed
	if Input.is_action_pressed("cam_bas"):
		if rotation.x-rotation_speed < -PI/2:
			rotation.x = -PI/2
		else:
			rotation.x -= rotation_speed
	if Input.is_action_pressed("cam_gauche"):
		rotate_y(rotation_speed)
		
	if Input.is_action_pressed("cam_droite"):
		rotate_y(-rotation_speed)
		
		
func _physics_process(delta: float) -> void:
	f = global_transform.basis*Vector3(0,0,0)
	if Input.is_action_pressed("avancer"):
		f = global_transform.basis*Vector3(0,0,-0.01)
	if Input.is_action_pressed("reculer"):
		f = global_transform.basis*Vector3(0,0,0.01)


		
		
	velocity += f
	print(velocity)
	
	move_and_slide()
	
