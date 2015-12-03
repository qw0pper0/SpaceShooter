extends Node

var current_scene = null
var rot


func _ready():
	var root = get_scene().get_root()
	current_scene = root.get_child( root.get_child_count() -1 )
	#score=0

func quit():
	OS.get_main_loop().quit()


func goto_scene(scene):
# remove current scene from root and enqueue it for deletion
#get_scene().get_root().remove_child(current_scene)
	current_scene.queue_free()

# load and add new scene to root
	var s = ResourceLoader.load(scene)
	current_scene = s.instance()
	get_scene().get_root().add_child(current_scene)
	
func eightway(): # full eight-way movement

    if(Input.is_action_pressed("Wkey")): # set forward movements
        if(Input.is_action_pressed("Akey")): # diagonally left-forward
            rot = 45
            move(Vector2(-1,-1))
        elif(Input.is_action_pressed("Dkey")): # diagonally right-forward
            rot = 315
            move(Vector2(1,-1))

        else: # straight forward
            rot = 0
            move(Vector2(0,-1))
    if(Input.is_action_pressed("Skey")): # set backward movements
        if(Input.is_action_pressed("Akey")): # diagonally left-backward
            rot = 135
            move(Vector2(-1,1))
        elif(Input.is_action_pressed("Dkey")): # diagonally right-backward
            rot = 225
            move(Vector2(1,1))

        else: # straight backward
            rot = 180
            move(Vector2(0,1))
    if(Input.is_action_pressed("Akey")): # move straight left
        if(Input.is_action_pressed("Wkey") == false and Input.is_action_pressed("Skey") == false):
            rot = 90
            move(Vector2(-1,0))
    if(Input.is_action_pressed("Dkey")): # move straight right
        if(not Input.is_action_pressed("Wkey") and not Input.is_action_pressed("Skey")):
            rot = 270
            move(Vector2(1,0))
