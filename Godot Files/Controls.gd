
extends Node2D

# member variables here, example:
# var a=2
# var b="textvar"

func _ready():
	# Initalization here
	pass




func _on_Back_pressed():
	get_node("/root/global").goto_scene("res://MainMenu.scn")
	pass # replace with function body




func _on_Button_pressed():
	pass # replace with function body
