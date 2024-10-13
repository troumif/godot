extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 4.5
var rotation_speed = 0.06
var move = 0
var gravity := 50.0
var jump_strength := 20.0
var f = global_transform.basis*Vector3(0,0,0)
var pi2 = PI/2
signal finish

func _ready() -> void:
	set_physics_process(false)
	set_process(false)



func _process(delta: float) -> void:
	if Input.is_action_pressed("cam_haut"):
		if rotation.x+rotation_speed > pi2:
			rotation.x = pi2
		else:
			rotation.x += rotation_speed
	if Input.is_action_pressed("cam_bas"):
		if rotation.x-rotation_speed < -pi2:
			rotation.x = -pi2
		else:
			rotation.x -= rotation_speed
	if Input.is_action_pressed("cam_gauche"):
		rotate_y(rotation_speed)
		
	if Input.is_action_pressed("cam_droite"):
		rotate_y(-rotation_speed)
	repere()
		
		
func _physics_process(delta: float) -> void:
	f = global_transform.basis*Vector3(0,0,0)
	if Global.dpl == 1:
		if Input.is_action_pressed("avancer"):
			f = global_transform.basis*Vector3(0,0,-0.01)
		if Input.is_action_pressed("reculer"):
			f = global_transform.basis*Vector3(0,0,0.01)
		velocity += f
	else:
		if Input.is_action_pressed("avancer"):
			f = global_transform.basis*Vector3(0,0,-1)
		if Input.is_action_pressed("reculer"):
			f = global_transform.basis*Vector3(0,0,1)
		velocity = f
	

		
		
	
	
	move_and_slide()
	if Input.is_action_pressed("light +"):
		$OmniLight3D.light_energy += 0.01	
	
	if Input.is_action_pressed("light -"):
		$OmniLight3D.light_energy -= 0.01
		
	if Input.is_action_just_pressed("light"):
		if $OmniLight3D.light_energy > 0: 
			$OmniLight3D.light_energy = 0
		else:
			$OmniLight3D.light_energy = 1




func _on_play_pressed() -> void:
	set_process(true)
	set_physics_process(true)
func repere():
	Global.xposition = floor(position.x)
	Global.yposition = floor(position.y)
	Global.zposition = floor(position.z)
	print(position)
	





func _on_finish_body_entered(body: Area3D) -> void:
	pass # Replace with function body.
	finish.emit()
	print(2)


func _on_finish_body_shape_entered(body_rid: RID, body: Node3D, body_shape_index: int, local_shape_index: int) -> void:
	pass # Replace with function body.
	finish.emit()
