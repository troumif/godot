extends Node
var x = -0.5
var z = 0.5
var y = 0.5
var pos_in_lab = -1

func labyrinthe(complexity):
	var random = [0, 1, 2]
	var hor = []
	var vert = []
	var z_axe = []
	var A = 0
	var AA = 0
	var AAA = 0
	var AAAA = 0
	var x = 0

	for i in (pow(Global.cote, 3)):
		A += 1
		Global.lab.append(A)
	
	#make grid
	A = -1
	for k in ceil(float(Global.cote)/2):
		for i in pow(Global.cote, 2):
			A += 1
			Global.lab[A] = -1
		A += pow(Global.cote, 2)
	
	A = -2
	for i in ceil(float(Global.cote)/2):
		A += 2
		for k in pow(Global.cote, 2):
			Global.lab[A] = -1
			A += Global.cote
		A -= pow(Global.cote, 3)
	
	A = -1
	for z in Global.cote:
		for k in (ceil(float(Global.cote)/2)):
			for i in (Global.cote):
				A += 1
				Global.lab[A] = -1
			A += Global.cote
		A -= Global.cote

	#breakable walls
	A = pow(Global.cote, 2)+1
	for z in ((Global.cote-2)/2):
		for k in (Global.cote/2):
			for i in ((Global.cote/2)-1):
				A += Global.cote*2
				vert.append(A)
			A += -Global.cote*2*((Global.cote/2)-1)+2
		
		for k in (Global.cote/2):
			for i in ((Global.cote/2)-1):
				A += 2
				hor.append(A)
			A += Global.cote+3
		
		A += Global.cote-1
		for i in (Global.cote/2):
			for k in (Global.cote/2):
				A += 2
				z_axe.append(A)
			A += Global.cote+1
		A += 2
	
	for k in (Global.cote/2):
		for i in ((Global.cote/2)-1):
			A += Global.cote*2
			vert.append(A)
		A += -Global.cote*2*((Global.cote/2)-1)+2
	
	for k in (Global.cote/2):
		for i in ((Global.cote/2)-1):
			A += 2
			hor.append(A)
		A += Global.cote+3
	
	#break walls
	print(vert)
	while hor.size()+vert.size()+z_axe.size() != 0:
		AAAA = random.pick_random()
		if AAAA == 0 and hor.size() != 0 :
			#horizontal
			A = hor.pick_random()
			hor.remove_at(hor.find(A))
			AA = int(Global.lab[A-1])
			AAA = int(Global.lab[A+1])
			if AA != AAA:
				Global.lab[A] = AAA
				A = -1
				for i in (Global.lab.size()):
					A += 1
					if Global.lab[A] == AA:
						Global.lab[A] = AAA
		
		elif AAAA == 1 and vert.size() != 0 :
			#vertical
			A = vert.pick_random()
			vert.remove_at(vert.find(A))
			AA = int(Global.lab[A-Global.cote])
			AAA = int(Global.lab[A+Global.cote])
			if AA != AAA:
				Global.lab[A] = AAA
				A = -1
				for i in (Global.lab.size()):
					A += 1
					if Global.lab[A] == AA:
						Global.lab[A] = AAA
		
		elif z_axe.size() != 0:
			#z axe
			A = z_axe.pick_random()
			z_axe.remove_at(z_axe.find(A))
			AA = int(Global.lab[A-(pow(Global.cote, 2))])
			AAA = int(Global.lab[A+pow(Global.cote, 2)])
			if AA != AAA:
				Global.lab[A] = AAA
				A = -1
				for i in (Global.lab.size()):
					A += 1
					if Global.lab[A] == AA:
						Global.lab[A] = AAA
	
	#find alls walls
	var wall = []
	A = pow(Global.cote, 2)+1
	for z in ((Global.cote-2)/2):
		for k in (Global.cote/2):
			for i in ((Global.cote/2)-1):
				A += Global.cote*2
				wall.append(A)
			A += -Global.cote*2*((Global.cote/2)-1)+2
		
		for k in (Global.cote/2):
			for i in ((Global.cote/2)-1):
				A += 2
				wall.append(A)
			A += Global.cote+3
		
		A += Global.cote-1
		for i in (Global.cote/2):
			for k in (Global.cote/2):
				A += 2
				wall.append(A)
			A += Global.cote+1
		A += 2
	
	for k in (Global.cote/2):
		for i in ((Global.cote/2)-1):
			A += Global.cote*2
			wall.append(A)
		A += -Global.cote*2*((Global.cote/2)-1)+2
	
	for k in (Global.cote/2):
		for i in ((Global.cote/2)-1):
			A += 2
			wall.append(A)
		A += Global.cote+3
	
	#complexity
	A = 0
	random = []
	for i in (complexity):
		random.append(A)
		A += 1

	if random.size() != 0:
		for i in (wall.size()):
			if random.pick_random() == 0:
				Global.lab[wall[0]] = Global.lab[pow(Global.cote, 2)+Global.cote+1]
			wall.remove_at(0)
			
	#make enter/exit
	Global.lab[pow(Global.cote, 3)-1-pow(Global.cote, 2)-Global.cote] = -2

func afficher_lab():
	for i in Global.cote :
		for k in Global.cote :
			for m in Global.cote :
				x+=1
				pos_in_lab +=1
				if Global.lab[pos_in_lab] ==-1:
					var wall = (load("res://scene/wall.tscn")as PackedScene).instantiate()
					wall.position = Vector3(x*1,y*1,z*1)
					add_child(wall)
				elif Global.lab[pos_in_lab] ==-2:
					$finish.position = Vector3(x*1,y*1,z*1)
			z +=1
			x = -0.5
		y +=1 
		z = 0.5


func _on_button_pressed_play() -> void:

	labyrinthe(10)
	print(Global.lab)
	afficher_lab()
	$Chrono.start()




func _on_character_body_3d_finish() -> void:
	pass # Replace with function body.
	
	$Chrono.stop()
