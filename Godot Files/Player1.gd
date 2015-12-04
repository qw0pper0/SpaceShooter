
extends RigidBody2D
var rot = 0
# member variables here, example:
# var a=2
# var b="textvar"
func eightway(delta): # full eight-way set_posment

    if(Input.is_action_pressed("Wkey")): # set forward set_posments
        get_node("LeftJet/Particles2D").set_amount(0)
        
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


func _process(delta):
	set_rot( get_pos().angle_to_point( Input.get_mouse_pos() ) )
	eightway(delta)

func _ready():
	# Initalization here
	set_process( true )
	pass
	
func fire():
	if (Input.is_action_pressed("MouseL")):
		
