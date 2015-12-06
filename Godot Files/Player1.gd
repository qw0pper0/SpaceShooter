
extends RigidBody2D
var rot = 0
#create a speed variable so you can easily change the speed. This could even be a powerup
var speed = 150

#import our laser so we can create instances of it
var Glaser = preload("res://Glaser.scn")

# member variables here, example:
# var a=2
# var b="textvar"
func eightway(delta): # full eight-way set_posment
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


func _process(delta):
	eightway(delta)
	set_rot( get_pos().angle_to_point( get_viewport().get_mouse_pos() ) )

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
		#I'm firing my laser
		fire()
	
# we should create different weapons to attach to the ship and fire the weapon instead, but this is a good start
func fire():
	#create an instance of the laser
	var las = Glaser.instance()
	#add the laser to the scene (the ship's parent) rather than to the ship
	get_parent().add_child(las)
	# place our laser in front of the ship (we can do this better)
	las.set_pos(get_pos() - Vector2(0, 64) )
	las.set_rot(get_rot() )
	# start moving our laser by giving it some velocity
	las.set_linear_velocity( Vector2(0, 400) )
		
