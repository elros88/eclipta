extends Node2D


func _ready():
	pass
	
func _process(delta):	
	if Input.is_action_pressed("jump"):
		get_tree().change_scene("res://levels/level-1.tscn")
