
extends RigidBody2D
var rot = 0
#<<<<<<< HEAD
#=======
#create a speed variable so you can easily change the speed. This could even be a powerup
var speed = 150
#import our laser so we can create instances of it
var Glaser = preload("res://Glaser.scn")
#>>>>>>> 56852e38ab42d368bc3afffb1fd0dab5a96543df

# member variables here, example:
# var a=2
# var b="textvar"
func eightway(delta): # full eight-way set_posment
	if(Input.is_action_pressed("Wkey")): # set forward set_posments
		#get_node("LeftJet/Particles2D").set_amount(0)
		get_node("LeftJet/Particles2D").set_emitting( true )

		if(Input.is_action_pressed("Akey")): # diagonally left-forward
			set_pos(  get_pos()+Vector2(-150*delta,-150*delta))		   
		elif(Input.is_action_pressed("Dkey")): # diagonally right-forward
			set_pos(  get_pos()+Vector2(150*delta,-150*delta)) 


		else: # straight forward
			set_pos(  get_pos()+Vector2(0,-150*delta))
	if(Input.is_action_pressed("Skey")): # set backward set_posments
		if(Input.is_action_pressed("Akey")): # diagonally left-backward
			set_pos(  get_pos()+Vector2(-150*delta,150*delta))
		elif(Input.is_action_pressed("Dkey")): # diagonally right-backward
			set_pos(  get_pos()+Vector2(150*delta,150*delta))

		else: # straight backward
			set_pos(  get_pos()+Vector2(0,150*delta))
	if(Input.is_action_pressed("Akey")): # set_pos straight left
		if(Input.is_action_pressed("Wkey") == false and Input.is_action_pressed("Skey") == false):
			set_pos(  get_pos()+Vector2(-150*delta,0))
	if(Input.is_action_pressed("Dkey")): # set_pos straight right
		if(not Input.is_action_pressed("Wkey") and not Input.is_action_pressed("Skey")):
			set_pos(  get_pos()+Vector2(150*delta,0))
	var newPos = get_pos()
	
	if(Input.is_action_pressed("Wkey")):
		newPos = newPos + Vector2(0,-speed*delta)
	if(Input.is_action_pressed("Akey")):
		newPos = newPos + Vector2(-speed*delta,0)
	if(Input.is_action_pressed("Skey")):
		newPos = newPos + Vector2(0,speed*delta)
	if(Input.is_action_pressed("Dkey")):
		newPos = newPos + Vector2(speed*delta,0)
	set_pos(newPos)
	
	if(Input.is_action_pressed("Wkey")||Input.is_action_pressed("Akey")||Input.is_action_pressed("Skey")||Input.is_action_pressed("Dkey")):
		get_node("LeftJet/Particles2D").set_emitting(true)
		get_node("RightJet/Particles2D").set_emitting(true)
	else:
		get_node("LeftJet/Particles2D").set_emitting(false)
		get_node("RightJet/Particles2D").set_emitting(false)
#>>>>>>> 56852e38ab42d368bc3afffb1fd0dab5a96543df


func _process(delta):
	eightway(delta)
	set_rot( get_pos().angle_to_point( get_viewport().get_mouse_pos() ) )
	get_node("LeftJet/Particles2D").set_initial_velocity((get_pos()-get_viewport().get_mouse_pos()).normalized()*100)
	get_node("RightJet/Particles2D").set_initial_velocity((get_pos()-get_viewport().get_mouse_pos()).normalized()*100)
func _ready():
	# Initalization here
	set_process( true )
	#process events as well
	set_process_input(true)
	pass
	
#when an evet occurs less a button press
func _input(event):
	#Did you make this action? Maybe make a new one?
	if (Input.is_action_pressed("MouseL")):
		get_node("Weapon").fire(get_rot(),get_node("Weapon").get_global_pos(),get_parent())
		#I'm firing my laser
		
# we should create different weapons to attach to the ship and fire the weapon instead, but this is a good start
