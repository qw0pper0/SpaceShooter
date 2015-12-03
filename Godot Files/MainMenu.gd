
extends Node2D

# member variables here, example:
# var a=2
# var b="textvar"

func _ready():
	# Initalization here
	pass



func _on_Start_pressed():
	get_node("/root/global").goto_scene("res://level1.scn")

	pass # replace with function body


func _on_Controls_pressed():
	get_node("/root/global").goto_scene("res://Controls.scn")
	pass # replace with function body


func _on_Exit_pressed():
	get_node("/root/global").quit()
	pass # replace with function body
	