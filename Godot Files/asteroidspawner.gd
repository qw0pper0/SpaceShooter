
extends Node2D
var last_warmup = 0
var min_warmup = rand_range(1000,2000)
var Glaser = preload("res://Glaser.scn")
var Ast = [preload("res://M1.scn"),preload("res://M2.scn"),preload("res://M3.scn"),preload("res://M4.scn")]
# member variables here, example:
# var a=2
# var b="textvar"
	
func fire(dir,pos,scene):
	if OS.get_ticks_msec()-last_warmup>=min_warmup:
		#create an instance of the laser
		var las = Ast[1].instance()
		#var las = Ast[randi() % Ast.size()].instance()
		scene.add_child(las)
		# place our laser in front of the ship (we can do this better)
		las.set_pos(pos)
		las.set_angular_velocity(rand_range(-10,10))
		# start moving our laser by giving it some velocity
		las.set_linear_velocity(dir*(rand_range(500,800)))
		
		las.health=4
		las.damage=20
		# get_parent().get_node("Player1").get_pos()
		
		last_warmup = OS.get_ticks_msec()
		
func _ready():
	set_process(true)
	pass

func _process(delta):
	fire((get_parent().get_node("Player1").get_pos()-get_pos()).normalized(),get_pos(),get_parent())
	
	
	# Initialization here
	pass


