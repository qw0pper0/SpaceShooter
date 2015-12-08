
extends "res://weapon.gd"

var last_warmup = 0
var min_warmup = 200
# member variables here, example:
# var a=2
# var b="textvar"

func _ready():
	# Initialization here
	pass

var Glaser = preload("res://Glaser.scn")
var charge = 0
func fire(direction,pos,scene):
	if OS.get_ticks_msec()-last_warmup>=min_warmup:
		#create an instance of the laser
		var las = Glaser.instance()
		#add the laser to the scene (the ship's parent) rather than to the ship
		scene.add_child(las)
		# place our laser in front of the ship (we can do this better)
		las.set_pos(pos)
		las.set_rot(direction)
		# start moving our laser by giving it some velocity
		las.set_linear_velocity((get_viewport().get_mouse_pos()-pos).normalized()*2000)
		last_warmup = OS.get_ticks_msec()
func startCharge():
	charge = OS.get_ticks_msec() #what time did we start charging
#func fireCharge(direction,scene):
	#var secondsCharged = (OS.get_ticks_msec() - OS.get_ticks_msec() ) / 1000
	#for i in range(secondsCharged * 4):
		#fire(direction+some random amount,scene)
		
